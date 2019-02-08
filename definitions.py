"""
    Definitions for project
"""
import os

ROOT_DIR = os.path.dirname(os.path.abspath(__file__))
SCHEMAS = {
    'Account': os.path.join(ROOT_DIR, 'schemas/account.schema.json'),
    'Account_summaries': os.path.join(ROOT_DIR, 'schemas/account_summaries.schema.json'),
    'Accounts': os.path.join(ROOT_DIR, 'schemas/accounts.schema.json'),
    'Account_membership': os.path.join(ROOT_DIR, 'schemas/account_membership.schema.json'),
    'Account_membership_create': os.path.join(ROOT_DIR, 'schemas/account_membership_email.schema.json'),
    'Project': os.path.join(ROOT_DIR, 'schemas/projects.schema.json'),
    'Story': os.path.join(ROOT_DIR, 'schemas/story.schema.json'),
    'Task': os.path.join(ROOT_DIR, 'schemas/task.schema.json'),
    'Story transitions': os.path.join(ROOT_DIR, 'schemas/story_transitions.schema.json')
}
