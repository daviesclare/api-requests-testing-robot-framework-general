var inputfile = '../robot_tests/files/api.yaml',
    outputfile = 'api.json',
    yaml = require('js-yaml'),
    fs = require('fs'),
    obj = yaml.load(fs.readFileSync(inputfile, {encoding: 'utf-8'}));

fs.writeFileSync(outputfile, JSON.stringify(obj, null, 2));
