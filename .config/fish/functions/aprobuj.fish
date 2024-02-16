function aprobuj
    gh pr list --author $argv -S review:none --json url -q ".[] | .url" | xargs -n1 gh pr review --approve
end
