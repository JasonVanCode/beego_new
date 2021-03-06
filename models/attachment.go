package models

import (
	"github.com/beego/beego/v2/client/orm"
)

// Attachment struct
type Attachment struct {
	Id           int    `orm:"column(id);auto;size(11)" description:"表ID"`
	AdminUserId  int    `orm:"column(admin_user_id);size(11);default(0)" description:"后台用户id"`
	UserId       int    `orm:"column(user_id);size(11);default(0)" description:"前台用户ID"`
	OriginalName string `orm:"column(original_name);size(200)" description:"原文件名"`
	SaveName     string `orm:"column(save_name);size(200)" description:"保存文件名"`
	SavePath     string `orm:"column(save_path);size(255)" description:"系统完整路径"`
	Url          string `orm:"column(url);size(255)" description:"图片访问路径"`
	Extension    string `orm:"column(extension);size(100)" description:"后缀"`
	Mime         string `orm:"column(mime);size(100)" description:"类型"`
	Size         int64  `orm:"column(size);size(20);default(0)" description:"大小"`
	Md5          string `orm:"column(md5);size(32);default(\"\")" description:"MD5"`
	Sha1         string `orm:"column(sha1);size(40);default(\"\")" description:"SHA1"`
	CreateTime   string `orm:"column(create_time);size(10);default(0)" description:"操作时间"`
	UpdateTime   string `orm:"column(update_time);size(10);default(0)" description:"更新时间"`
	DeleteTime   string `orm:"column(delete_time);size(10);default(0)" description:"删除时间"`
}

//注册模型
func init() {
	orm.RegisterModel(new(Attachment))
}
