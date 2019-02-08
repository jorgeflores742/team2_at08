"""
    Definitions for project
"""
import os

ROOT_DIR = os.path.dirname(os.path.abspath(__file__))
SCHEMAS = {
    'Account': os.path.join(ROOT_DIR, 'schemas/account.schema.json'),
    'Project': os.path.join(ROOT_DIR, 'schemas/projects.schema.json'),
    'Story GET':os.path.join(ROOT_DIR, 'schemas/story_get.schema.json'),
    'Story POST':os.path.join(ROOT_DIR, 'schemas/story_post.schema.json'),
    'Task':os.path.join(ROOT_DIR, 'schemas/task.schema.json')
}
