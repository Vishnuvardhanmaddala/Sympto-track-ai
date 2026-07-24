# SymptoTrack AI Setup & Run Script

Write-Host "--- 🩺 Initializing SymptoTrack AI Full-Stack Environment ---" -ForegroundColor Cyan

# 1. Backend Setup
Write-Host "`n[1/3] Setting up Python Backend..." -ForegroundColor Yellow
cd backend

# Check for .env
if (-not (Test-Path .env)) {
    Copy-Item .env.example .env
    Write-Host "Created .env file. PLEASE FILL IN YOUR API KEYS!" -ForegroundColor Magenta
}

# Install dependencies (Trying common python commands)
$python_cmd = "python"
if (-not (Get-Command $python_cmd -ErrorAction SilentlyContinue)) { $python_cmd = "python3" }
if (-not (Get-Command $python_cmd -ErrorAction SilentlyContinue)) { $python_cmd = "py" }

if (Get-Command $python_cmd -ErrorAction SilentlyContinue) {
    Write-Host "Using $python_cmd to install dependencies..."
    & $python_cmd -m pip install -r requirements.txt
} else {
    Write-Host "ERROR: Python not found in PATH. Please install Python 3 and run 'pip install -r requirements.txt' manually in the backend folder." -ForegroundColor Red
}

# 2. Frontend Setup
Write-Host "`n[2/3] Setting up React Frontend..." -ForegroundColor Yellow
cd ../frontend
npm install

# 3. Running the App
Write-Host "`n[3/3] System Ready!" -ForegroundColor Green
Write-Host "To start the project:" -ForegroundColor White
Write-Host "1. Open a terminal in 'backend' and run: python app.py" -ForegroundColor Cyan
Write-Host "2. Open another terminal in 'frontend' and run: npm run dev" -ForegroundColor Cyan
Write-Host "`nNote: Don't forget to add GEMINI_API_KEY and TAVILY_API_KEY to backend/.env" -ForegroundColor Yellow
