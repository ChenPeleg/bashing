# Plan: Automatic Documentation Updates

## Objective
Automatically update the documentation when new files are added to specific folders in the repository.

## Current State Analysis
- The repository uses Jekyll for documentation (via GitHub Pages)
- Documentation files are located in the `docs/` folder
- There's an existing GitHub Actions workflow (`deploy-gh-pages.yml`) that builds and deploys the docs when changes are pushed to `main` or `gh-pages` branches
- The build process (`build-jekyll-site.sh`) copies markdown files from subdirectories and creates posts with dates

## Proposed Solution

### Option 1: GitHub Actions Workflow with Auto-Index Generation

**Description**: Create a GitHub Actions workflow that runs when files are added to monitored folders and automatically generates/updates index files or table of contents.

**Steps**:
1. Create a new workflow file `.github/workflows/auto-update-docs.yml`
2. Configure the workflow to trigger on:
   - Push events to specific paths (e.g., `docs/**/*.md`)
   - File creation/modification in designated folders
3. Create a script that:
   - Scans the specified folders for new/modified files
   - Updates the relevant index files (e.g., `a-linux.md`, `c-Tools.md`)
   - Generates links to new documents automatically
4. Commit and push the updated index files
5. The existing `deploy-gh-pages.yml` workflow will then deploy the updated docs

**Pros**:
- Fully automated
- Works within existing GitHub Pages deployment
- No additional dependencies

**Cons**:
- Requires careful configuration to avoid infinite loops
- Index file format must be consistent

### Option 2: Pre-commit Hook with Documentation Generator

**Description**: Use a pre-commit hook to automatically update documentation before committing.

**Steps**:
1. Create a documentation generator script in the repository
2. Set up a pre-commit hook that runs the generator
3. The generator would:
   - Scan folders for markdown files
   - Parse frontmatter to extract title, order, etc.
   - Generate/update index files with links to all documents
4. Hook runs before each commit, ensuring docs are always up-to-date

**Pros**:
- Updates happen locally before push
- Immediate feedback to developers
- No GitHub Actions complexity

**Cons**:
- Requires developers to set up hooks locally
- May not work for GitHub web-based edits

### Option 3: Jekyll Collection with Auto-Navigation (Recommended)

**Description**: Leverage Jekyll's built-in collection feature to automatically generate navigation based on folder structure.

**Steps**:
1. Configure Jekyll collections in `_config.yml` for each folder type
2. Create a Jekyll plugin or use Liquid templates to:
   - Automatically list all pages in a collection
   - Sort them by frontmatter properties (order, date, title)
   - Generate navigation menus dynamically
3. Update category index pages to use dynamic listing instead of hardcoded links
4. New files will automatically appear in navigation when deployed

**Example Index Template**:
```liquid
{% raw %}
---
title: Linux & Mac
order: 1
---

# Content

{% assign sorted_posts = site.linux | sort: 'order' %}
{% for post in sorted_posts %}
{{ forloop.index }}. [{{ post.title }}]({{ post.url }})
{% endfor %}
{% endraw %}
```

**Pros**:
- Native Jekyll solution
- No additional workflows needed
- Automatic sorting and listing
- Works with existing deployment

**Cons**:
- Requires folder restructuring to match Jekyll collection conventions
- Need to update existing index pages

### Option 4: Hybrid Approach

**Description**: Combine GitHub Actions with Jekyll templates for maximum flexibility.

**Steps**:
1. Convert index pages to use Jekyll's dynamic listing (Option 3)
2. Create a GitHub Action that validates new documents have proper frontmatter
3. Optionally notify maintainers when new docs are added

## Recommended Implementation Order

1. **Phase 1**: Implement Option 3 (Jekyll Collections)
   - Restructure folders to match collection requirements
   - Update `_config.yml` with collection definitions
   - Convert index pages to dynamic templates
   - Test locally before deployment

2. **Phase 2**: Add validation workflow
   - Create `.github/workflows/validate-docs.yml`
   - Check that new markdown files have required frontmatter
   - Validate links and references

3. **Phase 3**: Optional enhancements
   - Add pre-commit hooks for local validation
   - Create contribution guidelines for documentation
   - Add automated changelog generation

## Implementation Considerations

### Required Changes to `_config.yml`
```yaml
collections:
  linux:
    output: true
  python:
    output: true
  npm:
    output: true
  # Add more collections as needed
```

**Note**: Jekyll collections don't natively support `sort_by` in the configuration. Sorting should be handled in Liquid templates using filters like `| sort: 'order'`:

```liquid
{% raw %}
{% assign sorted_posts = site.linux | sort: 'order' %}
{% for post in sorted_posts %}
  ...
{% endfor %}
{% endraw %}
```

### Folder Structure Requirements
- Each collection folder should be prefixed with `_` (e.g., `_linux/`, `_python/`)
- Or configure collection directories in `_config.yml`

### Frontmatter Requirements for New Documents
```yaml
---
title: Document Title
order: 1
category: linux
---
```

## Files to Create/Modify

| File | Action | Description |
|------|--------|-------------|
| `docs/site/_config.yml` | Modify | Add collection definitions |
| `docs/a-linux.md` | Modify | Convert to dynamic template |
| `docs/b-windows.md` | Modify | Convert to dynamic template |
| `docs/c-Tools.md` | Modify | Convert to dynamic template |
| `.github/workflows/validate-docs.yml` | Create | Validation workflow |
| `CONTRIBUTING.md` | Create | Documentation contribution guidelines |

## Testing Strategy

1. Test locally with Jekyll:
   ```bash
   cd docs/site
   bundle install
   bundle exec jekyll serve
   ```
2. Verify all existing documents still render correctly
3. Add a test document to a folder and verify it appears automatically
4. Test the GitHub Actions workflow in a feature branch

## Rollback Plan

If issues arise:
1. Revert to static index files
2. Keep GitHub Actions workflow disabled until fixed
3. Manual documentation updates as fallback

## Timeline Estimate

- Phase 1: 2-4 hours
- Phase 2: 1-2 hours  
- Phase 3: 2-3 hours (optional)

Total: 5-9 hours for full implementation
