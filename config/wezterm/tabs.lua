local wezterm = require 'wezterm'
local module = {}

-- Helper function to get project name from path
local function get_project_name(cwd_uri)
    if not cwd_uri then
        return 'Terminal'
    end

    local cwd = cwd_uri:match('file://(.+)')
    if not cwd then
        return 'Terminal'
    end

    -- URL decode
    cwd = cwd:gsub('%%(%x%x)', function(hex)
        return string.char(tonumber(hex, 16))
    end)

    local project_name = cwd:match('/([^/]+)/?$')

    if project_name == nil or project_name == '' then
        return 'Root'
    end

    -- Clean up and capitalize
    project_name = project_name:gsub('^%.', '')
    project_name = project_name:gsub('^%l', string.upper)

    return project_name
end

function module.apply_to_config(config)
    -- Tab bar configuration
    config.use_fancy_tab_bar = true
    config.tab_max_width = 25
    config.show_tab_index_in_tab_bar = false
    config.hide_tab_bar_if_only_one_tab = false

    -- Tab title formatting
    wezterm.on('format-tab-title', function(tab, tabs, panes, config, hover, max_width)
        -- Respect manual titles
        local manual_title = tab.tab_title
        if manual_title and #manual_title > 0 then
            return {{
                Text = ' ' .. manual_title .. ' '
            }}
        end

        -- Auto-generate from directory
        local pane = tab.active_pane
        local cwd_uri = pane.current_working_dir
        local project_name = get_project_name(cwd_uri)

        -- Get tab index
        local tab_index = ''
        for i, t in ipairs(tabs) do
            if t.tab_id == tab.tab_id then
                tab_index = i
                break
            end
        end

        local title = string.format('%d: %s', tab_index, project_name)

        -- Truncate if needed
        if #title > max_width then
            title = title:sub(1, max_width - 3) .. '...'
        end

        -- Style based on active state
        local bg_color = tab.is_active and '#5e81ac' or '#2e3440'
        local fg_color = tab.is_active and '#eceff4' or '#d8dee9'

        return {{
            Background = {
                Color = bg_color
            }
        }, {
            Foreground = {
                Color = fg_color
            }
        }, {
            Text = ' ' .. title .. ' '
        }}
    end)
end

return module
