package services

import (
	"beego_new/models"
	"beego_new/utils"
	"fmt"
	"sort"
	"strconv"
	"strings"

	"github.com/beego/beego/v2/client/orm"
)

type AdminMenuTreeService struct {
	Array      map[int]orm.Params
	Type       map[string]interface{}
	Html       string
	ShowArray  []orm.Params
	TreeHtml   string
	TreeType   map[string]interface{}
	AuthHtml   string
	AuthType   map[string]interface{}
	AuthArray  map[int]orm.Params
	SelectHtml string
}

func (menuTree *AdminMenuTreeService) GetMenuTree(user *models.AdminUser, currentUrl string) string {
	//获取有权限的url
	menu := user.ShowMenu()
	var currentId int
	var pIdarrs []int
	//判断菜单有多少层级
	maxLevel := 0
	//获取该菜单的所有父级菜单
	fmt.Println(currentUrl)
	for _, v := range menu {
		if v["Url"].(string) == currentUrl {
			currentId = int(v["Id"].(int64))
			pIdarrs = menuTree.GetParentIds(currentId, menu, []int{})
			break
		}
	}

	if len(pIdarrs) == 0 {
		pIdarrs = []int{0}
	}
	//获取菜单所有的层级
	for k, v := range menu {
		menu[k]["Url"] = "/" + menu[k]["Url"].(string)
		level := menuTree.GetLevel(int(v["Id"].(int64)), menu, 0)
		menu[k]["Level"] = level

		if level > maxLevel {
			maxLevel = level
		}
	}
	//初始化生成html
	menuTree.initHtml(menu)
	//下面是只有一个菜单，没有下拉菜单
	currentOne := ` <li class="nav-item" >
	<a href="$url" class="nav-link `
	currentHover := `active`
	currentTwo := `">
	<i class="nav-icon fas"></i>
	<p>
	  $name
	</p>
  	</a>
	</li>`
	baseOne := `<li class="nav-item`
	baseTwo := ` menu-is-opening menu-open `
	baseThr := `"><a href="#" class="nav-link `
	baseFive := `active`
	baseSix := `">
		<i class="nav-icon fa $icon"></i>
		<p>
		$name
		<i class="right fas fa-angle-left"></i>
		</p>
	</a>
	<ul class="nav nav-treeview">`
	baseSeven := `</ul></li>`
	//将分散的html组合起来
	menuTree.Type["textone"] = baseOne + baseThr + baseSix
	menuTree.Type["texttwo"] = baseOne + baseTwo + baseThr + baseFive + baseSix
	menuTree.Type["textthr"] = baseSeven
	//current li
	menuTree.Type["current"] = currentOne + currentHover + currentTwo
	menuTree.Type["other"] = currentOne + currentTwo
	return menuTree.getAuthTree(0, currentId, pIdarrs)
}

//初始化一些输
func (menuTree *AdminMenuTreeService) initHtml(menu map[int]orm.Params) {
	menuTree.Array = menu
	menuTree.Type = make(map[string]interface{})
	menuTree.Html = ""
}

func (menuTree *AdminMenuTreeService) getAuthTree(myId int, currentId int, parentID []int) string {
	//获取
	child := menuTree.GetChild(myId)
	var childKey []int
	for _, v := range child {
		childKey = append(childKey, int(v["Id"].(int64)))
	}
	sort.Ints(childKey)
	for _, key := range childKey {
		k := key
		v := child[k]
		if len(menuTree.GetChild(k)) > 0 {
			if utils.InArrayForInt(parentID, k) {
				str := menuTree.Type["texttwo"].(string)
				str = menuTree.StrReplace(str, v)
				menuTree.Html += str

			} else {
				str := menuTree.Type["textone"].(string)
				str = menuTree.StrReplace(str, v)
				menuTree.Html += str
			}
			menuTree.getAuthTree(k, currentId, parentID)
			menuTree.Html += menuTree.Type["textthr"].(string)

		} else if currentId == k {
			str := menuTree.Type["current"].(string)
			str = menuTree.StrReplace(str, v)
			menuTree.Html += str
		} else {
			str := menuTree.Type["other"].(string)
			str = menuTree.StrReplace(str, v)
			menuTree.Html += str

		}
	}
	return menuTree.Html
}

