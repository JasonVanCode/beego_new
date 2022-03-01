package controllers

import (
	"beego_new/global"
	"beego_new/global/response"
	"beego_new/services"
	"time"
)

type LogController struct {
	BaseController
}

//页面信息
func (lc *LogController) Index() {
	lc.Data["create_time"] = time.Now().Format(global.TIME_FORMAT)
	lc.Data["user_list"] = new(services.AdminUserService).GetAllUser()
	lc.Layout = "public/base.html"
	lc.TplName = "admin_log/index.html"
}

//获取log列表信息
func (lc *LogController) GetLogist() {
	var logService services.AdminLogService
	result := logService.GetLogist(page, perPage, queryRaw)
	//讲用户存放在data中
	response.SuccessMsgData("成功", result, lc.Ctx)
}
