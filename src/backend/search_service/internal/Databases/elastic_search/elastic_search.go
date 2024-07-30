package elastic_search

import (
	"github.com/elastic/go-elasticsearch/v8"
)

func Connect() (*elasticsearch.TypedClient, error) {
	es, err := elasticsearch.NewTypedClient(elasticsearch.Config{
		Addresses: []string{"http://localhost:9200"},
	})

	return es, err
}
