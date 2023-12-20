module github.com/ekrucio/apm-agent-go/module/apmrichardknopmachinery/v2

go 1.15

require (
	go.elastic.co/apm/module/apmhttp/v2 v2.2.0
	go.elastic.co/apm/v2 v2.2.0
)

require github.com/RichardKnop/machinery v1.10.6

replace go.elastic.co/apm/module/apmhttp/v2 => ../apmhttp

replace go.elastic.co/apm/v2 => ../..
