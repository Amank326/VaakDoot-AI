param()

# Creates venv, installs deps, prompts for GEMINI_API_KEY if not set, and starts proxy + static server
Set-StrictMode -Version Latest

$cwd = Split-Path -Parent $MyInvocation.MyCommand.Path
Write-Host "Working directory: $cwd"

# Create venv
if (-Not (Test-Path -Path "$cwd\.venv")) {
    python -m venv .venv
}

# Activate venv for current process
& "$cwd\.venv\Scripts\Activate.ps1"

Write-Host "Installing Python requirements (this may take a minute)..."
python -m pip install --upgrade pip | Out-Null
python -m pip install -r requirements.txt | Out-Null

# Ensure GEMINI_API_KEY is set in this session
if (-Not $env:GEMINI_API_KEY) {
    Write-Host "GEMINI_API_KEY not set. You can paste it now (input hidden):"
    $secure = Read-Host -AsSecureString "Enter GEMINI_API_KEY"
    if ($secure.Length -gt 0) {
        $ptr = [System.Runtime.InteropServices.Marshal]::SecureStringToBSTR($secure)
        $plain = [System.Runtime.InteropServices.Marshal]::PtrToStringAuto($ptr)
        [System.Runtime.InteropServices.Marshal]::ZeroFreeBSTR($ptr) | Out-Null
        $env:GEMINI_API_KEY = $plain
        Write-Host "GEMINI_API_KEY set for this session."
    } else {
        Write-Host "No key provided. You can still run the proxy later by setting GEMINI_API_KEY."
    }
} else {
    Write-Host "GEMINI_API_KEY already set in environment."
}

# Start api_proxy.py (if available)
if (Test-Path -Path "$cwd\api_proxy.py") {
    Write-Host "Starting api_proxy.py (background)..."
    Start-Process -NoNewWindow -FilePath python -ArgumentList "api_proxy.py"
} else {
    Write-Host "api_proxy.py not found; skipping proxy start."
}

# Start static server.py
if (Test-Path -Path "$cwd\server.py") {
    Write-Host "Starting server.py (background)..."
    Start-Process -NoNewWindow -FilePath python -ArgumentList "server.py"
    Start-Sleep -Seconds 1
    Write-Host "Static server started (should be at http://localhost:5500). Opening browser..."
    Start-Process "http://localhost:5500"
} else {
    Write-Host "server.py not found; static server not started."
}

Write-Host "Done. To stop the background Python processes, find them in Task Manager and end them, or run `Get-Process python | Stop-Process` in PowerShell." 
