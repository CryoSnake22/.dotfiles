# Git Worktrees

**File:** `/Users/charlo/.dotfiles/.config/memo/_posts/Scratch.md`

## Notes

Git Worktrees let you checkout other branches in other directories for the same repo without having to reclone the entire thing.

Usage:

```bash
git worktree add ../my-feature feature_name

git worktree add -b new_branch ../my-feature feature_name

git worktree list

git worktree remove ../my-feature
```
