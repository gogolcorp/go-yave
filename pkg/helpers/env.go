package helpers

import (
	"os"

	log "github.com/sirupsen/logrus"

	"github.com/joho/godotenv"
)

func EnvVar(key string) string {
	if err := godotenv.Load(".env"); err != nil {
		log.Error("Error loading .env file", err)
	}

	envVars, doesExist := os.LookupEnv(key)
	if !doesExist {
		log.Error("Couldn't find variable : ", key)
	}

	return envVars
}
