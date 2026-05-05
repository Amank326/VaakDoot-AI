# Local automation for VaakDoot AI

This file describes the included automation helper for running the local static server and the Gemini proxy.

Usage (Windows PowerShell):

1. Open PowerShell in the project folder (`C:\Users\amank\Downloads\files`).
2. Run the script:

```powershell
.\run_local.ps1
```

What the script does:
- Creates a virtual environment in `.venv` (if missing)
- Installs dependencies from `requirements.txt`
- Prompts you to paste a `GEMINI_API_KEY` for the current session (input is hidden)
- Starts `api_proxy.py` (if present) in the background
- Starts `server.py` (serves static files) and opens `http://localhost:5500` in your browser

Notes:
- The script sets `GEMINI_API_KEY` only for the running PowerShell session.
- If you want the proxy to run in production, deploy `api_proxy.py` to Cloud Run or another Python host and set `GEMINI_API_KEY` there.
- To stop background Python processes, use Task Manager or run `Get-Process python | Stop-Process`.
