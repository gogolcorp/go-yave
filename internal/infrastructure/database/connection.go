package database

import (
	"fmt"
	"time"

	"gorm.io/driver/postgres"
	"gorm.io/gorm"

	"github.com/blyndusk/go-yave/pkg/helpers"
	"github.com/sirupsen/logrus"
)

var DBClient *gorm.DB

func Connect(migrate bool) error {
	dbURL := fmt.Sprintf("host=%s user=%s password=%s dbname=%s port=%s sslmode=disable",
		helpers.EnvVar("DB_HOST"),
		helpers.EnvVar("DB_USER"),
		helpers.EnvVar("DB_PASSWORD"),
		helpers.EnvVar("DB_NAME"),
		helpers.EnvVar("DB_PORT"),
	)
	var tmpDb *gorm.DB
	var err error

	for i := 0; i <= 5; i++ {
		tmpDb, err = gorm.Open(postgres.Open(dbURL), &gorm.Config{})
		if err != nil {
			logrus.Warn(fmt.Sprintf("Failed to connect to database. Retry... (%d/5)", i))
			time.Sleep(5 * time.Second)
			continue
		}
		if migrate {
			for i := 0; i <= 5; i++ {
				err = Migrate(tmpDb)
				if err != nil {
					continue
				}
				logrus.Info("Migrations done !")
				break
			}
		}
		break
	}
	helpers.ExitOnError("Failed to connecto to database", err)

	DBClient = tmpDb
	logrus.Info("connected to database !")
	return nil
}

func GetDBClient() *gorm.DB {
	db, err := DBClient.DB()
	if err != nil {
		return nil
	}
	if db.Ping() != nil {
		Connect(false)
		return DBClient
	} else {
		return DBClient
	}
}
