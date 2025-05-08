#!/bin/bash

echo "Starting Kong in Docker..."
docker-compose -f kong/docker-compose.yml up -d

echo "Waiting for Kong to be ready..."
sleep 10

echo "Running Postman tests..."
newman run postman/mock-service-test.postman_collection.json

echo "Stopping Docker..."
docker-compose -f kong/docker-compose.yml down
