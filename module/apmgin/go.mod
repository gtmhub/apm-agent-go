module go.elastic.co/apm/module/apmgin/v2

require (
	github.com/gin-gonic/gin v1.7.2
	github.com/pkg/errors v0.9.1
	github.com/stretchr/testify v1.6.1
	go.elastic.co/apm/module/apmhttp/v2 v2.2.0
	go.elastic.co/apm/v2 v2.2.0
)

require (
	github.com/armon/go-radix v1.0.0 // indirect
	github.com/davecgh/go-spew v1.1.1 // indirect
	github.com/elastic/go-sysinfo v1.8.1 // indirect
	github.com/gin-contrib/sse v0.1.0 // indirect
	github.com/go-playground/locales v0.13.0 // indirect
	github.com/go-playground/universal-translator v0.17.0 // indirect
	github.com/go-playground/validator/v10 v10.4.1 // indirect
	github.com/golang/protobuf v1.3.3 // indirect
	github.com/google/go-cmp v0.5.8 // indirect
	github.com/joeshaw/multierror v0.0.0-20140124173710-69b34d4ec901 // indirect
	github.com/leodido/go-urn v1.2.0 // indirect
	github.com/mattn/go-isatty v0.0.12 // indirect
	github.com/pmezard/go-difflib v1.0.0 // indirect
	github.com/ugorji/go/codec v1.1.7 // indirect
	go.elastic.co/fastjson v1.1.0 // indirect
	golang.org/x/crypto v0.0.0-20210921155107-089bfa567519 // indirect
	golang.org/x/sys v0.2.0 // indirect
	gopkg.in/yaml.v2 v2.2.8 // indirect
	gopkg.in/yaml.v3 v3.0.0-20200313102051-9f266ea9e77c // indirect
	howett.net/plist v1.0.0 // indirect
)

replace go.elastic.co/apm/v2 => ../..

replace go.elastic.co/apm/module/apmhttp/v2 => ../apmhttp

go 1.17
