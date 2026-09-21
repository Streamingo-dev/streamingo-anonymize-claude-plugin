---
description: Create a view-only link to an anonymized video or image
argument-hint: [video or image id]
---

Produce a shareable link for finished media with `generate_embedd_link`.

If "$ARGUMENTS" holds an id, use it. Otherwise ask which job, or list the folder
and let the user pick.

Confirm two things before generating:

- **How many days the link should stay live.** Pass it as `expiry_days`; the
  default is 1 day, which is usually shorter than people expect. Ask rather
  than assuming.
- **Whether the job actually finished.** Check inference status first — a link
  to an unfinished job is not useful.

Set `media_type` to `video` or `image` to match. Tell the user what the link
does: it opens on the Streamingo Anonymize platform and shows the anonymized
media, it does not download the file, and it stops working when the expiry
passes.
