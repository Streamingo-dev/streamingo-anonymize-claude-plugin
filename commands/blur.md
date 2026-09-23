---
description: Anonymize a video or image with Streamingo Anonymize
argument-hint: [media URL]
---

Submit media to Streamingo Anonymize for face blurring.

If "$ARGUMENTS" is non-empty, treat it as the URL of the media to anonymize.
Otherwise ask what to anonymize.

Decide video or image from the URL, and use the matching path: `blur_video`
with a `VIDEO` folder, or `blur_image` with an `IMAGE` folder. Follow the
server's own instructions for project and folder selection and its confirmation
steps.

Before submitting, check the format, the URL type and the submit-time options —
the anonymizing-media skill covers all three, and the options cannot be changed
after the job starts.

If the Streamingo Anonymize tools are not connected, tell the user to run
`/mcp` and sign in first.
