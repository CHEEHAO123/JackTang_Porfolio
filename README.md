# Tang Sew Peng — Resume Site

A single-page resume site built with Flutter Web, intended to be shared with
interviewers and headhunters. Content comes from the resume PDF and is defined as
plain Dart data in `lib/data/portfolio_data.dart`.

**Live site:** https://tang-39100.web.app

## Features

- Hero, Summary, Skills, Experience, Education & Professional Development
  and Contact sections, all on one scrollable page with a sticky nav bar.
- Light/dark theme toggle, persisted across visits (`shared_preferences`).
- Fully responsive (mobile / tablet / desktop breakpoints).
- Scroll-reveal animations, hover states, expandable experience cards.
- Downloadable resume PDF and mailto/tel/LinkedIn/GitHub links.

## Getting started

```bash
flutter pub get
flutter run -d chrome
```

## Production build

```bash
flutter build web --release
```

The output is written to `build/web/`. If deploying to a sub-path (e.g. a
GitHub Pages project site instead of Firebase), build with:

```bash
flutter build web --release --base-href /your-repo-name/
```

## Deployment (Firebase Hosting)

The site is hosted on Firebase Hosting under the project **`tang-39100`**
, configured in `firebase.json` / `.firebaserc`.

### One-time setup (already done)

1. `npm install -g firebase-tools` then `firebase login`.
2. Created the Firebase project and hosting site via `firebase init hosting`,
   with public directory set to `build/web` and configured as a single-page app.
3. `firebase init hosting` also wired up **GitHub Actions** auto-deploy for the
   `CHEEHAO123/JackTang_Porfolio` repo:
   - `.github/workflows/firebase-hosting-merge.yml` — deploys to the live
     channel on every push to `main`.
   - `.github/workflows/firebase-hosting-pull-request.yml` — deploys a preview
     channel for every pull request.
   - Both workflows were hand-edited to add a `subosito/flutter-action@v2` step
     before the build, since the Firebase CLI's generated workflow assumes an
     npm project and doesn't install Flutter on the runner.
   - The deploy service account key is stored as the GitHub secret
     `FIREBASE_SERVICE_ACCOUNT_TANG_39100`.

### Manual deploy

```bash
flutter build web --release
firebase deploy
```

### Notes

- `.firebase/` is a local per-machine deploy cache — it's git-ignored and never
  needs to be committed.
- If you ever re-run `firebase init hosting`, double-check the "public
  directory" prompt is answered `build/web` (not the default) — `firebase.json`
  must have `"public": "build/web"`.

## Updating content

Edit `lib/data/portfolio_data.dart` to change resume content, or replace
`assets/resume/Tang_Sew_Peng_Resume.pdf` to update the downloadable resume.
