package controllers

import (
	"beego_new/formvalidate"
	"beego_new/global/response"
	"beego_new/models"
	"beego_new/services"
	"beego_new/utils"
	"fmt"
	"github.com/adam-hanna/arrayOperations"
	"github.com/beego/beego/v2/client/orm"
	"github.com/beego/beego/v2/core/validation"
	"strings"
)

type RoleController struct {
	BaseController
}

//角色列表显示
func (rc *RoleController) Index() {
	rc.Layout = "public/base.html"
	rc.TplName = "admin_role/index.html"
}

//获取角色数据
func (rc *RoleController) GetRoleList() {
	var roleService services.AdminRoleService
	result := roleService.GetRoleList(page, perPage, queryRaw)
	response.SuccessMsgData("成功", result, rc.Ctx)
}

//添加角色页面
func (rc *RoleController) Add() {
	rc.Layout = "public/base.html"
	rc.TplName = "admin_role/add.html"
}

//处理添加角色方法
func (rc *RoleController) RoleCreate() {
	var roleForm formvalidate.AadminRoleForm
	if err := rc.ParseForm(&roleForm); err != nil {
		response.ErrorMsg("参数错误", rc.Ctx)
	}
	v := validation.Validation{}
	if isOk, _ := v.Valid(&roleForm); !isOk {
		response.ErrorMsg("参数错误", rc.Ctx)
	}

	//验证角色是否重名
	var roleService services.AdminRoleService
	if isExists := roleService.IsRoleNameExists(roleForm.Id, roleForm.Name); isExists {
		response.ErrorMsg("该角色名已经存在", rc.Ctx)
	}
	//创建数据
	result := roleService.RoleCreate(&roleForm)
	if result {
		response.Success(rc.Ctx)
	} else {
		response.Error(rc.Ctx)
	}
}

//编辑角色页面
func (rc *RoleController) Edit() {
	id, _ := rc.GetInt("id")
	fmt.Println("获取id得值----", id)
	rc.Data["role"] = new(services.AdminRoleService).GetRoleById(id)
	rc.Layout = "public/base.html"
	rc.TplName = "admin_role/edit.html"
}

//处理编辑数据得提交
func (rc *RoleController) RoleUpdate() {
	var roleForm formvalidate.AadminRoleForm
	if err := rc.ParseForm(&roleForm); err != nil {
		response.ErrorMsg(err.Error(), rc.Ctx)
	}
	//判断是否传入id
	if roleForm.Id == 0 {
		response.ErrorMsg("id错误", rc.Ctx)
	}
	v := validation.Validation{}
	if isOk, err := v.Valid(&roleForm); !isOk || err != nil {
		response.ErrorMsg("参数错误", rc.Ctx)
	}
	//验证角色是否重名
	var roleService services.AdminRoleService
	if isExists := roleService.IsRoleNameExists(roleForm.Id, roleForm.Name); isExists {
		response.ErrorMsg("该角色名已经存在", rc.Ctx)
	}
	//数据库修改
	result := roleService.RoleUpdate(&roleForm)
	if result {
		response.Success(rc.Ctx)
	} else {
		response.Error(rc.Ctx)
	}

}

// Access 菜单管理-角色管理-角色授权界面.
func (rc *RoleController) Access() {
	id, err := rc.GetInt("id")
	if err != nil || id <= 0 {
		response.ErrorMsg("参数错误", rc.Ctx)
	}
	//获取当前角色信息
	roleData := new(services.AdminRoleService).GetRoleById(id)
	//获取所有的菜单
	allMenu := new(services.AdminMenuService).GetAllMenuList()
	allMenuMap := make(map[int]orm.Params)
	for _, v := range allMenu {
		id := v.Id
		if allMenuMap[id] == nil {
			allMenuMap[id] = make(orm.Params)
		}
		allMenuMap[id]["Id"] = id
		allMenuMap[id]["Parent_id"] = v.Parent_id
		allMenuMap[id]["Name"] = v.Name
		allMenuMap[id]["Url"] = v.Url
		allMenuMap[id]["IsShow"] = v.Is_show
		allMenuMap[id]["SortId"] = v.Sort_id
		allMenuMap[id]["LogMethod"] = v.Log_method
		//allMenuMap[v.Id]
	}
	//获取前端显示的html
	result := new(services.AdminMenuTreeService).AuthorizeHtml(allMenuMap, strings.Split(roleData.Url, ","))
	rc.Data["html"] = result
	rc.Data["data"] = roleData
	rc.Layout = "public/base.html"
	rc.TplName = "admin_role/access.html"
}

//授权数据保存
func (rc *RoleController) AccessOperate() {
	id, err := rc.GetInt("id")
	if err != nil {
		response.ErrorMsg("参数错误", rc.Ctx)
	}
	var urlArr []string
	if err := rc.Ctx.Input.Bind(&urlArr, "url"); err != nil {
		response.ErrorMsg("参数错误", rc.Ctx)
	}
	if len(urlArr) == 0 {
		response.ErrorMsg("请选择要授权得菜单", rc.Ctx)
	}

	if !utils.InArrayForString(urlArr, "1") {
		response.ErrorMsg("首页权限必须选择", rc.Ctx)
	}
	//处理保存数据
	result := new(services.AdminRoleService).StoreAccess(id, urlArr)
	if result {
		response.Success(rc.Ctx)
	} else {
		response.Error(rc.Ctx)
	}
}

//角色删除
func (rc *RoleController) Del() {
	id := rc.GetString("id")
	if id == "" {
		response.ErrorMsg("参数错误", rc.Ctx)
	}
	//如果存在多个id，用逗号分隔开
	idArr := strings.Split(id, ",")
	idArrInt := utils.TransSliceStringToInt(idArr)

	noDeletionID := new(models.AdminRole).NoDeletionId()
	m, b := arrayOperations.Intersect(noDeletionID, idArrInt)
	//判断是否有禁止删除的数据
	if len(noDeletionID) > 0 && len(m.Interface().([]int)) > 0 && b {
		response.ErrorMsg("有禁止删除的数据", rc.Ctx)
	}
	result := new(services.AdminRoleService).Del(idArrInt)
	if result {
		response.Success(rc.Ctx)
	} else {
		response.Error(rc.Ctx)
	}
}

//Enable 启用
func (rc *RoleController) Enable() {
	id := rc.GetString("id")
	status, err := rc.GetInt("status")
	if id == "" || err != nil {
		response.ErrorMsg("参数错误", rc.Ctx)
	}
	idArr := utils.TransSliceStringToInt(strings.Split(id, ","))
	//数据库处理
	result := new(services.AdminRoleService).Enable(idArr, status)
	if result {
		response.Success(rc.Ctx)
	} else {
		response.Error(rc.Ctx)
	}
}
