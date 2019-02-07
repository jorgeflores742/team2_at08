import json

import yaml

from core.rest_client.request_manager import RequestManager
from core.utils import commons
from core.utils.storage import Storage

global config_data
config_data = yaml.load(open('environment.yml'))

container_id = Storage.get_instance()


class ProjectHelper:
    project_id = None
    webhook_id = None
    membership_id = None
    epic_id = None

    @staticmethod
    def create_project(name):
        client = RequestManager()
        body = {
            'name': commons.get_unique_name(name),
            'project_type': 'public'
        }
        client.set_method('POST')
        client.set_endpoint('/projects')
        client.set_body(json.dumps(body))
        response = client.execute_request()
        container_id.add_value("$PROJECT_ID", response.json()['id'])
        ProjectHelper.project_id = response.json()['id']
        return response.json()['id']

    @staticmethod
    def create_webhook(name):
        client = RequestManager()
        body = {
            'webhook_url': commons.get_unique_name(name),
            'webhook_version': 'v5'
        }
        client.set_method('POST')
        client.set_endpoint('/projects/{0}/webhooks'.format(ProjectHelper.project_id))
        client.set_body(json.dumps(body))
        response = client.execute_request()
        container_id.add_value("$WEBHOOK_ID", response.json()['id'])
        ProjectHelper.webhook_id = response.json()['id']

    @staticmethod
    def create_membership():
        client = RequestManager()
        body = {
            "person_id": 3143772,
            "role": "member"
        }
        client.set_method('POST')
        client.set_endpoint('/projects/{0}/memberships'.format(ProjectHelper.project_id))
        client.set_body(json.dumps(body))
        response = client.execute_request()
        container_id.add_value("$MEMBERSHIP_ID_FOR_PROJECT", response.json()["id"])
        ProjectHelper.membership_id = response.json()['id']

    @staticmethod
    def delete_project(project_id):
        client = RequestManager()
        client.set_method("DELETE")
        client.set_endpoint("/projects/{0}".format(project_id))
        client.execute_request()

    @staticmethod
    def create_integration(url, random):
        client = RequestManager()
        body = {
            'api_username': 'fakeuser',
            'api_password': 'fakepassword',
            'filter_id': '474748',
            'base_url': commons.get_unique_name(url),
            'name': random,
            'type': 'jira'
        }
        client.set_method('POST')
        client.set_endpoint('/projects/{0}/integrations'.format(ProjectHelper.project_id))
        client.set_body(json.dumps(body))
        response = client.execute_request()
        container_id.add_value("$INTEGRATION_ID", response.json()["id"])
        ProjectHelper.membership_id = response.json()['id']

    @staticmethod
    def create_epic(name):
        client = RequestManager()
        body = {
            'name': commons.get_unique_name(name)
        }
        client.set_method('POST')
        client.set_endpoint('/projects/{0}/epics'.format(ProjectHelper.project_id))
        client.set_body(json.dumps(body))
        response = client.execute_request()
        container_id.add_value('$EPIC_ID', response.json()['id'])
        ProjectHelper.epic_id = response.json()['id']

    @staticmethod
    def delete_account_membership(account_id, membership_id):
        client = RequestManager()
        client.set_method("DELETE")
        client.set_endpoint("/accounts/{0}/memberships/{1}".format(account_id, membership_id))
        client.execute_request()

    @staticmethod
    def clear_account():
        account_id = config_data['account_id']
        client = RequestManager()
        client.set_method("GET")
        client.set_endpoint("/projects")
        response = client.execute_request()
        for project in response.json():
            if project["account_id"] == account_id:
                ProjectHelper.delete_project(project["id"])

    @staticmethod
    def clear_account_memberships():
        account_id = config_data['account_id']
        client = RequestManager()
        client.set_method("GET")
        client.set_endpoint("/accounts/{0}/memberships".format(account_id))
        response = client.execute_request()
        for membership in response.json():
            if membership["owner"] is False:
                ProjectHelper.delete_account_membership(account_id, membership["id"])

    @staticmethod
    def set_account_data():
        account_id = config_data['account_id']
        membership_id = config_data['member2_id']
        container_id.add_value('$ACCOUNT_ID', account_id)
        container_id.add_value('$MEMBERSHIP_ID_FOR_ACCOUNT', membership_id)

    @staticmethod
    def create_stories(description):
        client = RequestManager()
        body = {
            'name': commons.get_unique_name(description)
        }
        client.set_method('POST')
        client.set_endpoint('/stories')
        client.set_body(json.dumps(body))
        response = client.execute_request()
        container_id.add_value("$STORY_ID", response.json()['id'])
        ProjectHelper.project_id = response.json()['id']
        return response.json()['id']
