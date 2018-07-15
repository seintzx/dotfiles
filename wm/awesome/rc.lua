-- REQUIRED LIBRARY ===========================================================
local awesome, client, mouse, screen, tag = awesome, client, mouse, screen, tag
local ipairs, string, os, table, tostring, tonumber, type = ipairs, string, os, table, tostring, tonumber, type

local gears         = require("gears")
local awful         = require("awful")
                      require("awful.autofocus")
local wibox         = require("wibox")
local beautiful     = require("beautiful")
local naughty       = require("naughty")
local lain          = require("lain")
local hotkeys_popup = require("awful.hotkeys_popup").widget
local my_table      = awful.util.table or gears.table -- 4.{0,1} compatibility
-- local menubar       = require("menubar")
-- local freedesktop   = require("freedesktop")

-- ERROR HANDLING =============================================================
if awesome.startup_errors then
    naughty.notify({
        preset = naughty.config.presets.critical,
        title = "Oops, there were errors during startup!",
        text = awesome.startup_errors
    })
end
do
    local in_error = false
    awesome.connect_signal("debug::error",
    function (err)
        if in_error then return end
        in_error = true
        naughty.notify({
            preset = naughty.config.presets.critical,
            title = "Oops, an error happened!",
            text = tostring(err)
        })
        in_error = false
    end)
end

-- VARIABLE DEFINITIONS =======================================================
--[[
local themes = {
    "my-theme",
    "powerarrow",
    "powerarrow-dark",
}
local chosen_theme  = themes[3]
--]]
local theme_path    = string.format("%s/.config/awesome/theme.lua", os.getenv("HOME"))
local modkey        = "Mod4"
local altkey        = "Mod1"
local terminal      = "st -e /bin/tmux"
local editor        = os.getenv("EDITOR") or "nvim"
local gui_editor    = "gvim"
local browser       = "firefox"
local script_path   = string.format("%s/.config/wm_script/", os.getenv("HOME"))

local tag_name = { "", "", "", "", "", "", "", "", "" }
awful.util.tagnames = tag_name

awful.util.terminal = terminal
awful.layout.layouts = {
    awful.layout.suit.tile,
    -- awful.layout.suit.tile.left,
    -- awful.layout.suit.tile.bottom,
    -- awful.layout.suit.tile.top,
    -- awful.layout.suit.floating,
    --awful.layout.suit.fair,
    --awful.layout.suit.fair.horizontal,
    --awful.layout.suit.spiral,
    --awful.layout.suit.spiral.dwindle,
    --awful.layout.suit.max,
    --awful.layout.suit.max.fullscreen,
    --awful.layout.suit.magnifier,
    --awful.layout.suit.corner.nw,
    --awful.layout.suit.corner.ne,
    --awful.layout.suit.corner.sw,
    --awful.layout.suit.corner.se,
    --lain.layout.cascade,
    --lain.layout.cascade.tile,
    --lain.layout.centerwork,
    --lain.layout.centerwork.horizontal,
    --lain.layout.termfair,
    --lain.layout.termfair.center,
}

local taglist_buttons = my_table.join(
                    awful.button({ }, 1, function(t) t:view_only() end),
                    awful.button({ modkey }, 1, function(t)
                        if client.focus then
                            client.focus:move_to_tag(t)
                        end
                    end),
                    awful.button({ }, 3, awful.tag.viewtoggle),
                    awful.button({ modkey }, 3, function(t)
                        if client.focus then
                            client.focus:toggle_tag(t)
                        end
                    end),
                    awful.button({ }, 4, function(t) awful.tag.viewnext(t.screen) end),
                    awful.button({ }, 5, function(t) awful.tag.viewprev(t.screen) end)
                )

local tasklist_buttons = my_table.join(
                     awful.button({ }, 1, function (c)
                            if c == client.focus then
                                c.minimized = true
                            else
                                c.minimized = false
                                if not c:isvisible() and c.first_tag then
                                    c.first_tag:view_only()
                                end
                                client.focus = c
                                c:raise()
                            end
                        end),
                     awful.button({ }, 3, function()
                            local instance = nil
                            return function ()
                                if instance and instance.wibox.visible then
                                    instance:hide()
                                    instance = nil
                                else
                                    instance = awful.menu.clients({ theme = { width = 250 } })
                                end
                            end
                        end),
                     awful.button({ }, 4, function ()
                                                awful.client.focus.byidx(1)
                                            end),
                     awful.button({ }, 5, function ()
                                                awful.client.focus.byidx(-1)
                                            end))
