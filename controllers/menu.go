package controllers

import (
	"beego_new/formvalidate"
	"beego_new/global/response"
	"beego_new/models"
	"beego_new/services"
	"fmt"
	"github.com/beego/beego/v2/adapter/validation"
	"strings"
)

type MenuController struct {
	BaseController
}

//菜单页面
func (mc *MenuController) Index() {
	var treeService services.AdminMenuTreeService
	result := treeService.AdminMenuTree()
	mc.Data["table"] = result
	mc.Layout = "public/base.html"
	mc.TplName = "admin_menu/index.html"
}

//新建菜单页面
func (mc *MenuController) Add() {
	var adminTreeService services.AdminMenuTreeService
	parents := adminTreeService.GetSelectMenu(0)
	mc.Data["parents"] = parents
	mc.Data["log_method"] = new(models.AdminMenu).GetLogMethod()
	mc.Layout = "public/base.html"
	mc.TplName = "admin_menu/add.html"
}

//编辑菜单页面
func (mc *MenuController) Edit() {
	id, err := mc.GetInt("id")
	if id == 0 || err != nil {
		response.ErrorMsg("参数错误", mc.Ctx)
	}
	var (
		menuTree    services.AdminMenuTreeService
		menuService services.AdminMenuService
	)
	//判断当前数据是否存在
	menu := menuService.GetAdminMenuById(id)
	fmt.Println("menu 编辑的数据", menu, menu.Parent_id)
	if menu == nil {
		response.ErrorMsg("该条数据不存在", mc.Ctx)
	}
	mc.Data["parents"] = menuTree.GetSelectMenu(menu.Parent_id)
	mc.Data["log_method"] = new(models.AdminMenu).GetLogMethod()
	mc.Data["menu"] = menu
	mc.Layout = "public/base.html"
	mc.TplName = "admin_menu/edit.html"
}

//创建菜单
func (mc *MenuController) MenuCreate() {
	var menuForm formvalidate.AdminMenuForm
	var menuService services.AdminMenuService
	if err := mc.ParseForm(&menuForm); err != nil {
		response.ErrorMsg("参数错误", mc.Ctx)
	}
	//去除url前后两端得空格
	if menuForm.Url != "" {
		menuForm.Url = strings.TrimSpace(menuForm.Url)
		menuForm.Url = strings.TrimLeft(menuForm.Url, "/")
		menuForm.Url = strings.TrimRight(menuForm.Url, "/")
	}
	//validate 验证
	v := validation.Validation{}
	b, e := v.Valid(&menuForm)
	if !b || e != nil {
		response.ErrorMsg("必填项没填", mc.Ctx)
	}
	//判断url地址是否重复
	if menuService.IsExistUrl(menuForm.Id, menuForm.Url) {
		response.ErrorMsg("该url已经存在", mc.Ctx)
	}
	//数据库数据保存
	result := menuService.Create(&menuForm)
	if result {
		response.Success(mc.Ctx)
	}
	response.Error(mc.Ctx)
}

//编辑菜单

func (mc *MenuController) MenuUpdate() {
	var (
		menuForm    formvalidate.AdminMenuForm
		menuService services.AdminMenuService
	)
	err := mc.ParseForm(&menuForm)
	if err != nil {
		response.ErrorMsg("参数错误", mc.Ctx)
	}
	if menuForm.Url != "" {
		menuForm.Url = strings.TrimSpace(menuForm.Url)
		menuForm.Url = strings.TrimLeft(menuForm.Url, "/")
		menuForm.Url = strings.TrimRight(menuForm.Url, "/")
	}
	if menuForm.Id == 0 {
		response.ErrorMsg("暂无该条数据", mc.Ctx)
	}
	//验证有没有漏填必填数据
	v := validation.Validation{}
	b, e := v.Valid(&menuForm)
	if !b || e != nil {
		response.ErrorMsg("必填项没填", mc.Ctx)
	}
	//验证url有没有存在
	if menuService.IsExistUrl(menuForm.Id, menuForm.Url) {
		response.ErrorMsg("该url已经存在", mc.Ctx)
	}
	result := menuService.Update(&menuForm)
	if result {
		response.Success(mc.Ctx)
	}
	response.Error(mc.Ctx)
}
