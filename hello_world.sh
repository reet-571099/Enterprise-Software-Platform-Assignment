#!/bin/bash

# Call the Hello service
hello_response=$(curl -s http://127.0.0.1:53006/hello)

# Call the World service
world_response=$(curl -s http://127.0.0.1:53025/world)

# Combine and print the responses
echo "$hello_response $world_response"

