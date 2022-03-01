package models

import (
	"github.com/beego/beego/v2/client/orm"
)

type AdminRole struct {
	Id          int    `orm:"column(id)"`
	Name        string `orm:"column(name)"`
	Description string `orm:"column(description)"`
	Url         string `orm:"column(url)"`
	Status      int    `orm:"column(status)"`
}

// NoDeletionId 禁止删除的数据id
func(*AdminRole)NoDeletionId()[]int{
	return []int{1}
}


func init() {
	orm.RegisterModel(new(AdminRole))
}
