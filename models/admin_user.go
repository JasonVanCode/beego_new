package models

import (
	"beego_new/utils"
	"crypto/sha1"
	"fmt"
	"strings"

	"github.com/beego/beego/v2/client/orm"
	"github.com/beego/beego/v2/server/web/context"
)

type AdminUser struct {
	Id           int    `orm:"column(id)"`
	Username     string `orm:"column(username)"`
	Password     string `orm:"column(password)"`
	Nickname     string `orm:"column(nickname)"`
	Avatar       string `orm:"column(avatar)"`
	Role         string `orm:"column(role)"`
	Status       int    `orm:"column(status)"`
	Delete_time  string `orm:"column(delete_time)"`
	Created_time string `orm:"column(created_time)"`
	Update_time  string `orm:"column(update_time)"`
}

func (u *AdminUser) TableName() string {
	return "admin_user"
}

// NoDeletionId 禁止删除的数据id
func (*AdminUser) NoDeletionId() []int {
	return []int{}
}

//获取已经授权的url
func (user *AdminUser) GetAuthUrl() map[string]interface{} {
	var list orm.ParamsList
	authUrl := make(map[string]interface{})
	o := orm.NewOrm()
	_, err := o.QueryTable(new(AdminRole)).Filter("id__in", strings.Split(user.Role, ",")).ValuesFlat(&list, "url")
	if err != nil {
		fmt.Println(err)
	}
	var allUrlstr string
	for _, row := range list {
		urlStr, ok := row.(string)
		if ok {
			if allUrlstr == "" {
				allUrlstr = urlStr
			} else {
				allUrlstr = allUrlstr + "," + urlStr
			}
		}
	}
	urlSlice := utils.RemoveDuplicateElement(strings.Split(allUrlstr, ","))

	if len(urlSlice) > 0 {
		var authURLArr orm.ParamsList
		o.QueryTable(new(AdminMenu)).Filter("id__in", urlSlice).ValuesFlat(&authURLArr, "url")
		fmt.Println(authURLArr)

		for k, v := range authURLArr {
			urlStr, ok := v.(string)
			if ok {
				authUrl[urlStr] = k
			}
		}
		return authUrl
	}
	return authUrl
}

func (u *AdminUser) GetSignStrByAdminUser(ctx *context.Context) string {
	userAgent := ctx.Input.Header("User-Agent")
	return fmt.Sprintf("% x", sha1.Sum([]byte(fmt.Sprintf("%d%s%s", u.Id, u.Username, userAgent))))
}

//获取该用户的menu
func (u *AdminUser) ShowMenu() map[int]orm.Params {
	var maps []orm.Params
	returnMaps := make(map[int]orm.Params)
	o := orm.NewOrm()
	//管理员权限
	if u.Id == 1 {
		_, err := o.QueryTable(new(AdminMenu)).Filter("is_show", 1).Values(&maps, "id", "parent_id", "name", "url", "icon", "sort_id")
		if err != nil {
			fmt.Println(err)
		}
		for _, v := range maps {
			returnMaps[int(v["Id"].(int64))] = v
		}
	}
	return returnMaps
}

//注册模型
func init() {
	orm.RegisterModel(new(AdminUser))
}
