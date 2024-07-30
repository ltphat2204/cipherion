package Controllers

import (
	"context"
	"encoding/json"
	"github.com/labstack/echo/v4"
	"log"
	"net/http"
	"search_service/internal/Global"
	"search_service/internal/Models"
	"search_service/internal/Services"
)

type SongController struct {
	SongSearch *Services.SongSearch
	Ctx        context.Context
}

// InsertSong godoc
//
//	@Summary		Insert a song to Elasticsearch
//	@Description	Insert a song
//	@ID				insert-song
//	@Tags			song
//	@Accept			json
//	@Produce		json
//	@Param			name	body		string	true	"Song name"
//	@Param			id		body		string	true	"Song ID"
//	@Success		200		{object}	Global.StatusResponse
//	@Failure		500		{object}	Global.ErrorResponse
//	@Router			/song/create [post]
func (sc SongController) InsertSong(c echo.Context) error {
	name := c.FormValue("name")
	id := c.FormValue("id")
	newSong := Models.Song{
		name,
		id,
	}

	res, err := sc.SongSearch.Insert(sc.Ctx, &newSong)
	if err != nil {
		log.Println(err)
		return c.JSON(http.StatusInternalServerError, Global.ErrorResponse{
			Data: struct {
				Err error `json:"err"`
			}{
				Err: err,
			},
			Status: http.StatusInternalServerError,
		})
	}
	if res.Shards_.Successful == 1 {
		return c.JSON(http.StatusOK, Global.StatusResponse{
			Data: struct {
				Message string `json:"message"`
				Success bool   `json:"success"`
			}{
				Message: "song inserted successfully",
				Success: true,
			},
			Status: http.StatusOK,
		})
	}
	log.Println(res)
	return c.JSON(http.StatusOK, Global.StatusResponse{
		Data: struct {
			Message string `json:"message"`
			Success bool   `json:"success"`
		}{
			Message: "song inserted unsuccessfully",
			Success: true,
		},
		Status: http.StatusInternalServerError,
	})

}

// SearchSong godoc
//
//	@Summary		Searching for songs
//	@Description	Search songs by their name
//	@ID				search-songs-by-name
//	@Tags			song
//	@Accept			json
//	@Produce		json
//	@Param			name	query		string	true	"Searching name"
//	@Success		200		{object}	Global.SongResponse
//	@Failure		500		{object}	Global.ErrorResponse
//	@Router			/song/search [get]
func (sc SongController) SearchSong(c echo.Context) error {
	name := c.QueryParam("name")
	res, err := sc.SongSearch.Search(sc.Ctx, name)
	if err != nil {
		log.Println(err)
		return c.JSON(http.StatusInternalServerError, Global.ErrorResponse{
			Data: struct {
				Err error `json:"err"`
			}{
				Err: err,
			},
			Status: http.StatusInternalServerError,
		})
	}
	var songList []Models.Song
	for _, hit := range res.Hits.Hits {
		song := Models.Song{}
		err := json.Unmarshal(hit.Source_, &song)
		if err != nil {
			log.Println(err)

			return c.JSON(http.StatusInternalServerError, Global.ErrorResponse{
				Data: struct {
					Err error `json:"err"`
				}{
					Err: err,
				},
				Status: http.StatusInternalServerError,
			})
		}
		songList = append(songList, song)
	}

	response := Global.SongResponse{
		Data: struct {
			Results []Models.Song `json:"results"`
		}{
			Results: songList,
		},
		Status: http.StatusOK,
	}
	return c.JSON(http.StatusOK, response)

}

