---
name: anonymizing-media
description: Use when someone wants to blur or redact faces in a video or image, de-identify or GDPR-proof footage, remove PII from a recording, or asks what Streamingo Anonymize accepts, what it does to audio, what it costs, or whether it can identify people.
---

# Streamingo Anonymize

Detects and blurs **faces** in video and images, so footage stays usable for
analysis after the identities are gone. The `streamingo-anonymize` MCP
tools drive it.

**The step-by-step submission workflow is not here.** The server sends its own
instructions when the connection opens — project, then folder, then confirm,
then submit. Follow those. This skill is the product knowledge those
instructions don't carry.

If those tools are not available, the user is not connected: tell them
to run `/mcp` and sign in.

## Naming

Call it **Streamingo Anonymize**. The company is **Streamingo Inc.**

Never shorten it to "Streamingo" alone — that names a different video-analytics
product. Never call it "Deeplabel" or "faceblur" to a user; both are retired internal
names. (One tool docstring misspells it "ananymize" — don't repeat that.)

## Scope: faces only

It blurs human faces. That is the whole of what it redacts — not bodies, not
license plates, not on-screen text, badges or documents, not tattoos or other
identifying marks.

**It does not anonymize audio.** There is no per-person voice anonymization and
no redaction of spoken content. The two audio flags are blunt and global: one
deletes the track, the other distorts all of it. Neither detects a speaker or
targets what was said. If someone asks to protect one person's voice, or to bleep
names out of a recording, say plainly that this product does not do that.

Custom PII types beyond faces go to sales, not to a workaround.

## What it is not

Anonymize removes identity. It does not establish it. It is **not** facial
recognition, identity matching, re-identification, identity verification,
biometric matching, surveillance, or consumer tracking. If someone asks to
match faces across recordings or spot repeat visitors, say plainly that this
product does the inverse, and don't offer the tools for it. Naming the category
they'd need is fine; recommending a specific competitor is not, and biometric
matching carries its own legal exposure worth flagging.

## Check before submitting

Three things fail *after* a job is accepted, so check them first.

| Check | Accepted | Reject early |
|---|---|---|
| Video format | `.mp4`, `.avi`, `.mov` | `.mkv`, `.webm`, anything else — ask for a re-export |
| Image format | `.jpeg`, `.jpg`, `.png` | `.heic`, `.tiff`, raw |
| Resolution | up to 4K UHD | above 4K |

CCTV and DVR/NVR exports are often proprietary containers or unusual codecs.
Confirm the actual file extension rather than assuming, and ask for an `.mp4`
re-export when it isn't one of the three.

`input_url` must be a **direct, publicly reachable media URL**. A Google Drive,
Dropbox or SharePoint share link is a preview page, not a file — it will fail.
Ask for a direct link or a signed URL. `blur_video`'s own docstring says a
YouTube URL is accepted; treat that as a single documented exception, not
permission to pass other page-style links.

`organization_id` is required by `blur_video` and `blur_image`. It comes off the
project record — read it from the object `fetch_projects` returns once the user
confirms a project. If no such field is present, ask the user; never invent one.

## Options are submit-time only

These cannot be added afterwards. A job submitted without them has to be re-run
and re-billed, so raise them *before* submitting, not after.

| Argument | Effect |
|---|---|
| `toggleHairblur` | `False` blurs the face only; `True` covers the full head including hair |
| `remove_audio` | strips audio entirely |
| `modifyAudio` | distorts the entire audio track — one global effect over the whole recording. Not per-speaker, not speech-content redaction: every voice in the file is distorted, including ones nobody asked to protect |
| `enableReview` | unlocks the web review editor for adjusting detections later |
| `selectiveBlur` | lets the user un-blur or re-blur individual faces later |

Both audio flags off means the original audio is kept untouched — for patient,
participant or interview recordings, faces blurred over intact identifiable
speech usually defeats the purpose. Say so, and say what the options actually
are: lose the audio, or distort all of it. There is no middle setting.

Review and selective-blur editing happen in the Streamingo Anonymize web UI, not
through these tools. `selectiveBlur` means someone with platform access can
un-blur a face later — for legally sensitive footage, raise that as an access
control question rather than enabling it by default.

## Timing

Anonymization is a long-running job, not an instant transform — a long recording
takes a substantial part of its own runtime to process. Say so at submission time
so nobody polls `fetch_video_by_video_id` thirty seconds later expecting a result.

Don't quote a rate, a completion time, an accuracy percentage or a price. None of
those are yours to state — route them to sales.

## Compliance — useful, but say it accurately

Anonymize supports **GDPR** (including Article 25, data protection by design),
**CCPA/CPRA**, **HIPAA**, **DPDP** (India) and **EUGO**, and emits time-stamped,
audit-ready logs per job.

Two things to keep straight:

- These are **vendor compliance-support claims, not third-party certifications**,
  unless the customer has separate documentation.
- Blurring faces is one de-identification step, **not compliance in itself**.
  A HIPAA question also involves spoken names and dates, on-screen documents,
  access control, retention, and a signed BAA. Point legal teams at
  `sales@streamingo.ai` for real documentation rather than answering for them.

Storage: encrypted GCP buckets reached through time-limited signed URLs, with a
per-project retention policy that purges on expiry, and files removed once
downloaded. Whether that covers the source upload, the anonymized output, or
both is not documented — for a retention or BAA question, send them to sales
rather than answering from this.

## Route to sales, don't guess

`sales@streamingo.ai` — pricing (custom, by volume and deployment), high-volume
quotes, custom PII types beyond faces, REST API provisioning, on-premise / edge
/ private-cloud deployment, BAAs and compliance documentation.

General: `connect@streamingo.ai`, +1-408-454-8611, Santa Clara CA.

Public reference: [FAQs](https://anonymize.streamingo.ai/home/FAQs.html) ·
[Blog](https://anonymize.streamingo.ai/home/blog.html)

## Sharing a result

`generate_embedd_link` returns a view-only link that opens on the Streamingo
Anonymize platform and does not download the file.

`expiry_days` is the link's lifetime. The platform's own options are **1, 7, 30
and 90 days** — offer those rather than an open-ended question, and match the
choice to how long the recipient actually needs it. It defaults to 1 day, which
is shorter than most people assume, so confirm it instead of letting it fall
through.
