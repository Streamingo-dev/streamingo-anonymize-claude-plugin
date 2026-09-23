# Streamingo Anonymize for Claude

Streamingo Anonymize finds faces in videos and images and blurs them, so
footage can be shared or analysed without exposing anyone's identity. Faces
only — it does not anonymize audio. This plugin connects Claude to the hosted
service, so you can manage anonymization projects and submit jobs from a
conversation instead of the dashboard. You'll need a Streamingo Anonymize
account — the plugin gives Claude access to yours, it doesn't create one for
you.

## Claude Code install

```
/plugin marketplace add Streamingo-dev/streamingo-anonymize-claude-plugin
/plugin install streamingo-anonymize
/reload-plugins
/mcp
```

If the install summary says `Run /reload-plugins to activate.`, run
`/reload-plugins` before continuing — plugin MCP servers only load on a
reload or restart. `/mcp` opens a browser window to log in to your
Streamingo Anonymize account. You only need to do this once — after that, Claude
stays connected.

## Claude Desktop and claude.ai install

Using Claude Desktop or the claude.ai web app instead of Claude Code? Follow
[docs/connector-setup.md](docs/connector-setup.md).

## What you can ask for

Once connected, just talk to Claude. For example:

- `List my anonymization projects and show me the folders in the most recent one.`
- `Blur the faces in https://www.youtube.com/shorts/53u4C1EShvY and put it in my Demo project.`
- `Has my last video finished processing? If so, give me a shareable link that expires in 7 days.`

Or use the commands directly:

| Command | What it does |
|---|---|
| `/streamingo-anonymize:blur [url]` | Submit a video or image for anonymization |
| `/streamingo-anonymize:status [id]` | Check whether a job has finished |
| `/streamingo-anonymize:share [id]` | Create a view-only link, with an expiry you choose |
| `/streamingo-anonymize:projects` | Browse projects, folders and past jobs |

## Requirements

- A Streamingo Anonymize account.
- For Claude Desktop or claude.ai: any plan works, Free included — custom
  connectors are not limited to paid plans. Free accounts are capped at one
  custom connector in total, though, so this one may already be spoken for
  if you've connected something else there.
- For Team and Enterprise plans, an organization Owner must add the
  connector under Organization settings before individual members can
  authenticate it.

## Support

Questions or issues: support@streamingo.ai, or open an issue in this
repository's issue tracker.
