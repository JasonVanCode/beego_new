package services

import (
	"beego_new/formvalidate"
	"beego_new/models"
	"net/url"
	"strings"

	"github.com/beego/beego/v2/client/orm"
)

type AdminRoleService struct {
	BaseService
}

//根据id获取角色
func (*AdminRoleService) GetRoleById(id int) *models.AdminRole {
	var role models.AdminRole
	o := orm.NewOrm()
	err := o.QueryTable(new(models.AdminRole)).Filter("id", id).One(&role)
	if err != nil {
		return nil
	}
	return &role
}

func (*AdminRoleService) GetRoleList(page int, perPage int, queryRaw url.Values) map[string]interface{} {
	var list []*models.AdminRole
	o := orm.NewOrm().QueryTable(new(models.AdminRole))
	cond := orm.NewCondition()
	if name, ok := queryRaw["name"]; ok {
		cond = cond.And("name__contains", name[0])
	}
	allCount, _ := o.Count()
	//获取列表数据
	o.SetCond(cond).Limit(perPage, page).All(&list)
	result := make(map[string]interface{})
	result["data"] = list
	result["count"] = allCount
	return result
}

//获取当前多少个角色
func (*AdminRoleService) GetCount() int {
	o := orm.NewOrm()
	num, err := o.QueryTable(new(models.AdminRole)).Count()
	if err == nil {
		return int(num)
	}
	return 0
}

//获取当前所有角色
func (*AdminRoleService) GetAllRole() []*models.AdminRole {
	var roleList []*models.AdminRole
	o := orm.NewOrm()
	_, err := o.QueryTable(new(models.AdminRole)).All(&roleList)
	if err == nil {
		return roleList
	}
	return nil
}

//获取所有得角色数据 map[id]name
func (roleService *AdminRoleService) GetAllRoleMapIdName() map[int]string {
	roleList := roleService.GetAllRole()
	if roleList == nil {
		return nil
	}
	result := make(map[int]string)
	for _, v := range roleList {
		result[v.Id] = v.Name
	}
	return result
}

//判断角色是否重名
func (*AdminRoleService) IsRoleNameExists(id int, name string) bool {
	o := orm.NewOrm()
	if id == 0 {
		return o.QueryTable(new(models.AdminRole)).Filter("name", name).Exist()
	}
	//编辑页面排除自己数据
	return o.QueryTable(new(models.AdminRole)).Filter("name", name).Exclude("id", id).Exist()
}

//创建角色
func (*AdminRoleService) RoleCreate(roleForm *formvalidate.AadminRoleForm) bool {
	adminRole := models.AdminRole{
		Name:        roleForm.Name,
		Description: roleForm.Description,
		Url:         "1,2,18",
		Status:      roleForm.Status,
	}
	_, err := orm.NewOrm().Insert(&adminRole)
	return err == nil
}

//修改角色
func (*AdminRoleService) RoleUpdate(roleForm *formvalidate.AadminRoleForm) bool {
	_, err := orm.NewOrm().QueryTable(new(models.AdminRole)).Filter("id", roleForm.Id).Update(orm.Params{
		"name":        roleForm.Name,
		"description": roleForm.Description,
		"status":      roleForm.Status,
	})
	return err == nil
}

//授权数据得保存
func (*AdminRoleService) StoreAccess(id int, url []string) bool {
	urlStr := strings.Join(url, ",")
	o := orm.NewOrm()
	_, err := o.QueryTable(new(models.AdminRole)).Filter("id", id).Update(orm.Params{"url": urlStr})
	return err == nil
}

//删除数据
func (*AdminRoleService) Del(idArr []int) bool {
	o := orm.NewOrm()
	_, err := o.QueryTable(new(models.AdminRole)).Filter("id__in", idArr).Delete()
	return err == nil
}

//启用角色
func (*AdminRoleService) Enable(id []int, status int) bool {
	o := orm.NewOrm()
	_, err := o.QueryTable(new(models.AdminRole)).Filter("id__in", id).Update(orm.Params{"status": status})
	return err == nil
}
