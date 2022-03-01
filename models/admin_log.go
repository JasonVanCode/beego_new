package models

import (
	"github.com/beego/beego/v2/client/orm"
)

type AdminLog struct {
	Id            int    `orm:"column(id)" json:"id"`
	Admin_user_id int    `orm:"column(admin_user_id)" json:"admin_user_id"`
	Name          string `orm:"column(name)" json:"name"`
	Url           string `orm:"column(url)" json:"url"`
	Log_method    string `orm:"column(log_method)" json:"log_method"`
	Log_ip        string `orm:"column(log_ip)" json:"log_ip"`
	Create_time   string `orm:"column(create_time)" json:"create_time"`
	Update_time   string `orm:"column(update_time)" json:"update_time"`
}

func (u *AdminLog) TableName() string {
	return "admin_log"
}

//注册模型
func init() {
	orm.RegisterModel(new(AdminLog))
}
