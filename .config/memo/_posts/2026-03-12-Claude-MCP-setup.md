# Claude MCP setup

For project specific files setup can go in `.mcp.json` which can be git shared. Private mcps can go in .claude

```json
{
  "mcpServers": {
    "next-devtools": {
      "command": "npx",
      "args": ["-y", "next-devtools-mcp@latest"]
    }
  }
}
```

E.G with next-devtools
