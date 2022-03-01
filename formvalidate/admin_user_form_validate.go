package formvalidate

import (
	"github.com/beego/beego/v2/core/validation"
)

// AdminUserForm admin_user 表单
type AdminUserForm struct {
	Id       int    `form:"id"`
	Username string `form:"username"`
	Password string `form:"password"`
	Nickname string `form:"nickname"`
	Avatar   string `form:"avatar"`
	Role     string `form:"role"`
	Status   int    `form:"status"`
	IsCreate int    `form:"_create"`
}

// 如果你的 struct 实现了接口 validation.ValidFormer
// 当 StructTag 中的测试都成功时，将会执行 Valid 函数进行自定义验证
func (u *AdminUserForm) Valid(v *validation.Validation) {
	if u.Username == "admin" {
		v.SetError("用户名", "不允许是admin")
	}
	if u.Username == "" {
		v.SetError("用户名", "不允许是空")
	}
	if u.Password == "" {
		v.SetError("密码", "不允许是空")
	}
	if u.Nickname == "" {
		v.SetError("昵称", "不允许是空")
	}
	if u.Role == "" {
		v.SetError("角色", "不允许为空")
	}
}
