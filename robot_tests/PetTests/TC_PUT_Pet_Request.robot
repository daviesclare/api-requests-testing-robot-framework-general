*** Settings ***
Library  OperatingSystem
Library  json
Library  RequestsLibrary
Library  JSONLibrary
Library  Collections

*** Variables ***
${BASE_URL}  http://127.0.0.1:4010

*** test cases ***
TC_001_PUT_pet
    create session  AddData  ${BASE_URL}
    &{body}=  create dictionary  name=ssds  photoUrls=["amet", "occaecat ex"]
    &{header}=  create dictionary  Content-Type=application/json  Authorization=Bearer write:pets
    ${response}=  put request  AddData  /pet  data=${body}  headers=${header}
    ${statusCode}=  convert to string  ${response.status_code}
    should be equal  ${statusCode}  200
