---
description: Browse Streamingo Anonymize projects, folders and past jobs
argument-hint: [project name or id]
---

Show the user what is in their Streamingo Anonymize account.

Start with `fetch_projects(page=1, limit=5)`. If "$ARGUMENTS" names a project,
go straight to its folders instead.

Then, on request:

- `fetch_folders(project_id=..., type='VIDEO')` or `type='IMAGE'` for folders
- `fetch_videos(parent_folder_id=...)` / `fetch_images(parent_folder_id=...)`
  for the jobs inside one

These are read-only lookups — nothing here submits a job or costs anything, so
no confirmation is needed. Paginate as the server's instructions describe, and
say which page is being shown.