// Autocomplete godoc
//
//	@Summary		Autocomplete searching name
//	@Description	Autocomplete searching phrase
//	@ID				autocomplete-song
//	@Tags			song
//	@Accept			json
//	@Produce		json
//	@Param			name	query		string	true	"Searching name"
//	@Success		200		{object}	Global.SongResponse
//	@Failure		500		{object}	Global.ErrorResponse
//	@Router			/song/autocomplete [get]
func (sc SongController) Autocomplete(c echo.Context) error {
	prefix := c.QueryParam("prefix")
	res, err := sc.SongSearch.Completion(sc.Ctx, prefix)
	if err != nil {
		log.Println(err)
		return c.JSON(http.StatusInternalServerError, Global.ErrorResponse{
			Data: struct {
				Err error `json:"err"`
			}{
				Err: err,
			},
			Status: http.StatusInternalServerError,
		})
	}
	var songList []Models.Song
	for _, hit := range res.Hits.Hits {
		song := Models.Song{}
		err := json.Unmarshal(hit.Source_, &song)
		if err != nil {
			log.Println(err)
			return c.JSON(http.StatusInternalServerError, Global.ErrorResponse{
				Data: struct {
					Err error `json:"err"`
				}{
					Err: err,
				},
				Status: http.StatusInternalServerError,
			})
		}
		songList = append(songList, song)
	}

	response := Global.SongResponse{
		Data: struct {
			Results []Models.Song `json:"results"`
		}{
			Results: songList,
		},
		Status: http.StatusOK,
	}
	return c.JSON(http.StatusOK, response)

}

// UpdateSong godoc
//
//	@Summary		Update a song's name
//	@Description	Update a song's name by its ID
//	@ID				update-song
//	@Tags			song
//	@Accept			json
//	@Produce		json
//	@Param			id		body		string	true	"Song ID"
//	@Param			name	body		string	true	"New Song's name"
//	@Success		200		{object}	Global.StatusResponse
//	@Failure		404		{object}	Global.ErrorResponse
//	@Failure		500		{object}	Global.ErrorResponse
//	@Router			/song/update/name [patch]
func (sc SongController) UpdateSong(c echo.Context) error {
	id := c.FormValue("id")
	newName := c.FormValue("name")
	res, err := sc.SongSearch.Update(sc.Ctx, id, newName)
	if err != nil {
		log.Println(err)
		return c.JSON(http.StatusInternalServerError, Global.ErrorResponse{
			Data: struct {
				Err error `json:"err"`
			}{
				Err: err,
			},
			Status: http.StatusInternalServerError,
		})
	}
	if *res.Updated == 1 {
		return c.JSON(http.StatusOK, Global.StatusResponse{
			Data: struct {
				Message string `json:"message"`
				Success bool   `json:"success"`
			}{
				Message: "song updated",
				Success: true,
			},
			Status: http.StatusOK,
		})
	}
	return c.JSON(http.StatusOK, Global.StatusResponse{
		Data: struct {
			Message string `json:"message"`
			Success bool   `json:"success"`
		}{
			Message: "song not found",
			Success: false,
		},
		Status: http.StatusNotFound,
	})
}

// DeleteSong godoc
//
//	@Summary		Delete a song
//	@Description	Delete a song by its ID
//	@ID				delete-song
//	@Tags			song
//	@Accept			json
//	@Produce		json
//	@Param			id		query		string	true	"Deleting Song ID"
//	@Success		200		{object}	Global.StatusResponse
//	@Failure		404		{object}	Global.ErrorResponse
//	@Failure		500		{object}	Global.ErrorResponse
//	@Router			/song/delete [delete]
func (sc SongController) DeleteSong(c echo.Context) error {
	id := c.QueryParam("id")
	res, err := sc.SongSearch.Delete(sc.Ctx, id)
	if err != nil {
		log.Println(err)
		return c.JSON(http.StatusInternalServerError, Global.ErrorResponse{
			Data: struct {
				Err error `json:"err"`
			}{
				Err: err,
			},
			Status: http.StatusInternalServerError,
		})
	}
	if *res.Deleted == 1 {
		return c.JSON(http.StatusOK, Global.StatusResponse{
			Data: struct {
				Message string `json:"message"`
				Success bool   `json:"success"`
			}{
				Message: "song deleted",
				Success: true,
			},
			Status: http.StatusOK,
		})
	}
	return c.JSON(http.StatusOK, Global.StatusResponse{
		Data: struct {
			Message string `json:"message"`
			Success bool   `json:"success"`
		}{
			Message: "song not found",
			Success: false,
		},
		Status: http.StatusNotFound,
	})
}
