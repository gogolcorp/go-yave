package models

import "time"

type User struct {
	Id        uint      `json:"id"`
	Name      string    `json:"name"`
	Age       uint      `json:"age"`
	CreatedAt time.Time `json:"created_at"`
	UpdatedAt time.Time `json:"updated_at"`
}

type Users []User

type UserInput struct {
	Name string `json:"name"`
	Age  uint   `json:"age"`
}
