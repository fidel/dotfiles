function aprobuj
    if test (string match -r '^\d+$' "$argv[1]")
        gh pr review $argv[1] --approve
    else
        gh pr list --author $argv -S review:none --json url -q ".[] | .url" | xargs -n1 gh pr review --approve
    end
end
