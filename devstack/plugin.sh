# plugin.sh - DevStack plugin.sh dispatch script template

function prepare_mytheme {
    :
}

function install_mytheme {
    cp -r $HORIZON_DIR/openstack_dashboard/themes/default $HORIZON_DIR/openstack_dashboard/themes/mytheme
    mkdir $HORIZON_DIR/openstack_dashboard/themes/mytheme/img
    
    if [ $MYTHEME_ICO == "NOTHING" ]; then
        touch $HORIZON_DIR/openstack_dashboard/themes/mytheme/img/favicon.ico
    else
        wget $MYTHEME_ICO -O $HORIZON_DIR/openstack_dashboard/themes/mytheme/img/favicon.ico
    fi
    if [ $MYTHEME_LOGO == "NOTHING" ]; then
        touch $HORIZON_DIR/openstack_dashboard/themes/mytheme/img/logo.png
    else
        wget $MYTHEME_LOGO -O $HORIZON_DIR/openstack_dashboard/themes/mytheme/img/logo.png
    fi
    if [ $MYTHEME_LOGO_SPLASH == "NOTHING" ]; then
        touch $HORIZON_DIR/openstack_dashboard/themes/mytheme/img/logo-splash.png
    else
        wget $MYTHEME_LOGO_SPLASH -O $HORIZON_DIR/openstack_dashboard/themes/mytheme/img/logo-splash.png
    fi
}

function configure_mytheme {
    local local_settings=$HORIZON_DIR/openstack_dashboard/local/local_settings.py
    _horizon_config_set $local_settings "" AVAILABLE_THEMES \[\(\'default\',\'Default\',\'themes/mytheme\'\),\]
    _horizon_config_set $local_settings "" SITE_BRANDING "\'My OpenStack Dashboard\'"
}

function init_mytheme {
    :
}

function unstack_mytheme {
    rm -rf $HORIZON_DIR/openstack_dashboard/themes/mytheme
}

function clean_mytheme {
    :
}

# check for service enabled
if is_service_enabled horizon mytheme; then

    if [[ "$1" == "stack" && "$2" == "pre-install" ]]; then
        # Set up system services
        echo_summary "Configuring system services for MyTheme"
        prepare_mytheme

    elif [[ "$1" == "stack" && "$2" == "install" ]]; then
        # Perform installation of service source
        echo_summary "Installing MyTheme"
        install_mytheme

    elif [[ "$1" == "stack" && "$2" == "post-config" ]]; then
        # Configure after the other layer 1 and 2 services have been configured
        echo_summary "Configuring MyTheme"
        configure_mytheme

    elif [[ "$1" == "stack" && "$2" == "extra" ]]; then
        # Initialize and start the template service
        echo_summary "Initializing MyTheme"
        init_mytheme
    fi

    if [[ "$1" == "unstack" ]]; then
        # Shut down template services
        echo_summary "Unstacking MyTheme"
        unstack_mytheme
    fi

    if [[ "$1" == "clean" ]]; then
        # Remove state and transient data
        # Remember clean.sh first calls unstack.sh
        echo_summary "Cleaning MyTheme"
        clean_mytheme
    fi
fi
