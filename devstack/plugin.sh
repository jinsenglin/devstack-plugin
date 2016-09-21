# plugin.sh - DevStack plugin.sh dispatch script template

function prepare_mypanel {
    :
}

function install_mypanel {
    git_clone $MYPANEL_REPO $MYPANEL_REPO_DIR_NAME $MYPANEL_REPO_BRANCH
}

function configure_mypanel {
    setup_develop $MYPANEL_REPO_DIR_NAME
    cp $MYPANEL_REPO_DIR_NAME/mypanel_ui/enabled/$MYPANEL_ENABLED_FILE $HORIZON_DIR/openstack_dashboard/local/enabled
}

function init_mypanel {
    :
}

function unstack_mypanel {
    rm -f $HORIZON_DIR/openstack_dashboard/local/enabled/$MYPANEL_ENABLED_FILE
}

function clean_mypanel {
    :
}

# check for service enabled
if is_service_enabled horizon mypanel; then

    if [[ "$1" == "stack" && "$2" == "pre-install" ]]; then
        # Set up system services
        echo_summary "Configuring system services for MyPanel"
        prepare_mypanel

    elif [[ "$1" == "stack" && "$2" == "install" ]]; then
        # Perform installation of service source
        echo_summary "Installing MyPanel"
        install_mypanel

    elif [[ "$1" == "stack" && "$2" == "post-config" ]]; then
        # Configure after the other layer 1 and 2 services have been configured
        echo_summary "Configuring MyPanel"
        configure_mypanel

    elif [[ "$1" == "stack" && "$2" == "extra" ]]; then
        # Initialize and start the template service
        echo_summary "Initializing MyPanel"
        init_mypanel
    fi

    if [[ "$1" == "unstack" ]]; then
        # Shut down template services
        echo_summary "Unstacking MyPanel"
        unstack_mypanel
    fi

    if [[ "$1" == "clean" ]]; then
        # Remove state and transient data
        # Remember clean.sh first calls unstack.sh
        echo_summary "Cleaning MyPanel"
        clean_mypanel
    fi
fi
