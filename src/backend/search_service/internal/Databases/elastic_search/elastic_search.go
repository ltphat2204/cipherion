package elastic_search

import (
	"fmt"
	"github.com/elastic/go-elasticsearch/v8"
	"log"
	"os"
)

func Connect() (*elasticsearch.TypedClient, error) {
	if err != nil {
		log.Fatal("Error loading .env file")
	}
	elasticURL := os.Getenv("ELASTIC_URL")
	es, err := elasticsearch.NewTypedClient(elasticsearch.Config{
		Addresses: []string{fmt.Sprintf("http://%s", elasticURL)},
	})

	return es, err
}
