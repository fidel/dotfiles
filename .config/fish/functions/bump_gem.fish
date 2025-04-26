function bump_gem() {
  set -eo pipefail
  git checkout -b up-to-date-$1 master
  bundle update --conservative $@
  git add Gemfile*
  git ci -m "chore: up-to-date $1 dependency"
  git push
  curl -s https://rubygems.org/api/v1/gems/$1 | jq '.["metadata"]["changelog_uri"]' | gh pr create -f -F -
  git checkout -
}