lain.layout.termfair.nmaster           = 3
lain.layout.termfair.ncol              = 1
lain.layout.termfair.center.nmaster    = 3
lain.layout.termfair.center.ncol       = 1
lain.layout.cascade.tile.offset_x      = 2
lain.layout.cascade.tile.offset_y      = 32
lain.layout.cascade.tile.extra_padding = 5
lain.layout.cascade.tile.nmaster       = 5
lain.layout.cascade.tile.ncol = 2

beautiful.init(theme_path)

-- wallpaper
screen.connect_signal("property::geometry", function(s)
    if beautiful.wallpaper then
        local wallpaper = beautiful.wallpaper
        if type(wallpaper) == "function" then
            wallpaper = wallpaper(s)
        end
        gears.wallpaper.maximized(wallpaper, s, true)
    end
end)

awful.screen.connect_for_each_screen(function(s) beautiful.at_screen_connect(s) end)

-- KEYBINDINGS ================================================================
globalkeys = my_table.join(
    awful.key({ modkey, "Shift" }, "r",         awesome.restart),
    awful.key({ modkey, "Shift" }, "q",         awesome.quit),
    awful.key({ modkey          }, "r",         function () awful.screen.focused().mypromptbox:run()            end),
    awful.key({ modkey,         }, "space",     function () awful.layout.inc( 1)                                end),
    awful.key({ modkey, "Shift" }, "space",     function () awful.layout.inc(-1)                                end),
    awful.key({ modkey,         }, "Return",    function () awful.spawn(terminal)                               end),

    -- layout manipulation
    awful.key({ modkey,         }, "j",         function () awful.client.focus.byidx(-1)                        end),
    awful.key({ modkey,         }, "k",         function () awful.client.focus.byidx( 1)                        end),
    awful.key({ modkey, "Shift" }, "j",         function () awful.client.swap.byidx( -1)                        end),
    awful.key({ modkey, "Shift" }, "k",         function () awful.client.swap.byidx(  1)                        end),
    awful.key({ modkey,         }, "h",         function () awful.tag.viewprev(awful.screen.focused())          end),
    awful.key({ modkey,         }, "l",         function () awful.tag.viewnext(awful.screen.focused())          end),

    -- back&forth and urgent
    awful.key({ modkey,         }, "u",         awful.client.urgent.jumpto),
    awful.key({ modkey,         }, "Tab",       awful.tag.history.restore),

    -- reduce to icon
    awful.key({ modkey, "Shift" }, "n",         function ()   local c = awful.client.restore()    if c then   client.focus = c    c:raise()   end       end),

    -- change keyboard layout
    awful.key({ altkey,         }, "Caps_Lock", function () mykbdlayout.next()                                                           end),

    -- Personal keybinds
    awful.key({ modkey,         }, "p",         function()  awful.util.spawn_with_shell("rofi -show run")                                end),
    awful.key({ modkey, "Shift" }, "p",         function()  awful.util.spawn_with_shell("rofi -show")                                    end),
    awful.key({ modkey, "Shift" }, "z",         function()  awful.util.spawn_with_shell( script_path .. "lockscr.sh")                    end),
    awful.key({ modkey, "Shift" }, "s",         function()  awful.util.spawn_with_shell( script_path .. "chat.sh")                       end),
    awful.key({ modkey,         }, "F2",        function()  awful.util.spawn("sync")     awful.util.spawn("xbacklight -dec 10")          end),
    awful.key({ modkey,         }, "F3",        function()  awful.util.spawn("sync")     awful.util.spawn("xbacklight -inc 10")          end),
    awful.key({ modkey,         }, "F9",        function()  awful.util.spawn("sync")     awful.util.spawn("amixer sset Master 5%-")      end),
    awful.key({ modkey,         }, "F10",       function()  awful.util.spawn("sync")     awful.util.spawn("amixer sset Master 5%+")      end),

    -- screenshot
    awful.key({                 }, "Print",     function()
            awful.util.spawn("scrot 'scr-%Y-%m-%d_%s.png' -e 'mv $f ~/Pictures/screenshot 2>/dev/null'", false)                         end),
    awful.key({         "Shift" }, "Print",     function()
            awful.util.spawn_with_shell("sleep 0.2 ; scrot -s 'scr-%Y-%m-%d_%s.png' -e 'mv $f ~/Pictures/screenshot 2>/dev/null'")      end)
)

