#!/usr/bin/env node

var fs = require ('fs')

let input = process.argv.slice(2)

fs.readFile(
    input[0],
    {encoding: 'utf-8'},
    function (err, data) {
        if (!err) {
            console.log ( data[12] )
            let jason = JSON.parse(data)
            process.stdout.write( "{\"length\":" + Object.keys(jason).length + "}");
        } else { console.log ( err ); }
    });
