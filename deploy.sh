#!/bin/bash
set -e

# -----------------------------------------------------------
# Deploy keith-pipeline CloudFormation stack
# Usage: ./deploy.sh <GitHubOwner> <GitHubRepo> <GitHubOAuthToken>
# Example: ./deploy.sh myuser myrepo ghp_abc123
# -----------------------------------------------------------

GITHUB_OWNER=$1
GITHUB_REPO=$2
GITHUB_TOKEN=$3

if [ -z "$GITHUB_OWNER" ] || [ -z "$GITHUB_REPO" ] || [ -z "$GITHUB_TOKEN" ]; then
  echo "Error: Missing required arguments."
  echo "Usage: ./deploy.sh <GitHubOwner> <GitHubRepo> <GitHubOAuthToken>"
  exit 1
fi

aws cloudformation deploy \
  --template-file keith-pipeline.yml \
  --stack-name keith-pipeline-stack \
  --capabilities CAPABILITY_NAMED_IAM \
  --parameter-overrides \
      GitHubOwner="$GITHUB_OWNER" \
      GitHubRepo="$GITHUB_REPO" \
      GitHubOAuthToken="$GITHUB_TOKEN"

echo "keith-pipeline deployed successfully!"