# This is the main for plugin.sh
if is_service_enabled jinsenglin; then
    if [[ "$1" == "stack" && "$2" == "pre-install" ]]; then
        echo_summary "Configuring system services for jinsenglin"
    elif [[ "$1" == "stack" && "$2" == "install" ]]; then
        echo_summary "Installing jinsenglin"
    elif [[ "$1" == "stack" && "$2" == "post-config" ]]; then
        echo_summary "Configuring jinsenglin"
    elif [[ "$1" == "stack" && "$2" == "extra" ]]; then
        echo_summary "Initializing jinsenglin"
    fi

    if [[ "$1" == "unstack" ]]; then
        echo_summary "Shutting Down jinsenglin"
    fi

    if [[ "$1" == "clean" ]]; then
        echo_summary "Cleaning jinsenglin"
    fi
fi
