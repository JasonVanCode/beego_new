package controllers

import (
	"beego_new/services"
	"bufio"
	"fmt"
	"github.com/beego/beego/v2/core/logs"
	"io"
	"os"
	"runtime"
	"strings"
	"time"
)

type IndexController struct {
	BaseController
}

// PackageLib 加载的包信息
type PackageLib struct {
	Name    string
	Version string
}

//首页显示
func (ic *IndexController) Index() {
	//获取人员个数
	var userService services.AdminUserService
	ic.Data["user_count"] = userService.GetCount()
	//获取角色个数
	var roleService services.AdminRoleService
	ic.Data["role_count"] = roleService.GetCount()
	//获取菜单个数
	var menuService services.AdminMenuService
	ic.Data["menu_count"] = menuService.GetCount()
	//后台日志的数量
	var logService services.AdminLogService
	ic.Data["log_count"] = logService.GetCount()

	//获取数据库得版本
	var dataService services.DatabaseService
	ic.Data["database_version"] = dataService.GetDatabaseVersion()

	ic.Data["timezone"] = time.UTC
	//获取后台系统信息
	ic.Data["sys_info"] = ic.GetSysinfo()
	ic.Layout = "public/base.html"
	ic.TplName = "index/index.html"
}

//获取系统信息
func (ic *IndexController) GetSysinfo() map[string]interface{} {
	info := make(map[string]interface{})
	info["os"] = runtime.GOOS
	info["go_version"] = runtime.Version()
	var requireList []*PackageLib
	file, err := os.Open("go.mod")
	if err != nil {
		logs.Error(err)
	} else {
		defer file.Close()
		readFile := bufio.NewReader(file)
		for {
			line, _, err := readFile.ReadLine()
			if err == io.EOF {
				break
			}
			if err != nil || string(line) == "" {
				continue
			}

			strArr := strings.Split(strings.TrimSpace(string(line)), " ")
			if strArr[0] == "require" && len(strArr) >= 3 {
				needModule := PackageLib{Name: strArr[1], Version: strArr[2]}
				requireList = append(requireList, &needModule)
			} else if strings.Contains(strArr[0], "/") && len(strArr) >= 2 {
				needModule := PackageLib{Name: strArr[0], Version: strArr[1]}
				requireList = append(requireList, &needModule)
			}
		}
	}

	info["request_module"] = requireList
	//用户访问ip
	info["ip"] = ic.Ctx.Input.IP()
	//请求客户端得信息
	fmt.Println("请求客户端信息", ic.Ctx.Input.Header("User-Agent"))

	userAgent := ic.Ctx.Input.Header("User-Agent")

	switch {
	case strings.Contains(userAgent, "Chrome"):
		info["user_browser"] = "Chrome"
		break
	case strings.Contains(userAgent, "Safari"):
		info["user_browser"] = "Safari"
		break
	default:
		info["user_browser"] = "other"
	}

	switch {
	case strings.Contains(userAgent, "win"):
		info["user_os"] = "Windows"
		break
	case strings.Contains(userAgent, "mac"):
		info["user_os"] = "MAC"
		break
	default:
		info["user_os"] = "other"
	}
	fmt.Println(info)
	return info
}
