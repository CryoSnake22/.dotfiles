#!/bin/bash
appname=$1

pnpm create next-app@latest $appname
cd $appname
cp -r ~/.dotfiles/templates/claude/.claude_nextjs/ .claude
pnpm dlx shadcn@latest init --preset a1rWmbY --yes

# MCP servers
npx -y add-mcp next-devtools-mcp@latest
pnpm dlx shadcn@latest mcp init --client claude
