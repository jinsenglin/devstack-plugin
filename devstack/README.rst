=========================
Enabling mypanel in DevStack
=========================

1. Download DevStack::

    git clone https://github.com/openstack-dev/devstack.git
    cd devstack

2. Add this repo as an external repository in ``local.conf`` file::

    [[local|localrc]]
    enable_plugin mypanel https://github.com/jinsenglin/devstack-plugin

   To use stable branches, make sure devstack is on that branch, and specify
   the branch name to enable_plugin, for example::

    enable_plugin mypanel https://github.com/jinsenglin/devstack-plugin mypanel/stable/mitaka

   There are some options, such as MYPANEL_REPO, defined in
   ``devstack-plugin/devstack/settings``, they can be used to configure the installation
   of mytheme. If you don't want to use their default value, you can set a new
   one in ``local.conf``.

3. Run ``stack.sh``.

=========================
Sample local.conf
=========================

    enable_plugin mypanel https://github.com/jinsenglin/devstack-plugin mypanel/stable/mitaka
    
    MYPANEL_REPO=https://github.com/jinsenglin/horizon-plugin
    
    MYPANEL_REPO_BRANCH=mypanel/stable/mitaka
    
    MYPANEL_REPO_DIR_NAME=mypanel
    
