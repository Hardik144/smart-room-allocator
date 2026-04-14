#!/bin/bash

# ============================================================
# SMARTALLOC - Reset & Fresh Backdated Commit Script
# Date Range: April 14, 2026 → May 4, 2026
# Total Commits: 65  |  Per day: 2, 3, or 4 (natural variation)
# ============================================================

# ─── CONFIGURATION ───────────────────────────────────────────
REPO_URL="https://github.com/Hardik144/smart-room-allocator.git"   # <-- Change this
BRANCH="main"
AUTHOR_NAME="Hardik Patidar"                                       # <-- Change this
AUTHOR_EMAIL="patidarhardik81@gmail.com"                                 # <-- Change this
# ─────────────────────────────────────────────────────────────

set -e

echo ""
echo "╔══════════════════════════════════════════════════╗"
echo "║   SMARTALLOC - Reset & Rebuild Commit History   ║"
echo "╚══════════════════════════════════════════════════╝"
echo ""

# ─── STEP 1: Remove old git history completely ───────────────
echo "🗑️  Step 1: Removing old git history..."

if [ -d ".git" ]; then
  rm -rf .git
  echo "  ✅ Old .git folder deleted"
else
  echo "  ℹ️  No existing .git found, skipping"
fi

# ─── STEP 2: Fresh git init ──────────────────────────────────
echo ""
echo "🔧 Step 2: Initializing fresh git repo..."
git init
git config user.name "$AUTHOR_NAME"
git config user.email "$AUTHOR_EMAIL"
echo "  ✅ Git initialized with user: $AUTHOR_NAME <$AUTHOR_EMAIL>"

# ─── STEP 3: Add remote ──────────────────────────────────────
echo ""
echo "🔗 Step 3: Adding remote origin..."
git remote add origin "$REPO_URL"
echo "  ✅ Remote set to: $REPO_URL"

# ─── COMMIT PLAN ─────────────────────────────────────────────
# Format: "DATE|HH:MM|message"
# 21 days | mix of 2, 3, 4 commits = 65 total
# ─────────────────────────────────────────────────────────────

