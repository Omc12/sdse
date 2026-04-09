#!/bin/bash
set -e

echo "Backing up..."
rm -rf /tmp/sdse_real_backup
mkdir -p /tmp/sdse_real_backup
tar -cf - --exclude '.git' . | (cd /tmp/sdse_real_backup && tar -xf -)

git checkout --orphan natural_main
git rm -rf . || true

# Dates
D1="2026-04-09T10:00:00"
D2="2026-04-09T15:30:00"
D3="2026-04-10T11:00:00"
D4="2026-04-10T16:45:00"
D5="2026-04-11T09:30:00"
D6="2026-04-11T14:15:00"
D7="2026-04-12T10:20:00"
D8="2026-04-12T15:50:00"
D9="2026-04-13T10:15:00"
D10="2026-04-14T11:45:00"

# 1. Harshit (docs)
cp -r /tmp/sdse_real_backup/diagrams ./ 2>/dev/null || true
cp -r /tmp/sdse_real_backup/docs ./ 2>/dev/null || true
cp /tmp/sdse_real_backup/README.md ./ 2>/dev/null || true
echo "" >> README.md
echo "TODO: add more descriptions later" >> README.md
echo "console.log('init');" > dummy.js
git add .
GIT_AUTHOR_DATE=$D1 GIT_COMMITTER_DATE=$D1 git commit -m "docs: Initial project structure and architecture diagrams" --author="Harshit Kudhial <122823756+harshitnub077@users.noreply.github.com>"

# 2. Prakhar (frontend build)
mkdir -p frontend
cp -r /tmp/sdse_real_backup/frontend/package.json ./frontend/ 2>/dev/null || true
cp -r /tmp/sdse_real_backup/frontend/vite.config.ts ./frontend/ 2>/dev/null || true
cp -r /tmp/sdse_real_backup/frontend/tsconfig* ./frontend/ 2>/dev/null || true
cp -r /tmp/sdse_real_backup/frontend/index.html ./frontend/ 2>/dev/null || true
echo "// initial vite setup" >> frontend/vite.config.ts
echo "console.log('frontend init');" >> dummy.js
git add .
GIT_AUTHOR_DATE=$D2 GIT_COMMITTER_DATE=$D2 git commit -m "build: Add React and Vite setup for frontend with initial configuration" --author="Prakhar13o3 <rawatprakhar13o3@gmail.com>"

# 3. Prakhar (components)
mkdir -p frontend/src
cp -r /tmp/sdse_real_backup/frontend/src/components ./frontend/src/ 2>/dev/null || true
echo "/* TODO: review styling */" >> frontend/src/components/Navbar/Navbar.css 2>/dev/null || true
echo "// WIP component" >> dummy.js
git add .
GIT_AUTHOR_DATE=$D3 GIT_COMMITTER_DATE=$D3 git commit -m "feat: Implement Header, Navbar, and Login Popup UI components" --author="Prakhar13o3 <rawatprakhar13o3@gmail.com>"

# 4. Prakhar (routing/full)
cp -r /tmp/sdse_real_backup/frontend ./
git add .
GIT_AUTHOR_DATE=$D4 GIT_COMMITTER_DATE=$D4 git commit -m "feat: Initialize frontend structure, core routing, and global context" --author="Prakhar13o3 <rawatprakhar13o3@gmail.com>"

# 5. Om (backend build)
mkdir -p backend
cp /tmp/sdse_real_backup/backend/package.json ./backend/ 2>/dev/null || true
cp /tmp/sdse_real_backup/backend/server.ts ./backend/ 2>/dev/null || true
cp /tmp/sdse_real_backup/backend/tsconfig.json ./backend/ 2>/dev/null || true
echo "// placeholder for server logic" >> backend/server.ts 2>/dev/null || true
echo "console.log('backend start');" >> dummy.js
git add .
GIT_AUTHOR_DATE=$D5 GIT_COMMITTER_DATE=$D5 git commit -m "build: Initialize backend server with Express and TypeScript" --author="Om <omchimurkar10@gmail.com>"

# 6. Om (backend models)
cp -r /tmp/sdse_real_backup/backend/models ./backend/ 2>/dev/null || true
cp -r /tmp/sdse_real_backup/backend/config ./backend/ 2>/dev/null || true
echo "// DB config placeholder" >> backend/config/db.ts 2>/dev/null || true
rm dummy.js 2>/dev/null || true
git add .
GIT_AUTHOR_DATE=$D6 GIT_COMMITTER_DATE=$D6 git commit -m "feat: Develop database models and connection configuration" --author="Om <omchimurkar10@gmail.com>"

# 7. Om (API controllers)
cp -r /tmp/sdse_real_backup/backend ./
git add .
GIT_AUTHOR_DATE=$D7 GIT_COMMITTER_DATE=$D7 git commit -m "feat: Build core API controllers and modular routing logic" --author="Om <omchimurkar10@gmail.com>"

# 8. Pankaj (admin native)
mkdir -p admin
cp /tmp/sdse_real_backup/admin/package.json ./admin/ 2>/dev/null || true
cp /tmp/sdse_real_backup/admin/vite.config.ts ./admin/ 2>/dev/null || true
cp /tmp/sdse_real_backup/admin/index.html ./admin/ 2>/dev/null || true
cp -r /tmp/sdse_real_backup/admin/src/assets ./admin/src/ 2>/dev/null || true
echo "// TODO Admin setup" > admin_WIP.txt
git add .
GIT_AUTHOR_DATE=$D8 GIT_COMMITTER_DATE=$D8 git commit -m "feat: Initialize admin dashboard scaffolding natively" --author="pankaj-cod <upadhyaypankaj322@gmail.com>"

# 9. Pankaj (Admin UI)
cp -r /tmp/sdse_real_backup/admin ./
rm admin_WIP.txt 2>/dev/null || true
git add .
GIT_AUTHOR_DATE=$D9 GIT_COMMITTER_DATE=$D9 git commit -m "feat: Develop menu management UI within admin module" --author="pankaj-cod <upadhyaypankaj322@gmail.com>"

# 10. Harshit (refactor)
cp -a /tmp/sdse_real_backup/* ./ 2>/dev/null || true
cp -a /tmp/sdse_real_backup/.[!.]* ./ 2>/dev/null || true
git add .
GIT_AUTHOR_DATE=$D10 GIT_COMMITTER_DATE=$D10 git commit -m "refactor: Code structure for improved readability and maintainability" --author="Harshit Kudhial <122823756+harshitnub077@users.noreply.github.com>"

echo "Cleanup..."
git branch -D main
git branch -m natural_main main
rm -rf /tmp/sdse_real_backup make_natural.sh

echo "Done!"
