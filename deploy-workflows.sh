#!/bin/bash
#
# Quick deployment script for GitHub workflows
# Run this to commit and push all workflow files
#

set -e

echo "=================================="
echo "GitHub Workflows Deployment Script"
echo "=================================="
echo ""

# Check if we're in the right directory
if [ ! -d ".github/workflows" ]; then
    echo "❌ Error: .github/workflows directory not found"
    echo "Please run this script from the project root directory"
    exit 1
fi

echo "✅ Found .github/workflows directory"
echo ""

# Count files
WORKFLOW_COUNT=$(find .github/workflows -name "*.yml" | wc -l)
TOTAL_COUNT=$(find .github -type f | wc -l)

echo "📊 Files to commit:"
echo "   - Workflows: $WORKFLOW_COUNT"
echo "   - Total in .github/: $TOTAL_COUNT"
echo "   - CONTRIBUTING.md"
echo "   - README.md (updated)"
echo ""

# Show git status
echo "📝 Git status:"
git status --short | grep -E "^\?\?|^A |^ M" | head -20
echo ""

# Confirm before proceeding
read -p "🚀 Ready to commit and deploy? (y/n) " -n 1 -r
echo ""

if [[ ! $REPLY =~ ^[Yy]$ ]]; then
    echo "❌ Deployment cancelled"
    exit 0
fi

echo ""
echo "📦 Adding files to git..."

# Add all GitHub workflow files
git add .github/

# Add documentation
git add CONTRIBUTING.md README.md 2>/dev/null || true

# Add other documentation if exists
git add QUICK_START.md ICEBERG_USAGE_GUIDE.md 2>/dev/null || true

echo "✅ Files added"
echo ""

# Create commit message
COMMIT_MSG="ci: add comprehensive GitHub workflows and automation

Added 7 GitHub Actions workflows:
- CI Build and Test (Java 8/11)
- Release Automation
- Code Quality Checks
- Integration Tests (with MinIO)
- Dependency Updates
- Performance Benchmarks
- PR Automation

Added templates and configs:
- Pull Request template
- Issue templates (bug, feature, docs)
- Auto-labeling configuration
- Reviewer auto-assignment

Added documentation:
- CONTRIBUTING.md guide
- Workflow documentation
- Setup guides and checklists

Updated README with build badges and documentation links.

Features:
- Automated CI/CD pipeline
- One-command releases with checksums
- Integration tests with S3 simulation
- Performance benchmarking and tracking
- Code quality enforcement (Scalastyle)
- Automated dependency tracking
- PR automation (labels, size, reviewers, stale detection)"

echo "💬 Committing with message:"
echo "---"
echo "$COMMIT_MSG" | head -5
echo "   ..."
echo "---"
echo ""

git commit -m "$COMMIT_MSG"

echo "✅ Committed successfully"
echo ""

# Get current branch
CURRENT_BRANCH=$(git branch --show-current)

echo "🌿 Current branch: $CURRENT_BRANCH"
echo ""

read -p "📤 Push to origin/$CURRENT_BRANCH? (y/n) " -n 1 -r
echo ""

if [[ $REPLY =~ ^[Yy]$ ]]; then
    echo "🚀 Pushing to origin/$CURRENT_BRANCH..."
    git push origin "$CURRENT_BRANCH"
    echo ""
    echo "✅ Pushed successfully!"
    echo ""
    echo "🎉 Deployment complete!"
    echo ""
    echo "📍 Next steps:"
    echo "   1. Go to your GitHub repository"
    echo "   2. Click the 'Actions' tab"
    echo "   3. Watch your workflows run!"
    echo ""
    echo "💡 Tips:"
    echo "   - First CI build starts automatically"
    echo "   - Check build badges in README after run"
    echo "   - Create a PR to test PR automation"
    echo "   - Tag a release: git tag -a v0.1.0 -m 'Release 0.1.0'"
    echo ""
else
    echo "⏸️  Push skipped. Run manually when ready:"
    echo "   git push origin $CURRENT_BRANCH"
    echo ""
fi

echo "📚 Documentation:"
echo "   - Workflow details: .github/workflows/README.md"
echo "   - Setup guide: .github/WORKFLOWS_SETUP.md"
echo "   - Checklist: .github/SETUP_CHECKLIST.md"
echo "   - Contributing: CONTRIBUTING.md"
echo ""
echo "✨ All done!"

