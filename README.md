# Titilope Oluwatobi-Daniels portfolio

A responsive CX Specialist portfolio with a Supabase-backed blog. The public site is served at `/`; the private publishing dashboard is at `/admin`.

## Run locally

```bash
npm install
npm run dev
```

Copy `.env.example` to `.env.local` and set the Supabase project URL and publishable key. Vite runs at the local URL it prints. `npm run build` creates the production bundle in `dist/`.

## Connect Supabase

1. In the Supabase SQL Editor, run [`supabase.sql`](./supabase.sql). It creates the blog table, policies and public image bucket, and adds three starter articles.
2. In Supabase Authentication, create an owner user with `titilopeadeleye05@gmail.com` and a password. Row-level security grants management access only to this email.
3. Add `VITE_SUPABASE_URL` and `VITE_SUPABASE_PUBLISHABLE_KEY` to the local `.env.local` file. The provided publishable key is intended for browser use; the database policies control access.
4. Add the same two variables in Vercel under Project Settings → Environment Variables, then redeploy. Set the Supabase Auth Site URL to your Vercel domain and allow its `/admin` redirect URL.
5. Open `/admin` to sign in. You can publish, edit, archive, restore and delete posts, with optional cover image uploads.

The `.env.local` file is ignored by Git. Never put a Supabase service-role key in frontend code or Vercel client variables.

## Deploy

Import this GitHub repository into Vercel. Vercel detects Vite automatically (`npm run build`, output `dist`). `vercel.json` sends app routes such as `/admin` to the single-page app entry point.

## Resume details

Experience, education, skills, contact details and performance figures are based on the supplied resume. LinkedIn was listed without a profile URL, so no LinkedIn link has been invented.
