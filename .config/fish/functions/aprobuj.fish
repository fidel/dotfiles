function aprobuj
    if test (string match -r '^\d+$' "$argv[1]")
        for pr in $argv
            gh pr review $pr --approve
        end
    else
        set author $argv[1]
        set since (test (count $argv) -gt 1; and echo $argv[2]; or date +%Y-%m-%d)
        gh pr list --author $author --search "created:>=$since review:none" --json url -q ".[] | .url" | xargs -n1 gh pr review --approve
    end
end
