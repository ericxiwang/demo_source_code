import pytest, requests, json

#base_url = "http://flask-example:8080"
with open('api_temp.json', 'r') as file:
    api_json_temp = json.load(file)

print(api_json_temp)

@pytest.mark.list_operation
@pytest.mark.parametrize("test_case_name", ["/api/v1/list_reverse_slice"])
def test_api_list_reverse_slice(test_case_name,api_authentication, base_url):
    api_url = base_url + test_case_name
    test_list = api_json_temp[test_case_name]['user_list'][::-1]

    payload = json.dumps(api_json_temp[test_case_name])

    response = requests.request("POST", api_url, headers=api_authentication, data=payload)
    get_json = response.json()
    print(get_json['result'])
    #response = requests.get(api_url)

    # Verify status code
    assert response.status_code == 200
    assert get_json['result'] == test_list
@pytest.mark.list_operation
@pytest.mark.parametrize("test_case_name", ["/api/v1/list_reverse_loop"])
def test_api_list_reverse_loop(test_case_name,api_authentication, base_url):
    api_url = base_url + test_case_name
    test_list = api_json_temp[test_case_name]['user_list'][::-1]

    payload = json.dumps(api_json_temp[test_case_name])

    response = requests.request("POST", api_url, headers=api_authentication, data=payload)
    get_json = response.json()
    print(get_json['result'])
    #response = requests.get(api_url)

    # Verify status code
    assert response.status_code == 200
    assert get_json['result'] == test_list

@pytest.mark.list_operation
@pytest.mark.parametrize("test_case_name", ["/api/v1/list_comprehension"])
def test_api_list_comprehension(test_case_name,api_authentication, base_url):
    limit_list = 10
    api_url = base_url + test_case_name
    payload = json.dumps(api_json_temp[test_case_name])


    response = requests.request("POST", api_url, headers=api_authentication, data=payload)
    get_json = response.json()
    print(get_json['result'])
    assert response.status_code == 200

    def list_verify(limit_list):
        new_list = [i ** 2 for i in range(1, limit_list) if i * (i - 2) % 3 == 0]
        return new_list

    assert get_json['result'] == list_verify(limit_list)

@pytest.mark.list_operation
@pytest.mark.parametrize("test_case_name", ["/api/v1/list_find_duplicates"])
def list_find_duplicates(test_case_name,api_authentication, base_url):
    api_url = base_url + test_case_name

    payload = json.dumps(api_json_temp[test_case_name])
    print(payload)

    response = requests.request("POST", api_url, headers=api_authentication, data=payload)
    get_json = response.json()
    print(get_json['result'])


    # Verify status code
    assert response.status_code == 200
    assert get_json['result'][0] == 3000

@pytest.mark.list_operation
@pytest.mark.parametrize("test_case_name", ["/api/v1/list_topKFrequent"])
def list_topKFrequent(test_case_name,api_authentication, base_url):
    api_url = base_url + test_case_name

    payload = json.dumps(api_json_temp[test_case_name])

    print(payload)

    response = requests.request("POST", api_url, headers=api_authentication, data=payload)
    get_json = response.json()
    print(get_json['result'])


    # Verify status code
    assert response.status_code == 200
    assert get_json['result'][0] == [3, 5000]
    assert get_json['result'][1] == [2, 3000]
    assert get_json['result'][2] == [1, 9000]


@pytest.mark.data_validator
@pytest.mark.parametrize("test_case_name, user_name, user_group", [("/api/v1/user_profile","admin_test@test.com", "admin")])
def test_user_profile(test_case_name,user_name,user_group,api_authentication, base_url):
    api_url = base_url + "/api/v1/user_profile"
    payload = json.dumps({
        "user_name": "admin_test@test.com",
        "user_address": "1110-1111 eastwood street",
        "user_group": "admin"
    })


    response = requests.request("POST", api_url, headers=api_authentication, data=payload)
    get_json = response.json()
    print(get_json,user_name,user_group)
    assert response.status_code == 200
    assert get_json['user_name'] == user_name
    assert get_json['user_group'] == user_group


