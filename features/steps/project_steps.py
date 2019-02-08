"""
    Project steps
"""
import json

from behave import step, then
from compare import expect
from jsonschema import validate

import core.logger.singleton_logger
import core.rest_client.request_manager
import core.utils
import core.utils.storage
import definitions

CONTAINER_ID = core.utils.storage.Storage.get_instance()
LOGGER = core.logger.singleton_logger.SingletonLogger().get_logger()


@step(u'I set up a "{method}" request to "{endpoint}" endpoint')
def step_impl_1(context, method, endpoint):
    """
        Method step implement
    :param context: context
    :param method: method
    :param endpoint: endpoint
    """
    LOGGER.info("Make the call")
    client = core.rest_client.request_manager.RequestManager()
    client.set_method(method)
    client.set_endpoint(core.utils.commons.get_filter(endpoint))
    context.client = client


@then(u'I get a "{status_code}" status code as response')
def step_impl_2(context, status_code):
    """
        Method step implement for verify status code
    :param context: context
    :param status_code: status code
    """
    LOGGER.info("Validation Status Code")
    expect(int(status_code)).__eq__(context.response.status_code)


@step(u'I set up a retrieve of all Projects')
def step_impl_3(context):
    """
        Method step implement for retrieve all projects
    :param context: context
    """
    LOGGER.info("Make the call: ")
    client = core.rest_client.request_manager.RequestManager()
    client.set_method('GET')
    client.set_endpoint('/projects.json')
    context.client = client


@then(u'I get an OK response')
def step_impl_4(context):
    """
        Method step implement for verify status code
    :param context: context
    """
    LOGGER.info("Validation Smoke")
    response = context.client.execute_request()
    expect(200).__eq__(int(response.status_code))


@step(u'I send the request')
def step_impl_5(context):
    """
        Method step implement send request
    :param context: context
    """
    LOGGER.info("Execute request")
    context.response = context.client.execute_request()


@step(u'I set up the data')
def step_impl_all(context):
    """
        Method step implement for set up the data
    :param context: context
    """
    LOGGER.info("Add Data to request")
    body = json.loads(context.text)
    context.client.set_body(json.dumps(body))


@step(u'I validate with "{read_schema}" schema')
def schema_validation(context, read_schema):
    """
        Method step implement validate schema
    :param context: context
    :param read_schema: read schema
    """
    with open(definitions.SCHEMAS[read_schema]) as schema_creation:
        instance = context.response.json()
        print("==========>"+str(instance))
        validate(instance, schema=json.load(schema_creation))
