# DEPLOY GUIDE — House of Brené

## 1) Supabase
1. Create a Supabase project.
2. Open SQL Editor.
3. Paste `supabase/schema.sql` and run it.
4. Copy your Project URL and anon key from Project Settings → API.

## 2) Frontend config
1. In `frontend`, copy `env.example.js` to `env.js`.
2. Fill in:
```js
window.HOB_ENV = {
  SUPABASE_URL: 'https://YOUR_PROJECT.supabase.co',
  SUPABASE_ANON_KEY: 'YOUR_SUPABASE_ANON_KEY',
  MPESA_API_BASE: 'https://your-backend-domain.com',
  ADMIN_PASSWORD: 'your-strong-admin-password'
};
```

## 3) Backend config
1. In `backend`, copy `.env.example` to `.env`.
2. Fill in Safaricom Daraja credentials.
3. Run:
```bash
cd backend
npm install
npm run dev
```

## 4) Deploy frontend
### Vercel
- Push to GitHub
- Import repo into Vercel
- Set root directory to `frontend`
- Framework preset: Other

### Netlify
- New site from Git
- Publish directory: `frontend`
- No build command

### GitHub Pages
- Publish the `frontend` folder or place its contents at the repo root
- Commit `env.js`

## 5) Deploy backend
Use Vercel, Render, or Railway with root directory `backend`. Add all `.env` values in the host settings.

## 6) Go live checklist
- Run the SQL schema
- Create `frontend/env.js`
- Create `backend/.env`
- Deploy backend
- Deploy frontend
- Update `MPESA_API_BASE` to the live backend URL
- Test admin add/edit/delete
- Test checkout inserts into `customers` and `orders`

## 7) Security note
This starter uses a simple password gate and open Supabase policies so it is easy to launch. For production, replace these with Supabase Auth, tighter RLS policies, and server-side admin actions.
