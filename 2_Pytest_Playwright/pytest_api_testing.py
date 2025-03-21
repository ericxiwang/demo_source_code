import pytest, requests, json

#base_url = "http://flask-example:8080"
with open('api_temp.json', 'r') as file:
    api_json_temp = json.load(file)

print(api_json_temp)


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