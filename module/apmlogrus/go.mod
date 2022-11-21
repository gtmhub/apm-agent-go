module go.elastic.co/apm/module/apmlogrus/v2

require (
	github.com/pkg/errors v0.9.1
	github.com/sirupsen/logrus v1.2.0
	github.com/stretchr/testify v1.6.1
	go.elastic.co/apm/v2 v2.2.0
	golang.org/x/crypto v0.0.0-20210921155107-089bfa567519 // indirect
)

require (
	github.com/armon/go-radix v1.0.0 // indirect
	github.com/davecgh/go-spew v1.1.1 // indirect
	github.com/elastic/go-sysinfo v1.8.1 // indirect
	github.com/google/go-cmp v0.5.8 // indirect
	github.com/joeshaw/multierror v0.0.0-20140124173710-69b34d4ec901 // indirect
	github.com/pmezard/go-difflib v1.0.0 // indirect
	go.elastic.co/fastjson v1.1.0 // indirect
	golang.org/x/sys v0.2.0 // indirect
	golang.org/x/term v0.2.0 // indirect
	gopkg.in/yaml.v3 v3.0.0-20200313102051-9f266ea9e77c // indirect
	howett.net/plist v1.0.0 // indirect
)

replace go.elastic.co/apm/v2 => ../..

go 1.17