//替换数据库中的名字
func (*AdminMenuTreeService) StrReplace(str string, value map[string]interface{}) string {
	str = strings.ReplaceAll(str, "$name", value["Name"].(string))
	str = strings.ReplaceAll(str, "$icon", value["Icon"].(string))
	str = strings.ReplaceAll(str, "$url", value["Url"].(string))
	return str
}

func (menuTree *AdminMenuTreeService) GetParentIds(id int, menu map[int]orm.Params, pIdarrs []int) []int {
	for _, v := range menu {
		pId := int(v["Parent_id"].(int64))
		if id == int(v["Id"].(int64)) && pId != 0 {
			pIdarrs = append(pIdarrs, pId)
			pIdarrs = menuTree.GetParentIds(pId, menu, pIdarrs)
		}
	}
	if len(pIdarrs) > 0 {
		return pIdarrs
	}
	return []int{}
}

//获取当前菜单层级
func (menuTree *AdminMenuTreeService) GetLevel(currentId int, menu map[int]orm.Params, i int) int {
	//获取有权限的url
	parentId := 0

	v, ok := menu[currentId]["Parent_id"].(int64)
	if ok {
		parentId = int(v)
	} else {
		parentId = menu[currentId]["Parent_id"].(int)
	}

	if parentId == 0 || currentId == parentId {
		return i
	}
	i++
	return menuTree.GetLevel(parentId, menu, i)
}

func (menuTree *AdminMenuTreeService) GetChild(pid int) map[int]map[string]interface{} {

	result := make(map[int]map[string]interface{})
	var parentIDInt int
	for k, v := range menuTree.Array {
		parentID, ok := v["Parent_id"].(int64)
		if ok {
			parentIDInt = int(parentID)
		} else {
			parentIDInt = v["Parent_id"].(int)
		}

		if parentIDInt == pid {
			result[k] = v
		}
	}
	return result

}

//初始化生成treehtml
func (menuTree *AdminMenuTreeService) initTreeHtml(menu map[int]orm.Params) {
	menuTree.TreeType = make(map[string]interface{})
	menuTree.Array = make(map[int]orm.Params)
	menuTree.Array = menu
	menuTree.TreeHtml = ""
}

//生成菜单树
func (menuTree *AdminMenuTreeService) AdminMenuTree() string {
	var menuService AdminMenuService
	menuList := menuService.GetAllMenuList()
	//如果获取不到列表，直接返回
	if menuList == nil {
		return ""
	}
	result := make(map[int]orm.Params)
	for _, list := range menuList {
		id := list.Id
		if result[id] == nil {
			result[id] = make(orm.Params)
		}
		result[id]["Id"] = list.Id
		result[id]["Url"] = list.Url
		result[id]["Name"] = list.Name
		result[id]["Icon"] = list.Icon
		result[id]["Sort_id"] = list.Sort_id
		result[id]["Parent_id"] = list.Parent_id
		if list.Is_show == 1 {
			result[id]["Is_show"] = "显示"
		} else {
			result[id]["Is_show"] = "隐藏"
		}
		result[id]["Log_method"] = list.Log_method
	}
	//下面是拼接树级的table
	baseOne := `<tr>
					<td>$id</td>
					<td>$name</td>
					<td>$url</td> 
					<td>$pid</td> 
					<td>$status</td> 
    				<td><a class="btn btn-success btn-sm ReloadButton" data-toggle="tooltip" title="刷新">
                    <i class="fa fa-refresh"></i> 编辑
                	</a>
                     <a class="btn btn-danger btn-sm AjaxButton" data-toggle="tooltip" title="删除选中数据" data-confirm-title="删除确认" data-confirm-content="您确定要删除选中的数据吗？" data-id="checked" data-url="/admin/admin_user/del">
                    <i class="fa fa-trash"></i> 删除
                	</a>
					</td>
          		</tr>`

	baseTwo := `<tr data-widget="expandable-table" aria-expanded="false">
					<td><i class="expandable-table-caret fas fa-caret-right fa-fw"></i>$id</td>
					<td>
						$name
					</td>
					<td>$url</td> 
					<td>$pid</td> 
					<td>$status</td> 
					<td> <a class="btn btn-success btn-sm ReloadButton" data-toggle="tooltip" title="刷新">
                    <i class="fa fa-refresh"></i> 编辑
                </a>
				 <a class="btn btn-danger btn-sm AjaxButton" data-toggle="tooltip" title="删除选中数据" data-confirm-title="删除确认" data-confirm-content="您确定要删除选中的数据吗？" data-id="checked" data-url="/admin/admin_user/del">
                    <i class="fa fa-trash"></i> 删除
                	</a>	
				</td>
				</tr>`
	baseThr := `<tr class="expandable-body">
					<td>
						<div class="p-0">
    						<table class="table table-hover">
								<tbody>`

	baseFour := `    						</tbody>
                                        </table>
                                    </div>
  								</td>
                            </tr>`
	//初始化一些数据
	menuTree.initTreeHtml(result)

	menuTree.TreeType["baseOne"] = baseOne
	menuTree.TreeType["baseTwo"] = baseTwo
	menuTree.TreeType["baseThr"] = baseThr
	menuTree.TreeType["baseFour"] = baseFour

	//拼接前端tablehtml
	return menuTree.GetTree(0)
}

