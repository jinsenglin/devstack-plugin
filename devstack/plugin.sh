# plugin.sh - DevStack plugin.sh dispatch script template

function install_template {
    cp -r $HORIZON_DIR/openstack_dashboard/themes/default $HORIZON_DIR/openstack_dashboard/themes/mytheme
}

function init_template {
    :
}

function configure_template {
    :
}

# check for service enabled
if is_service_enabled horizon template; then

    if [[ "$1" == "stack" && "$2" == "pre-install" ]]; then
        # Set up system services
        echo_summary "Configuring system services Template"
        install_package cowsay

    elif [[ "$1" == "stack" && "$2" == "install" ]]; then
        # Perform installation of service source
        echo_summary "Installing Template"
        install_template

    elif [[ "$1" == "stack" && "$2" == "post-config" ]]; then
        # Configure after the other layer 1 and 2 services have been configured
        echo_summary "Configuring Template"
        configure_template

    elif [[ "$1" == "stack" && "$2" == "extra" ]]; then
        # Initialize and start the template service
        echo_summary "Initializing Template"
        init_template
    fi

    if [[ "$1" == "unstack" ]]; then
        # Shut down template services
        # no-op
        :
    fi

    if [[ "$1" == "clean" ]]; then
        # Remove state and transient data
        # Remember clean.sh first calls unstack.sh
        
        rm -rf $HORIZON_DIR/openstack_dashboard/themes/mytheme
    fi
fi
