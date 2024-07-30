package main

import (
	"context"
	"fmt"
	"github.com/elastic/go-elasticsearch/v8"
	"github.com/elastic/go-elasticsearch/v8/typedapi/indices/create"
	"github.com/elastic/go-elasticsearch/v8/typedapi/types"
	"github.com/elastic/go-elasticsearch/v8/typedapi/types/enums/icunormalizationmode"
	"github.com/elastic/go-elasticsearch/v8/typedapi/types/enums/icunormalizationtype"
	"github.com/labstack/echo/v4"
	_ "github.com/swaggo/echo-swagger"
	"log"
	_ "search_service/docs"
	_ "search_service/internal/Controllers"
	"search_service/internal/Databases/elastic_search"
	"search_service/internal/Global"
	"search_service/internal/Services"
	route "search_service/internal/transport/http"
)

func mappingList() map[string]*types.TypeMapping {
	return map[string]*types.TypeMapping{"song": Global.MappingSong}
}

// @title Lyrica API
// @version 1.0
// @description This is Lyrica serverAPI.
// @termsOfService http://swagger.io/terms/

// @host localhost:3000
// @BasePath /v1
func main() {
	ctx := context.Background()
	es, err := elastic_search.Connect()
	if err != nil {
		log.Fatalf("Error creating the client: %s", err)
	}
	server := echo.New()

	for index, mapping := range mappingList() {
		err := CreateIndex(es, index, mapping, ctx)

		if err != nil {
			log.Printf("Error creating index: %s", err.Error())
		}
	}
	songSearch := Services.NewSongSearch(es)
	route.RoutingSong(server, songSearch, ctx)
	err = server.Start(":3000")
	log.Fatal(err)
}

func CreateIndex(es *elasticsearch.TypedClient, name string, mapping *types.TypeMapping, ctx context.Context) error {
	exists, _ := es.Indices.Exists(name).Do(ctx)
	if !exists {
		res, err := es.Indices.Create(name).Request(&create.Request{
			Settings: &types.IndexSettings{
				Index: &types.IndexSettings{
					Analysis: &types.IndexSettingsAnalysis{
						Analyzer: map[string]types.Analyzer{Global.Analyzer: types.Analyzer(types.IcuAnalyzer{Method: icunormalizationtype.Nfkc, Mode: icunormalizationmode.Compose})},
					},
				},
			},
			Mappings: mapping,
		}).
			Do(ctx)
		if err != nil {
			log.Println(res)
			return err
		}
		if res.Acknowledged {
			return fmt.Errorf("error: %s", res)
		}
		log.Println(res)
	}

	return nil
}
