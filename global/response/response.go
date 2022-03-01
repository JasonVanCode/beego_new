package response

import (
	"errors"

	"github.com/beego/beego/v2/server/web/context"
)

const (
	ERROR = iota
	SUCCESS
)

// Response 响应参数结构体
type Response struct {
	Code int         `json:"code"`
	Msg  string      `json:"msg"`
	Data interface{} `json:"data"`
	Url  string      `json:"url"`
	Wait int         `json:"wait"`
}

//下面是处理返回的函数
func Result(code int, msg string, data interface{}, header map[string]string, ctx *context.Context) {
	result := Response{
		Code: code,
		Msg:  msg,
		Data: data,
	}
	//下面是自定义返回header
	if len(header) > 0 {
		for k, v := range header {
			ctx.Output.Header(k, v)
		}
	}

	ctx.Output.JSON(result, false, false)
	//结束请求
	panic(errors.New("user stop run"))
}

// Success 成功、普通返回
func Success(ctx *context.Context) {
	Result(SUCCESS, "操作成功", "", map[string]string{}, ctx)
}

//Success 成功，自定义消息返回
func SuccessMsg(msg string, ctx *context.Context) {
	Result(SUCCESS, msg, "", map[string]string{}, ctx)
}

func SuccessMsgData(msg string, data interface{}, ctx *context.Context) {
	Result(SUCCESS, msg, data, map[string]string{}, ctx)
}

func Error(ctx *context.Context) {
	Result(ERROR, "操作失败", "", map[string]string{}, ctx)
}

func ErrorMsg(msg string, ctx *context.Context) {
	Result(ERROR, msg, "", map[string]string{}, ctx)
}
