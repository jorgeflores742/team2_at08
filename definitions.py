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
    'Error': {
        'resource_no_found': os.path.join(ROOT_DIR, 'schemas/error/resource.no.found.json'),
        'iso_date': os.path.join(ROOT_DIR, 'schemas/error/iso.date.json'),
        'too_far_past': os.path.join(ROOT_DIR, 'schemas/error/too.far.past.json'),
        'string_too_long': os.path.join(ROOT_DIR, 'schemas/error/string.too.long.json'),
        'iteration_length': os.path.join(ROOT_DIR, 'schemas/error/iteration.length.json'),
        'integer_value': os.path.join(ROOT_DIR, 'schemas/error/integer.value.json'),
        'custom_point_scale': os.path.join(ROOT_DIR, 'schemas/error/custom.point.scale.json')
    }
}
