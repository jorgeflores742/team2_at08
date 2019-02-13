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
    'Epic': os.path.join(ROOT_DIR, 'schemas/epic.schema.json'),
    'Error unfound resource': os.path.join(ROOT_DIR, 'schemas/error_unfound.schema.json'),
    'Project_snapshots': os.path.join(ROOT_DIR, 'schemas/project_snapshots.schema.json'),
    'Project_history': os.path.join(ROOT_DIR, 'schemas/project_history.schema.json'),
    'Project_integrations': os.path.join(ROOT_DIR, 'schemas/project_integrations.schema.json'),
    'Project_interations': os.path.join(ROOT_DIR, 'schemas/project_iterations.schema.json'),
    'Project_membership': os.path.join(ROOT_DIR, 'schemas/projects_membership.schema.json'),
    'Project_webhooks': os.path.join(ROOT_DIR, 'schemas/projects_webhooks.schema.json')
}
