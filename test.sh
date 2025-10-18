#!/bin/bash

echo "Running tests..."
# Example test: check if app.py exists
if [ -f "app.py" ]; then
    echo "Test Passed: app.py exists."
    exit 0
else
    echo "Test Failed: app.py missing."
    exit 1
fi



