# Connect Streamingo Anonymize to Claude Desktop or claude.ai

This page walks through connecting Claude to Streamingo Anonymize so you
can manage anonymization projects and blur videos and images from a
conversation. It's written for Claude Desktop and the claude.ai web app — if
you use Claude Code instead, see the main [README](https://github.com/Streamingo-dev/streamingo-anonymize-claude-plugin).

No technical setup is required. You're adding a connector: a link that lets
Claude talk to Streamingo Anonymize on your behalf, the same way you might
connect Claude to Google Drive or Gmail.

You'll need a Streamingo Anonymize account to log in partway through. If you
don't have one yet, create one at [anonymize.streamingo.ai](https://anonymize.streamingo.ai)
before you start.

## The connector URL

Copy this address — you'll paste it in during setup:

```
https://anonymize.streamingo.ai/mcp/mcp
```

## Add it in Claude Desktop

1. Open Claude Desktop and go to **Customize → Connectors**.
2. Click **+**, then **Add custom connector**.
3. Paste the URL above, then click **Add**.
4. Click **Connect** next to the new connector.
5. A browser window opens and asks you to log in to your **Streamingo Anonymize**
   account. Log in.
6. Approve access when prompted. You're returned to Claude Desktop, and the
   connector shows as connected.

## Add it in claude.ai (web)

The steps are the same, in your browser settings instead of the desktop app:

1. Go to **Customize → Connectors**.
2. Click **+**, then **Add custom connector**.
3. Paste the URL above, click **Add**, then click **Connect**.
4. Log in to your Streamingo Anonymize account when prompted, and approve access.

## Turn it on for your conversation

Adding the connector doesn't turn it on by itself. In any conversation,
click the **+** button in the lower left of the message box, choose
**Connectors**, and switch this one on for that conversation. Skip this
and Claude has no tools to call even though the connector shows as
connected.

## Team and Enterprise accounts

If your workspace is on a Team or Enterprise plan, an organization
**Owner** has to add the connector first: go to **Organization settings →
Connectors**, click **Add**, hover **Custom**, select **Web**, paste the
URL above, then click **Add**. Once it's added there, each member connects
individually: go to your own **Customize → Connectors**, find it in the
list, and click **Connect** to log in with your own Streamingo Anonymize account. You
don't need to re-enter the URL yourself.

## Check it worked

Start a conversation and ask Claude:

```
List my anonymization projects
```

If the connection is working, Claude replies with your actual Streamingo Anonymize
projects. If it lists nothing, replies that it has no relevant tools, or
asks you to connect first, go back through the steps above.

## Troubleshooting

- **Claude doesn't seem to have any Streamingo Anonymize tools available.** Either the
  connector isn't turned on for this conversation — click the **+** button
  → **Connectors** and switch it on — or it's added but not authenticated.
  Go to Customize → Connectors, find it, and click **Connect** (or
  **Reconnect**) to log in again.
- **The login page keeps redirecting back to itself without signing you
  in.** This is almost always third-party cookies being blocked in your
  browser. Allow third-party cookies for this site (or try a different
  browser) and log in again.

## A note on network access

When you use this connector, Claude connects to Streamingo Anonymize from Anthropic's
cloud infrastructure — not from your own computer or phone. If your
organization restricts outbound or inbound traffic by firewall, the
Streamingo Anonymize (`anonymize.streamingo.ai`) needs to be reachable over the
public internet; no access needs to be opened from your device or network
specifically, since the connection is made from Anthropic's side.
