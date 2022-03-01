package models

import (
	"github.com/beego/beego/v2/client/orm"
)

type AdminMenu struct {
	Id         int    `orm:"column(id)"`
	Parent_id  int    `orm:"column(parent_id)"`
	Name       string `orm:"column(name)"`
	Url        string `orm:"column(url)"`
	Icon       string `orm:"column(icon)"`
	Is_show    int    `orm:"column(is_show)"`
	Sort_id    int    `orm:"column(sort_id)"`
	Log_method string `orm:"column(log_method)"`
}

func (*AdminMenu) GetLogMethod() []string {
	return []string{"不记录", "GET", "POST", "PUT", "DELETE"}
}

func init() {
	orm.RegisterModel(new(AdminMenu))
}
