package services

import (
	"beego_new/global"
	"beego_new/models"
	"encoding/json"
	"fmt"
	"net/url"
	"strings"
	"time"

	"github.com/beego/beego/v2/client/orm"
	"github.com/beego/beego/v2/core/logs"
	"github.com/beego/beego/v2/server/web/context"
)

type AdminLogService struct {
	BaseService
}

//用户登录记录日志
func (als *AdminLogService) LoginLog(user_id int, acx *context.Context) {
	// fmt.Println(json.Marshal(acx.Request.PostForm))
	nowTime := time.Now().Format(global.TIME_FORMAT)
	log := models.AdminLog{
		Admin_user_id: user_id,
		Name:          "登录",
		Url:           acx.Input.URL(),
		Log_method:    acx.Request.Method,
		Log_ip:        acx.Input.IP(),
		Create_time:   nowTime,
		Update_time:   nowTime,
	}
	o := orm.NewOrm()
	//对于多表的操作，手动加上事务
	to, _ := o.Begin()
	adminLogId, err := o.Insert(&log)

	if err != nil {
		to.Rollback()
		logs.Error(err.Error())
		return
	}
	//将登录请求的数据json
	postData, _ := json.Marshal(acx.Request.PostForm)

	logData := models.AdminLogData{
		Admin_log_id: int(adminLogId),
		Data:         string(postData),
	}
	//给admin_login_data插入数据
	_, err = o.Insert(&logData)
	if err != nil {
		to.Rollback()
		logs.Error(err.Error())
		return
	}
	to.Commit()
}

//用户请求日志
func (*AdminLogService) CreateRequestLog(loginuser *models.AdminUser, menu *models.AdminMenu, url string, ctx *context.Context) {
	var loginId int
	if loginuser == nil {
		loginId = 0
	} else {
		loginId = loginuser.Id
	}
	log := models.AdminLog{
		Admin_user_id: loginId,
		Name:          menu.Name,
		Url:           url,
		Log_method:    menu.Log_method,
		Log_ip:        ctx.Input.IP(),
		Create_time:   time.Now().Format(global.TIME_FORMAT),
		Update_time:   time.Now().Format(global.TIME_FORMAT),
	}
	fmt.Println(log)

	//开启事务
	o := orm.NewOrm()
	to, _ := o.Begin()
	logId, err := to.Insert(&log)

	if err != nil {
		to.Rollback()
		logs.Error(err.Error())
		return
	}
	var data string
	//如果请求是post
	if menu.Log_method == "POST" {
		postData := ctx.Request.PostForm
		//post请求的数据，json处理
		jsonData, _ := json.Marshal(postData)
		data = string(jsonData)
	}
	//get请求
	if menu.Log_method == "GET" {
		if strings.Contains(ctx.Input.URI(), "?") {
			urlArr := strings.Split(ctx.Input.URI(), "?")
			data = urlArr[1]
		}
	}

	//存储请求的数据
	logData := models.AdminLogData{
		Admin_log_id: int(logId),
		Data:         data,
	}
	_, err = to.Insert(&logData)
	if err != nil {
		to.Rollback()
		logs.Error(err.Error())
		return
	}
	to.Commit()
}

//获取日志的数量
func (*AdminLogService) GetCount() int {
	o := orm.NewOrm()
	num, err := o.QueryTable(new(models.AdminLog)).Count()
	if err == nil {
		return int(num)
	}
	return 0
}

//获取日志列表
func (*AdminLogService) GetLogist(page int, perPage int, queryRaw url.Values) map[string]interface{} {
	cond := orm.NewCondition()

	if name, ok := queryRaw["name"]; ok {
		cond = cond.And("name__contains", name[0])
	}
	if user, ok := queryRaw["user_id"]; ok {
		cond = cond.And("admin_user_id", user[0])
	}

	if time, ok := queryRaw["rangeTime"]; ok {
		timeArr := strings.Split(time[0], " - ")
		cond = cond.And("create_time__gt", timeArr[0])
		cond = cond.And("create_time__lt", timeArr[1])
	}

	querySecter := orm.NewOrm().QueryTable(new(models.AdminLog)).SetCond(cond)
	//获取总共多少条数据
	allCount, _ := querySecter.Count()
	var list []models.AdminLog
	result := make(map[string]interface{})
	//分页获取数据
	_, err := querySecter.OrderBy("-create_time").Limit(perPage, page).All(&list)
	if err != nil {
		result["count"] = 0
		result["data"] = nil
	} else {
		result["data"] = list
		result["count"] = allCount
	}
	//获取当前所有用户的信息
	result["userlist"] = new(AdminUserService).GetUserMapIdName()
	return result
}
