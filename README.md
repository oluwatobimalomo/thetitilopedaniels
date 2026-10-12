# Titilope Adeleye Portfolio

A responsive portfolio for customer experience and technical support work, with a small blog studio for creating, editing, archiving and deleting posts.

## Run locally

```bash
npm install
npm run dev
```

Open the local URL printed by Vite. Create a production build with `npm run build`.

## Blog studio

Choose **Manage blog** in the Writing section. The studio supports new posts, editing, optional image uploads, archiving/restoring and deletion. Posts are saved in browser `localStorage`, so this version needs no keys, database or server for local use.

Browser storage is private to each browser and device. Posts created in the deployed site are visible only in that browser; they do not sync to visitors or other devices. For a shared production blog, connect a hosted content service such as Supabase before publishing. Image uploads are stored in the browser with the post and should be kept to reasonably small images.

## Deploy

The app builds to `dist/` and can be deployed to Vercel by importing this GitHub repository. Vercel detects Vite automatically; use `npm run build` and `dist` as the output directory if prompted. The app uses no server-side routes, so it also works as a static site.

## Resume details

Experience, education, skills, contact details and performance figures are based on the supplied resume. LinkedIn was listed without a profile URL, so no LinkedIn link has been invented.
