*** Settings ***
Library  RequestsLibrary
Library  JSONLibrary
Library  Collections

*** Variables ***
${BASE_URL}   http://127.0.0.1:4010

*** Test Cases ***
TC_001_Delete_Request_Fetch_and_Validate_Pet_Content
    create session  Delete_Pet_Details  ${BASE_URL}
    &{header}=  create dictionary  Content-Type=application/json  Authorization=Bearer write:pets
    ${response}=  Delete Request  Delete_Pet_Details  /pet/4066162388379209700  headers=${header}
    ${statusCode}=  convert to string  ${response.status_code}
    should be equal  ${statusCode}  200