@pytest.mark.parametrize("test_case_name", ["/api/v1/fib_loop"])
def test_api_fib_loop(test_case_name,api_authentication, base_url):
    api_url = base_url + test_case_name

    payload = json.dumps(api_json_temp[test_case_name])


    response = requests.request("POST", api_url, headers=api_authentication, data=payload)
    get_json = response.json()
    print(get_json['result'])
    #response = requests.get(api_url)

    # Verify status code
    assert response.status_code == 200
@pytest.mark.parametrize("test_case_name", ["/api/v1/fib_recursion_2"])
def test_api_fib_recursion_2(test_case_name,api_authentication, base_url):
    api_url = base_url + test_case_name

    payload = json.dumps(api_json_temp[test_case_name])


    response = requests.request("POST", api_url, headers=api_authentication, data=payload)
    get_json = response.json()
    print(get_json['result'])
    #response = requests.get(api_url)

    # Verify status code
    assert response.status_code == 200

@pytest.mark.data_validator
@pytest.mark.parametrize("test_case_name", ["/api/v1/validate_ipv4_general"])
@pytest.mark.parametrize("ipv4", ["192.168.1.1","200.200.200.1","0.0.0.0","8.8.8.8","999.999.999.999"])
def test_validate_ipv4_general(test_case_name,api_authentication, base_url,ipv4):
    api_url = base_url + test_case_name

    payload = json.dumps({"ipv4": ipv4})

    response = requests.request("POST", api_url, headers=api_authentication, data=payload)
    get_json = response.json()


    assert response.status_code == 200
    assert get_json['result'] is True

@pytest.mark.data_validator
@pytest.mark.parametrize("test_case_name", ["/api/v1/validate_ipv4_regex"])
@pytest.mark.parametrize("ipv4", ["192.168.1.1","200.200.200.1","0.0.0.0","8.8.8.8","999.999.999.999"])
def test_validate_ipv4_regex(test_case_name,api_authentication, base_url,ipv4):
    api_url = base_url + test_case_name

    payload = json.dumps({"ipv4": ipv4})

    response = requests.request("POST", api_url, headers=api_authentication, data=payload)
    get_json = response.json()


    assert response.status_code == 200
    assert get_json['result'] is True



@pytest.mark.data_validator
@pytest.mark.parametrize("test_case_name", ["/api/v1/validate_email_regex"])
@pytest.mark.parametrize("email", ["admin@admin.com","user_name@gmail.com","user-name@gmail-abc.com","123@234.345","admin@admin@admin.com"])
def test_validate_email_regex(test_case_name,api_authentication, base_url,email):
    api_url = base_url + test_case_name

    payload = json.dumps({"email": email})

    response = requests.request("POST", api_url, headers=api_authentication, data=payload)
    get_json = response.json()

    assert response.status_code == 200
    assert get_json['result'] is True


@pytest.mark.data_validator
@pytest.mark.parametrize("test_case_name", ["/api/v1/valid_parentheses_nostack"])
@pytest.mark.parametrize("parentheses_string", ["{}", "{[()]}", "{}()[]", "{[]}{()}", "({[})]{}"])
def test_valid_parentheses_nostack(test_case_name, api_authentication, base_url, parentheses_string):
    api_url = base_url + test_case_name

    payload = json.dumps({"parentheses_string": parentheses_string})

    response = requests.request("POST", api_url, headers=api_authentication, data=payload)
    get_json = response.json()

    assert response.status_code == 200
    assert get_json['result'] is True

@pytest.mark.parametrize("test_case_name", ["/api/v1/search_insert"])
@pytest.mark.parametrize("nums,target,result", [([1,3,5,7],9,4),([2,4,6,8],1,0),([1,3,5,6],5,2)])
def test_search_insert(test_case_name, api_authentication, base_url, nums,target,result):
    api_url = base_url + test_case_name
    print(nums,target)
    payload = json.dumps({"nums": nums,"target": target})

    response = requests.request("POST", api_url, headers=api_authentication, data=payload)
    get_json = response.json()

    assert response.status_code == 200

    assert get_json['result'] == result

@pytest.mark.data_validator
@pytest.mark.parametrize("test_case_name", ["/api/v1/valid_parentheses_stack"])
@pytest.mark.parametrize("parentheses_string", ["{}", "{[()]}", "{}()[]", "{[]}{()}", "({[})]{}"])
def test_valid_parentheses_stack(test_case_name, api_authentication, base_url, parentheses_string):
    api_url = base_url + test_case_name

    payload = json.dumps({"parentheses_string": parentheses_string})

    response = requests.request("POST", api_url, headers=api_authentication, data=payload)
    get_json = response.json()

    assert response.status_code == 200
    assert get_json['result'] is True


