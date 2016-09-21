=========================
Enabling jinsenglin in DevStack
=========================

1. Download DevStack::

    git clone https://git.openstack.org/openstack-dev/devstack.git
    cd devstack

2. Add this repo as an external repository in ``local.conf`` file::

    [[local|localrc]]
    enable_plugin jinsenglin https://github.com/jinsenglin/devstack-plugin

3. Run ``stack.sh``.
