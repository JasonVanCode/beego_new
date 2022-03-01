package global

import (
	"beego_new/conf"
)

const TIME_FORMAT = "2006-01-02 15:04:05"

const LOWER_LETTER = "abcdefghijklmnopqrstuvwxyz"

// LOGIN_USER 登录用户key
const LOGIN_USER = "loginUser"

// LOGIN_USER_ID 登录用户id
const LOGIN_USER_ID = "LoginUserId"

// LOGIN_USER_ID_SIGN 登录用户签名
const LOGIN_USER_ID_SIGN = "loginUserIdSign"

var (
	Config conf.Server
)
