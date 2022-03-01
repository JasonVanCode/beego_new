package mysql

import (
	"beego_new/global"
	"fmt"
	"github.com/beego/beego/v2/client/orm"
	"github.com/beego/beego/v2/core/logs"
	_ "github.com/go-sql-driver/mysql" // import your used driver
)

func init() {
	fmt.Println("init mysql")
	dataSource := fmt.Sprintf("%s:%s@tcp(%s:%d)/%s?charset=utf8&loc=Local",
		global.Config.Mysql.Username,
		global.Config.Mysql.Password,
		global.Config.Mysql.Host,
		global.Config.Mysql.Port,
		global.Config.Mysql.Database,
	)
	//注册连接mysql
	if err := orm.RegisterDataBase("default", "mysql", dataSource); err != nil {
		logs.Error(err)
	}

}
