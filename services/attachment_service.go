package services

import (
	"beego_new/global"
	"beego_new/models"
	"beego_new/utils"
	"errors"
	"fmt"
	"io"
	"io/fs"
	"net/http"
	"os"
	"path"
	"strconv"
	"strings"
	"time"

	"mime/multipart"

	"github.com/beego/beego/v2/client/orm"
	beego "github.com/beego/beego/v2/server/web"
	"github.com/beego/beego/v2/server/web/context"
	"github.com/google/uuid"
)

type AttachmentService struct {
	BaseService
}

// Upload 上传单个文件
func (*AttachmentService) Upload(ctx *context.Context, name string, adminUserId int, userId int) (*models.Attachment, error) {
	file, h, err := ctx.Request.FormFile(name)
	if err != nil {
		return nil, err
	}
	defer file.Close()
	if err := validateForAttachment(h); err != nil {
		return nil, err
	}
	//生成随机得名字
	newFileName := uuid.New().String()
	fileExt := path.Ext(h.Filename)
	savePath := beego.AppPath + "/" + global.Config.Attachment.Path + newFileName + fileExt
	saveDir := beego.AppPath + "/" + global.Config.Attachment.Path
	if _, err := os.Stat(saveDir); err != nil {
		os.MkdirAll(saveDir, fs.ModePerm)
	}
	f, err := os.OpenFile(savePath, os.O_WRONLY|os.O_CREATE|os.O_TRUNC, 0666)
	if err != nil {
		return nil, err
	}
	io.Copy(f, file)
	defer f.Close()

	//文件的信息存储在数据库中
	attachmentInfo := models.Attachment{
		AdminUserId:  adminUserId,
		UserId:       userId,
		OriginalName: h.Filename,
		SaveName:     newFileName,
		SavePath:     saveDir,
		Url:          "/" + global.Config.Attachment.Path + newFileName + fileExt,
		Extension:    strings.TrimLeft(fileExt, "."),
		Mime:         h.Header.Get("Content-Type"),
		Size:         h.Size,
		Md5:          utils.GetMd5String(newFileName),
		Sha1:         utils.GetSha1String(newFileName),
		CreateTime:   time.Now().Format(global.TIME_FORMAT),
		UpdateTime:   time.Now().Format(global.TIME_FORMAT),
	}
	o := orm.NewOrm()
	_, err = o.Insert(&attachmentInfo)
	if err != nil {
		return nil, err
	}
	return &attachmentInfo, nil
}

//upload 上传多个文件
func (*AttachmentService) UploadMulti(ctx *context.Context, name string, adminUserId int, userId int) error {
	// file, h, err := ctx.Request.FormFile(name)
	fmt.Println(ctx.Request.MultipartForm.File[name])

	filearr, ok := ctx.Request.MultipartForm.File[name]

	if !ok {
		return http.ErrMissingFile
	}
	fmt.Println(filearr)

	for _, v := range filearr {
		f, e := v.Open()
		if e != nil {
			return e
		}
		defer f.Close()
		//验证图片
		e = validateForAttachment(v)
		if e != nil {
			return e
		}
		//生成名字
		newFileName := uuid.New().String()
		fileExt := path.Ext(v.Filename)
		savePath := beego.AppPath + "/" + global.Config.Attachment.Path + newFileName + fileExt
		saveDir := beego.AppPath + "/" + global.Config.Attachment.Path
		//判断文件保存的目录是否存在
		if _, err := os.Stat(saveDir); err != nil {
			os.MkdirAll(saveDir, fs.ModePerm)
		}
		newFile, err := os.OpenFile(savePath, os.O_WRONLY|os.O_CREATE|os.O_TRUNC, 0666)
		if err != nil {
			return err
		}
		io.Copy(newFile, f)
		defer newFile.Close()

	}
	return nil
}

// validateForAttachment attachment自定义验证
func validateForAttachment(h *multipart.FileHeader) error {
	//文件上传最大得大小
	upload_max_size, _ := strconv.Atoi(global.Config.Attachment.ValidateSize)
	fileSize := int(h.Size)
	if fileSize > upload_max_size {
		return errors.New("文件超过限制大小")
	}
	if !strings.Contains(global.Config.Attachment.ValidateExt, strings.ToLower(strings.TrimLeft(path.Ext("a.jpg"), "."))) {
		return errors.New("不支持该文件格式得图片")
	}
	return nil
}
