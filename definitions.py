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
    'Project': os.path.join(ROOT_DIR, 'schemas/projects.schema.json'),
    'Story GET':os.path.join(ROOT_DIR, 'schemas/story_get.schema.json'),
    'Story POST':os.path.join(ROOT_DIR, 'schemas/story_post.schema.json')
}
