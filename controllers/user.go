package controllers

import (
	"beego_new/formvalidate"
	"beego_new/global"
	"beego_new/global/response"
	"beego_new/models"
	"beego_new/services"
	"beego_new/utils"
	"strings"

	"github.com/adam-hanna/arrayOperations"
	"github.com/beego/beego/v2/core/validation"
)

type UserController struct {
	BaseController
}

//首页显示
func (uc *UserController) Index() {
	uc.Layout = "public/base.html"
	uc.TplName = "admin_user/index.html"
}

//添加页面
func (uc *UserController) Add() {
	uc.Data["roles"] = new(services.AdminRoleService).GetAllRole()
	uc.Layout = "public/base.html"
	uc.TplName = "admin_user/add.html"
}

//编辑页面
func (uc *UserController) Edit() {
	id, err := uc.GetInt("id")
	if id == 0 || err != nil {
		response.ErrorMsg("参数错误", uc.Ctx)
	}
	userInfo := new(services.AdminUserService).GetAdminUserById(id)
	uc.Data["user"] = userInfo
	uc.Data["roles"] = new(services.AdminRoleService).GetAllRole()
	uc.Data["role_arr"] = strings.Split(userInfo.Role, ",")
	uc.Layout = "public/base.html"
	uc.TplName = "admin_user/edit.html"
}

//获取用户列表的数据
func (uc *UserController) GetUserList() {
	var userService services.AdminUserService
	result := userService.GetUserList(queryRaw, page, perPage)
	//获取所有得角色信息
	response.SuccessMsgData("成功", result, uc.Ctx)
}

//创建用户
func (uc *UserController) UserCreate() {
	var user_form formvalidate.AdminUserForm
	if err := uc.ParseForm(&user_form); err != nil {
		response.ErrorMsg(err.Error(), uc.Ctx)
	}
	v := validation.Validation{}
	isOk, _ := v.Valid(&user_form)

	if !isOk {
		response.ErrorMsg("必填项没有填写", uc.Ctx)
	}
	//创建账号
	var userService services.AdminUserService
	id := userService.Create(user_form)
	if id > 0 {
		response.Success(uc.Ctx)
	}
	response.Error(uc.Ctx)
}

//更新用户信息
func (uc *UserController) UserUpdate() {
	var userForm formvalidate.AdminUserForm
	if err := uc.ParseForm(&userForm); err != nil {
		response.ErrorMsg(err.Error(), uc.Ctx)
	}
	//编辑的时候，看是否提交id
	if userForm.Id <= 0 {
		response.ErrorMsg("该用户不存在", uc.Ctx)
	}

	v := validation.Validation{}
	is_ok, _ := v.Valid(&userForm)
	if !is_ok {
		response.ErrorMsg("必填项没有填写", uc.Ctx)
	}
	var userService services.AdminUserService
	id := userService.Update(&userForm)
	if id > 0 {
		response.Success(uc.Ctx)
	}
	response.Error(uc.Ctx)
}

//删除用户信息
func (uc *UserController) UserDel() {
	delId := uc.GetString("id")
	if delId == "" {
		response.ErrorMsg("请选择要删除的数据", uc.Ctx)
	}
	idArrs := utils.TransSliceStringToInt(strings.Split(delId, ","))

	noDeletionIds := new(models.AdminUser).NoDeletionId()
	//判断要删除的id，是否在禁止删除的id切片中
	m, b := arrayOperations.Intersect(noDeletionIds, idArrs)

	if len(noDeletionIds) > 0 && len(m.Interface().([]int)) > 0 && b {
		response.ErrorMsg("该条数据无法删除", uc.Ctx)
	}
	//处理删除数据的逻辑
	var userService services.AdminUserService
	count := userService.Del(idArrs)
	if count > 0 {
		response.Success(uc.Ctx)
	}
	response.Error(uc.Ctx)
}

//个人资料页面
func (uc *UserController) ProfileIndex() {
	uc.Layout = "public/base.html"
	uc.TplName = "admin_user/profile.html"
}

//修改昵称
func (uc *UserController) UpdateNickName() {
	id, err := uc.GetInt("id")
	nickName := strings.TrimSpace(uc.GetString("nickName"))

	if err != nil || nickName == "" {
		response.ErrorMsg("参数错误", uc.Ctx)
	}
	var userService services.AdminUserService
	result := userService.UpdateNickName(id, nickName)
	if result {
		//更新session
		userInfo := userService.GetAdminUserById(id)
		uc.SetSession(global.LOGIN_USER, *userInfo)
		response.Success(uc.Ctx)
	}
	response.Error(uc.Ctx)
}

//修改密码
func (uc *UserController) UpdatePassword() {
	id, err := uc.GetInt("id")
	oldPass := strings.TrimSpace(uc.GetString("oldPass"))
	newPass := strings.TrimSpace(uc.GetString("newPass"))
	reNewPass := strings.TrimSpace(uc.GetString("reNewPass"))

	if err != nil || oldPass == "" || newPass == "" || reNewPass == "" || newPass != reNewPass {
		response.ErrorMsg("参数错误", uc.Ctx)
	}
	var userService services.AdminUserService
	result := userService.UpdatePassword(id, oldPass, newPass)
	if result == nil {
		response.Success(uc.Ctx)
	} else {
		response.ErrorMsg(result.Error(), uc.Ctx)
	}
}

//修改用户头像
func (uc *UserController) UpdateUserImage() {
	id, errId := uc.GetInt("id")
	_, _, err := uc.GetFile("img")
	if err != nil || errId != nil {
		response.ErrorMsg("参数错误", uc.Ctx)
	}
	//处理图片得上传
	var attachmentService services.AttachmentService
	attachment, err := attachmentService.Upload(uc.Ctx, "img", 1, 1)
	if err != nil || attachment == nil {
		response.ErrorMsg("", uc.Ctx)
	}
	var userService services.AdminUserService
	result := userService.UpdateUserImage(id, attachment.Url)
	if result {
		response.Success(uc.Ctx)
	} else {
		response.Error(uc.Ctx)
	}
}

//启用或者禁用用户
func (uc *UserController) Enable() {
	id := uc.GetString("id")
	//状态
	status, err := uc.GetInt("status")
	if id == "" || err != nil {
		response.ErrorMsg("参数错误,", uc.Ctx)
	}
	idArrs := utils.TransSliceStringToInt(strings.Split(id, ","))
	noDelIds := new(models.AdminUser).NoDeletionId()
	v, b := arrayOperations.Intersect(idArrs, noDelIds)
	if len(noDelIds) > 0 && b && len(v.Interface().([]int)) > 0 {
		response.ErrorMsg("有禁止修改得数据", uc.Ctx)
	}
	result := new(services.AdminUserService).Enable(idArrs, status)
	if result {
		response.Success(uc.Ctx)
	}
	response.Error(uc.Ctx)
}
