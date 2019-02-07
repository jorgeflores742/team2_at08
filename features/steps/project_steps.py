import json

from behave import *
from compare import *
from jsonschema import validate

from core.logger.singleton_logger import SingletonLogger
from core.rest_client.request_manager import *
from core.utils import commons
from core.utils.json_helper import JsonHelper
from core.utils.storage import Storage
from definitions import SCHEMAS

container_id = Storage.get_instance()
logger = SingletonLogger().get_logger()


@step(u'I set up a "{method}" request to "{endpoint}" endpoint')
def step_impl(context, method, endpoint):
    logger.info("Make the call")
    client = RequestManager()
    client.set_method(method)
    client.set_endpoint(commons.get_filter(endpoint))
    context.client = client


@then(u'I get a "{status_code}" status code as response')
def step_impl(context, status_code):
    logger.info("Validation Status Code")
    expect(int(status_code)).to_equal(context.response.status_code)


@step(u'I set up a retrieve of all Projects')
def step_impl(context):
    logger.info("Make the call: ")
    client = RequestManager()
    client.set_method('GET')
    client.set_endpoint('/projects.json')
    context.client = client


@then(u'I get an OK response')
def step_impl(context):
    logger.info("Validation Smoke")
    JsonHelper.print_pretty_json(context.response.json())
    expect(200).to_equal(context.response.status_code)


@step(u'I send the request')
def step_impl(context):
    logger.info("Execute request")
    context.response = context.client.execute_request()


@step(u'I set up the data')
def step_impl(context):
    logger.info("Add Data to request")
    body = json.loads(context.text)
    context.client.set_body(json.dumps(body))


@step(u'I validate with "{read_schema}" schema')
def schema_validation(context, read_schema):
    with open(SCHEMAS[read_schema]) as schema_creation:
        validate(instance=context.response.json(), schema=json.load(schema_creation))
