package Global

import (
	"github.com/elastic/go-elasticsearch/v8/typedapi/types"
	"search_service/internal/Models"
)

var Analyzer = "icu"

var MappingSong = &types.TypeMapping{
	Properties: map[string]types.Property{
		"name": types.TextProperty{
			Analyzer: &Analyzer,
		},
		"id": types.NewKeywordProperty(),
	},
}

type SongResponse struct {
	Data struct {
		Results []Models.Song `json:"results"`
	} `json:"data"`
	Status int `json:"status" example:"200"`
}

type StatusResponse struct {
	Data struct {
		Message string `json:"message"`
		Success bool   `json:"success"`
	} `json:"data"`
	Status int `json:"status" example:"200"`
}

type ErrorResponse struct {
	Data struct {
		Err error `json:"err"`
	} `json:"data"`
	Status int `json:"status" example:"500"`
}
