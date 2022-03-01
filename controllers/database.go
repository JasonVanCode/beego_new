package controllers

import (
	"beego_new/global/response"
	"beego_new/services"
)

type DatabaseController struct {
	BaseController
}

//数据库维护列表
func (dc *DatabaseController) Table() {
	dc.Layout = "public/base.html"
	dc.TplName = "database/index.html"
}

//table数据列表
func (dc *DatabaseController) GetTbleList() {
	var databaseService services.DatabaseService
	result := databaseService.GetTableStatus()
	response.SuccessMsgData("成功", result, dc.Ctx)
}

//table 详情
func (dc *DatabaseController) View() {
	name := dc.GetString("name")
	if name == "" {
		response.ErrorMsg("参数错误", dc.Ctx)
	}
	var databaseService services.DatabaseService
	result := databaseService.GetFullColumnsFromTable(name)
	response.SuccessMsgData("成功", result, dc.Ctx)
}

//优化table
func (dc *DatabaseController) Optimize() {
	name := dc.GetString("name")
	if name == "" {
		response.ErrorMsg("参数错误", dc.Ctx)
	}
	var databaseService services.DatabaseService
	result := databaseService.OptimizeTable(name)
	if result {
		response.Success(dc.Ctx)
	}
	response.Error(dc.Ctx)
}

//修复表
func (dc *DatabaseController) Repair() {
	name := dc.GetString("name")
	if name == "" {
		response.ErrorMsg("参数错误", dc.Ctx)
	}
	var databaseService services.DatabaseService
	result := databaseService.RepairTable(name)
	if result {
		response.Success(dc.Ctx)
	}
	response.Error(dc.Ctx)
}
