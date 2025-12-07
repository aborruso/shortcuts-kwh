# Script Versioning Capability Specification

## ADDED Requirements

### Requirement: AutoHotkey v2 Script Version
The system SHALL provide a separate AutoHotkey v2 version of the script with identical functionality to the v1 version.

#### Scenario: User downloads v2 script
Given the user has AutoHotkey v2 installed
When the user runs `start@aborruso_v2.ahk`
Then all shortcuts function identically to the v1 version

#### Scenario: v2 script uses modern syntax
Given the v2 script file
When examining the code
Then it uses v2 syntax (StrLower, :=, modern function definitions)

#### Scenario: v2 script has version requirement
Given the v2 script file
When examining the directives
Then it includes `#Requires AutoHotkey v2.0` at the top

### Requirement: Dual Version Build Support
The compilation script SHALL support building both v1 and v2 executables.

#### Scenario: Compile both versions
Given both v1 and v2 .ahk files exist
When running `compile.bat`
Then both `start@aborruso.exe` and `start@aborruso_v2.exe` are created

#### Scenario: Version-specific compiler
Given AutoHotkey v1 and v2 are installed
When compiling each version
Then the correct compiler version is used for each script

### Requirement: Dual Version Deployment
The deployment script SHALL support deploying both v1 and v2 versions.

#### Scenario: Deploy both versions by default
Given both v1 and v2 .ahk files exist
When running `./deploy.sh`
Then both files are copied to the target directory

#### Scenario: Deploy specific version
Given both v1 and v2 .ahk files exist
When running `./deploy.sh --version v1` or `./deploy.sh --version v2`
Then only the specified version is deployed

#### Scenario: Integrity check for both versions
Given both versions are deployed
When deployment completes
Then file integrity is verified for both v1 and v2 files

### Requirement: Version Documentation
The documentation SHALL clearly explain the differences between v1 and v2 and guide users on which to use.

#### Scenario: README shows both versions
Given the README.md file
When a user reads the installation section
Then both v1 and v2 download options are clearly presented

#### Scenario: Version comparison table
Given the README.md file
When a user looks for version differences
Then a comparison table shows key syntax and compatibility differences

#### Scenario: AI assistant guidance
Given CLAUDE.md and AGENTS.md files
When an AI assistant reads the documentation
Then it understands both v1 and v2 syntax requirements