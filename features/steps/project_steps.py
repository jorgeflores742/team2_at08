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
    context.sent_data = json.loads(context.text)
    context.client.set_body(json.dumps(context.sent_data))


@step(u'I validate with "{read_schema}" schema')
def schema_validation(context, read_schema):
    """
        Method step implement validate schema
    :param context: context
    :param read_schema: read schema
    """
    LOGGER.info("Validation of schema")
    with open(definitions.SCHEMAS[read_schema]) as schema:
        validate(instance=context.response.json(), schema=json.load(schema))


@step(u'I verify the sent data')
def verify_sent_data(context):
    """
        Method step implement to verify sent data
    :param context: context
    """
    LOGGER.info("Validation of sent data")
    for key in context.sent_data:
        expect(context.sent_data[key]).__eq__(context.response.json()[key])


@step(u'I verify the sent data membership')
def verify_sent_data_membership(context):
    """
        Method step implement to verify sent data membership
    :param context: context
    """
    LOGGER.info("Validation of sent data membership")
    for key in context.sent_data:
        if key == 'person_id':
            expect(context.sent_data[key]).__eq__(context.response.json()['person']['id'])
        else:
            expect(context.sent_data[key]).__eq__(context.response.json()['person'][key])


@step(u'I verify if the project was delete')
def verify_project_deleted(context):
    """
        Method step implement to verify if project was delete
    :param context: context
    """
    LOGGER.info("Validation of project delete")
    context.client.set_method('GET')
    expect(403).__eq__(int(context.client.execute_request().status_code))


@step(u'I verify if the item was delete')
def verify_item_deleted(context):
    """
        Method step implement to verify if task was delete
    :param context: context
    """
    LOGGER.info("Validation of delete")
    context.client.set_method('GET')
    context.response = context.client.execute_request()
    expect(404).__eq__(context.response.status_code)


@step("I verify the sent data of epics")
def verify_send_data_epics(context):
    """
        :type context: context
    """
    LOGGER.info("Validation of sent data of epics")
    send_data = context.sent_data
    response = context.response.json()
    for item in send_data:
        if item == "label":
            expect(send_data[item]["name"]).__eq__(response[item]["name"])
        else:
            expect(send_data[item]).__eq__(response[item])


@step('I set up "{key}" the data')
def step_impl(context, key):
    """
    :type context: behave.runner.Context
    :type key: key
    """
    context.sent_data = json.loads(str(context.text).replace(key, CONTAINER_ID.get_value(key)))
    context.client.set_body(json.dumps(context.sent_data))

@step("I verify the sent data of membership")
def step_impl_membership(context):
    """
        :type context: context
    """
    LOGGER.info("Validation of sent data of membership")
    send_data = context.sent_data
    response = context.response.json()
    for key in send_data:
        if key == "person_id":
            expect(context.sent_data[key]).__eq__(context.response.json()["person"]["id"])
        elif key == "email":
            expect(context.sent_data[key]).__eq__(context.response.json()["person"]["email"])
        elif key == "name":
            expect(context.sent_data[key]).__eq__(context.response.json()["person"]["name"])
        elif key == "initials":
            expect(context.sent_data[key]).__eq__(context.response.json()["person"]["initials"])
        else:
            expect(send_data[key]).__eq__(response[key])


@step("I verify the sent data of integrations")
def step_impl_integrations(context):
    """
        :type context: context
    """
    LOGGER.info("Validation of sent data of integrations")
    send_data = context.sent_data
    response = context.response.json()
    for key in send_data:
        if key == "api_password":
            expect(context.sent_data[key]).__eq__(context.sent_data[key])
        elif key == "type":
            expect(context.sent_data[key]).__eq__(context.sent_data[key])
        else:
            expect(send_data[key]).__eq__(response[key])


@step(u'I validate with "{read_schema}" error schema')
def error_schema_validation(context, read_schema):
    """
        Method step implement validate schema
    :param context: context
    :param read_schema: read schema
    """
    LOGGER.info("Validation of schema")
    with open(definitions.SCHEMAS['Error'][read_schema]) as schema:
        validate(instance=context.response.json(), schema=json.load(schema))
