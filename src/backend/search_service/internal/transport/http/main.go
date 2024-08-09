package http

import (
	"context"
	"github.com/labstack/echo/v4"
	echoSwagger "github.com/swaggo/echo-swagger"
	"log"
	"net/http"
	"search_service/internal/Controllers"
	"search_service/internal/Services"
)

func RoutingSong(server *echo.Echo, songSearch *Services.SongSearch, ctx context.Context) {
	sc := Controllers.SongController{
		SongSearch: songSearch,
		Ctx:        ctx,
	}
	server.POST("/v1/song/create", sc.InsertSong)
	server.GET("/v1/song/search", sc.SearchSong)
	server.GET("/v1/song/autocomplete", sc.Autocomplete)
	server.PATCH("/v1/song/update/name", sc.UpdateSong)
	server.DELETE("/v1/song/delete", sc.DeleteSong)
	server.GET("/swagger/*", echoSwagger.WrapHandler)
	server.GET("/", func(c echo.Context) error {
		log.Println("Server is running")
		return c.String(http.StatusOK, "Hello, World!")
	})
}
