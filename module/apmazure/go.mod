module go.elastic.co/apm/module/apmazure/v2

go 1.17

require (
	github.com/Azure/azure-pipeline-go v0.2.3
	github.com/Azure/azure-storage-blob-go v0.14.0
	github.com/Azure/azure-storage-file-go v0.8.0
	github.com/Azure/azure-storage-queue-go v0.0.0-20191125232315-636801874cdd
	github.com/stretchr/testify v1.7.0
	go.elastic.co/apm/module/apmhttp/v2 v2.2.0
	go.elastic.co/apm/v2 v2.2.0
	golang.org/x/crypto v0.0.0-20210921155107-089bfa567519 // indirect
)

require (
	github.com/armon/go-radix v1.0.0 // indirect
	github.com/davecgh/go-spew v1.1.0 // indirect
	github.com/elastic/go-sysinfo v1.8.1 // indirect
	github.com/google/go-cmp v0.5.8 // indirect
	github.com/google/uuid v1.2.0 // indirect
	github.com/joeshaw/multierror v0.0.0-20140124173710-69b34d4ec901 // indirect
	github.com/mattn/go-ieproxy v0.0.1 // indirect
	github.com/pkg/errors v0.9.1 // indirect
	github.com/pmezard/go-difflib v1.0.0 // indirect
	go.elastic.co/fastjson v1.1.0 // indirect
	golang.org/x/sys v0.2.0 // indirect
	gopkg.in/yaml.v3 v3.0.0-20200313102051-9f266ea9e77c // indirect
	howett.net/plist v1.0.0 // indirect
)

replace go.elastic.co/apm/v2 => ../..

replace go.elastic.co/apm/module/apmhttp/v2 => ../apmhttp
