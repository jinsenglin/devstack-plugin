=========================
Enabling mytheme in DevStack
=========================

1. Download DevStack::

    git clone https://github.com/openstack-dev/devstack.git
    cd devstack

2. Add this repo as an external repository in ``local.conf`` file::

    [[local|localrc]]
    enable_plugin mytheme https://github.com/jinsenglin/devstack-plugin

   To use stable branches, make sure devstack is on that branch, and specify
   the branch name to enable_plugin, for example::

    enable_plugin mytheme https://github.com/jinsenglin/devstack-plugin mytheme/stable/mitaka

   There are some options, such as MYTHEME_ICO, defined in
   ``devstack-plugin/devstack/settings``, they can be used to configure the installation
   of mytheme. If you don't want to use their default value, you can set a new
   one in ``local.conf``.

3. Run ``stack.sh``.

=========================
Sample local.conf
=========================

    enable_plugin mytheme https://github.com/jinsenglin/devstack-plugin mytheme/stable/mitaka
    MYTHEME_ICO=https://lh5.googleusercontent.com/IJDKTzSSegNujBS1IZOqNO1zTM_oE4TLViRFLv-APgT83oU9rt08wt2Ki2nkfpllnzvOIE5BTswrGU4=w2880-h1420
    MYTHEME_LOGO=https://lh4.googleusercontent.com/ChzGh4wvWlK1HugUbcLhVHbAxiboGzwqVm8Lyrwnry_xHr-NtrqBnUbBp2NB08toPSKeg6bZFohld6c=w2880-h1420
    MYTHEME_LOGO_SPLASH=https://lh4.googleusercontent.com/aP_t9S0WsK4hYt31cHoDk0I7vaiRfF80CX_MLPiqr9X9S8H_i5ccYl61exJmLKdNYT96fTz5dTWzl2A=w2880-h1420
