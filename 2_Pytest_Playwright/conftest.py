import pytest,json, requests



def pytest_addoption(parser):
    #default auto test demo link: http://flask-demo:8080
    parser.addoption("--base_url", action="store", default="http://localhost:8080", help="Base URL for the API tests")

@pytest.fixture(scope="session")
def api_authentication(request):
    with open('api_temp.json', 'r') as file:
        user_info_file = json.load(file)
    api_url = str(request.config.getoption("--base_url")) + str("/api/v1/auth")
    print("+++++++++++++++++++++++++++++++++",api_url)
    payload = json.dumps({"user_name": user_info_file['/api/v1/auth']['user_name'],
                          "user_password": user_info_file['/api/v1/auth']['user_password']})

    headers = {
        'Content-Type': 'application/json'
    }
    response = requests.request("POST", api_url, headers=headers, data=payload)
    get_json = response.json()

    Token = "Bearer " + get_json['access_token']
    api_headers = {
        'Content-Type': 'application/json',
        'Authorization': Token
    }
    return api_headers

@pytest.fixture(scope="session")
def base_url(request):
    return request.config.getoption("--base_url")







