package conf

type Server struct {
	Mysql      Mysql      `json:"mysql" yaml:"mysql"`
	Attachment Attachment `json:"attachment" yaml:"attachment"`
}
