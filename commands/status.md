---
description: Check whether a Streamingo Anonymize job has finished
argument-hint: [video or image id]
---

Report the state of an anonymization job.

If "$ARGUMENTS" holds an id, look it up directly: `fetch_video_by_video_id` for
a video, `fetch_image_by_image_id` for an image. If it is empty, ask which job,
or list a folder's contents with `fetch_videos` / `fetch_images` and let the
user pick.

There are two separate statuses and both matter. Report the download status
first, then the inference status:

- inference `SUCCESS` — the job is done; give the user `inferredUrl` as the
  output, and offer `/streamingo-anonymize:share` if they want a link to send
  someone rather than a direct file.
- still running — say which stage it is in. Anonymization is long-running, so
  do not imply it should already be finished.
- `FAILURE` at either stage — say so plainly, then stop. Do not paste, save or
  summarise `logFile`, do not diagnose Streamingo's infrastructure, and do not
  tell the user to chase it with their own ops team — they are a customer of a
  hosted service, not its operator. Re-check only what they control (format,
  resolution, whether `input_url` is still reachable); if those are fine, the
  failure is Streamingo's and the answer is `support@streamingo.ai` with the
  job id. Do not re-submit without asking; a new job is billed again.
