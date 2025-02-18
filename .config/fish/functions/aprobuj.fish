function aprobuj
    if test (string match -r '^\d+$' "$argv[1]")
        for pr in $argv
            gh pr review $pr --approve
        end
    else
        gh pr list --author $argv -S review:none --json url -q ".[] | .url" | xargs -n1 gh pr review --approve
    end
end
