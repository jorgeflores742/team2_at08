"""
    Helpers for the project
"""
import json

import yaml

from core.rest_client.request_manager import RequestManager
from core.utils import commons
from core.utils.storage import Storage


CONFIG_DATA = yaml.load(open('environment.yml'))

CONTAINER_ID = Storage.get_instance()


class ProjectHelper:
    """
        Main helper
    """
    project_id = None
    webhook_id = None
    membership_id = None
    epic_id = None
    epic_id_name = None
    story_id = None

    @staticmethod
    def create_project(name):
        """
            Method for create a project in pivotal tracker
        :param name: name project
        :return: id_project
        """
        client = RequestManager()
        body = {
            'name': commons.get_unique_name(name),
            'project_type': 'public'
        }
        client.set_method('POST')
        client.set_endpoint('/projects')
        client.set_body(json.dumps(body))
        response = client.execute_request()
        CONTAINER_ID.add_value("$PROJECT_ID", response.json()['id'])
        ProjectHelper.project_id = response.json()['id']
        return response.json()['id']

    @staticmethod
    def create_webhook(name):
        """
            Method for create a webhook in pivotal tracker
            :param name: name webhook
        """
        client = RequestManager()
        body = {
            'webhook_url': commons.get_unique_name(name),
            'webhook_version': 'v5'
        }
        client.set_method('POST')
        client.set_endpoint('/projects/{0}/webhooks'.format(ProjectHelper.project_id))
        client.set_body(json.dumps(body))
        response = client.execute_request()
        CONTAINER_ID.add_value("$WEBHOOK_ID", response.json()['id'])
        ProjectHelper.webhook_id = response.json()['id']

    @staticmethod
    def create_membership():
        """
            Method for create a membership in pivotal tracker
        """
        client = RequestManager()
        body = {
            "person_id": 3143772,
            "role": "member"
        }
        client.set_method('POST')
        client.set_endpoint('/projects/{0}/memberships'.format(ProjectHelper.project_id))
        client.set_body(json.dumps(body))
        response = client.execute_request()
        CONTAINER_ID.add_value("$MEMBERSHIP_ID_FOR_PROJECT", response.json()["id"])
        ProjectHelper.membership_id = response.json()['id']

    @staticmethod
    def delete_project(project_id):
        """
            Method for delete a project in pivotal tracker
        :param project_id: id project
        """
        client = RequestManager()
        client.set_method("DELETE")
        client.set_endpoint("/projects/{0}".format(project_id))
        client.execute_request()

    @staticmethod
    def create_integration(url, random):
        """
            Method for create a integration in pivotal tracker
        :param url: url
        :param random: ramdom
        """
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
        CONTAINER_ID.add_value("$INTEGRATION_ID", response.json()["id"])
        ProjectHelper.membership_id = response.json()['id']

    @staticmethod
    def create_epic(name):
        """
            Method for create a epic in pivotal tracker
        :param name: name epic
        """
        client = RequestManager()
        CONTAINER_ID.add_value("$EPIC_NAME", commons.get_unique_name(name))
        body = {
            'name': CONTAINER_ID.get_value("$EPIC_NAME")
        }
        client.set_method('POST')
        client.set_endpoint('/projects/{0}/epics'.format(ProjectHelper.project_id))
        client.set_body(json.dumps(body))
        response = client.execute_request()
        CONTAINER_ID.add_value('$EPIC_ID', response.json()['id'])
        ProjectHelper.epic_id = response.json()['id']

    @staticmethod
    def delete_account_membership(account_id, membership_id):
        """
            Method for delete account in pivotal tracker
        :param account_id: id account
        :param membership_id: id membership
        """
        client = RequestManager()
        client.set_method("DELETE")
        client.set_endpoint("/accounts/{0}/memberships/{1}".format(account_id, membership_id))
        client.execute_request()

    @staticmethod
    def clear_account():
        """
            Method for clear account in pivotal tracker
        """
        account_id = CONFIG_DATA['account_id']
        client = RequestManager()
        client.set_method("GET")
        client.set_endpoint("/projects")
        response = client.execute_request()
        for project in response.json():
            if project["account_id"] == account_id:
                ProjectHelper.delete_project(project["id"])

    @staticmethod
    def clear_account_memberships():
        """
            Method for clear account in pivotal tracker
        """
        account_id = CONFIG_DATA['account_id']
        client = RequestManager()
        client.set_method("GET")
        client.set_endpoint("/accounts/{0}/memberships".format(account_id))
        response = client.execute_request()
        for membership in response.json():
            if membership["owner"] is False:
                ProjectHelper.delete_account_membership(account_id, membership["id"])

    @staticmethod
    def set_account_data():
        """
            Method for set account data in pivotal tracker
        """
        account_id = CONFIG_DATA['account_id']
        membership_id = CONFIG_DATA['member2_id']
        CONTAINER_ID.add_value('$ACCOUNT_ID', account_id)
        CONTAINER_ID.add_value('$MEMBERSHIP_ID_FOR_ACCOUNT', membership_id)

    @staticmethod
    def create_story(description):
        """
            Method for create stories in a project in pivotal tracker
        :param description: storie description
        :return: id story
        """
        client = RequestManager()
        body = {
            'name': commons.get_unique_name(description)
        }
        client.set_method('POST')
        client.set_endpoint("/projects/{0}/stories".format(ProjectHelper.project_id))
        client.set_body(json.dumps(body))
        response = client.execute_request()
        CONTAINER_ID.add_value("$STORY_ID", response.json()['id'])
        ProjectHelper.story_id = response.json()['id']
        return response.json()['id']

    @staticmethod
    def create_task(name):
        """
            Method for create task in a project in pivotal tracker
        """
        client = RequestManager()
        body = {
            "description": name
        }
        client.set_method("POST")
        client.set_endpoint("/projects/{0}/stories/{1}/tasks".format(ProjectHelper.project_id, ProjectHelper.story_id))
        client.set_body(json.dumps(body))
        response = client.execute_request()
        CONTAINER_ID.add_value("$TASK_ID", response.json()['id'])