-- Client Key Bindings
clientkeys = my_table.join(
    awful.key({ modkey, "Shift" }, "c",         function (c) c:kill()                                           end),
    awful.key({ modkey,         }, "n",         function (c) c.minimized = true                                 end),
    awful.key({ modkey,         }, "f",         function (c) c.fullscreen = not c.fullscreen c:raise()          end)
)

-- TAG BINDINGS ===============================================================
for i = 1, 9 do
    local descr_view, descr_toggle, descr_move, descr_toggle_focus
    if i == 1 or i == 9 then
        descr_view = {description = "view tag #", group = "tag"}
        descr_toggle = {description = "toggle tag #", group = "tag"}
        descr_move = {description = "move focused client to tag #", group = "tag"}
        descr_toggle_focus = {description = "toggle focused client on tag #", group = "tag"}
    end

    globalkeys = my_table.join(globalkeys,
            -- view tag only
            awful.key({ modkey }, "#" .. i + 9,
                function ()
                    local screen = awful.screen.focused()
                    local tag = screen.tags[i]
                    if tag then
                        tag:view_only()
                    end
                end,
                descr_view),

            -- move client to tag
            awful.key({ modkey, "Shift" }, "#" .. i + 9,
                function ()
                    if client.focus then
                        local tag = client.focus.screen.tags[i]
                        if tag then
                            client.focus:move_to_tag(tag)
                        end
                    end
                end,
                descr_move)
    )
end

clientbuttons = my_table.join(
    awful.button({ }, 1, function (c) client.focus = c; c:raise() end),
    awful.button({ modkey }, 1, awful.mouse.client.move),
    awful.button({ modkey }, 3, awful.mouse.client.resize))

root.keys(globalkeys)

-- RULES ======================================================================
-- Rules to apply to new clients (through the "manage" signal).
awful.rules.rules = {
    -- All clients will match this rule.
    { rule = { },
      properties = {
                     border_width = beautiful.border_width,
                     border_color = beautiful.border_normal,
                     focus = awful.client.focus.filter,
                     raise = true,
                     keys = clientkeys,
                     buttons = clientbuttons,
                     screen = awful.screen.preferred,
                     placement = awful.placement.no_overlap+awful.placement.no_offscreen,
                     size_hints_honor = false
                    }
    },

    -- Floating clients.
    { rule_any = {
            instance =  { "DTA", "copyq", },
            class =     { "Arandr", "Gpick", "Kruler", "MessageWin", "Sxiv", "Wpa_gui", "pinentry", "veromix", "xtightvncviewer" },
            name =      { "Event Tester", },
            role =      { "AlarmWindow", "pop-up",   }   },
            properties = { floating = true }
    },

    -- Add titlebars to normal clients and dialogs
    { rule_any = {type = { "normal", "dialog" } }, properties = { titlebars_enabled = false }   },

    -- Personal Rules
    -- 
    { rule = { class = "Firefox" },             properties = { screen = 1, tag = tag_name[1] } },
    { rule = { class = "Tor Browser" },         properties = { screen = 1, tag = tag_name[1] } },
    { rule = { class = "Chromium" },            properties = { screen = 1, tag = tag_name[1] } },
    -- 
    { rule = { class = "Nemo" },                properties = { screen = 1, tag = tag_name[4] } },
    -- 
    { rule = { class = "jetbrains-idea" },      properties = { screen = 1, tag = tag_name[5] } },
    { rule = { class = "Zathura" },             properties = { screen = 1, tag = tag_name[5] } },
    { rule = { class = "Db_main" },             properties = { screen = 1, tag = tag_name[5] } },
    { rule = { class = "TeXstudio" },           properties = { screen = 1, tag = tag_name[5] } },
    { rule = { class = "libreoffice" },         properties = { screen = 1, tag = tag_name[5] } },
    { rule = { class = "subl" },                properties = { screen = 1, tag = tag_name[5] } },
    { rule = { class = "Eclipse" },             properties = { screen = 1, tag = tag_name[5] } },
    -- 
    { rule = { class = "player" },              properties = { screen = 1, tag = tag_name[6] } },
    { rule = { class = "Genymotion" },          properties = { screen = 1, tag = tag_name[6] } },
    { rule = { class = "spotify" },             properties = { screen = 1, tag = tag_name[6] } },
    { rule = { class = "steam" },               properties = { screen = 1, tag = tag_name[6] } },
    { rule = { class = "vlc" },                 properties = { screen = 1, tag = tag_name[6] } },
    { rule = { class = "Gimp" },                properties = { screen = 1, tag = tag_name[6] } },
    -- 
    { rule = { class = "TelegramDesktop" },     properties = { screen = 1, tag = tag_name[7] } },
    { rule = { class = "Slack" },               properties = { screen = 1, tag = tag_name[7] } },
    { rule = { class = "signal" },              properties = { screen = 1, tag = tag_name[7] } },
    -- 
    { rule = { class = "qBittorrent" },         properties = { screen = 1, tag = tag_name[8] } },
    { rule = { class = "VirtualBox Manager" },  properties = { scrren = 1, tag = tag_name[8] } },
    { rule = { class = "VirtualBox Machine" },  properties = { scrren = 1, tag = tag_name[8] } },
    -- 
    { rule = { class = "keepassxc" },           properties = { scrren = 1, tag = tag_name[9] } },
}

