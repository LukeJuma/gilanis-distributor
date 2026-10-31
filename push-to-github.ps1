# Push Gilanis Website to GitHub
# Run this AFTER creating the repository on github.com

Write-Host "========================================" -ForegroundColor Cyan
Write-Host "  Push to GitHub  " -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""

# Get GitHub username
$username = Read-Host "Enter your GitHub username"

if ([string]::IsNullOrWhiteSpace($username)) {
    Write-Host "Error: Username cannot be empty" -ForegroundColor Red
    exit
}

$repoUrl = "https://github.com/$username/gilanis-distributor-website.git"

Write-Host ""
Write-Host "Repository URL: $repoUrl" -ForegroundColor Yellow
Write-Host ""
Write-Host "Make sure you've created this repository on GitHub first!" -ForegroundColor Yellow
Write-Host "Go to: https://github.com/new" -ForegroundColor Cyan
Write-Host ""

$confirm = Read-Host "Have you created the repository? (yes/no)"

if ($confirm -ne "yes") {
    Write-Host ""
    Write-Host "Please create the repository first:" -ForegroundColor Yellow
    Write-Host "1. Go to: https://github.com/new" -ForegroundColor White
    Write-Host "2. Repository name: gilanis-distributor-website" -ForegroundColor White
    Write-Host "3. Leave all checkboxes UNCHECKED" -ForegroundColor White
    Write-Host "4. Click 'Create repository'" -ForegroundColor White
    Write-Host "5. Run this script again" -ForegroundColor White
    Write-Host ""
    exit
}

Write-Host ""
Write-Host "Pushing to GitHub..." -ForegroundColor Green

# Add remote
git remote add origin $repoUrl 2>$null

# If remote already exists, update it
if ($LASTEXITCODE -ne 0) {
    Write-Host "Remote already exists, updating..." -ForegroundColor Yellow
    git remote set-url origin $repoUrl
}

# Rename branch to main
git branch -M main

# Push to GitHub
Write-Host "Pushing code..." -ForegroundColor Yellow
git push -u origin main

if ($LASTEXITCODE -eq 0) {
    Write-Host ""
    Write-Host "========================================" -ForegroundColor Green
    Write-Host "  SUCCESS! Code pushed to GitHub  " -ForegroundColor Green
    Write-Host "========================================" -ForegroundColor Green
    Write-Host ""
    Write-Host "View your repository at:" -ForegroundColor Yellow
    Write-Host "https://github.com/$username/gilanis-distributor-website" -ForegroundColor Cyan
    Write-Host ""
    Write-Host "Next step: Deploy on Vercel" -ForegroundColor Yellow
    Write-Host "1. Go to: https://vercel.com" -ForegroundColor White
    Write-Host "2. Sign in with GitHub" -ForegroundColor White
    Write-Host "3. Click 'Import Project'" -ForegroundColor White
    Write-Host "4. Select your repository" -ForegroundColor White
    Write-Host "5. Click 'Deploy'" -ForegroundColor White
    Write-Host ""
} else {
    Write-Host ""
    Write-Host "Error pushing to GitHub" -ForegroundColor Red
    Write-Host ""
    Write-Host "Common issues:" -ForegroundColor Yellow
    Write-Host "1. Repository doesn't exist - create it at https://github.com/new" -ForegroundColor White
    Write-Host "2. Wrong username - check your GitHub username" -ForegroundColor White
    Write-Host "3. Not authenticated - GitHub may ask for credentials" -ForegroundColor White
    Write-Host ""
}
