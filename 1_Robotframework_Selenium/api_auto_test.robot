*** Settings ***
Resource    resources.robot

*** Test Cases ***
API_SESSION_INIT
    [Tags]      sanity
    API_auth
    ${flask_api_temp}=    Load Json From File        ${PATH}/api_temp.json
    Set Global Variable     ${flask_api_temp}
    Log    ${PATH}


/api/v1/list_reverse_slice
    [Tags]     list_operation
    ${body}=     Get Value From Json    ${flask_api_temp}     $.'${TEST NAME}'
    ${body}     Set Variable    ${body}[0]
   # ${body}=    Update Value To Json        ${body}      $.user_list     [9,8,7,6,5,4,3,2,1]
    ${response}=    POST    ${FLASK_CLOUD_URL}/${TEST NAME}   data=${body}     verify=${False}  headers=${api_header}
    Log     ${response.json()}


/api/v1/list_reverse_loop
    [Tags]     list_operation
    ${body}=     Get Value From Json    ${flask_api_temp}     $.'${TEST NAME}'
    ${body}     Set Variable    ${body}[0]
   # ${body}=    Update Value To Json        ${body}      $.user_list     [9,8,7,6,5,4,3,2,1]
    ${response}=    POST    ${FLASK_CLOUD_URL}/${TEST NAME}   data=${body}     verify=${False}  headers=${api_header}
    Log     ${response.json()}



/api/v1/list_comprehension
    [Tags]      list_operation
    ${body}=     Get Value From Json    ${flask_api_temp}     $.'${TEST NAME}'
    ${body}     Set Variable    ${body}[0]
    ${response}=    POST    ${FLASK_CLOUD_URL}/${TEST NAME}   json=${body}     verify=${False}  headers=${api_header}
    Log     ${response.json()}

/api/v1/list_find_duplicates
    [Tags]      list_operation
    ${body}=     Get Value From Json    ${flask_api_temp}     $.'${TEST NAME}'
    ${body}     Set Variable    ${body}[0]
    ${response}=    POST    ${FLASK_CLOUD_URL}/${TEST NAME}   json=${body}     verify=${False}  headers=${api_header}
    Log     ${response.json()}

/api/v1/list_topKFrequent
    [Tags]      list_operation
    ${body}=     Get Value From Json    ${flask_api_temp}     $.'${TEST NAME}'
    ${body}     Set Variable    ${body}[0]
    ${response}=    POST    ${FLASK_CLOUD_URL}/${TEST NAME}   json=${body}     verify=${False}  headers=${api_header}
    Log     ${response.json()}


/api/v1/fib_loop
    [Tags]     list_operation
    ${body}=     Get Value From Json    ${flask_api_temp}     $.'${TEST NAME}'
    ${body}     Set Variable    ${body}[0]
    ${response}=    POST    ${FLASK_CLOUD_URL}/${TEST NAME}   json=${body}     verify=${False}  headers=${api_header}
    Log     ${response.json()}

/api/v1/fib_recursion_2
    [Tags]     list_operation
    ${body}=     Get Value From Json    ${flask_api_temp}     $.'${TEST NAME}'
    ${body}     Set Variable    ${body}[0]
    ${response}=    POST    ${FLASK_CLOUD_URL}/${TEST NAME}   json=${body}     verify=${False}  headers=${api_header}
    Log     ${response.json()}

/api/v1/validate_ipv4_general
    [Tags]     data_validator
    ${body}=     Get Value From Json    ${flask_api_temp}     $.'${TEST NAME}'
    ${body}     Set Variable    ${body}[0]
    ${response}=    POST    ${FLASK_CLOUD_URL}/${TEST NAME}   json=${body}     verify=${False}  headers=${api_header}
    Log     ${response.json()}
    Should Be True    ${response.json()}[result]

/api/v1/validate_ipv4_regex
    [Tags]     data_validator
    ${body}=     Get Value From Json    ${flask_api_temp}     $.'${TEST NAME}'
    ${body}     Set Variable    ${body}[0]
    ${response}=    POST    ${FLASK_CLOUD_URL}/${TEST NAME}   json=${body}     verify=${False}  headers=${api_header}
    Log     ${response.json()}
    Should Be True    ${response.json()}[result]

