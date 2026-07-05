#!/bin/sh
# Dagelijkse vault-backup naar github.com/talatpassendonline/second-brain
# Draait via launchd: ~/Library/LaunchAgents/nl.passendonline.vault-backup.plist
cd "/Users/talat/Second Brain" || exit 1
/usr/bin/git add -A
if ! /usr/bin/git diff --cached --quiet; then
  /usr/bin/git commit -m "Auto-backup $(date '+%Y-%m-%d %H:%M')"
fi
/usr/bin/git push origin main
