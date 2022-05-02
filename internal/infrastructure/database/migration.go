package database

import (
	"github.com/blyndusk/go-yave/internal/models"
	"gorm.io/gorm"
)

func Migrate(Db *gorm.DB) error {
	// Add your models here for gorm to create the tables for you.
	return Db.AutoMigrate(&models.User{})
}
