package persistence

import (
	"github.com/blyndusk/go-yave/internal/infrastructure/database"
	"github.com/blyndusk/go-yave/internal/models"
)

func CreateUser(user *models.User) (err error) {
	db := database.GetDBClient()
	err = db.Model(&models.User{}).Create(user).Error
	if err != nil {
		panic("aled")
	}
	return
}

func GetAllUsers() (users []*models.User, err error) {
	db := database.GetDBClient()
	err = db.Find(&users).Error
	return
}

func GetUserById(id uint) (user *models.User, err error) {
	db := database.GetDBClient()
	err = db.Model(&models.User{}).Where("id = ?", id).First(&user).Error
	return
}

func UpdateUser(user *models.User) (err error) {
	db := database.GetDBClient()
	err = db.Model(&user).Updates(user).Error
	return
}

func DeleteUser(id uint) (err error) {
	db := database.GetDBClient()
	err = db.Model(&models.User{}).Where("id = ?", id).Delete(&models.User{}, id).Error
	return
}
