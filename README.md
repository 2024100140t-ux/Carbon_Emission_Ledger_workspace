# Carbon Emission Ledger CLI

A Dart-based command-line application that retrieves and displays the latest carbon intensity information using the Great Britain Carbon Intensity API.

## Project Description

The **Carbon Emission Ledger CLI** is a command-line application developed using Dart. It connects to the **Great Britain Carbon Intensity API** to retrieve the latest carbon intensity data and displays the information through a simple and user-friendly command-line interface.

The project demonstrates API integration, JSON data processing, Dart package organization, command-line interaction, error handling, logging, and automated testing.

The application allows users to enter commands directly in the terminal to view the latest carbon intensity information.

## Objectives

The project aims to:

- Retrieve the latest carbon intensity information from the Carbon Intensity API.
- Process API responses and display relevant carbon emission data.
- Provide a simple command-line interface for users.
- Implement API request and response handling.
- Display carbon intensity information in a readable format.
- Implement logging for application activities and API requests.
- Organize the application using multiple Dart packages.
- Implement automated tests for the project components.

## Features

- Query the latest carbon intensity information.
- Display carbon intensity values in gCO2/kWh.
- Display the carbon intensity index.
- Connect to the Great Britain Carbon Intensity API.
- Provide an interactive command-line interface.
- Display available commands through the `help` command.
- Handle API request and network-related errors.
- Provide logging information during API requests.
- Include automated tests.
- Use a modular Dart workspace structure.

## Technologies Used

- Dart
- Dart Workspace
- HTTP/API Integration
- JSON
- Great Britain Carbon Intensity API
- Dart Testing Framework
- Command-Line Interface
- Logging
- Git
- GitHub

## Project Structure

```text
carbon_workspace/
│
├── carbon_api/
│   ├── lib/
│   │   ├── src/
│   │   └── carbon_api.dart
│   ├── example/
│   │   └── carbon_api_example.dart
│   ├── test/
│   ├── .gitignore
│   ├── analysis_options.yaml
│   ├── CHANGELOG.md
│   ├── pubspec.yaml
│   └── README.md
│
├── carbon_cli/
│   ├── bin/
│   ├── lib/
│   │   └── src/
│   ├── test/
│   └── pubspec.yaml
│
├── .dart_tool/
├── pubspec.yaml
├── pubspec.lock
└── README.md
