"""
    enviroment
"""
import string
from random import choices

from core.utils.project_helper import ProjectHelper

def before_feature(context, feature):
    """
    Method run before feature
    :param context: context
    :param feature: feature
    """
    if 'create_project' in feature.tags:
        context.project_id = ProjectHelper.create_project('project.dateTime')
    if 'accounts' in feature.tags:
        ProjectHelper.set_account_data()


def before_scenario(scenario):
    """
    Method run before scenario
    :param scenario:
    """
    if 'create_projects' in scenario.tags:
        ProjectHelper.create_project('project.dateTime')
    if 'create_webhook' in scenario.tags:
        ProjectHelper.create_webhook('https://elvillano.dataTime.com')
    if 'create_membership' in scenario.tags:
        ProjectHelper.create_membership()
    if 'create_integration' in scenario.tags:
        ProjectHelper.create_integration("https://elrincondejira2.atlassian.net",
                                         "".join(choices(string.ascii_letters + string.digits, k=10)))
    if 'create_epic' in scenario.tags:
        ProjectHelper.create_epic('epic.dateTime')


def after_all():
    """
    Method for clear
    """
    ProjectHelper.clear_account()
    ProjectHelper.clear_account_memberships()
