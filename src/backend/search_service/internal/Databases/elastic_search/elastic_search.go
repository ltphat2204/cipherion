package elastic_search

import (
	"fmt"
	"github.com/elastic/go-elasticsearch/v8"
	"log"
	"os"
)

func Connect() (*elasticsearch.TypedClient, error) {
	elasticURL := os.Getenv("ELASTIC_URL")
	log.Println(elasticURL)
	es, err := elasticsearch.NewTypedClient(elasticsearch.Config{
		Addresses: []string{fmt.Sprintf("http://%s", elasticURL},
	})
	return es, err
}
