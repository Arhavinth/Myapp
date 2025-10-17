#!/bin/bash
echo "Running tests..."
curl -s http://localhost:5000 | grep "Hello from Jenkins"
