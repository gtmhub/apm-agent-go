module github.com/ekrucio/apm-agent-go/module/apmgoredisv9/v2

go 1.15

require (
	github.com/redis/go-redis/v9 v9.4.0
	github.com/stretchr/testify v1.7.0
	go.elastic.co/apm/v2 v2.2.0
)

replace go.elastic.co/apm/v2 => ../..
