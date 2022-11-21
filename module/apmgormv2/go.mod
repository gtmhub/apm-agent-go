module go.elastic.co/apm/module/apmgormv2/v2

require (
	github.com/stretchr/testify v1.6.1
	go.elastic.co/apm/module/apmsql/v2 v2.2.0
	go.elastic.co/apm/v2 v2.2.0
	gorm.io/driver/mysql v1.0.2
	gorm.io/driver/postgres v1.0.2
	gorm.io/driver/sqlite v1.1.4-0.20200928065301-698e250a3b0d
	gorm.io/gorm v1.20.2
)

require (
	github.com/armon/go-radix v1.0.0 // indirect
	github.com/davecgh/go-spew v1.1.1 // indirect
	github.com/elastic/go-sysinfo v1.8.1 // indirect
	github.com/go-sql-driver/mysql v1.5.0 // indirect
	github.com/google/go-cmp v0.5.8 // indirect
	github.com/jackc/chunkreader/v2 v2.0.1 // indirect
	github.com/jackc/pgconn v1.7.0 // indirect
	github.com/jackc/pgio v1.0.0 // indirect
	github.com/jackc/pgpassfile v1.0.0 // indirect
	github.com/jackc/pgproto3/v2 v2.0.5 // indirect
	github.com/jackc/pgservicefile v0.0.0-20200714003250-2b9c44734f2b // indirect
	github.com/jackc/pgtype v1.5.0 // indirect
	github.com/jackc/pgx/v4 v4.9.0 // indirect
	github.com/jinzhu/inflection v1.0.0 // indirect
	github.com/jinzhu/now v1.1.1 // indirect
	github.com/joeshaw/multierror v0.0.0-20140124173710-69b34d4ec901 // indirect
	github.com/mattn/go-sqlite3 v1.14.3 // indirect
	github.com/pkg/errors v0.9.1 // indirect
	github.com/pmezard/go-difflib v1.0.0 // indirect
	go.elastic.co/fastjson v1.1.0 // indirect
	golang.org/x/crypto v0.0.0-20210921155107-089bfa567519 // indirect
	golang.org/x/sys v0.2.0 // indirect
	golang.org/x/text v0.4.0 // indirect
	golang.org/x/xerrors v0.0.0-20220907171357-04be3eba64a2 // indirect
	gopkg.in/yaml.v3 v3.0.0-20200313102051-9f266ea9e77c // indirect
	howett.net/plist v1.0.0 // indirect
)

replace go.elastic.co/apm/v2 => ../..

replace go.elastic.co/apm/module/apmsql/v2 => ../apmsql

go 1.17
