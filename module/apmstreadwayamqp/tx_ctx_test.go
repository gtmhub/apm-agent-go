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

package apmstreadwayamqp

import (
	"testing"

	"github.com/streadway/amqp"
	"github.com/stretchr/testify/assert"
	"github.com/stretchr/testify/require"

	"go.elastic.co/apm/module/apmhttp/v2"
	"go.elastic.co/apm/v2"
)

func TestInjectTraceContext(t *testing.T) {
	expectedTraceStateHeader := "vendorname1=opaqueValue1,vendorname2=opaqueValue2"
	traceState, err := apmhttp.ParseTracestateHeader(expectedTraceStateHeader)
	require.Nil(t, err)
	tx := apm.TraceContext{
		Trace:   apm.TraceID{0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15},
		Span:    apm.SpanID{0, 1, 2, 3, 4, 5, 6, 7},
		Options: 0,
		State:   traceState,
	}

	msg := amqp.Publishing{
		Headers: map[string]interface{}{
			"ela":   "e",
			"stic":  "l",
			"stack": "k",
		},
	}
	expectedHeaderVal := apmhttp.FormatTraceparentHeader(tx)

	InjectTraceContext(tx, msg)
	txHeader, ok := msg.Headers[w3cTraceparentHeader]
	require.True(t, ok)
	tsHeader, tsOk := msg.Headers[tracestateHeader]
	require.True(t, ok)
	assert.Equal(t, expectedHeaderVal, txHeader)
	require.True(t, tsOk)
	assert.Equal(t, expectedTraceStateHeader, tsHeader)
}

func TestExtractTraceContext(t *testing.T) {
	ts, err := apmhttp.ParseTracestateHeader("vendorname1=opaqueValue1,vendorname2=opaqueValue2")
	require.Nil(t, err)
	tx := apm.TraceContext{
		Trace:   apm.TraceID{0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15},
		Span:    apm.SpanID{0, 1, 2, 3, 4, 5, 6, 7},
		Options: 0,
		State:   ts,
	}

	msg := amqp.Publishing{
		Headers: map[string]interface{}{
			"ela":   "e",
			"stic":  "l",
			"stack": "k",
		},
	}
	InjectTraceContext(tx, msg)
	extrTraceCtx, extrOk := ExtractTraceContext(amqp.Delivery{Headers: msg.Headers})
	require.True(t, extrOk)
	assert.Equal(t, tx, extrTraceCtx)
}
