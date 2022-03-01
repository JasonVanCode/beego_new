package controllers

import (
	"beego_new/formvalidate"
	"beego_new/global"
	"beego_new/global/response"
	"beego_new/models"
	"beego_new/services"
	"beego_new/utils"
	"fmt"
	"net/http"

	"github.com/beego/beego/v2/core/validation"
)

type AuthController struct {
	BaseController
}

func (*AuthController) NestPrepare() {
	fmt.Println("LoginController实现了NestPreparer的接口")
	utils.GetRandMd5String()
}

func (ac *AuthController) Get() {
	fmt.Println(ac.Ctx.Input.Domain())
	ac.Ctx.WriteString("hello login")
}

func (ac *AuthController) Login() {
	ac.Data["test"] = "hahhaha"
	admin := map[string]interface{}{
		"name":  "name",
		"title": "登录",
	}
	ac.Data["admin"] = admin
	ac.TplName = "auth/login.html"
}

//登录验证
func (ac *AuthController) CheckLogin() {
	var err error
	//解析登录请求的数据
	login_data := formvalidate.LoginForm{}
	if err = ac.ParseForm(&login_data); err != nil {
		//handle error
		response.ErrorMsg(err.Error(), ac.Ctx)
	}
	fmt.Println("登录请求的shuju", login_data)
	//对请求数据的验证
	valid := validation.Validation{}
	var is_valid bool
	if is_valid, err = valid.Valid(&login_data); err != nil {
		response.ErrorMsg(err.Error(), ac.Ctx)
	}
	//表示数据验证没有通过
	if !is_valid {
		response.ErrorMsg(valid.Errors[0].Key+valid.Errors[0].Message, ac.Ctx)
	}
	//用户密码的验证
	var user_service services.AdminUserService
	var user_data *models.AdminUser
	if user_data, err = user_service.CheckLogin(login_data, ac.Ctx); err != nil {
		response.ErrorMsg(err.Error(), ac.Ctx)
	}
	//登录日志的记录
	var log_service services.AdminLogService
	log_service.LoginLog(user_data.Id, ac.Ctx)
	ac.Ctx.Redirect(http.StatusFound, "/admin/index/index")
}

//退出登录
func (ac *AuthController) LoginOut() {
	ac.DelSession(global.LOGIN_USER)
	ac.Ctx.Output.Cookie(global.LOGIN_USER_ID, "", -1)
	ac.Ctx.Output.Cookie(global.LOGIN_USER_ID_SIGN, "", -1)
	ac.Redirect("/admin/auth/loginindex", http.StatusFound)
}

func (ac *AuthController) CheckToken() {
	ac.Ctx.WriteString("CheckToken")
}
