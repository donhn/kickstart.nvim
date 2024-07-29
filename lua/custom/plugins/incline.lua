return {
  'b0o/incline.nvim',
  dependencies = {
    'SmiteshP/nvim-navic',
  },
  config = function()
    local devicons = require 'nvim-web-devicons'
    require('incline').setup {
      hide = {
        focused_win = false,
        only_win = false,
      },
      window = {
        padding = 0,
        margin = { horizontal = 0 },
      },
      render = function(props)
        local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(props.buf), ':t')
        if filename == '' then
          filename = '[No Name]'
        end
        local ft_icon, ft_color = devicons.get_icon_color(filename)

        local function get_git_diff()
          local icons = { removed = ' ', changed = ' ', added = ' ' }
          local signs = vim.b[props.buf].gitsigns_status_dict
          local labels = {}
          if signs == nil then
            return labels
          end
          for name, icon in pairs(icons) do
            if tonumber(signs[name]) and signs[name] > 0 then
              table.insert(labels, { icon .. signs[name] .. ' ', group = 'Diff' .. name })
            end
          end
          if #labels > 0 then
            table.insert(labels, { '┊ ' })
          end
          return labels
        end

        local function get_diagnostic_label()
          local icons = { error = ' ', warn = ' ', info = ' ', hint = '󰬏 ' }
          local label = {}

          for severity, icon in pairs(icons) do
            local n = #vim.diagnostic.get(props.buf, { severity = vim.diagnostic.severity[string.upper(severity)] })
            if n > 0 then
              table.insert(label, { icon .. n .. ' ', group = 'DiagnosticSign' .. severity })
            end
          end
          if #label > 0 then
            table.insert(label, { '┊ ' })
          end
          return label
        end

        -- Modify the filename text when unfocused.
        local hl_group = 'Normal'
        if not props.focused then
          hl_group = 'Comment'
        end

        local hl_info = vim.api.nvim_get_hl(0, { name = hl_group })
        local fg_color_raw = hl_info.fg
        local filename_fg_color = string.format('#%06x', fg_color_raw)

        return {
          { get_diagnostic_label() },
          { get_git_diff() },
          { (ft_icon or '') .. ' ', guifg = ft_color, guibg = 'none' },
          { filename .. ' ', gui = vim.bo[props.buf].modified and 'bold,italic' or 'bold', guifg = filename_fg_color },
          { '┊   ' .. vim.api.nvim_win_get_number(props.win), group = 'DevIconWindows' },
        }
      end,
    }
  end,
  -- Optional: Lazy load Incline
  event = 'VeryLazy',
}
