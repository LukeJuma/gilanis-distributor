# Deployment Instructions for Vercel

## Option 1: Deploy via Vercel Website (Easiest - No CLI needed)

### Step 1: Create a GitHub Repository
1. Go to [GitHub](https://github.com) and sign in
2. Click the "+" button in the top right and select "New repository"
3. Name it: `gilanis-distributor-website`
4. Keep it Public or Private (your choice)
5. **DO NOT** initialize with README (we already have files)
6. Click "Create repository"

### Step 2: Push Your Code to GitHub
Run these commands in PowerShell (from the project directory):

```powershell
git remote add origin https://github.com/YOUR-USERNAME/gilanis-distributor-website.git
git branch -M main
git push -u origin main
```

Replace `YOUR-USERNAME` with your actual GitHub username.

### Step 3: Deploy to Vercel
1. Go to [Vercel](https://vercel.com) and sign up/sign in (use GitHub account for easy connection)
2. Click "Add New..." → "Project"
3. Import your GitHub repository `gilanis-distributor-website`
4. Keep all default settings (Vercel will detect it's a static site)
5. Click "Deploy"
6. Wait 1-2 minutes for deployment to complete

### Step 4: Your Site is Live! 🎉
You'll get a URL like: `https://gilanis-distributor-website.vercel.app`

### Optional: Add Custom Domain
1. In Vercel dashboard, go to your project
2. Click "Settings" → "Domains"
3. Add your custom domain (e.g., gilanis.co.ke)
4. Follow DNS configuration instructions

---

## Option 2: Deploy via Vercel CLI (Advanced)

### Prerequisites
Install Node.js from [nodejs.org](https://nodejs.org) if not already installed.

### Install Vercel CLI
```powershell
npm install -g vercel
```

### Deploy
```powershell
# Login to Vercel (opens browser)
vercel login

# Deploy (from project directory)
vercel

# Follow the prompts:
# - Set up and deploy? Yes
# - Which scope? (select your account)
# - Link to existing project? No
# - Project name? gilanis-distributor-website
# - Directory? ./ (current directory)
# - Override settings? No
```

### Deploy to Production
```powershell
vercel --prod
```

---

## What Gets Deployed?

All your HTML pages:
- ✅ Home page (index.html)
- ✅ Shop page (shop.html)
- ✅ Product detail (product.html)
- ✅ Calculator (calculator.html)
- ✅ Shopping cart (cart.html)
- ⏳ Checkout (checkout.html) - to be created
- ⏳ About (about.html) - to be created
- ⏳ Gallery (gallery.html) - to be created
- ⏳ Contact (contact.html) - to be created

---

## Automatic Deployments

Once connected to GitHub:
- Every `git push` to `main` branch triggers automatic deployment
- Pull requests get preview deployments
- Easy rollback to previous versions

---

## Troubleshooting

**Issue: "vercel command not found"**
- Solution: Install Node.js first, then run `npm install -g vercel`

**Issue: Git push denied**
- Solution: Make sure you've created the GitHub repo and used the correct URL

**Issue: Site not loading properly**
- Solution: Check browser console for errors (F12)
- All CSS/JS is loaded via CDN, ensure internet connection

---

## Support

For deployment help:
- Vercel Docs: https://vercel.com/docs
- GitHub Docs: https://docs.github.com

For website issues:
- Email: dev@gilanis.co.ke
