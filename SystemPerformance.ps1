# Define the log file path
$logFile = "C:\PerformanceLogs\SystemPerformance.log"

# Create the log directory if it doesn't exist
if (-Not (Test-Path -Path (Split-Path -Path $logFile))) {
    New-Item -ItemType Directory -Path (Split-Path -Path $logFile)
}

# Function to log performance data
function Log-Performance {
    $timestamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
    $cpuUsage = (Get-WmiObject -Query "SELECT LoadPercentage FROM Win32_Processor").LoadPercentage
    $memoryUsage = (Get-WmiObject -Class Win32_OperatingSystem).TotalVisibleMemorySize - (Get-WmiObject -Class Win32_OperatingSystem).FreePhysicalMemory

    $logEntry = "$timestamp - CPU Usage: $cpuUsage%, Memory Usage: $memoryUsage KB"
    Add-Content -Path $logFile -Value $logEntry
}

# Schedule the logging function to run daily
$trigger = New-ScheduledTaskTrigger -Daily -At "00:00"
$action = New-ScheduledTaskAction -Execute "PowerShell.exe" -Argument "-File `"$PSScriptRoot\DailySystemPerformanceLogger.ps1`""
Register-ScheduledTask -Action $action -Trigger $trigger -TaskName "DailySystemPerformanceLogger" -Description "Logs daily system performance data" -User "$env:UserName" -RunLevel Highest -Force

# Run the logging function
Log-Performance
