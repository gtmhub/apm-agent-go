// Licensed to Elasticsearch B.V. under one or more contributor
// license agreements. See the NOTICE file distributed with
// this work for additional information regarding copyright
// ownership. Elasticsearch B.V. licenses this file to you under
// the Apache License, Version 2.0 (the "License"); you may
// not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing,
// software distributed under the License is distributed on an
// "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
// KIND, either express or implied.  See the License for the
// specific language governing permissions and limitations
// under the License.

package apmrichardknopmachinery // import "github.com/ekrucio/apm-agent-go/module/apmrichardknopmachinery/v2"

import (
	"go.elastic.co/apm/module/apmhttp/v2"
	"go.elastic.co/apm/v2"
	"strings"

	"github.com/RichardKnop/machinery/v1/tasks"
)

var (
	elasticTraceparentHeader = strings.ToLower(apmhttp.ElasticTraceparentHeader)
	w3cTraceparentHeader     = strings.ToLower(apmhttp.W3CTraceparentHeader)
	tracestateHeader         = strings.ToLower(apmhttp.TracestateHeader)
)

// InjectTraceContext injects the provided apm.TraceContext in the
// headers of amqp.Publishing
//
// The header injected is W3C Trace-Context header used
// for trace propagation => "Traceparent"
// If the provided msg contains header with this key
// it will be overwritten
func InjectTraceContext(tc apm.TraceContext, headers tasks.Headers) tasks.Headers {
	if headers != nil {
		headers[w3cTraceparentHeader] = apmhttp.FormatTraceparentHeader(tc)
		if encoded := tc.State.String(); encoded != "" {
			headers[tracestateHeader] = encoded
		}
	}
	return headers
}

// ExtractTraceContext returns apm.TraceContext from the
// trace information stored in the headers.
//
// It's the client's choice how to use the provided apm.TraceContext
func ExtractTraceContext(headers tasks.Headers) (apm.TraceContext, bool) {
	txCtx, ok := getMessageTraceparent(headers, w3cTraceparentHeader)
	if !ok {
		txCtx, ok = getMessageTraceparent(headers, elasticTraceparentHeader)
	}

	if ok {
		txCtx.State, _ = getMessageTracestate(headers, tracestateHeader)
	}
	return txCtx, ok
}

func getMessageTraceparent(headers map[string]interface{}, header string) (apm.TraceContext, bool) {
	headerValue := getHeaderValueAsStringIfPresent(headers, header)
	if len(headerValue) == 0 {
		return apm.TraceContext{}, false
	}
	if trP, err := apmhttp.ParseTraceparentHeader(headerValue); err == nil {
		return trP, true
	}
	return apm.TraceContext{}, false
}

func getMessageTracestate(headers map[string]interface{}, header string) (apm.TraceState, bool) {
	headerValue := getHeaderValueAsStringIfPresent(headers, header)

	if len(headerValue) == 0 {
		return apm.TraceState{}, false
	}
	if trP, err := apmhttp.ParseTracestateHeader(headerValue); err == nil {
		return trP, true
	}
	return apm.TraceState{}, false
}

func getHeaderValueAsStringIfPresent(headers map[string]interface{}, header string) string {
	for h, val := range headers {
		if hv, ok := val.(string); ok && strings.EqualFold(header, h) {
			return hv
		}
	}
	return ""
}