/api/v1/validate_email_regex
    [Tags]     data_validator
    ${body}=     Get Value From Json    ${flask_api_temp}     $.'${TEST NAME}'
    ${body}     Set Variable    ${body}[0]
    ${response}=    POST    ${FLASK_CLOUD_URL}/${TEST NAME}   json=${body}     verify=${False}  headers=${api_header}
    Log     ${response.json()}
    Should Be True    ${response.json()}[result]

/api/v1/valid_parentheses_nostack
    [Tags]     data_validator
    ${body}=     Get Value From Json    ${flask_api_temp}     $.'${TEST NAME}'
    ${body}     Set Variable    ${body}[0]
    ${response}=    POST    ${FLASK_CLOUD_URL}/${TEST NAME}   json=${body}     verify=${False}  headers=${api_header}
    Log     ${response.json()}

/api/v1/valid_parentheses_stack
    [Tags]     data_validator
    ${body}=     Get Value From Json    ${flask_api_temp}     $.'${TEST NAME}'
    ${body}     Set Variable    ${body}[0]
    ${response}=    POST    ${FLASK_CLOUD_URL}/${TEST NAME}   json=${body}     verify=${False}  headers=${api_header}
    Log     ${response.json()}

/api/v1/search_insert
    [Tags]     list_operation
    ${body}=     Get Value From Json    ${flask_api_temp}     $.'${TEST NAME}'
    ${body}     Set Variable    ${body}[0]
    ${response}=    POST    ${FLASK_CLOUD_URL}/${TEST NAME}   json=${body}     verify=${False}  headers=${api_header}
    Log     ${response.json()}
    Should Be Equal As Numbers  ${response.json()}[result]   11

/api/v1/selection_sort
    [Tags]     cloud
    ${body}=     Get Value From Json    ${flask_api_temp}     $.'${TEST NAME}'
    ${body}     Set Variable    ${body}[0]
    ${response}=    POST    ${FLASK_CLOUD_URL}/${TEST NAME}   json=${body}     verify=${False}  headers=${api_header}
    Log     ${response.json()}

/api/v1/bubble_sort
    [Tags]     cloud
    ${body}=     Get Value From Json    ${flask_api_temp}     $.'${TEST NAME}'
    ${body}     Set Variable    ${body}[0]
    ${response}=    POST    ${FLASK_CLOUD_URL}/${TEST NAME}   json=${body}     verify=${False}  headers=${api_header}
    Log     ${response.json()}
/api/v1/quick_sort
    [Tags]     cloud
    ${body}=     Get Value From Json    ${flask_api_temp}     $.'${TEST NAME}'
    ${body}     Set Variable    ${body}[0]
    ${response}=    POST    ${FLASK_CLOUD_URL}/${TEST NAME}   json=${body}     verify=${False}  headers=${api_header}
    Log     ${response.json()}

/api/v1/build_in_sort
    [Tags]     cloud
    ${body}=     Get Value From Json    ${flask_api_temp}     $.'${TEST NAME}'
    ${body}     Set Variable    ${body}[0]
    ${response}=    POST    ${FLASK_CLOUD_URL}/${TEST NAME}   json=${body}     verify=${False}  headers=${api_header}
    Log     ${response.json()}

/api/v1/user_profile(check_username)
    [Tags]     cloud
    ${body}=     Get Value From Json    ${flask_api_temp}     '/api/v1/user_profile'
    Log     ${body}[0][user_name]
    ${test_data}    Set Variable    ${body}[0][user_name]
   # ${body}     Set Variable    ${body}[0]
    ${response}=    POST    ${FLASK_CLOUD_URL}/api/v1/user_profile   json=${body}     verify=${False}   headers=${api_header}
    Log     ${response.json()}
    ${real_data}    Set Variable     ${response.json()}[user_name]
    Log    ${real_data}
    Should Be Equal As Strings    ${test_data}      ${real_data}

/api/v1/user_profile(check_username_failed_demo)
    [Tags]     cloud
    ${body}=     Get Value From Json    ${flask_api_temp}     '/api/v1/user_profile'
    Log     ${body}[0][user_name]
    ${test_data}    Set Variable    ${body}[0][user_name]
   # ${body}     Set Variable    ${body}[0]
    ${response}=    POST    ${FLASK_CLOUD_URL}/api/v1/user_profile   json=${body}     verify=${False}   headers=${api_header}
    Log     ${response.json()}
    ${real_data}    Set Variable     ${response.json()}[user_name]
    Log    ${real_data}
    Should Not Be Equal As Strings    ${test_data}      ${real_data}

