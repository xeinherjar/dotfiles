return {
  'saghen/blink.indent',
  --- @module 'blink.indent'
  --- @type blink.indent.Config
  opts = {
    {
      blocked = {
        -- default: 'terminal', 'quickfix', 'nofile', 'prompt'
        buftypes = { include_defaults = true },
        -- default: 'lspinfo', 'packer', 'checkhealth', 'help', 'man', 'gitcommit', 'dashboard', ''
        filetypes = { include_defaults = true },
      },
      static = {
        enabled = false,
        char = '▎',
        priority = 1,
        highlights = { 'BlinkIndentRed', 'BlinkIndentOrange', 'BlinkIndentYellow', 'BlinkIndentGreen', 'BlinkIndentViolet', 'BlinkIndentCyan' },
        -- highlights = { 'BlinkIndent' },
      },
      scope = {
        enabled = true,
        char = '▎',
        priority = 1000,
        -- set this to a single highlight, such as 'BlinkIndent' to disable rainbow-style indent guides
        -- highlights = { 'BlinkIndentScope' },
        -- highlights = { 'BlinkIndentOrange', 'BlinkIndentViolet', 'BlinkIndentBlue' },
        highlights = { 'BlinkIndentRed', 'BlinkIndentOrange', 'BlinkIndentYellow', 'BlinkIndentGreen', 'BlinkIndentViolet', 'BlinkIndentCyan' },
        -- enable to show underlines on the line above the current scope
        underline = {
          enabled = true,
          -- optionally add: 'BlinkIndentRedUnderline', 'BlinkIndentCyanUnderline', 'BlinkIndentYellowUnderline', 'BlinkIndentGreenUnderline'
          highlights = { 'BlinkIndentOrangeUnderline', 'BlinkIndentVioletUnderline', 'BlinkIndentBlueUnderline' },
        },
      },
    }
  },
}
