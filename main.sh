#!/bin/bash

sigint_handler() {
  echo "Exiting..."
  exit 1
}

trap sigint_handler SIGINT

choose_framework() {
  while true; do
    echo "Choose you want:"
    echo "1. Start"
    echo "2. Stop"
    echo "3. Restart"
    read -p "Enter option (1/2/3): " choice

    case $choice in
      1)
        echo "Start..."
        docker compose -f docker/docker-compose.yml up -d
        break
        ;;
      2)
        echo "Stop..."
        docker compose -f docker/docker-compose.yml down -d
        break
        ;;
      3)
        echo "Restart..."
        docker compose -f docker/docker-compose.yml stop -d
        docker compose -f docker/docker-compose.yml up -d
        break
        ;;
      *)
        echo "Invalid selection ❌. Please choose 1/2/3"
        ;;
    esac
  done
}

choose_framework