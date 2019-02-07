"""
    Request manager
"""
import requests
import yaml

CONFIG_DATA = yaml.load(open('environment.yml'))


class RequestManager:
    """
    Class that performs API requests.
    """

    def __init__(self):
        """
            Method init
        """
        self.method = ''
        self.endpoint = ''
        self.headers = {
            'X-TrackerToken': CONFIG_DATA['token'],
            'Content-Type': 'application/json'
        }
        self.body = {}
        self.parameters = {}
        self.base_url = CONFIG_DATA['api_url']
        self.authentication = (CONFIG_DATA['user'], CONFIG_DATA['pass'])

    def set_headers(self, headers):
        """
            Mehod set headers
        :param headers: headers
        """
        self.headers = headers

    def set_parameters(self, parameters):
        """
            Method set parameters
        :param parameters:
        """
        self.parameters = parameters

    def set_body(self, body):
        """
            Method set body
        :param body: body
        """
        self.body = body

    def set_base_url(self, base_url):
        """
            Method set base url
        :param base_url: base url
        """
        self.base_url = base_url

    def set_method(self, method):
        """
            Method set methods
        :param method: method
        """
        self.method = method

    def set_endpoint(self, endpoint):
        """
            Method set endpoints
        :param endpoint: endpoint
        """
        self.endpoint = endpoint

    def get_body(self):
        """
            Method get body
        :return: body
        """
        return self.body

    def get_headers(self):
        """
            Method get headers
        :return: headers
        """
        return self.headers

    def get_parameters(self):
        """
            Method get parameters
        :return: parameters
        """
        return self.parameters

    def get_base_url(self):
        """
            Method get base url
        :return: base url
        """
        return self.base_url

    def get_method(self):
        """
            Method get method
        :return: method
        """
        return self.method

    def get_endpoint(self):
        """
            Mehod get endpoints
        :return: endpoints
        """
        return self.endpoint

    def build_url(self):
        """
            Method build url
        :return: build url
        """
        return "{}{}".format(self.base_url, self.endpoint)

    def execute_request(self):
        """
        Performs an API request.
        :return: request
        """
        uri = self.build_url()
        sending = {
            'GET': requests.get,
            'POST': requests.post,
            'PUT': requests.put,
            'DELETE': requests.delete
        }
        return sending[self.method](uri, headers=self.headers, auth=self.authentication, data=self.get_body())
