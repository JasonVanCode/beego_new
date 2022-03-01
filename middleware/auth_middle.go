package middleware

import (
	"fmt"
	"net/http"
	"strconv"
	"strings"

	"beego_new/global"
	"beego_new/models"
	"beego_new/services"

	"github.com/beego/beego/v2/server/web"
	"github.com/beego/beego/v2/server/web/context"
)

//用户登录得验证
func AuthMiddle() {
	authExcep := map[string]interface{}{
		"admin/auth/login":         0,
		"admin/auth/loginindex":    1,
		"admin/index/index":        2,
		"admin/admin_user/index":   3,
		"admin/admin_user/getlist": 4,
	}
	var FilterUser = func(ctx *context.Context) {
		//下面是需要验证的请求地址
		if !isAuthExceptUrl(authExcep, ctx.Input.URL()) {
			return
			//判断用户是否登录
			user, isLogin := isLogin(ctx)
			if !isLogin {
				ctx.Redirect(http.StatusFound, "/admin/auth/loginindex")
				return
			}
			fmt.Println("当前登录的用户", user)
		}
	}
	web.InsertFilter("/admin/*", web.BeforeRouter, FilterUser)
}

func isAuthExceptUrl(m map[string]interface{}, url string) bool {
	urlArr := strings.Split(strings.TrimLeft(url, "/"), "/")
	var newGenUrl string
	for k, v := range urlArr {
		if k == (len(urlArr) - 1) {
			newGenUrl += v
		} else {
			newGenUrl += v + "/"
		}
	}
	if _, ok := m[newGenUrl]; ok {
		return true
	}
	return false
}

//验证用户是否登录
func isLogin(ctx *context.Context) (*models.AdminUser, bool) {
	loginUser, ok := ctx.Input.Session(global.LOGIN_USER).(models.AdminUser)
	if !ok {
		loginUserId := ctx.GetCookie(global.LOGIN_USER_ID)
		loginUserSign := ctx.GetCookie(global.LOGIN_USER_ID_SIGN)
		if loginUserId != "" && loginUserSign != "" {
			var userSerivce services.AdminUserService
			id, _ := strconv.Atoi(loginUserId)
			user := userSerivce.GetAdminUserById(id)

			if user != nil && user.GetSignStrByAdminUser(ctx) == loginUserSign {
				ctx.Output.Session(global.LOGIN_USER, user)
				return user, true
			}
		}
		return nil, false
	}
	return &loginUser, true
}
