return {
  "mikavilpas/yazi.nvim",
  version = "*",
  event = "VeryLazy",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  init = function()
    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1
  end,
  keys = {
    {
      "<leader>ym",
      function()
        local current = vim.fn.expand("%:p")

        local choices = {
          "📄 Create File",
          "📁 Create Folder",
          "✏️ Rename",
          "🗑️ Delete",
          "❌ Cancel",
        }

        vim.ui.select(choices, { prompt = "File Manager:" }, function(choice)
          if choice == "📄 Create File" then
            vim.ui.input({ prompt = "New file name: " }, function(input)
              if input and input ~= "" then
                local new_path = vim.fn.expand("%:p:h") .. "/" .. input
                local f = io.open(new_path, "w")
                if f then
                  f:close()
                  vim.cmd("edit " .. vim.fn.fnameescape(new_path))
                  vim.notify("File created: " .. new_path)
                end
              end
            end)
          elseif choice == "📁 Create Folder" then
            vim.ui.input({ prompt = "New folder name: " }, function(input)
              if input and input ~= "" then
                local new_dir = vim.fn.expand("%:p:h") .. "/" .. input
                vim.fn.mkdir(new_dir, "p")
                vim.notify("Folder created: " .. new_dir)
              end
            end)
          elseif choice == "✏️ Rename" then
            local old_path = current
            local old_name = vim.fn.expand("%:t")

            vim.ui.input({
              prompt = "Rename to: ",
              default = old_name,
            }, function(new)
              if new and new ~= "" then
                local new_path = vim.fn.expand("%:p:h") .. "/" .. new
                os.rename(old_path, new_path)
                vim.cmd("edit " .. vim.fn.fnameescape(new_path))
                vim.notify("Renamed to: " .. new)
              end
            end)
          elseif choice == "🗑️ Delete" then
            local confirm = vim.fn.input("Delete this file? (y/N): ")
            if confirm:lower() == "y" then
              os.remove(current)
              vim.cmd("bdelete")
              vim.notify("File deleted.")
            end
          end
        end)
      end,
      desc = "Popup File Manager",
    },
    { "<leader>e", "<cmd>Yazi<cr>", desc = "Open Yazi (current folder)" },
    { "<leader>E", "<cmd>Yazi cwd<cr>", desc = "Open Yazi (cwd)" },
    {
      "<leader>yF",
      function()
        vim.ui.input({ prompt = "Create new folder (cwd): " }, function(input)
          if not input or input == "" then
            vim.notify("Nama folder tidak boleh kosong!", vim.log.levels.WARN)
            return
          end

          local cwd = vim.fn.getcwd()
          local new_dir = cwd .. "/" .. input

          if vim.fn.isdirectory(new_dir) == 1 then
            vim.notify("Folder sudah ada: " .. new_dir, vim.log.levels.ERROR)
            return
          end

          vim.fn.mkdir(new_dir, "p")
          vim.notify("Folder dibuat: " .. new_dir)
        end)
      end,
      desc = "Create new folder (cwd)",
    },
    {
      "<leader>yf",
      function()
        vim.ui.input({ prompt = "Create new folder (current folder): " }, function(input)
          if not input or input == "" then
            vim.notify("Nama folder tidak boleh kosong!", vim.log.levels.WARN)
            return
          end

          local cwd = vim.fn.expand("%:p:h")
          local new_dir = cwd .. "/" .. input

          if vim.fn.isdirectory(new_dir) == 1 then
            vim.notify("Folder sudah ada: " .. new_dir, vim.log.levels.ERROR)
            return
          end

          vim.fn.mkdir(new_dir, "p")
          vim.notify("Folder dibuat: " .. new_dir)
        end)
      end,
      desc = "Create new folder (current folder)",
    },
    {
      "<leader>yA",
      function()
        vim.ui.input({ prompt = "Create new file (cwd): " }, function(input)
          if not input or input == "" then
            vim.notify("Nama file tidak boleh kosong!", vim.log.levels.WARN)
            return
          end
          local cwd = vim.fn.getcwd()
          local new_path = cwd .. "/" .. input

          local f = io.open(new_path, "w")
          if f then
            f:close()
            vim.cmd("edit " .. vim.fn.fnameescape(new_path))
            vim.notify("File baru dibuat: " .. new_path)
          else
            vim.notify("Gagal membuat file: " .. new_path, vim.log.levels.ERROR)
          end
        end)
      end,
      desc = "Create new file (cwd)",
    },
    {
      "<leader>ya",
      function()
        vim.ui.input({ prompt = "Create new file (current folder): " }, function(input)
          if not input or input == "" then
            vim.notify("Nama file tidak boleh kosong!", vim.log.levels.WARN)
            return
          end
          local cwd = vim.fn.expand("%:p:h")
          local new_path = cwd .. "/" .. input

          local f = io.open(new_path, "w")
          if f then
            f:close()
            vim.cmd("edit " .. vim.fn.fnameescape(new_path))
            vim.notify("File baru dibuat: " .. new_path)
          else
            vim.notify("Gagal membuat file: " .. new_path, vim.log.levels.ERROR)
          end
        end)
      end,
      desc = "Create new file (current folder)",
    },
    {
      "<leader>yr",
      function()
        local old_path = vim.fn.expand("%:p")
        if old_path == nil or old_path == "" then
          vim.notify("Tidak ada file untuk di-rename!", vim.log.levels.WARN)
          return
        end

        local old_name = vim.fn.expand("%:t")

        vim.ui.input({
          prompt = "Rename to: ",
          default = old_name,
        }, function(new)
          local new_path = vim.fn.fnamemodify(old_path, ":h") .. "/" .. new

          os.rename(old_path, new_path)

          local old_buf = vim.api.nvim_get_current_buf()
          vim.api.nvim_buf_delete(old_buf, { force = true })

          vim.cmd("edit " .. vim.fn.fnameescape(new_path))
        end)
      end,
      desc = "Rename current file",
    },
    {
      "<leader>yd",
      function()
        local file = vim.fn.expand("%:p")
        if file == nil or file == "" then
          vim.notify("Tidak ada file untuk di-delete!", vim.log.levels.WARN)
          return
        end

        local confirm = vim.fn.input("Delete " .. file .. "? (y/N): ")

        if confirm:lower() == "y" then
          os.remove(file)
          vim.cmd("bdelete")
        end
      end,
      desc = "Delete current file",
    },
  },

  opts = {
    floating_window = true,
    floating_window_scaling_factor = 0.7,
    yazi_floating_window_border = "rounded",
    open_for_directories = true,
    clipboard_register = "+",
  },
}
