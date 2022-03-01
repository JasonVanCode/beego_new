package services

import (
	"beego_new/formvalidate"
	"beego_new/models"
	"github.com/beego/beego/v2/client/orm"
)

type AdminMenuService struct {
	BaseService
}

func (*AdminMenuService) GetAdminMenuById(id int) *models.AdminMenu {
	var menu models.AdminMenu
	err := orm.NewOrm().QueryTable(new(models.AdminMenu)).Filter("id", id).One(&menu)
	if err == nil {
		return &menu
	}
	return nil
}

func (*AdminMenuService) GetAdminMenuByUrl(url string) *models.AdminMenu {
	adminMenu := new(models.AdminMenu)
	err := orm.NewOrm().QueryTable(new(models.AdminMenu)).Filter("url", url).One(adminMenu)
	if err == nil {
		return adminMenu
	}
	return nil
}

//获取菜单总数
func (*AdminMenuService) GetCount() int {
	o := orm.NewOrm()
	num, err := o.QueryTable(new(models.AdminMenu)).Filter("is_show", 1).Count()
	if err == nil {
		return int(num)
	}
	return 0
}

//获取菜单树
func (*AdminMenuService) GetAllMenuList() []*models.AdminMenu {
	var list []*models.AdminMenu
	o := orm.NewOrm()
	_, err := o.QueryTable(new(models.AdminMenu)).OrderBy("sort_id", "id").All(&list)
	if err == nil {
		return list
	}
	return nil
}

//获取除当前id之外得所有数据
func (*AdminMenuService) Menu(cuurentId int) []orm.Params {
	var adminMenusMap []orm.Params
	orm.NewOrm().QueryTable(new(models.AdminMenu)).Exclude("id", cuurentId).OrderBy("sort_id", "id").Values(&adminMenusMap, "id", "parent_id", "name", "sort_id")
	return adminMenusMap
}

//查看当前url是否存在
func (*AdminMenuService) IsExistUrl(id int, url string) bool {
	var (
		menu models.AdminMenu
	)
	o := orm.NewOrm()

	if id == 0 {
		o.QueryTable(new(models.AdminMenu)).Filter("url", url).One(&menu)
	}
	o.QueryTable(new(models.AdminMenu)).Filter("url", url).Exclude("id", id).One(&menu)
	return menu.Id > 0
}

//创建数据
func (*AdminMenuService) Create(form *formvalidate.AdminMenuForm) bool {
	menu := models.AdminMenu{
		Parent_id:  form.Parentid,
		Name:       form.Name,
		Url:        form.Url,
		Is_show:    form.IsShow,
		Sort_id:    form.SortId,
		Log_method: form.LogMethod,
	}
	_, err := orm.NewOrm().Insert(&menu)
	return err == nil
}

//更新数据
func (*AdminMenuService) Update(form *formvalidate.AdminMenuForm) bool {
	menu := models.AdminMenu{
		Id:         form.Id,
		Parent_id:  form.Parentid,
		Name:       form.Name,
		Url:        form.Url,
		Is_show:    form.IsShow,
		Sort_id:    form.SortId,
		Log_method: form.LogMethod,
	}
	count, _ := orm.NewOrm().Update(&menu, "Parent_id", "Name", "Url", "Is_show", "Sort_id", "Log_method")
	return count > 0
}
