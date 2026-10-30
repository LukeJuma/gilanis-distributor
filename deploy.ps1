# Gilanis Distributor Website - Quick Deploy Script
# Run this script to prepare your site for deployment

Write-Host "========================================" -ForegroundColor Cyan
Write-Host "  Gilanis Distributor - Deploy Helper  " -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""

# Check if git is initialized
if (Test-Path .git) {
    Write-Host "✓ Git repository found" -ForegroundColor Green
} else {
    Write-Host "✗ Git not initialized. Run: git init" -ForegroundColor Red
    exit
}

# Show current files
Write-Host ""
Write-Host "Files ready for deployment:" -ForegroundColor Yellow
Get-ChildItem -Filter "*.html" | ForEach-Object {
    Write-Host "  ✓ $($_.Name)" -ForegroundColor Green
}

# Check git status
Write-Host ""
Write-Host "Git Status:" -ForegroundColor Yellow
git status --short

# Commit if there are changes
$status = git status --porcelain
if ($status) {
    Write-Host ""
    $commit = Read-Host "Commit message (press Enter for default)"
    if ([string]::IsNullOrWhiteSpace($commit)) {
        $commit = "Update: $(Get-Date -Format 'yyyy-MM-dd HH:mm')"
    }
    
    git add .
    git commit -m $commit
    Write-Host "✓ Changes committed" -ForegroundColor Green
}

Write-Host ""
Write-Host "========================================" -ForegroundColor Cyan
Write-Host "Next Steps:" -ForegroundColor Yellow
Write-Host ""
Write-Host "1. Create a GitHub repository:" -ForegroundColor White
Write-Host "   https://github.com/new" -ForegroundColor Cyan
Write-Host ""
Write-Host "2. Push your code:" -ForegroundColor White
Write-Host "   git remote add origin https://github.com/YOUR-USERNAME/gilanis-website.git" -ForegroundColor Cyan
Write-Host "   git branch -M main" -ForegroundColor Cyan
Write-Host "   git push -u origin main" -ForegroundColor Cyan
Write-Host ""
Write-Host "3. Deploy on Vercel:" -ForegroundColor White
Write-Host "   https://vercel.com/new" -ForegroundColor Cyan
Write-Host ""
Write-Host "OR use Vercel CLI:" -ForegroundColor White
Write-Host "   npm install -g vercel" -ForegroundColor Cyan
Write-Host "   vercel" -ForegroundColor Cyan
Write-Host ""
Write-Host "📖 Read DEPLOYMENT.md for detailed instructions" -ForegroundColor Magenta
Write-Host "========================================" -ForegroundColor Cyan
