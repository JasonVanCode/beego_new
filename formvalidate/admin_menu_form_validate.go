package formvalidate

import "github.com/beego/beego/v2/core/validation"

//处理创建menu form
type AdminMenuForm struct{
	Id int `form:"id"`
	Parentid int `form:"parent_id"`
	Name string `form:"name"`
	Url string `form:"url"`
	SortId int `form:"sort_id""`
	IsShow int `form:"is_show"`
	LogMethod string `form:"log_method"`
}


//自定义角色得验证
func (menu *AdminMenuForm) Valid(v *validation.Validation){
	//对form表单得请求数据
	if menu.Parentid == -1 {
		v.SetError("Parentid","上级菜单不能为空")
	}
	if menu.Name == ""{
		v.SetError("Name","菜单名字不能为空")
	}
	if menu.Url == ""{
		v.SetError("Url","url不能为空")
	}
	if menu.SortId == 0 {
		v.SetError("SortId","排序不能为空")
	}
	if menu.LogMethod == ""{
		v.SetError("LogMethod","请求方法不能为空")
	}
}

