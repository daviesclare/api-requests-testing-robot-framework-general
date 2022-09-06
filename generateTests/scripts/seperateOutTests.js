
module.exports = function() { 
  this.seperateTests =
  function seperateTests(filePathToGeneratedTestFile, resultsFolderName) {
    var fs = require('fs')
    var data = require(filePathToGeneratedTestFile)
    var results = data.map(function(item) {
      var retval = [];
      Object.getOwnPropertyNames(item).forEach(function(val, idx, array) {
        retval.push({ [val]: item[val] });
      });
      return retval;
    });
    
    var arrayLength = results.length;
    for (var i = 0; i < arrayLength; i++) {
        var body = results[i][1].data
        var message = results[i][2]
        
        var stringMessage = JSON.stringify(message)

        stringMessage = removeColon(stringMessage);
        stringMessage = removeQuotes(stringMessage);
        stringMessage = removeCurlyBrackets(stringMessage);

        stringMessage = convertFirstLetterToUpperCase(stringMessage);
        stringMessage = removeSpaces(stringMessage)
        
        var folderName = "generateTests/testsGenerated/"
        var fileName = folderName + resultsFolderName + '/' + stringMessage + ".json"
        fs.writeFileSync(fileName, JSON.stringify(body))
    }
  }

}

function removeQuotes(sentence) {
  return sentence.replace(/['"]+/g, '');
}

function removeColon(sentence) {
  return sentence.replace(/[:():]/g, ' ');
}

function removeCurlyBrackets(sentence) {
  return sentence.replace(/[{()}]/g, '');
}

function removeSpaces(sentence) {
  return sentence.split(' ').join('');
}

function convertFirstLetterToUpperCase(sentence) {
  const words = sentence.split(" ");
  
  const index = words.indexOf('');
  if (index > -1) { 
    words.splice(index, 1);
  }

  for (let i = 0; i < words.length; i++) {
      words[i] = words[i][0].toUpperCase() + words[i].substr(1);
  }
  var joinedWords = words.join(" ");
  return joinedWords;
}
