package models

import (
	"github.com/beego/beego/v2/client/orm"
)

type AdminLogData struct {
	Id           int    `orm:"column(id)" json:"id"`
	Admin_log_id int    `orm:"column(admin_log_id)" json:"admin_log_id"`
	Data         string `orm:"column(data)" json:"data"`
}

func (ald *AdminLogData) TableName() string {
	return "admin_log_data"
}

//注册模型
func init() {
	orm.RegisterModel(new(AdminLogData))
}
