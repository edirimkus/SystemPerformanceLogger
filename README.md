# Daily System Performance Logger

## Description
This PowerShell script logs daily CPU and memory usage, automating system performance tracking with scheduled tasks. Ideal for monitoring and optimizing Windows system resources.

## Features
- Logs CPU and memory usage to a file daily.
- Creates a scheduled task to run the script automatically.
- Easy to set up and use.

## Prerequisites
- Windows PowerShell
- Administrator privileges

## Installation
1. Download the script and save it as `DailySystemPerformanceLogger.ps1`.
2. Create the necessary directory for logs: `C:\PerformanceLogs\`
3. Run the script in PowerShell with administrator privileges to set up the scheduled task.

## Usage
- The script will log CPU and memory usage daily at midnight.
- Logs are saved in `C:\PerformanceLogs\SystemPerformance.log`.

## License
This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.