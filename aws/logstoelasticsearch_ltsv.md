```js
function transform(payload) {
    if (payload.messageType === 'CONTROL_MESSAGE') {
        return null;
    }

    var bulkRequestBody = '';

    payload.logEvents.forEach(function(logEvent) {
        var timestamp = new Date(1 * logEvent.timestamp);

        // index name format: cwl-YYYY.MM.DD
        var indexName = [
            'cwl-' + timestamp.getUTCFullYear(),              // year
            ('0' + (timestamp.getUTCMonth() + 1)).slice(-2),  // month
            ('0' + timestamp.getUTCDate()).slice(-2)          // day
        ].join('.');

        var source = buildSource(logEvent.message, logEvent.extractedFields);
        console.log(logEvent);
        source['@id'] = logEvent.id;
        source['@timestamp'] = new Date(1 * logEvent.timestamp).toISOString();
        source['@message'] = logEvent.message;
        source['@owner'] = payload.owner;
        source['@log_group'] = payload.logGroup;
        source['@log_stream'] = payload.logStream;

        var action = { "index": {} };
        action.index._index = indexName;
        action.index._type = payload.logGroup;
        action.index._id = logEvent.id;
        
        bulkRequestBody += [ 
            JSON.stringify(action), 
            JSON.stringify(source),
        ].join('\n') + '\n';
    });
    return bulkRequestBody;
}

function buildSource(message, extractedFields) {
    if (extractedFields) {
        var source = {};

        for (var key in extractedFields) {
            if (extractedFields.hasOwnProperty(key) && extractedFields[key]) {
                var value = extractedFields[key];

                if (isNumeric(value)) {
                    source[key] = 1 * value;
                    continue;
                }

                jsonSubString = extractJson(value);
                if (jsonSubString !== null) {
                    source['$' + key] = JSON.parse(jsonSubString);
                }

                source[key] = value;
            }
        }
        return source;
    }

    jsonSubString = extractJson(message);
    if (jsonSubString !== null) { 
        return JSON.parse(jsonSubString); 
    }

　　ltsv = ltsvextract(message);
　  if (ltsv !== null) { 
　      //console.log("ltsv:" + JSON.stringify(ltsv));
        //return JSON.parse(JSON.stringify(ltsv)); 
        return ltsv;
    }
    return {};
}
function ltsvextract(message) {
    ary = message.split('\t');
    console.log("ary:" + ary);
    var obj ={};
    ary.map(ary=>{
        ret=ary.match(/(.*?):(.*)/);
        obj[ret[1]]=ret[2];
    });
    return obj;
}
```
