# Deployment Automation Capability Specification

## ADDED Requirements

### Requirement: Bash Deployment Script
The system SHALL provide a bash script that automates copying the main AutoHotkey script to the deployment directory.

#### Scenario: User executes deployment script
Given the user is in the project root directory
When the user runs the deployment script
Then the system copies start@aborruso.ahk to /mnt/c/github/shortcuts-kwh/ and reports success

#### Scenario: Source file missing
Given the start@aborruso.ahk file does not exist in current directory
When the user runs the deployment script
Then the system displays an error message and exits with non-zero status

#### Scenario: Target directory inaccessible
Given the target directory /mnt/c/github/shortcuts-kwh/ is not accessible
When the user runs the deployment script
Then the system displays an error message and exits with non-zero status

#### Scenario: Copy operation fails
Given there are permission or disk space issues
When the user runs the deployment script
Then the system displays an appropriate error message and exits with non-zero status

### Requirement: Operation Feedback
The deployment script SHALL provide clear feedback about the operation status.

#### Scenario: Successful deployment
Given the copy operation completes successfully
When the script finishes
Then the system displays a success message with file paths

#### Scenario: Failed deployment
Given the copy operation fails
When the script finishes
Then the system displays an error message explaining the failure reason

### Requirement: Script Usability
The deployment script SHALL be easy to use from the project root directory.

#### Scenario: User runs script without arguments
Given the user executes the script from project root
When the script runs
Then it performs the deployment with default settings without requiring additional input

#### Scenario: Script help information
Given the user wants to understand script usage
When the user runs the script with --help flag
Then the system displays usage instructions and available options