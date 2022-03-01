package services

import (
	"beego_new/models"
	"errors"
	"fmt"
	"time"

	"github.com/golang-jwt/jwt"
)

type BaseService struct {
}

// JWT : HEADER PAYLOAD SIGNATURE
const (
	SecretKEY              string = "JWT-Secret-Key"
	DEFAULT_EXPIRE_SECONDS int    = 180 // default expired 1 minute
)

// This struct is the payload
type MyCustomClaims struct {
	UserID int `json:"UserID"`
	jwt.StandardClaims
}

// This struct is the parsing of token payload
type JwtPayload struct {
	Username  string `json:"Username"`
	UserID    int    `json:"UserID"`
	IssuedAt  int64  `json:"Iat"`
	ExpiresAt int64  `json:"Exp"`
}

//验证前端回传的token是否失效
func CheckStatus(tokenString string) (string, int64) {

	jp, err := ValidateToken(tokenString)

	if err != nil {
		// if token has already expired
		fmt.Println("Your token has expired, Please log in again! ")
		return "", -1
	}
	timeDiff := jp.ExpiresAt - time.Now().Unix()
	fmt.Println("timeDiff = ", timeDiff)
	if timeDiff <= 30 {
		// if token is close to expiration, refresh the token
		fmt.Println("Your token would soon be expired")
		newToken, err := RefreshToken(tokenString)
		if err == nil {
			return newToken, timeDiff
		}
	}
	// if token is valid, do nothing
	return tokenString, timeDiff
}

//生成jwt token
func GenerateToken(loginInfo *models.AdminUser, userID int, expiredSeconds int) (tokenString string, err error) {

	if expiredSeconds == 0 {

		expiredSeconds = DEFAULT_EXPIRE_SECONDS
	}

	// Create the Claims
	mySigningKey := []byte(SecretKEY)
	expireAt := time.Now().Add(time.Minute * time.Duration(expiredSeconds)).Unix()
	fmt.Println(expireAt)
	user := *loginInfo
	claims := MyCustomClaims{

		userID,
		jwt.StandardClaims{

			Issuer:    user.Username,
			IssuedAt:  time.Now().Unix(),
			ExpiresAt: expireAt,
		},
	}

	// Create the token using your claims
	token := jwt.NewWithClaims(jwt.SigningMethodHS256, claims)
	// Signs the token with a secret
	tokenStr, err := token.SignedString(mySigningKey)
	if err != nil {

		return "", errors.New("error: failed to generate token")
	}

	return tokenStr, nil
}

//validate token
func ValidateToken(tokenString string) (*JwtPayload, error) {

	token, _ := jwt.ParseWithClaims(tokenString, &MyCustomClaims{},
		func(token *jwt.Token) (interface {
		}, error) {
			return []byte(SecretKEY), nil
		})

	claims, ok := token.Claims.(*MyCustomClaims)
	if ok && token.Valid {
		return &JwtPayload{
			Username:  claims.StandardClaims.Issuer,
			UserID:    claims.UserID,
			IssuedAt:  claims.StandardClaims.IssuedAt,
			ExpiresAt: claims.StandardClaims.ExpiresAt,
		}, nil
	} else {
		return nil, errors.New("error: failed to validate token")
	}
}

//刷新token
func RefreshToken(tokenString string) (newTokenString string, err error) {

	// get previous token
	token, err := jwt.ParseWithClaims(tokenString, &MyCustomClaims{},
		func(token *jwt.Token) (interface {
		}, error) {

			return []byte(SecretKEY), nil
		})

	claims, ok := token.Claims.(*MyCustomClaims)
	if !ok || !token.Valid {

		return "", err
	}

	mySigningKey := []byte(SecretKEY)
	expireAt := time.Now().Add(time.Second * time.Duration(DEFAULT_EXPIRE_SECONDS)).Unix() //new expired
	newClaims := MyCustomClaims{

		claims.UserID,
		jwt.StandardClaims{

			Issuer:    claims.StandardClaims.Issuer, //name of token issue
			IssuedAt:  time.Now().Unix(),            //time of token issue
			ExpiresAt: expireAt,                     // new expired
		},
	}

	// generate new token with new claims
	newToken := jwt.NewWithClaims(jwt.SigningMethodHS256, newClaims)
	// sign the token with a secret
	tokenStr, err := newToken.SignedString(mySigningKey)
	if err != nil {

		return "", errors.New("error: failed to generate new fresh json web token")
	}

	return tokenStr, nil
}
