package conf

import (
	"beego_new/global"
	"fmt"
	"github.com/spf13/viper"
)

func init() {
	var config string = "config.yaml"
	v := viper.New()
	v.SetConfigFile(config)
	v.SetConfigType("yaml")
	if err := v.ReadInConfig(); err != nil {
		fmt.Println(err)
		panic(fmt.Errorf("config file is missing"))
	}
	if err := v.Unmarshal(&global.Config); err != nil {
		fmt.Println(err)
		fmt.Println("解析失败")
	}
	fmt.Println(global.Config)
}
