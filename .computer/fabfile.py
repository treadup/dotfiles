from fabric2 import task
from fabric2 import Connection
import time

REBOOT_DELAY = 60 # 60 seconds
HOST = 'elm.peacefulrainforest.org'

def upgrade_server(c):
    print("Upgrading server")
    # Run all ubuntu commands non interactively
    c.run('export DEBIAN_FRONTEND=noninteractive')

    # Set the timezone
    c.run('export TZ=Europe/Stockholm')
    c.run('ln -snf /usr/share/zoneinfo/$TX /etc/localtime && echo $TZ > /etc/timezone')

    # Upgrade Ubuntu
    c.run('apt-get update && apt-get --yes upgrade')

    # Reboot
    c.run('reboot')

def install_packages(c):
    # Install Git
    c.put('ubuntu/install-ubuntu-packages.sh', 'install-ubuntu-packages.sh')
    c.run('bash install-ubuntu-packages.sh')

def create_user(c):
    print("Creating user henrik")

    # Add the group ubuntu if the group does not already exist
    c.run('getent group henrik &>/dev/null || groupadd -r henrik')

    # Add the user ubuntu if the user does not aleady exist
    c.run('id -u henrik &>/dev/null || useradd --no-log-init -r -g henrik henrik')

    # Create home folder
    if c.run('test -d /home/henrik', warn=True).failed:
        c.run('mkdir -p /home/henrik && chown henrik:henrik /home/henrik')

    # Need to copy over some kind of SSH key so that I can log in as henrik
    c.run('mkdir -p /home/henrik/.ssh/')
    c.run('cp /root/.ssh/authorized_keys /home/henrik/.ssh/authorized_keys && chown henrik:henrik /home/henrik/.ssh/authorized_keys')

def setup_user(c):
    c.put('setup-computer.sh', 'setup-computer.sh')
    c.run('bash setup-computer.sh')

@task
def bootstrap(ctx):

    with Connection(HOST, user='root') as connection:
        upgrade_server(connection)

    time.sleep(REBOOT_DELAY)

    with Connection(HOST, user='root') as connection:
        install_packages(connection)
        create_user(connection)

    with Connection(HOST, user='henrik') as connection:
        setup_user(connection)
