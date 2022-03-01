package routers

import (
	"beego_new/controllers"
	"beego_new/middleware"

	beego "github.com/beego/beego/v2/server/web"
)

func init() {
	//先注册中间件
	middleware.AuthMiddle()
	beego.Router("/", &controllers.AuthController{}, "get:Login")
	//
	//下面是处理admin后台得所有接口
	ns :=
		beego.NewNamespace("/admin",
			//判断如果请求得域名是xx 就可以访问
			// beego.NSCond(func(ctx *context.Context) bool {
			// 	return ctx.Input.Domain() == "127.0.0.1"
			// }),
			beego.NSRouter("/index/index", &controllers.IndexController{}, "get:Index"),

			//登录请求
			beego.NSRouter("/auth/loginindex", &controllers.AuthController{}, "get:Login"),
			beego.NSRouter("/auth/login", &controllers.AuthController{}, "post:CheckLogin"),
			beego.NSRouter("/auth/checktoken", &controllers.AuthController{}, "get:CheckToken"),
			beego.NSRouter("/auth/loginout", &controllers.AuthController{}, "get:LoginOut"),

			//用户页面
			beego.NSRouter("/admin_user/index", &controllers.UserController{}, "get:Index"),
			beego.NSRouter("/admin_user/add", &controllers.UserController{}, "get:Add"),
			beego.NSRouter("/admin_user/edit", &controllers.UserController{}, "get:Edit"),
			//个人资料页面
			beego.NSRouter("/admin_user/profile", &controllers.UserController{}, "get:ProfileIndex"),

			//角色页面
			beego.NSRouter("/admin_role/index", &controllers.RoleController{}, "get:Index"),
			beego.NSRouter("/admin_role/add", &controllers.RoleController{}, "get:Add"),
			beego.NSRouter("/admin_role/edit", &controllers.RoleController{}, "get:Edit"),
			beego.NSRouter("/admin_role/access", &controllers.RoleController{}, "get:Access"),

			//菜单
			beego.NSRouter("/admin_menu/index", &controllers.MenuController{}, "get:Index"),
			beego.NSRouter("/admin_menu/add", &controllers.MenuController{}, "get:Add"),
			beego.NSRouter("/admin_menu/edit", &controllers.MenuController{}, "get:Edit"),

			//日志
			beego.NSRouter("/admin_log/index", &controllers.LogController{}, "get:Index"),

			//数据维护页面
			beego.NSRouter("/database/table", &controllers.DatabaseController{}, "get:Table"),
		)

	//接口得请求
	ns2 := beego.NewNamespace("/api",
		beego.NSRouter("/admin_user/getlist", &controllers.UserController{}, "get:GetUserList"),
		beego.NSRouter("/admin_role/getlist", &controllers.RoleController{}, "get:GetRoleList"),
		//beego.NSRouter("/admin_menu/getlist", &controllers.MenuController{}, "get:GetMenuList"),
		beego.NSRouter("/admin_log/getlist", &controllers.LogController{}, "get:GetLogist"),

		//------用户管理------
		//添加用户
		beego.NSRouter("/admin_user/create", &controllers.UserController{}, "post:UserCreate"),
		//删除用户
		beego.NSRouter("/admin_user/del", &controllers.UserController{}, "post:UserDel"),
		//用户更新
		beego.NSRouter("/admin_user/update", &controllers.UserController{}, "post:UserUpdate"),
		//禁用或者启用账号
		beego.NSRouter("/admin_user/enable", &controllers.UserController{}, "post:Enable"),

		//------角色管理------
		//添加角色
		beego.NSRouter("/admin_role/create", &controllers.RoleController{}, "post:RoleCreate"),
		//授权角色
		beego.NSRouter("/admin_role/access_operate", &controllers.RoleController{}, "post:AccessOperate"),
		//删除角色
		beego.NSRouter("/admin_role/del", &controllers.RoleController{}, "post:Del"),
		//启用角色
		beego.NSRouter("/admin_role/enable", &controllers.RoleController{}, "post:Enable"),

		//个人资料-修改昵称
		beego.NSRouter("/admin_user/UpdateNickName", &controllers.UserController{}, "post:UpdateNickName"),
		//个人资料-修改密码
		beego.NSRouter("/admin_user/UpdatePassword", &controllers.UserController{}, "post:UpdatePassword"),
		//个人资料-修改头像
		beego.NSRouter("/admin_user/UpdateUserImage", &controllers.UserController{}, "post:UpdateUserImage"),

		//------菜单管理------
		beego.NSRouter("/admin_menu/create", &controllers.MenuController{}, "post:MenuCreate"),
		beego.NSRouter("/admin_menu/update", &controllers.MenuController{}, "post:MenuUpdate"),

		//------数据维护页面------
		beego.NSRouter("/database/getList", &controllers.DatabaseController{}, "get:GetTbleList"),
		beego.NSRouter("/database/view", &controllers.DatabaseController{}, "post:View"),
		beego.NSRouter("/database/optimize", &controllers.DatabaseController{}, "post:Optimize"),
		beego.NSRouter("/database/repair", &controllers.DatabaseController{}, "post:Repair"),
	)

	//注册 namespace
	beego.AddNamespace(ns, ns2)
}