//给菜单进行排序
func (menuTree *AdminMenuTreeService) GetTree(myId int) string {
	//获取所有的子类
	child := menuTree.GetChild(myId)
	var ids []int
	for _, v := range child {
		ids = append(ids, v["Id"].(int))
	}
	sort.Ints(ids)
	for _, id := range ids {
		k := id
		v := child[k]
		//如果有子菜单，继续查子菜单的数据
		if len(menuTree.GetChild(k)) > 0 {
			str := menuTree.TreeType["baseTwo"].(string) + menuTree.TreeType["baseThr"].(string)
			str = menuTree.StrTreeReplace(str, v)
			menuTree.TreeHtml += str
			menuTree.GetTree(k)
			menuTree.TreeHtml += menuTree.TreeType["baseFour"].(string)
		} else {
			str := menuTree.TreeType["baseOne"].(string)
			str = menuTree.StrTreeReplace(str, v)
			menuTree.TreeHtml += str

		}
	}
	return menuTree.TreeHtml
}

//替换值
func (*AdminMenuTreeService) StrTreeReplace(str string, value map[string]interface{}) string {
	str = strings.ReplaceAll(str, "$id", strconv.Itoa(value["Id"].(int)))
	str = strings.ReplaceAll(str, "$name", value["Name"].(string))
	str = strings.ReplaceAll(str, "$url", value["Url"].(string))
	str = strings.ReplaceAll(str, "$pid", strconv.Itoa(value["Parent_id"].(int)))
	str = strings.ReplaceAll(str, "$status", value["Is_show"].(string))
	return str
}

//授权页面替换
func (*AdminMenuTreeService) StrAuthReplace(str string, value map[string]interface{}) string {
	str = strings.ReplaceAll(str, "$id", strconv.Itoa(value["Id"].(int)))
	str = strings.ReplaceAll(str, "$level", strconv.Itoa(value["Level"].(int)))
	str = strings.ReplaceAll(str, "$name", value["Name"].(string))
	str = strings.ReplaceAll(str, "$checked", value["Checked"].(string))
	//str = strings.ReplaceAll(str,"$id",strconv.Itoa(value["Id"].(int)))
	return str
}

//初始化获取授权的页面数据
func (menuTree *AdminMenuTreeService) initAuth(menu map[int]orm.Params) {
	menuTree.Array = make(map[int]orm.Params)
	menuTree.Array = menu
	menuTree.AuthHtml = ""
	menuTree.AuthType = make(map[string]interface{})
}

//AuthorizeHtml 生成授权的html
func (menuTree *AdminMenuTreeService) AuthorizeHtml(menu map[int]orm.Params, authMenu []string) string {
	for id := range menu {
		if utils.InArrayForString(authMenu, strconv.Itoa(id)) {
			fmt.Println("Checked")
			menu[id]["Checked"] = "Checked"
		} else {
			menu[id]["Checked"] = ""
		}
		levelInt := menuTree.GetLevel(id, menu, 0)
		menu[id]["Level"] = levelInt
		menu[id]["Width"] = 100 - levelInt
	}
	//初始化
	menuTree.initAuth(menu)

	menuTree.AuthType["other"] = `<label class='checkbox'  >
                        <input $checked  name='url[]' value='$id' level='$level'
                        onclick='javascript:checkNode(this);' type='checkbox'>
                       $name
                   </label>`

	menuTree.AuthType["0"] = []string{
		`<dl class='checkMod'>
                    <dt class='hd'>
                        <label class='checkbox'>
                            <input $checked name='url[]' value='$id' level='$level'
                             onclick='javascript:checkNode(this);'
                             type='checkbox'>
                            $name
                        </label>
                    </dt>
                    <dd class='bd'>`,
		`</dd></dl>`,
	}

	menuTree.AuthType["1"] = []string{
		`<div class='menu_parent'>
                            <label class='checkbox'>
                                <input $checked  name='url[]' value='$id' level='$level'
                                onclick='javascript:checkNode(this);' type='checkbox'>
                               $name
                            </label>
                        </div>
                        <div class='rule_check' style='width: $width%;'>`,
		`</div><span class='child_row'></span>`,
	}
	//生成前端展示得html
	return menuTree.getAuthTreeAccess(0)

}

