require('./seperateOutTests')();
var generate = require('json-schema-test-data-generator');
var fs = require('fs')

var schemaFileFolderLocation= '../inputSchema/'

const args = process.argv.slice(2);

var schemaFileName = args[0];
var resultsFolderName = args[1];
var resultsFileName = args[2];

var schemaLocation = schemaFileFolderLocation + schemaFileName;
var schema = require(schemaLocation)
var output = generate(schema);

fs.mkdirSync('./generateTests/testsGenerated/' + resultsFolderName, { recursive: true })
var resultsFileNamePath = './generateTests/testsGenerated/' + resultsFolderName  + "/" + resultsFileName;
fs.writeFileSync(resultsFileNamePath, JSON.stringify(output));

var resultsFileNamePathSeperation = '../testsGenerated/' + resultsFolderName  + "/" + resultsFileName;
seperateTests(resultsFileNamePathSeperation, resultsFolderName)
