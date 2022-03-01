package services

import (
	"beego_new/formvalidate"
	"beego_new/global"
	"beego_new/models"
	"beego_new/utils"
	"encoding/base64"
	"errors"
	"net/url"
	"strconv"
	"time"

	"github.com/beego/beego/v2/client/orm"
	"github.com/beego/beego/v2/server/web/context"
)

type AdminUserService struct {
	BaseService
}

//用户登录验证
func (aus *AdminUserService) CheckLogin(userform formvalidate.LoginForm, ctx *context.Context) (*models.AdminUser, error) {
	var err error
	var adminuser models.AdminUser
	o := orm.NewOrm()
	err = o.QueryTable(new(models.AdminUser)).Filter("username", userform.Username).One(&adminuser)
	if err != nil {
		return nil, errors.New("该用户名不存在")
	}
	//获取到用户信息之后，对密码进行验证
	//对密码进行base64的解密
	base64_decode_pass, _ := base64.StdEncoding.DecodeString(adminuser.Password)
	if !utils.PasswordVerify(string(base64_decode_pass), userform.Password) {
		return nil, errors.New("密码不正确")
	}
	//判断用户是否冻结
	if adminuser.Status == 0 {
		return nil, errors.New("该账户已经被冻结")
	}
	//将用户的信息存入session
	ctx.Output.Session(global.LOGIN_USER, adminuser)
	//看是否要记住用户
	if userform.Remember != "" {
		ctx.SetCookie(global.LOGIN_USER_ID, strconv.Itoa(adminuser.Id), 7200)
		ctx.SetCookie(global.LOGIN_USER_ID_SIGN, adminuser.GetSignStrByAdminUser(ctx), 7200)
	} else {
		ctx.SetCookie(global.LOGIN_USER_ID, ctx.GetCookie(global.LOGIN_USER_ID), -1)
		ctx.SetCookie(global.LOGIN_USER_ID_SIGN, ctx.GetCookie(global.LOGIN_USER_ID_SIGN), -1)
	}
	return &adminuser, nil
}

//根据用户id，获取用户信息
func (aus *AdminUserService) GetAdminUserById(id int) *models.AdminUser {
	o := orm.NewOrm()
	user := &models.AdminUser{Id: id}
	err := o.Read(user)
	if err != nil {
		return nil
	}
	return user
}

//新建用户
func (*AdminUserService) Create(userform formvalidate.AdminUserForm) int {

	user := models.AdminUser{
		Username: userform.Username,
		Nickname: userform.Username,
		Avatar:   userform.Avatar,
		Role:     userform.Role,
		Status:   userform.Status,
	}
	//密码加密处理

	passHash, err := utils.PasswordHash(userform.Password)
	if err != nil {
		return 0
	}
	//base64 加密一下密码
	user.Password = base64.StdEncoding.EncodeToString([]byte(passHash))

	o := orm.NewOrm()
	id, err := o.Insert(&user)
	if err == nil {
		return int(id)
	}
	return 0
}

//更新用户
func (*AdminUserService) Update(userform *formvalidate.AdminUserForm) int {
	o := orm.NewOrm()
	u := models.AdminUser{Id: userform.Id}
	err := o.Read(&u)
	if err != nil {
		return 0
	}
	//判断密码是否有修改
	if u.Password != userform.Password {
		hashPass, _ := utils.PasswordHash(userform.Password)
		u.Password = base64.StdEncoding.EncodeToString([]byte(hashPass))
	}
	if userform.Avatar != "" {
		u.Avatar = userform.Avatar
	}
	u.Nickname = userform.Nickname
	u.Update_time = time.Now().Format(global.TIME_FORMAT)
	u.Role = userform.Role
	u.Username = userform.Username
	u.Status = userform.Status
	id, err := o.Update(&u)
	if err == nil {
		return int(id)
	}
	return 0
}

//删除数据
func (*AdminUserService) Del(idarr []int) int {
	o := orm.NewOrm()
	count, err := o.QueryTable(new(models.AdminUser)).Filter("id__in", idarr).Delete()
	if err == nil {
		return int(count)
	}
	return 0
}

//验证权限
func (*AdminUserService) AuthCheck(url string, userinfo *models.AdminUser, authExcept map[string]interface{}) bool {
	authUrl := userinfo.GetAuthUrl()
	if utils.KeyInMap(url, authUrl) || utils.KeyInMap(url, authExcept) {
		return true
	}

	return false
}

//获取用户表人数
func (*AdminUserService) GetCount() int {
	o := orm.NewOrm()
	num, err := o.QueryTable(new(models.AdminUser)).Filter("status", 1).Count()
	if err != nil {
		return 0
	}
	return int(num)
}

//获取用户列表
func (aus *AdminUserService) GetUserList(queryRaw url.Values, page int, perPage int) map[string]interface{} {
	var userList []*models.AdminUser
	cond := orm.NewCondition()
	//判断是否要查询名字
	if name, ok := queryRaw["name"]; ok {
		cond = cond.And("username__contains", name[0])
	}

	mySetter := orm.NewOrm().QueryTable(new(models.AdminUser)).SetCond(cond)
	allCount, err := mySetter.Count()
	if err != nil {
		allCount = 0
	}
	mySetter.Limit(perPage, page).All(&userList)

	result := make(map[string]interface{})
	result["roleData"] = new(AdminRoleService).GetAllRoleMapIdName()
	result["data"] = userList
	result["count"] = allCount
	return result
}

//修改昵称
func (aus *AdminUserService) UpdateNickName(id int, nickName string) bool {
	o := orm.NewOrm()
	uptData := orm.Params{"Nickname": nickName}
	_, err := o.QueryTable(new(models.AdminUser)).Filter("id", id).Update(uptData)
	return err == nil
}

//修改密码
func (aus *AdminUserService) UpdatePassword(id int, oldPass, newPass string) error {
	userInfo := aus.GetAdminUserById(id)
	base6DecodePass, _ := base64.StdEncoding.DecodeString(userInfo.Password)
	if !utils.PasswordVerify(string(base6DecodePass), oldPass) {
		return errors.New("当前用户密码错误")
	}

	hashNewPass, err := utils.PasswordHash(newPass)
	if err != nil {
		return err
	}
	o := orm.NewOrm()
	_, err = o.QueryTable(new(models.AdminUser)).Filter("id", id).Update(orm.Params{"Password": base64.StdEncoding.EncodeToString([]byte(hashNewPass))})
	if err != nil {
		return err
	}
	return nil
}

//更新头像
func (aus *AdminUserService) UpdateUserImage(id int, img string) bool {
	o := orm.NewOrm()
	data := orm.Params{"Avatar": img}
	_, err := o.QueryTable(new(models.AdminUser)).Filter("id", id).Update(data)
	return err == nil
}

//启用或禁用用户
func (*AdminUserService) Enable(id []int, status int) bool {
	o := orm.NewOrm()
	_, err := o.QueryTable(new(models.AdminUser)).Filter("id__in", id).Update(orm.Params{"status": status})
	return err == nil
}

//获取所有得用户信息
func (*AdminUserService) GetAllUser() []*models.AdminUser {
	var list []*models.AdminUser
	o := orm.NewOrm()
	_, err := o.QueryTable(new(models.AdminUser)).All(&list)
	if err == nil {
		return list
	}
	return nil
}

//获取用户 map[id] = name map数据
func (aus *AdminUserService) GetUserMapIdName() map[int]string {
	userList := aus.GetAllUser()
	if userList == nil {
		return nil
	}
	result := make(map[int]string)
	for _, v := range userList {
		result[v.Id] = v.Username
	}
	return result
}