-- SIGNALS ====================================================================
-- Signal function to execute when a new client appears.
client.connect_signal("manage", function (c)
        if awesome.startup and
        not c.size_hints.user_position and
        not c.size_hints.program_position then
            awful.placement.no_offscreen(c)
        end
    end)

-- Add a titlebar if titlebars_enabled is set to true in the rules.
client.connect_signal("request::titlebars", function(c)
    -- Custom
    if beautiful.titlebar_fun then
        beautiful.titlebar_fun(c)
        return
    end

    -- default
    local buttons = my_table.join(
            awful.button({ }, 1, function()
                client.focus = c
                c:raise()
                awful.mouse.client.move(c)
            end),
            awful.button({ }, 3, function()
                client.focus = c
                c:raise()
                awful.mouse.client.resize(c)
            end)
        )

    awful.titlebar(c, {size = 16 }) : setup {
        { -- left
            awful.titlebar.widget.iconwidget(c),
            buttons = buttons,
            layout  = wibox.layout.fixed.horizontal },
        { -- middle
            { -- title
                align  = "center",
                widget = awful.titlebar.widget.titlewidget(c)
            },
            buttons = buttons,
            layout  = wibox.layout.flex.horizontal
        },
        { -- right
            awful.titlebar.widget.floatingbutton (c),
            awful.titlebar.widget.maximizedbutton(c),
            awful.titlebar.widget.stickybutton   (c),
            awful.titlebar.widget.ontopbutton    (c),
            awful.titlebar.widget.closebutton    (c),
            layout = wibox.layout.fixed.horizontal()
        },
        layout = wibox.layout.align.horizontal
    }
end)

-- Enable sloppy focus, so that focus follows mouse.
client.connect_signal("mouse::enter", function(c)
    if awful.layout.get(c.screen) ~= awful.layout.suit.magnifier
        and awful.client.focus.filter(c) then
        client.focus = c
    end
end)

-- No border for maximized clients
function border_adjust(c)
    if c.maximized then
        c.border_width = 0
    elseif #awful.screen.focused().clients > 1 then
        c.border_width = beautiful.border_width
        c.border_color = beautiful.border_focus
    end
end

client.connect_signal("focus", border_adjust)
client.connect_signal("property::maximized", border_adjust)
client.connect_signal("unfocus", function(c) c.border_color = beautiful.border_normal end)
