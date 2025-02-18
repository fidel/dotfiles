function aprobuj
    if test (string match -r '^\d+$' "$argv[1]")
        for pr in $argv
            gh pr review $pr --approve
        end
    else
        set author $argv[1]
        set since $argv[2]
        gh pr list --author $author --search "created:>$since" -S review:none --json url -q ".[] | .url" | xargs -n1 gh pr review --approve
    end
end
