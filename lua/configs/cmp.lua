local cmp = require("cmp")

local options = {
  "hrsh7th/nvim-cmp",
  opts = {
    completion = { completeopt = "menu,menuone" },
    mapping = {
      ["<S-Tab>"] = function(callback)
        callback()
      end,
      ["<CR>"] = function(callback)
        callback()
      end,
      ["<Down>"] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
        else
          fallback()
        end
      end, {
        "i",
        "s",
      }),
      ["<Up>"] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.select_prev_item({ behavior = cmp.SelectBehavior.Select })
        else
          fallback()
        end
      end, {
        "i",
        "s",
      }),
      ["<Tab>"] = cmp.mapping.confirm({
        behavior = cmp.ConfirmBehavior.Insert,
        select = true,
      }),
    },
  },
  view = {
    entries = {
      follow_cursor = true,
    },
  },
  sources = {
    { name = "nvim_lsp" },
    { name = "luasnip" },
    { name = "buffer" },
    { name = "nvim_lua" },
    { name = "path" },
  },
  config = function(_, opts)
    dofile(vim.g.base46_cache .. "cmp")

    require("cmp").setup(opts)
  end,
}

options = vim.tbl_deep_extend("force", options, require "nvchad.cmp")

return options

