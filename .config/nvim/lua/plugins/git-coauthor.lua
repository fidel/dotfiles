return {
  {
    "lewis6991/gitsigns.nvim",
    keys = {
      {
        "<leader>gca",
        function()
          local coauthors = {}
          local handle = io.popen("git log --all --format='%aN <%aE>' 2>/dev/null | sort -u")
          if handle then
            local result = handle:read("*a")
            handle:close()
            for line in result:gmatch("[^\r\n]+") do
              if line ~= "" then
                table.insert(coauthors, line)
              end
            end
          end

          if #coauthors == 0 then
            vim.notify("No co-authors found in repository", vim.log.levels.WARN)
            return
          end

          vim.ui.select(coauthors, {
            prompt = "Select co-author:",
            format_item = function(item)
              return item
            end,
          }, function(choice)
            if choice then
              local commit_msg_file = vim.fn.system("git rev-parse --git-dir"):gsub("\n", "") .. "/COMMIT_EDITMSG"

              local file = io.open(commit_msg_file, "r")
              if file then
                local content = file:read("*a")
                file:close()

                local coauthor_line = "\n\nCo-authored-by: " .. choice

                if not content:match("Co%-authored%-by: " .. vim.pesc(choice)) then
                  file = io.open(commit_msg_file, "a")
                  if file then
                    file:write(coauthor_line)
                    file:close()
                    vim.notify("Added co-author: " .. choice, vim.log.levels.INFO)
                  end
                else
                  vim.notify("Co-author already added", vim.log.levels.INFO)
                end

                vim.cmd("checktime")
              else
                local manual_msg = "Co-authored-by: " .. choice
                vim.fn.setreg("+", manual_msg)
                vim.notify("Copied to clipboard: " .. manual_msg, vim.log.levels.INFO)
              end
            end
          end)
        end,
        desc = "Add git co-author",
      },
      {
        "<leader>gcm",
        function()
          local name = vim.fn.input("Co-author name: ")
          if name == "" then
            return
          end
          local email = vim.fn.input("Co-author email: ")
          if email == "" then
            return
          end

          local coauthor_line = string.format("Co-authored-by: %s <%s>", name, email)
          vim.fn.setreg("+", coauthor_line)

          local commit_msg_file = vim.fn.system("git rev-parse --git-dir"):gsub("\n", "") .. "/COMMIT_EDITMSG"
          local file = io.open(commit_msg_file, "a")
          if file then
            file:write("\n\n" .. coauthor_line)
            file:close()
            vim.notify("Added co-author: " .. coauthor_line, vim.log.levels.INFO)
            vim.cmd("checktime")
          else
            vim.notify("Copied to clipboard: " .. coauthor_line, vim.log.levels.INFO)
          end
        end,
        desc = "Add git co-author (manual)",
      },
    },
  },
}
