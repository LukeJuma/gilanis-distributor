# Quick Deploy Script - Opens deployment pages in browser

Write-Host "========================================" -ForegroundColor Cyan
Write-Host "  Gilanis Distributor - Quick Deploy  " -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""

Write-Host "Choose a deployment method:" -ForegroundColor Yellow
Write-Host ""
Write-Host "1. Netlify Drop (EASIEST - just drag and drop folder)" -ForegroundColor Green
Write-Host "2. Vercel (requires GitHub account)" -ForegroundColor White
Write-Host "3. GitHub (create repository first)" -ForegroundColor White
Write-Host "4. Show deployment guide" -ForegroundColor White
Write-Host ""

$choice = Read-Host "Enter your choice (1-4)"

switch ($choice) {
    "1" {
        Write-Host ""
        Write-Host "Opening Netlify Drop..." -ForegroundColor Green
        Write-Host ""
        Write-Host "INSTRUCTIONS:" -ForegroundColor Yellow
        Write-Host "1. The browser will open" -ForegroundColor White
        Write-Host "2. Drag the folder 'd:\bens site' onto the page" -ForegroundColor White
        Write-Host "3. Wait 10 seconds" -ForegroundColor White
        Write-Host "4. Your site is LIVE!" -ForegroundColor White
        Write-Host ""
        Start-Sleep -Seconds 3
        Start-Process "https://app.netlify.com/drop"
    }
    "2" {
        Write-Host ""
        Write-Host "Opening Vercel..." -ForegroundColor Green
        Write-Host ""
        Write-Host "INSTRUCTIONS:" -ForegroundColor Yellow
        Write-Host "1. Sign in with GitHub" -ForegroundColor White
        Write-Host "2. Click 'Add New Project'" -ForegroundColor White
        Write-Host "3. Import your GitHub repository" -ForegroundColor White
        Write-Host "4. Click 'Deploy'" -ForegroundColor White
        Write-Host ""
        Write-Host "NOTE: You need to push code to GitHub first!" -ForegroundColor Red
        Write-Host ""
        Start-Sleep -Seconds 3
        Start-Process "https://vercel.com/new"
    }
    "3" {
        Write-Host ""
        Write-Host "Opening GitHub..." -ForegroundColor Green
        Write-Host ""
        Write-Host "INSTRUCTIONS:" -ForegroundColor Yellow
        Write-Host "1. Repository name: gilanis-distributor-website" -ForegroundColor White
        Write-Host "2. Keep it Public" -ForegroundColor White
        Write-Host "3. Don't check any boxes" -ForegroundColor White
        Write-Host "4. Click 'Create repository'" -ForegroundColor White
        Write-Host ""
        Start-Sleep -Seconds 3
        Start-Process "https://github.com/new"
        
        Write-Host ""
        Write-Host "After creating the repository, run:" -ForegroundColor Yellow
        Write-Host ""
        Write-Host ".\push-to-github.ps1" -ForegroundColor Cyan
        Write-Host ""
    }
    "4" {
        Write-Host ""
        Write-Host "Opening deployment guide..." -ForegroundColor Green
        Start-Sleep -Seconds 1
        
        if (Test-Path "DEPLOY-SIMPLE.md") {
            notepad "DEPLOY-SIMPLE.md"
        } else {
            Write-Host "Guide file not found!" -ForegroundColor Red
        }
    }
    default {
        Write-Host ""
        Write-Host "Invalid choice. Please run the script again." -ForegroundColor Red
    }
}

Write-Host ""
Write-Host "========================================" -ForegroundColor Cyan
Write-Host "Need help? Check DEPLOY-SIMPLE.md" -ForegroundColor Yellow
Write-Host "========================================" -ForegroundColor Cyan
