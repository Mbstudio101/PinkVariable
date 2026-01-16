# Incremental Upgrade Plan: VS Code 1.99.3 → 1.108.0

**Current Version:** 1.99.3
**Target Version:** 1.108.0
**Strategy:** Incremental upgrades (version by version)

## Why Incremental?

With **11,558 commits** and **5,084 files** changed, upgrading all at once is risky. Incremental upgrades allow you to:
- ✅ Identify issues at each step
- ✅ Test thoroughly between versions
- ✅ Fix problems before moving forward
- ✅ Preserve your customizations

## Upgrade Path

### Phase 1: Minor Updates (1.99.3 → 1.100.0)
**Goal:** Get to the next major version

1. **Create backup branch:**
   ```bash
   git checkout -b backup-before-upgrade
   git push origin backup-before-upgrade
   ```

2. **Create upgrade branch:**
   ```bash
   git checkout -b upgrade-to-1.100.0
   ```

3. **Add VS Code upstream:**
   ```bash
   git remote add upstream https://github.com/microsoft/vscode.git
   git fetch upstream tag 1.100.0
   ```

4. **Merge 1.100.0:**
   ```bash
   git merge 1.100.0
   # Resolve conflicts
   ```

5. **Test:**
   - Compile: `npm run compile`
   - Run: `npm start`
   - Test splash screen
   - Test styling
   - Test AI features

6. **If successful, commit:**
   ```bash
   git commit -m "upgrade: VS Code 1.99.3 → 1.100.0"
   ```

### Phase 2: Continue Incrementally

Repeat for each version:
- 1.100.0 → 1.101.0
- 1.101.0 → 1.102.0
- ... continue through 1.108.0

**Or upgrade in larger chunks:**
- 1.99.3 → 1.100.0 (first major)
- 1.100.0 → 1.105.0 (midpoint)
- 1.105.0 → 1.108.0 (latest)

## Files to Watch During Upgrade

### Critical Files (Your Customizations)
1. `src/vs/workbench/browser/style.ts` - Theme/styling
2. `src/vs/code/electron-sandbox/workbench/workbench.ts` - Splash screen
3. `product.json` - PinkVariable branding
4. `package.json` - Dependencies
5. `src/vs/workbench/contrib/void/` - Your AI features ⚠️ **HIGH PRIORITY**

### AI/Chat Files (Major Changes)
- `src/vs/workbench/contrib/chat/` - **528 files changed!**
- VS Code's chat/agent features significantly upgraded
- May conflict with your void AI features
- See `AI_CHAT_UPGRADE_NOTES.md` for details

### AI/Chat Related Files
- `src/vs/workbench/contrib/chat/` - Chat features
- Any AI/agent related files

## Testing Checklist for Each Upgrade

- [ ] App compiles successfully
- [ ] App launches without errors
- [ ] Splash screen displays correctly
- [ ] Theme/styling works
- [ ] PinkVariable branding intact
- [ ] **AI features work** ⚠️ **CRITICAL**
- [ ] **Chat/agent features work** ⚠️ **CRITICAL**
- [ ] **Your void AI integration works** ⚠️ **CRITICAL**
- [ ] Extensions load
- [ ] No console errors

**Note:** AI/chat features had major updates (528 files changed). Test thoroughly!

## Rollback Plan

If an upgrade fails:
```bash
git checkout backup-before-upgrade
git branch -D upgrade-to-1.XXX.0
```

## Estimated Time

- **Per version:** 2-4 hours (testing + conflict resolution)
- **Total (9 versions):** 18-36 hours
- **Recommended:** Do 1-2 versions per week

## Tips

1. **Read release notes** before each upgrade
2. **Test immediately** after each merge
3. **Document issues** as you go
4. **Take breaks** between versions
5. **Keep backups** at each successful step

---

**Next Steps:**
1. Read release notes for 1.100.0
2. Create backup branch
3. Start with Phase 1
