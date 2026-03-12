#!/bin/bash
appname=$1

pnpm create next-app@latest $appname
cd $appname
cp ~/.dotfiles/templates/claude/nextjs-CLAUDE.md .claude/CLAUDE.md
npx add-mcp next-devtools-mcp@latest -y
pnpm dlx shadcn@latest mcp init --client claude