/api/v1/user_address(check_address)
    [Tags]     cloud
    ${body}=     Get Value From Json    ${flask_api_temp}     '/api/v1/user_profile'
    Log     ${body}[0][user_address]
    ${test_data}    Set Variable    ${body}[0][user_address]
   # ${body}     Set Variable    ${body}[0]
    ${response}=    POST    ${FLASK_CLOUD_URL}/api/v1/user_profile   json=${body}     verify=${False}   headers=${api_header}
    Log     ${response.json()}
    ${real_data}    Set Variable     ${response.json()}[user_address]
    Log    ${real_data}
    Should Be Equal As Strings    ${test_data}      ${real_data}
/api/v1/user_address(check_address_failed_demo)
    [Tags]     cloud
    ${body}=     Get Value From Json    ${flask_api_temp}     '/api/v1/user_profile'
    Log     ${body}[0][user_address]
    ${test_data}    Set Variable    ${body}[0][user_address]
   # ${body}     Set Variable    ${body}[0]
    ${response}=    POST    ${FLASK_CLOUD_URL}/api/v1/user_profile   json=${body}     verify=${False}   headers=${api_header}
    Log     ${response.json()}
    ${real_data}    Set Variable     ${response.json()}[user_address]
    Log    ${real_data}
    Should not Be Equal As Strings    ${test_data}      ${real_data}

/api/v1/user_group(check_group)
    [Tags]     cloud
    ${body}=     Get Value From Json    ${flask_api_temp}     '/api/v1/user_profile'
    Log     ${body}[0][user_group]
    ${test_data}    Set Variable    ${body}[0][user_group]
   # ${body}     Set Variable    ${body}[0]
    ${response}=    POST    ${FLASK_CLOUD_URL}/api/v1/user_profile   json=${body}     verify=${False}   headers=${api_header}
    Log     ${response.json()}
    ${real_data}    Set Variable     ${response.json()}[user_group]
    Log    ${real_data}
    Should Be Equal As Strings    ${test_data}      ${real_data}

/api/v1/user_group(check_group_failed_demo)
    [Tags]     cloud
    ${body}=     Get Value From Json    ${flask_api_temp}     '/api/v1/user_profile'
    Log     ${body}[0][user_group]
    ${test_data}    Set Variable    ${body}[0][user_group]
   # ${body}     Set Variable    ${body}[0]
    ${response}=    POST    ${FLASK_CLOUD_URL}/api/v1/user_profile   json=${body}     verify=${False}   headers=${api_header}
    Log     ${response.json()}
    ${real_data}    Set Variable     ${response.json()}[user_group]
    Log    ${real_data}
    Should not Be Equal As Strings    ${test_data}      ${real_data}

/api/v1/smallest_factor
    [Tags]     cloud
    ${prime_numbers}=     Get Value From Json    ${flask_api_temp}     $.'${TEST NAME}'
    @{prime_numbers}     Set Variable    ${prime_numbers}[0][input_numbers]

    FOR    ${each_number}       IN      @{prime_numbers}
        Log    ${each_number}
        ${response}=    GET    ${FLASK_CLOUD_URL}/${TEST NAME}/${each_number}       verify=${False}  headers=${api_header}
        Log     ${response.json()}[smallest_factor]
    END

/api/v1/ip_address_generator
    [Tags]     cloud

    FOR    ${each_number}   IN RANGE      1           10
        Log    ${each_number}
        ${response}=    GET    ${FLASK_CLOUD_URL}/${TEST NAME}     verify=${False}  headers=${api_header}
        ${input_ip_valid}   Set Variable    ${response.json()}[ipv4]
        ${body}      Create dictionary   ipv4=${input_ip_valid}
        ${response}=    POST    ${FLASK_CLOUD_URL}/api/v1/validate_ipv4_regex   json=${body}     verify=${False}  headers=${api_header}
        Log    ${response.json()}[result]
        Should Be True    ${response.json()}[result]



    END