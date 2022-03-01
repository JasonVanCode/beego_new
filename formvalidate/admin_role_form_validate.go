package formvalidate

import (
	"github.com/beego/beego/v2/core/validation"
)

//创建角色验证
type AadminRoleForm struct{
	Id int `form:"id"`
	Name string `form:"name"`
	Description string `form:"description""`
	Url string `form:"url"`
	Status int `form:"status"`
}


//自定义角色得验证
func (role *AadminRoleForm) Valid(v *validation.Validation) {
	if role.Name == ""{
		v.SetError("Name","名称不能为空")
	}

	if role.Description == ""{
		v.SetError("Description","简介不能为空")
	}
}