//生成html
func (menuTree *AdminMenuTreeService) getAuthTreeAccess(myID int) string {
	child := menuTree.GetChild(myID)
	if len(child) == 0 {
		return ""
	}
	sortId := 99999
	for k := range child {
		if k < sortId {
			sortId = k
		}
	}
	//取最小的id
	level := make(map[string]interface{})
	level = child[sortId]

	//child 排序
	var ids []int
	for id := range child {
		ids = append(ids, id)
	}
	sort.Ints(ids)
	var text []string
	if strResult, ok := menuTree.AuthType[strconv.Itoa(level["Level"].(int))]; ok {
		text = strResult.([]string)
	} else {
		text = menuTree.AuthType["1"].([]string)
	}
	for _, id := range ids {
		k := id
		v := child[k]
		if len(menuTree.GetChild(k)) > 0 {
			str := text[0]
			str = menuTree.StrAuthReplace(str, v)
			menuTree.AuthHtml += str
			menuTree.getAuthTreeAccess(k)
			str = text[1]
			menuTree.AuthHtml += str
		} else {
			str := menuTree.StrAuthReplace(menuTree.AuthType["other"].(string), v)
			menuTree.AuthHtml += str
		}
	}
	return menuTree.AuthHtml
}

//获取select 树形menu菜单
func (menuTree *AdminMenuTreeService) GetSelectMenu(selected int) string {
	menuMap := new(AdminMenuService).Menu(0)
	result := make(map[int]orm.Params)
	if menuMap == nil {
		return ""
	}
	for _, v := range menuMap {
		idInt, ok := v["Id"].(int)
		if !ok {
			idInt = int(v["Id"].(int64))
		}
		result[idInt] = v
		if selected == idInt {
			fmt.Println("idInt----------------", idInt)
			result[idInt]["Selected"] = "selected"
		} else {
			result[idInt]["Selected"] = ""
		}
	}
	str := `<option value='$id' $selected >$spacer $name</option>`
	menuTree.SelectHtml = ""
	menuTree.Array = result
	return menuTree.GenSelectHtml(0, str, selected, "", "")
}

var (
	icon  []string = []string{"│", "├", "└"}
	space string   = "&nbsp;&nbsp;"
)

//生成select html
func (menuTree *AdminMenuTreeService) GenSelectHtml(myId int, str string, sid int, adds string, strGroup string) string {
	number := 1
	child := menuTree.GetChild(myId)
	total := len(child)
	if len(child) > 0 {
		var ids []int
		for id := range child {
			ids = append(ids, id)
		}
		sort.Ints(ids)

		for _, id := range ids {
			value := child[id]
			j := ""
			k := ""
			if number == total {
				j += icon[2]
			} else {
				j = icon[1]
				if adds != "" {
					k = icon[0]
				} else {
					k = ""
				}
			}
			spacer := ""
			if adds != "" {
				spacer = adds + j
			}
			selected := ""
			if id == sid {
				selected = "selected"
			}

			nStr := ""
			idInt, ok := value["Id"].(int)
			if !ok {
				idInt := int(value["Id"].(int64))
				nStr = strings.ReplaceAll(str, "$id", strconv.Itoa(idInt))
			} else {
				nStr = strings.ReplaceAll(str, "$id", strconv.Itoa(idInt))
			}
			nameValue, ok := value["Name"].(string)
			if ok {
				nStr = strings.ReplaceAll(nStr, "$name", nameValue)
			}
			nStr = strings.ReplaceAll(nStr, "$spacer", spacer)
			nStr = strings.ReplaceAll(nStr, "$selected", selected)
			menuTree.SelectHtml += nStr
			menuTree.GenSelectHtml(id, str, sid, adds+k+space, strGroup)
			number++
		}

	}
	return menuTree.SelectHtml
}
