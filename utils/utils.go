package utils

import (
	"beego_new/global"
	"crypto/md5"
	"crypto/sha1"
	"fmt"
	"math/rand"
	"strconv"
	"time"

	"golang.org/x/crypto/bcrypt"
)

// PasswordHash php的函数password_hash
func PasswordHash(pass string) (string, error) {
	hashpass, err := bcrypt.GenerateFromPassword([]byte(pass), bcrypt.DefaultCost)
	return string(hashpass), err
}

//PasswordVerify php的函数password_verify
func PasswordVerify(hash string, pass string) bool {
	err := bcrypt.CompareHashAndPassword([]byte(hash), []byte(pass))
	return err == nil
}

//获取随机的md5加密串
func GetRandMd5String() string {
	now_time := time.Now()
	data := []byte(strconv.FormatInt(now_time.UnixNano(), 10) + GetRandString())
	return fmt.Sprintf("%x", md5.Sum(data))
}

//获取随机的数字
func GetRandString() (res string) {
	rand.Seed((time.Now().UnixNano()))
	letter := []byte(global.LOWER_LETTER)
	for i := 0; i < 4; i++ {
		res += string(letter[rand.Intn(len(letter))])
	}
	return
}

//获取指定字符的md5加密
func GetMd5String(str string) string {
	data := []byte(str)
	return fmt.Sprintf("%x", md5.Sum(data))
}

func GetSha1String(str string) string {
	data := []byte(str)
	return fmt.Sprintf("%x", sha1.Sum(data))
}

//去slice重复元素
//该函数总共初始化两个变量，一个长度为0的slice，一个空map。由于slice传参是按引用传递，没有创建额外的变量。
//只是用了一个for循环，代码更简洁易懂。
//利用了map的多返回值特性。
//空struct不占内存空间，可谓巧妙。

func RemoveDuplicateElement(addrs []string) []string {
	result := make([]string, 0, len(addrs))
	temp := map[string]struct{}{}
	for _, item := range addrs {
		if _, ok := temp[item]; !ok {
			temp[item] = struct{}{}
			result = append(result, item)
		}
	}
	return result
}

func KeyInMap(k string, m map[string]interface{}) bool {
	_, ok := m[k]
	return ok
}

// int 在 []int中是否存在
func InArrayForInt(arrayInt []int, key int) bool {
	for _, v := range arrayInt {
		if v == key {
			return true
		}
	}

	return false
}

// string 在[]string 是否存在
func InArrayForString(arrayString []string, key string) bool {
	for _, v := range arrayString {
		if v == key {
			return true
		}
	}
	return false
}

//[]string 转 []int
func TransSliceStringToInt(sliceString []string) []int {
	var data []int
	for _, str := range sliceString {
		res, _ := strconv.Atoi(str)
		data = append(data, res)
	}
	return data
}
