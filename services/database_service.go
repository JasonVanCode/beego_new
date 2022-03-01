package services

import (
	"github.com/beego/beego/v2/client/orm"
)

type DatabaseService struct {
}

var version string

func (*DatabaseService) GetDatabaseVersion() string {

	err := orm.NewOrm().Raw("select version()").QueryRow(&version)
	if err == nil {
		return version
	}
	return ""
}

//获取当前项目表数据
func(ds *DatabaseService)GetTableStatus() []map[string]string{
	var maps []orm.Params
	var resultMap []map[string]string
	o := orm.NewOrm()
	rows,err := o.Raw("SHOW TABLE STATUS").Values(&maps)
	if rows >0 && err == nil {
		for _,v := range maps{
			resultMap = append(resultMap, map[string]string{
				"name":ds.TransToString(v["Name"]),
				"comment":     ds.TransToString(v["Comment"]),
				"engine":      ds.TransToString(v["Engine"]),
				"collation":   ds.TransToString(v["Collation"]),
				"data_length": ds.TransToString(v["Data_length"]),
				"create_time": ds.TransToString(v["Create_time"]),
				"update_time": ds.TransToString(v["Update_time"]),
			})
		}
	}
	return resultMap
}

//获取表的所有字段
func(ds *DatabaseService)GetFullColumnsFromTable(name string)[]map[string]string{
	var columns []orm.Params
	var resultColumns []map[string]string
	count,err := orm.NewOrm().Raw("SHOW FULL COLUMNS FROM "+ name).Values(&columns)
	if count >0 && err == nil {
		for  _,item := range columns{
			resultColumns = append(resultColumns, map[string]string{
				"name":       ds.TransToString(item["Field"]),
				"type":       ds.TransToString(item["Type"]),
				"collation":  ds.TransToString(item["Collation"]),
				"null":       ds.TransToString(item["Null"]),
				"key":        ds.TransToString(item["Key"]),
				"default":    ds.TransToString(item["Default"]),
				"extra":      ds.TransToString(item["Extra"]),
				"privileges": ds.TransToString(item["Privileges"]),
				"comment":    ds.TransToString(item["Comment"]),
			})
		}

	}
	return resultColumns
}

//优化表
func(ds *DatabaseService)OptimizeTable(name string)bool{
	o := orm.NewOrm()
	_,err := o.Raw("OPTIMIZE TABLE `" +name+"`").Exec()
	return err == nil
}

//修复表
func(ds *DatabaseService)RepairTable(name string)bool{
	o := orm.NewOrm()
	_,err := o.Raw("REPAIR TABLE `" +name+"`").Exec()
	return err == nil
}

//转string
func(ds *DatabaseService)TransToString(value interface{})string{
	if value == nil {
		return ""
	}
	return value.(string)
}



