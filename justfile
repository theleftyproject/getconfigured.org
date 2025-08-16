# justfile

# Config
port := "6617"
url := "http://localhost:{{port}}"

run: serve-firefox

# Launch Flutter web server and Firefox, kill server when Firefox exits
serve-firefox:
    #!/bin/bash
    echo "Starting Flutter web server on port {{port}}..."
    flutter run -d web-server --web-port={{port}} & flutter_pid=$!
    echo "Flutter server PID: $flutter_pid"

    echo "Monitoring Marionette Firefox process..."
    # Loop while Marionette Firefox is running
    while pgrep -f "firefox -marionette" > /dev/null; do
        sleep 2
    done

