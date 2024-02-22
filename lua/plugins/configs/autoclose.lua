return {
   keys = {
      ["("] = { escape = false, close = true, pair = "()" },
      ["["] = { escape = false, close = true, pair = "[]" },
      ["{"] = { escape = false, close = true, pair = "{}" },

      [">"] = { escape = true, close = false, pair = "<>" },
      [")"] = { escape = true, close = false, pair = "()" },
      ["]"] = { escape = true, close = false, pair = "[]" },
      ["}"] = { escape = true, close = false, pair = "{}" },

      ['"'] = { escape = true, close = false, pair = '""' },
      ["'"] = { escape = false, close = false, pair = "''" },
      ["`"] = { escape = true, close = false, pair = "``" },
      -- <BS>, <C-H> and more in
      -- ~/.config/nvim/site/pack/packer/start/autoclose.nvim/lua/autoclose.lua
   },
   options = {
      disabled_filetypes = { "text" },
      disable_when_touch = true,
      touch_regex = "[^_)}%] ]", -- bug: need to add _ to list or else it always "touches" :(
      pair_spaces = false,
      auto_indent = true,
      disable_command_mode = true,
   },
}
