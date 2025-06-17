return {
  {
    'folke/tokyonight.nvim',
    lazy = false,
    priority = 1000,
    opts = {}
  },
  {
    'ellisonleao/gruvbox.nvim',
    priority = 1000,
    config = true,
    lazy = false,
    opts = {}
  },
  {
    'sainnhe/gruvbox-material',
    lazy = false,
    priority = 1000,
    opts = {},
    config = function()
      vim.g.gruvbox_material_enable_italic = true
      vim.g.gruvbox_material_background = 'medium'
    end
  },
  {
    'EdenEast/nightfox.nvim', -- for duskfox
    lazy = false,
    priority = 1000,
    opts = {}
  },
  {
    "rebelot/kanagawa.nvim",
    lazy = false,
    branch = "master",
    config = function()
      require('kanagawa').setup({
        transparent = true,
        overrides = function(colors)
          local theme = colors.theme
          return {
            NormalFloat = { bg = "none" },
            FloatBorder = { bg = "none" },
            FloatTitle = { bg = "none" },

            -- Save an hlgroup with dark background and dimmed foreground
            -- so that you can use it where your still want darker windows.
            -- E.g.: autocmd TermOpen * setlocal winhighlight=Normal:NormalDark
            NormalDark = { fg = theme.ui.fg_dim, bg = theme.ui.bg_m3 },

            -- Popular plugins that open floats will link to NormalFloat by default;
            -- set their background accordingly if you wish to keep them dark and borderless
            LazyNormal = { bg = theme.ui.bg_m3, fg = theme.ui.fg_dim },
            MasonNormal = { bg = theme.ui.bg_m3, fg = theme.ui.fg_dim },
          }
        end,
      });
    end,
  }
}