@pytest.mark.sort
@pytest.mark.parametrize("test_case_name", ["/api/v1/selection_sort"])
def test_api_selection_sort(test_case_name,api_authentication, base_url):
    api_url = base_url + test_case_name

    payload = json.dumps(api_json_temp[test_case_name])

    response = requests.request("POST", api_url, headers=api_authentication, data=payload)
    get_json = response.json()

    assert  get_json['result'] == sorted(api_json_temp[test_case_name]['user_list'])
@pytest.mark.sort
@pytest.mark.parametrize("test_case_name", ["/api/v1/bubble_sort"])
def test_api_bubble_sort(test_case_name,api_authentication, base_url):
    api_url = base_url + test_case_name

    payload = json.dumps(api_json_temp[test_case_name])

    response = requests.request("POST", api_url, headers=api_authentication, data=payload)
    get_json = response.json()

    assert  get_json['result'] == sorted(api_json_temp[test_case_name]['user_list'])
@pytest.mark.sort
@pytest.mark.parametrize("test_case_name", ["/api/v1/quick_sort"])
def test_api_quick_sort(test_case_name,api_authentication, base_url):
    api_url = base_url + test_case_name

    payload = json.dumps(api_json_temp[test_case_name])

    response = requests.request("POST", api_url, headers=api_authentication, data=payload)
    get_json = response.json()
    print(get_json['result'])
    assert get_json['result'] == sorted(api_json_temp[test_case_name]['user_list'])

@pytest.mark.sort
@pytest.mark.parametrize("test_case_name", ["/api/v1/build_in_sort"])
def test_api_build_in_sort(test_case_name,api_authentication, base_url):
    api_url = base_url + test_case_name

    payload = json.dumps(api_json_temp[test_case_name])

    response = requests.request("POST", api_url, headers=api_authentication, data=payload)
    get_json = response.json()
    print(get_json['result'])
    assert get_json['result'] == sorted(api_json_temp[test_case_name]['user_list'])

@pytest.mark.data_query
@pytest.mark.parametrize("test_case_name", [("/api/v1/data_grid/China"),
                                            ("/api/v1/data_grid/Canada"),
                                            ("/api/v1/data_grid/Israel"),
                                            ("/api/v1/data_grid/Spain"),
                                            ("/api/v1/data_grid/France"),])
def test_api_data_grid(test_case_name,api_authentication, base_url):
    api_url = base_url + test_case_name


    response = requests.request("GET", api_url, headers=api_authentication)
    get_json = response.json()
    print(get_json['result'])
    #assert get_json['result'] == sorted(api_json_temp[test_case_name]['user_list'])


@pytest.mark.data_validator
@pytest.mark.parametrize("test_case_name", ["/api/v1/smallest_factor"])
@pytest.mark.parametrize("number", ["1","3","5","7","11","13","999","991"])
def test_smallest_factor(test_case_name,api_authentication, base_url,number):
    api_url = base_url + test_case_name + "/" + number


    response = requests.request("GET", api_url, headers=api_authentication)
    get_json = response.json()
    print(get_json['smallest_factor'])
    if int(number) <= 1:
        pass
    else:
        assert get_json['smallest_factor'] == int(number)

@pytest.mark.data_validator
@pytest.mark.parametrize("test_case_name", ["/api/v1/ip_address_generator"])
@pytest.mark.parametrize("repeat", range(6))
def test_ip_address_generator(test_case_name,api_authentication, base_url,repeat):
    api_url = base_url + test_case_name
    verify_url = base_url + "/api/v1/validate_ipv4_regex"


    response = requests.request("GET", api_url, headers=api_authentication)
    get_json = response.json()
    print(get_json['ipv4'])
    payload = json.dumps({"ipv4":get_json['ipv4']})
    feedback = requests.request("POST", verify_url, headers=api_authentication, data=payload)
    get_feedback = feedback.json()
    print(get_feedback['result'])
    assert get_feedback['result'] is True
