from data import AVAILABLE_VERSIONS, DEVICES


def get_device_version(hostname):
    """
    Return the current software version for the device given
    by `hostname`
    """

    return DEVICES[hostname]["current_version"]


def get_software_versions():
    """
    Return a tuple of available software versions
    """
    return AVAILABLE_VERSIONS


def upgrade_single(hostname, version):
    """
    Upgrade the device given to `hostname` to version `version`. This
    is expected to be a single step upgrade.
    """

    if "fail_at" in DEVICES[hostname]:
        if DEVICES[hostname]["fail_at"] <= version:
            raise Exception("Upgrade failed")
