module github.com/ekrucio/apm-agent-go/module/apmstreadwayamqp/v2

go 1.15

require (
	github.com/streadway/amqp v1.1.0
	github.com/stretchr/testify v1.8.4
	github.com/valinurovam/garagemq v0.0.0-20210607094401-a1e62b6584f4
	go.elastic.co/apm/module/apmhttp/v2 v2.2.0
	go.elastic.co/apm/v2 v2.2.0
)

replace go.elastic.co/apm/module/apmhttp/v2 => ../apmhttp

replace go.elastic.co/apm/v2 => ../..
