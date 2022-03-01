package main

import (
	_ "beego_new/initialize/conf"
	_ "beego_new/initialize/mysql"
	_ "beego_new/routers"
	beego "github.com/beego/beego/v2/server/web"
)

func main() {
	beego.Run()
}
