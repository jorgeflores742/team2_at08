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


def before_scenario(context, scenario):
    """
    Method run before scenario
    :param scenario: context
    :param context:scenario
    """

    if 'create_projects' in scenario.tags:
        context.project_id = ProjectHelper.create_project('project.dateTime')
    if 'create_membership_in_an_account' in scenario.tags:
        ProjectHelper.create_membership_in_an_account()
    if 'create_webhook' in scenario.tags:
        ProjectHelper.create_webhook('https://elvillano.dataTime.com')
    if 'create_membership' in scenario.tags:
        ProjectHelper.create_membership()
    if 'create_integration' in scenario.tags:
        ProjectHelper.create_integration("https://elrincondejira2.atlassian.net",
                                         "".join(choices(string.ascii_letters + string.digits, k=10)))
    if 'create_epic' in scenario.tags:
        ProjectHelper.create_epic('epic.dateTime')
    if 'create_story' in scenario.tags:
        ProjectHelper.create_story('story'.join(choices(string.ascii_letters + string.digits, k=5)))
    if 'create_task' in scenario.tags:
        ProjectHelper.create_task('task'.join(choices(string.ascii_letters + string.digits, k=5)))


def after_scenario(context, scenario):
    """
        Method run after scenario
        :param scenario: context
        :param context:scenario
    """
    if 'clear_account_memberships' in scenario.tags:
        context.membership = ProjectHelper.clear_account_memberships()


def after_all(context):
    """
    Method for clear
    """
    context.project_id = None
    ProjectHelper.clear_account()
    ProjectHelper.clear_account_memberships()
