#!/usr/bin/env bash

# AzerothCore Auth Server Restarter Example
# This example shows how to use the run-engine with restart functionality for authserver

PATH_RUNENGINE="./"
CONFIG_FILE="./conf-auth.sh"

# Method 1: Using configuration file (recommended)
if [ -f "$CONFIG_FILE" ]; then
    echo "Starting authserver with restart loop using config file: $CONFIG_FILE"
    source "$CONFIG_FILE"
    "$PATH_RUNENGINE/run-engine" restart "$SERVERBIN" --config "$CONFIG_FILE"
else
    echo "Error: Configuration file not found: $CONFIG_FILE"
    echo "Please create $CONFIG_FILE by copying and modifying conf.sh.dist"
    echo "Make sure to set: export SERVERBIN=\"authserver\""
    echo ""
    echo "Alternative: Start with binary path directly"
    echo "Example: $PATH_RUNENGINE/run-engine restart /path/to/bin/authserver"
    echo "Example: $PATH_RUNENGINE/run-engine restart authserver  # if in PATH"
    exit 1
fi

# Method 2: Direct binary path (full path)
# Uncomment the line below to start with full binary path
#
# "$PATH_RUNENGINE/run-engine" restart /home/user/azerothcore/bin/authserver --server-config /path/to/authserver.conf

# Method 3: Binary name only (system PATH)
# Uncomment the line below if authserver is in your system PATH
#
# "$PATH_RUNENGINE/run-engine" restart authserver --server-config /path/to/authserver.conf

# Method 4: With session manager (tmux/screen)
# Uncomment the line below to use tmux session
#
# "$PATH_RUNENGINE/run-engine" restart authserver --session-manager tmux --server-config /path/to/authserver.conf

# Method 5: Environment variables only
# Uncomment the lines below for environment variable configuration
#
# export RUN_ENGINE_BINPATH="/path/to/your/bin"
# export RUN_ENGINE_SERVERBIN="authserver"
# export RUN_ENGINE_CONFIG="/path/to/authserver.conf"
# "$PATH_RUNENGINE/run-engine" restart authserver


