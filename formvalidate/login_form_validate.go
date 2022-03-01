package formvalidate

import (
	"github.com/beego/beego/v2/core/validation"
)

type LoginForm struct {
	Username string `form:"username"`
	Password string `form:"password"`
	Captcha  string `form:"captcha"`
	Remember string `form:"remember"`
}

//对提交的字段进行验证
func (lf *LoginForm) Valid(v *validation.Validation) {
	if lf.Username == "" {
		v.SetError("用户名", "不能为空")
	}
	if lf.Password == "" {
		v.SetError("密码", "不能为空")
	}
}
