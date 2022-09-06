*** Settings ***
Library  OperatingSystem
Library  json
Library  RequestsLibrary
Library  JSONLibrary
Library  Collections

*** Variables ***
${BASE_URL}  http://127.0.0.1:4010

*** test cases ***
TC_001_POST_pet_fail_due_to_format_id
    create session  AddData  ${BASE_URL}
    &{body} =    read_in_file   ../robot-framework-api-testing-automation/generateTests/testsGenerated/petTestResults//MessageShouldNotWorkWithIdOfTypeString.json
    &{header}=  create dictionary  Content-Type=application/json  Authorization=Bearer write:pets
    ${response}=  post request  AddData  /pet  data=${body}  headers=${header}
    ${statusCode}=  convert to string  ${response.status_code}
    should be equal  ${statusCode}  422

TC_002_POST_pet_pass_with_all_required_properties
    create session  AddData  ${BASE_URL}
    &{body} =    read_in_file   ../robot-framework-api-testing-automation/generateTests/testsGenerated/petTestResults/MessageShouldWorkWithAllRequiredProperties.json
    &{header}=  create dictionary  Content-Type=application/json  Authorization=Bearer write:pets
    ${response}=  post request  AddData  /pet  data=${body}  headers=${header}
    ${statusCode}=  convert to string  ${response.status_code}
    should be equal  ${statusCode}  200

*** Keywords ***    
read_in_file
    [Arguments]    ${file_path}
    ${data_as_string} =    Get File    ${file_path}
    ${dict}    Evaluate    json.loads($data_as_string)    json
    [Return]  ${dict}
