package controllers

import (
	"fmt"
	"time"

	beego "github.com/beego/beego/v2/server/web"
)

type MainController struct {
	beego.Controller
}

type Human struct {
	Run func(a, b int) string
}

func (c *MainController) Get() {
	c.Data["Website"] = "beego.me"
	c.Data["Email"] = "astaxie@gmail.com"
	c.Data["IsShow"] = false
	c.Data["MySlice"] = []string{"a", "b", "c"}
	c.Data["MyMap"] = map[string]string{
		"a": "a",
		"b": "b",
	}
	h := Human{func(a, b int) string { return fmt.Sprintf("%d%d", a, b) }}
	c.Data["Human"] = h
	c.Data["Time"] = time.Now()

	c.TplName = "index.tpl"
}
