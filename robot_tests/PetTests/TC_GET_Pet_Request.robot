*** Settings ***
Library  RequestsLibrary
Library  JSONLibrary
Library  Collections

*** Variables ***
${BASE_URL}   http://127.0.0.1:4010

*** Test Cases ***
TC_001_Get_Request_Fetch_and_Validate_Pet_Content
    create session  Get_Pet_Details  ${BASE_URL}
    &{header}=  create dictionary  Content-Type=application/json  Authorization=Bearer read:pets
    ${response}=  get request  Get_Pet_Details  /pet/6176579284612870000  headers=${header}
    Log To Console  ${response.content}
