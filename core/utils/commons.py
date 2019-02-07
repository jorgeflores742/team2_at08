from datetime import datetime

from core.utils.storage import Storage

container_id = Storage.get_instance()


def get_filter(param):
    path = param
    while path.find("$") >= 0:
        path_preview = path[str(path).find("$"):]
        key = path_preview[0:None if str(path_preview).find("/") == -1 else str(path_preview).find("/")]
        path = path.replace(key, str(container_id.get_value(key)))
    return path


def get_unique_name(name):
    date = datetime.utcnow().strftime('%Y-%m-%d %H:%M:%S.%f')[:-3]
    return str(name).replace("dateTime", date) if str(name).find("dateTime") >= 0 else name
