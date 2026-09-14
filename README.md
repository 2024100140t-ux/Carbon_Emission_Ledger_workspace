Carbon Emission Ledger CLI
A Dart-based command-line application that retrieves and displays the latest carbon intensity information using the Great Britain Carbon Intensity API.
Project Description
The Carbon Emission Ledger CLI is a command-line application developed using Dart. It connects to the Great Britain Carbon Intensity API to retrieve the latest carbon intensity data and displays the information through a simple and user-friendly command-line interface.
The project demonstrates API integration, JSON data processing, Dart package organization, command-line interaction, error handling, logging, and automated testing.
The application allows users to enter commands directly in the terminal to view carbon intensity information.
Objectives
The project aims to:
Retrieve the latest carbon intensity information from the Carbon Intensity API.
Process API responses and display relevant carbon emission data.
Provide a simple command-line interface for users.
Implement API request and response handling.
Display carbon intensity information in a readable format.
Implement logging for application activities and API requests.
Organize the application using multiple Dart packages.
Implement automated tests for the project components.
Features
Query the latest carbon intensity information.
Display carbon intensity values in gCO2/kWh.
Display the carbon intensity index.
Connect to the Great Britain Carbon Intensity API.
Provide an interactive command-line interface.
Display available commands through the help command.
Handle API request and network-related errors.
Provide logging information during API requests.
Include automated tests.
Use a modular Dart workspace structure.
Technologies Used
Dart
Dart HTTP/API Integration
JSON
Great Britain Carbon Intensity API
Dart Testing Framework
Command-Line Interface
Logging
Git
GitHub
Project Structure
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
Package Description
carbon_api
The carbon_api package is responsible for communicating with the Great Britain Carbon Intensity API.
It handles the retrieval of carbon intensity information and provides the necessary data for the command-line application.
The package also contains tests to verify that the API-related functionality works correctly.
carbon_cli
The carbon_cli package provides the command-line interface of the application.
It allows users to interact with the Carbon Emission Ledger through commands such as:
query
help
exit
The CLI also handles formatted output, logging, and communication with the carbon_api package.
Requirements
Before running the project, make sure the following are installed:
Dart SDK
Git
Internet connection
An internet connection is required because the application retrieves carbon intensity information from an external API.
Installation
Clone the repository:
git clone <your-github-repository-url>
Navigate to the project directory:
cd carbon_workspace
Get the project dependencies:
dart pub get
Code Formatting and Analysis
The project can be formatted using:
dart format .
The code can also be checked using Dart's analyzer:
dart analyze
The project shown in the screenshots successfully produced:
No issues found!
Testing
The project includes automated tests for its Dart packages.
To test the carbon_api package:
cd carbon_api
dart test
The test result shown in the project was:
All tests passed!
To test the carbon_cli package:
cd ..
cd carbon_cli
dart test
The project also successfully returned:
All tests passed!
How to Run
From the workspace directory, navigate to the CLI package:
cd carbon_cli
Run the Carbon Emission Ledger CLI:
dart run carbon_cli:carbon_cli
The application starts with the following interface:
================================
    CARBON EMISSION LEDGER CLI
================================

Type "help" to see available commands.

carbon>
Available Commands
The application provides the following commands:
help
Displays the available commands.
Example:
carbon> help
--- CARBON LEDGER HELP ---
query - Fetch latest carbon intensity
help - Display available commands
exit - Close the Carbon Ledger
---------------------------
query
The query command retrieves the latest carbon intensity information from the API.
Example:
carbon> query
The application displays logging information while processing the request.
Example output from the project:
[INFO] Starting carbon intensity request: latest
[INFO] Carbon API response status: 200
[INFO] Carbon API request lifecycle completed.
The Carbon Emission Ledger then displays information such as:
--- CARBON EMISSION LEDGER ---
Record ID: 2026-08-24T08:00Z-2026-08-24T08:30Z
Source: Great Britain Carbon Intensity
Intensity: 111.0 gCO2/kWh
Index: moderate
From: 2026-08-24T08:00Z
To: 2026-08-24T08:30Z
------------------------------
exit
The exit command closes the application.
Example:
carbon> exit
The application displays:
Exiting Carbon Emission Ledger...
Network client closed successfully.
API
The project uses the Great Britain Carbon Intensity API to retrieve carbon intensity information.
The application receives data from the API and processes the response before displaying it through the command-line interface.
The information shown by the application includes:
Record ID
Source
Carbon intensity
Carbon intensity index
Starting time
Ending time
The carbon intensity is displayed using the unit:
gCO2/kWh
API Response Handling
The carbon_api package is responsible for handling communication with the external API.
The application checks the API response and processes the returned information.
For example, the screenshot shows a successful API response:
Carbon API response status: 200
A status code of 200 indicates that the API request was successfully completed.
Error Handling
The application includes handling for possible API and network-related problems.
Possible problems include:
Network connection failures
API request failures
Invalid API responses
Unexpected data from the API
The application also uses logging to make it easier to monitor API requests and identify possible problems.
Logging
The Carbon Emission Ledger CLI provides logging information while performing API operations.
For example:
[INFO] Starting carbon intensity request: latest
[INFO] Carbon API response status: 200
[INFO] Carbon API request lifecycle completed.
This helps monitor the application's communication with the API and makes troubleshooting easier.
Testing and Code Quality
The project was checked using Dart's built-in development tools.
Dependencies
dart pub get
Result:
Resolving dependencies...
Downloading packages...
Got dependencies!
Formatting
dart format .
Result shown in the screenshot:
Formatted 16 files (0 changed) in 0.08 seconds.
Static Analysis
dart analyze
Result:
Analyzing carbon_workspace...
No issues found!
Carbon API Tests
cd carbon_api
dart test
Result:
All tests passed!
Carbon CLI Tests
cd carbon_cli
dart test
Result:
All tests passed!
Conclusion
The Carbon Emission Ledger CLI demonstrates how Dart can be used to create a command-line application that communicates with an external API. The project combines API integration, data processing, command-line interaction, logging, error handling, and automated testing.
The successful dependency installation, code formatting, static analysis, and package tests show that the project is properly organized and functioning as intended.