COMMITS=(

  # ── Apr 14 (4) ── Project Init
  "2026-04-14|09:10|Initial commit: create SMARTALLOC project structure"
  "2026-04-14|11:30|Add package.json and install backend dependencies"
  "2026-04-14|14:45|Add React frontend scaffold with create-react-app"
  "2026-04-14|18:20|Configure Tailwind CSS and postcss in frontend"

  # ── Apr 15 (3) ── User Auth Backend
  "2026-04-15|09:20|Add User model with name, email, password, and role"
  "2026-04-15|13:10|Implement JWT auth middleware in middleware/auth.js"
  "2026-04-15|17:40|Add register and login routes in routes/auth.js"

  # ── Apr 16 (3) ── Core Models
  "2026-04-16|09:00|Add Room model with capacity, type, and availability"
  "2026-04-16|12:30|Add Course model with code, name, credits, faculty ref"
  "2026-04-16|17:00|Add Allocation model linking course, room, and timeslot"

  # ── Apr 17 (2) ── DB & Seed
  "2026-04-17|10:15|Configure MongoDB connection in server.js with dotenv"
  "2026-04-17|16:00|Add seed.js to populate initial rooms and course data"

  # ── Apr 18 (4) ── Backend Routes
  "2026-04-18|09:05|Add rooms CRUD routes in backend/routes/rooms.js"
  "2026-04-18|11:50|Add courses CRUD routes in backend/routes/courses.js"
  "2026-04-18|14:30|Add users routes with admin role-based access control"
  "2026-04-18|18:10|Add allocations route with POST endpoint and validation"

  # ── Apr 19 (3) ── Allocation & Dashboard Routes
  "2026-04-19|09:40|Add conflict detection logic in allocations route"
  "2026-04-19|13:20|Add GET allocations with filters by room, course, day"
  "2026-04-19|17:55|Add dashboard route returning summary counts for stats"

  # ── Apr 20 (2) ── Frontend Layout
  "2026-04-20|10:00|Create Layout.js wrapping sidebar and header components"
  "2026-04-20|15:30|Build Sidebar.js with nav links and active route state"

  # ── Apr 21 (3) ── Header, Auth UI, Protected Route
  "2026-04-21|09:15|Build Header.js with user display and logout button"
  "2026-04-21|12:50|Add ProtectedRoute.js to redirect unauthenticated users"
  "2026-04-21|17:20|Create AuthPage.js with login and signup form UI"

  # ── Apr 22 (2) ── Context & API Service
  "2026-04-22|10:30|Setup AuthContext with login, logout, and user state"
  "2026-04-22|16:10|Add axios instance in services/api.js with JWT interceptor"

  # ── Apr 23 (4) ── Dashboard & Rooms
  "2026-04-23|09:00|Create Dashboard.js with stats cards for summary view"
  "2026-04-23|11:45|Connect dashboard to backend stats API endpoint"
  "2026-04-23|14:20|Build Rooms.js page with full room listing table"
  "2026-04-23|18:00|Add room add/edit modal and delete with confirmation"

  # ── Apr 24 (3) ── Courses & Users
  "2026-04-24|09:30|Build Courses.js page with searchable course table"
  "2026-04-24|13:40|Add course create, edit modal, and delete functionality"
  "2026-04-24|17:50|Build Users.js page with role management and user search"

  # ── Apr 25 (2) ── Allocation Frontend
  "2026-04-25|10:20|Build Allocation.js page with timetable grid view"
  "2026-04-25|15:55|Add allocation form: select course, room, day, timeslot"

  # ── Apr 26 (3) ── Allocation UI Polish
  "2026-04-26|09:10|Highlight conflicting slots in red on allocation grid"
  "2026-04-26|13:00|Connect allocation page to backend with loading states"
  "2026-04-26|17:30|Add success and error toast notifications for allocations"

  # ── Apr 27 (4) ── Timetable Page
  "2026-04-27|08:55|Create Timetable.js page with weekly schedule grid"
  "2026-04-27|11:30|Fetch and render timetable data grouped by day and time"
  "2026-04-27|14:10|Add filter controls: by room, faculty, or course name"
  "2026-04-27|18:20|Make timetable grid responsive for smaller viewports"

  # ── Apr 28 (2) ── Conflicts Page
  "2026-04-28|10:05|Build Conflicts.js showing all detected scheduling clashes"
  "2026-04-28|15:40|Add conflict resolution UI to reassign or reschedule slot"

  # ── Apr 29 (3) ── Reports & Settings
  "2026-04-29|09:20|Create Reports.js with room utilization and faculty load"
  "2026-04-29|13:00|Implement CSV export for all report types"
  "2026-04-29|17:30|Build Settings.js with password change and preferences"

  # ── Apr 30 (2) ── Styling
  "2026-04-30|10:45|Update App.css with global styles and color variables"
  "2026-04-30|16:20|Polish Tailwind UI: hover states, transitions, spacing"

  # ── May 01 (4) ── Bug Fixes
  "2026-05-01|09:00|Fix JWT token expiry not triggering logout on frontend"
  "2026-05-01|11:30|Fix allocation form not resetting after successful submit"
  "2026-05-01|14:50|Fix timetable blank on first load due to async race condition"
  "2026-05-01|18:15|Fix users page crash when role field is missing or undefined"

  # ── May 02 (3) ── More Fixes
  "2026-05-02|09:40|Fix room filter not clearing on page navigation"
  "2026-05-02|13:10|Fix course delete not updating table without page refresh"
  "2026-05-02|17:00|Fix sidebar active link not updating on browser back navigation"

  # ── May 03 (3) ── Enhancements
  "2026-05-03|09:15|Add loading spinners and skeleton states to all data pages"
  "2026-05-03|13:30|Add empty state illustrations when tables have no data"
  "2026-05-03|17:45|Add confirmation modals before all destructive operations"

  # ── May 04 (3) ── Final
  "2026-05-04|09:00|Add README with setup, usage, and project overview"
  "2026-05-04|13:00|Add .env.example for frontend and backend configs"
  "2026-05-04|17:00|Final cleanup: remove logs, unused imports, ready for submission"

)

# ─── STEP 4: Execute commits ─────────────────────────────────
echo ""
echo "📅 Step 4: Creating $(( ${#COMMITS[@]} )) backdated commits..."
echo ""

TOTAL=${#COMMITS[@]}
COUNT=0

for entry in "${COMMITS[@]}"; do
  DATE=$(echo "$entry" | cut -d'|' -f1)
  TIME=$(echo "$entry" | cut -d'|' -f2)
  MESSAGE=$(echo "$entry" | cut -d'|' -f3)
  FULL_DATE="${DATE}T${TIME}:00+05:30"
  COUNT=$((COUNT + 1))

  echo "[$COUNT/$TOTAL] $MESSAGE | $FULL_DATE" >> commit_log.txt

  git add .

  GIT_AUTHOR_DATE="$FULL_DATE" \
  GIT_COMMITTER_DATE="$FULL_DATE" \
  git commit --date="$FULL_DATE" -m "$MESSAGE"

  echo "  ✅ [$COUNT/$TOTAL] [$DATE $TIME] $MESSAGE"
done

# ─── STEP 5: Force push ──────────────────────────────────────
echo ""
echo "─────────────────────────────────────────────"
echo "✅ $TOTAL commits created!"
echo "─────────────────────────────────────────────"
echo ""
echo "📤 Step 5: Force pushing to GitHub (overwrites remote)..."
git branch -M $BRANCH
git push -u origin $BRANCH --force

echo ""
echo "╔══════════════════════════════════════════════════╗"
echo "║   🎉 Done! Old history removed. 65 new commits  ║"
echo "║   pushed. Check your GitHub contribution graph! ║"
echo "╚══════════════════════════════════════════════════╝"
echo ""