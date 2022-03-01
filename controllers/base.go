package controllers

import (
	"beego_new/global"
	"beego_new/models"
	"beego_new/services"
	"net/url"
	"strconv"
	"strings"

	beego "github.com/beego/beego/v2/server/web"
)

var (
	loginuser models.AdminUser
	queryRaw  url.Values
	page      int
	perPage   int
)

// NestPreparer 定义子控制器初始化方法
type NestPreparer interface {
	NestPrepare()
}

type BaseController struct {
	beego.Controller
}

func (bc *BaseController) Prepare() {

	//从session中获取用户信息
	var isOk bool
	loginuser, isOk = bc.GetSession(global.LOGIN_USER).(models.AdminUser)
	//处理get请求过来的参数
	if bc.Ctx.Input.IsGet() {
		queryRaw, _ = url.ParseQuery(bc.Ctx.Request.URL.RawQuery)
		queryRaw.Set("queryParamUrl", bc.Ctx.Input.URL())
		//处理get请求的数据()
		if len(queryRaw) > 0 {
			for k, v := range queryRaw {
				if k == "page" {
					page, _ = strconv.Atoi(v[0])
					queryRaw.Del("page")
				}
				if k == "perPage" {
					perPage, _ = strconv.Atoi(v[0])
					queryRaw.Del("perPage")
				}
			}
		}
	}

	//设置csrf token
	bc.Data["xsrf_token"] = bc.XSRFToken()
	//获取到请求的url
	requestUrl := strings.TrimLeft(bc.Ctx.Input.URL(), "/")

	//记录请求日志
	var title string
	var menuService services.AdminMenuService
	nowMenu := menuService.GetAdminMenuByUrl(requestUrl)
	if nowMenu != nil {
		title = nowMenu.Name
		if strings.EqualFold(nowMenu.Log_method, bc.Ctx.Request.Method) {
			var adminLog services.AdminLogService
			adminLog.CreateRequestLog(&loginuser, nowMenu, requestUrl, bc.Ctx)
		}
	}

	//左侧菜单
	var menu string
	if requestUrl != "admin/auth/loginindex" && isOk && !strings.Contains(requestUrl, "api/") {
		var adminMenuTree services.AdminMenuTreeService
		menu = adminMenuTree.GetMenuTree(&loginuser, requestUrl)
	}

	admin := map[string]interface{}{
		"user":  &loginuser,
		"menu":  menu,
		"title": title,
	}
	bc.Data["admin"] = admin
	//判断当前的控制器是否实现了NestPreparer这个接口
	if app, ok := bc.AppController.(NestPreparer); ok {
		app.NestPrepare()
	}
}
