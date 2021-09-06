package helpers

import (
	"net/http"
	"strings"

	"github.com/gin-gonic/gin"
	log "github.com/sirupsen/logrus"
	"gorm.io/gorm"
)

func ExitOnError(msg string, err error) {
	if err != nil {
		log.Fatal(msg, err)
	}
}

func GormErrorResponse(error error) (int, gin.H) {
	if strings.Split(error.Error(), ":")[0] == "Error 1062" {
		return ErrorToJson(http.StatusConflict, error.Error())
	}
	switch error {
	case gorm.ErrRecordNotFound:
		return ErrorToJson(http.StatusNotFound, gorm.ErrRecordNotFound.Error())
	case gorm.ErrInvalidTransaction:
		return ErrorToJson(http.StatusInternalServerError, gorm.ErrInvalidTransaction.Error())
	case gorm.ErrNotImplemented:
		return ErrorToJson(http.StatusInternalServerError, gorm.ErrNotImplemented.Error())
	case gorm.ErrMissingWhereClause:
		return ErrorToJson(http.StatusInternalServerError, gorm.ErrMissingWhereClause.Error())
	case gorm.ErrUnsupportedRelation:
		return ErrorToJson(http.StatusInternalServerError, gorm.ErrUnsupportedRelation.Error())
	case gorm.ErrPrimaryKeyRequired:
		return ErrorToJson(http.StatusInternalServerError, gorm.ErrPrimaryKeyRequired.Error())
	case gorm.ErrModelValueRequired:
		return ErrorToJson(http.StatusInternalServerError, gorm.ErrModelValueRequired.Error())
	case gorm.ErrInvalidData:
		return ErrorToJson(http.StatusInternalServerError, gorm.ErrInvalidData.Error())
	case gorm.ErrUnsupportedDriver:
		return ErrorToJson(http.StatusInternalServerError, gorm.ErrUnsupportedDriver.Error())
	case gorm.ErrRegistered:
		return ErrorToJson(http.StatusInternalServerError, gorm.ErrRegistered.Error())
	case gorm.ErrInvalidField:
		return ErrorToJson(http.StatusInternalServerError, gorm.ErrInvalidField.Error())
	case gorm.ErrEmptySlice:
		return ErrorToJson(http.StatusInternalServerError, gorm.ErrEmptySlice.Error())
	case gorm.ErrDryRunModeUnsupported:
		return ErrorToJson(http.StatusInternalServerError, gorm.ErrDryRunModeUnsupported.Error())
	default:
		return ErrorToJson(http.StatusInternalServerError, "Internal Server Error")
	}
}

func ErrorToJson(httpStatus int, errorMessage string) (int, gin.H) {
	return httpStatus, gin.H{
		"status": httpStatus,
		"error":  errorMessage,
	}
}
