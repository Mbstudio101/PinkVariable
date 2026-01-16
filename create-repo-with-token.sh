#!/bin/bash
# Alternative method using GitHub API directly with token

GITHUB_USERNAME="Mbstudio101"
REPO_NAME="PinkVariable"
GITHUB_TOKEN="${GH_TOKEN:-${GITHUB_TOKEN:-}}"

if [ -z "$GITHUB_TOKEN" ]; then
    echo "⚠️  GitHub token not found in environment variables"
    echo "Please provide your GitHub personal access token:"
    echo "1. Go to: https://github.com/settings/tokens"
    echo "2. Generate a new token with 'repo' scope"
    echo "3. Run: export GH_TOKEN=your_token_here"
    echo "4. Then run this script again"
    exit 1
fi

echo "🚀 Creating GitHub repository..."
echo "Username: $GITHUB_USERNAME"
echo "Repository: $REPO_NAME"
echo ""

# Create repository using GitHub API
response=$(curl -s -w "\n%{http_code}" -X POST \
  -H "Authorization: token $GITHUB_TOKEN" \
  -H "Accept: application/vnd.github.v3+json" \
  https://api.github.com/user/repos \
  -d "{\"name\":\"$REPO_NAME\",\"description\":\"PinkVariable - A fork of Void Editor with custom branding\",\"private\":false}")

http_code=$(echo "$response" | tail -n1)
body=$(echo "$response" | sed '$d')

if [ "$http_code" -eq 201 ]; then
    echo "✅ Repository created successfully!"
    echo ""
    echo "📤 Pushing code..."
    git remote remove origin 2>/dev/null || true
    git remote add origin "https://${GITHUB_TOKEN}@github.com/${GITHUB_USERNAME}/${REPO_NAME}.git"
    git push -u origin main
    git push origin v1.0.0

    echo ""
    echo "✅ Success! Repository created and code pushed!"
    echo "📍 Repository URL: https://github.com/${GITHUB_USERNAME}/${REPO_NAME}"
    echo ""
    echo "📝 Next: Create GitHub Release at:"
    echo "   https://github.com/${GITHUB_USERNAME}/${REPO_NAME}/releases/new"
else
    echo "❌ Failed to create repository"
    echo "HTTP Code: $http_code"
    echo "Response: $body"
    exit 1
fi
