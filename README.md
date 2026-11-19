# NOVA AI — Phase 1 Foundation

Responsive bilingual (Arabic/English) social-platform UI prototype.

## Included
- Responsive desktop, tablet, and mobile layout
- Arabic RTL / English LTR language switch
- Home dashboard, messages preview, community preview, NOVA AI preview, security roadmap, settings
- Interactive navigation, demo like button, demo prompts, toast feedback
- PWA manifest and basic service worker for offline shell caching
- No backend, real messaging, real calls, AI provider, or active encryption in this phase

## Run locally
**Simplest:** open `index.html` in a modern browser.

**Recommended (for PWA/service worker testing):**
1. Install Node.js (LTS) if not already installed.
2. Open a terminal in this folder.
3. Run:
   ```bash
   npx serve .
   ```
4. Open the local URL printed by the command.

You can also use VS Code with the Live Server extension.

## Test checklist
- [ ] Open `index.html` and confirm the home dashboard loads.
- [ ] Select EN; confirm layout switches to LTR and labels translate.
- [ ] Select العربية; confirm RTL returns.
- [ ] Navigate through all five main sections.
- [ ] Open Settings and switch language there.
- [ ] Tap the like control and confirm its count changes.
- [ ] Open NOVA AI, choose a prompt, submit text, and confirm the demo notice appears.
- [ ] Test at phone width (360–430px) and desktop width.

## Project status
Phase 1 is a front-end foundation and visual prototype. It is not a production social network. Do not use real private information. Security features shown are roadmap items only.

## Next phases
2. Authentication, profiles, account recovery, and backend foundation.
3. Real-time messaging with audited end-to-end encryption.
4. WebRTC voice/video calling.
5. Encrypted media storage and transfer.
6. Social feed, stories, groups, moderation and reporting.
7. AI provider integration with explicit privacy controls.
8. Security hardening, independent testing, deployment and operations.


## Phase 2 — Accounts and local API
- Open `auth.html` to create a development account or sign in.
- Start API with `python backend/server.py`.
- Serve project files with `python -m http.server 5500`, then open `http://127.0.0.1:5500/auth.html`.
- The local API uses SQLite and Python's standard library.
- See `backend/README.md` for routes and security limitations.


## Phase 3 — NOVA MESSENGER (local text messaging)

A development-only text messenger is included in `messenger.html`. It supports:
- Sending text messages between registered usernames on the same local API.
- Conversation list and periodic refresh (3 seconds).
- Authentication through the Phase 2 bearer-token session.

Run the API and static site using two terminals:

```bash
python backend/server.py
python -m http.server 5500
```

Open `http://127.0.0.1:5500/auth.html`, create two test accounts in separate browser sessions, then open `http://127.0.0.1:5500/messenger.html` and message the other username.

**Important limitations:** this phase uses HTTP polling, not WebSocket push. Messages are stored as readable text in the local SQLite database. End-to-end encryption (E2EE), voice/video calls, media upload, push notifications, and multi-device sync are not implemented. Do not use real passwords or sensitive personal information. Do not expose this development server to the internet. Production deployment needs a reviewed messaging protocol/library, HTTPS, abuse protections, moderation/reporting controls, secure storage, privacy policy, and independent security testing.


## Phase 4 — Profiles and account discovery

- Edit display name and a short public bio at `discover.html`.
- Search public accounts by username or display name.
- Start a message directly from a search result.
- API: `GET /api/users?q=...` and `POST /api/profile`.

This is still a local prototype. Search exposes usernames, display names, and public bios to signed-in users. Do not include sensitive personal information in bios.


## Phase 5 — File and image sharing (local development)

- Send JPEG, PNG, WEBP images, PDF documents, and plain text files up to 4 MB.
- Files are stored in `backend/uploads/` using random storage names.
- Downloads require a signed-in account that is the sender or recipient.
- The API checks the declared type against basic file signatures.

This is not cloud storage and attachments are not end-to-end encrypted. Keep the API bound to localhost; do not upload sensitive material. Production requires malware scanning, quotas, retention/deletion policy, content moderation/reporting, encrypted object storage, signed downloads, and security review.


## Phase 6 — Privacy and community safety controls

- Block and unblock accounts through the authenticated API.
- Blocked pairs cannot exchange text messages or attachments.
- Account discovery hides accounts involved in a block relationship.
- Submit reports for spam, harassment, impersonation, unsafe content, or other concerns.
- Reports are stored for review; this local prototype does not include a staffed moderation console or automatic enforcement.

Do not use the prototype as a public social network until reporting workflows, moderation staffing, appeals, age-appropriate safeguards, privacy/legal review, and abuse prevention are implemented.


## Phase 7 — Read receipts and unread counters

- Conversation list shows unread message counts.
- Opening a conversation marks incoming messages as read.
- Message status distinguishes sent and read for the current sender.

These indicators are best-effort in the local polling prototype and are not push notifications.


## Phase 7 — Read receipts and unread counters

- Conversation list shows unread message counts.
- Opening a conversation marks incoming messages as read.
- Message status distinguishes sent and read for the current sender.

These indicators are best-effort in the local polling prototype and are not push notifications.


## Quick start

**Windows:** double-click `START-NOVA-WINDOWS.bat`.

**macOS/Linux:** run `sh START-NOVA-MAC-LINUX.sh` from the project directory, then open `http://127.0.0.1:5500/auth.html`.

Keep both terminal windows open while using the local prototype. The API binds to localhost and is not configured for public hosting.

## Phase 9 — Session management
- `sessions.html` lets signed-in users review active sessions, revoke an individual other session, or revoke all other sessions.
- API endpoints: `GET /api/sessions`, `POST /api/sessions/revoke` (JSON `sessionId`), and `POST /api/sessions/revoke-others`.
- Current session cannot be revoked from this screen; use logout. This local development version does not identify device/IP and is not production-ready.


## Phase 10 — Profile & local settings

- Editable display name and bio (server-backed).
- Account information display.
- Device-local compact preference.
- Profile page: `profile.html`.
- Profile API: `POST /api/profile` (existing endpoint).

Development only: profile data is not a production privacy/security implementation.

## Phase 11 — Mobile UX refinements
Responsive messenger layout adjustments for smaller screens, sticky header/send area, touch sizing, and file attachment spacing. See `PHASE11-NOTES.txt`. CSS-only phase; backend functionality is unchanged.


## Phase 12 — Block-list management
Added a page to list accounts you blocked and unblock them, using the existing authenticated API.

## Consolidated final development release

This bundle consolidates the prototype pages and phases in one folder. It includes
account discovery/search, profiles, block-list management, sessions, notifications,
attachments, and responsive mobile UI. See `FINAL-RELEASE-NOTES.txt` for the
scope and limitations. The ZIP excludes the development database and test uploads.

## Mobile app packaging (Android/iOS)
See `mobile/README-AR.md` for Capacitor build instructions. Android builds require Android Studio/SDK. iOS builds require macOS and Xcode. The backend must be hosted securely and the frontend API URL changed from localhost to that server before phone testing.
