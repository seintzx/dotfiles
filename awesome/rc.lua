-- REQUIRED LIBRARY ============================================================
local awesome, client, mouse, screen, tag = awesome, client, mouse, screen, tag
local ipairs, string, os, table, tostring, tonumber, type = ipairs, string, os
local table, tostring, tonumber, type

local gears         = require("gears")
local awful         = require("awful")
                      require("awful.autofocus")
local wibox         = require("wibox")
local beautiful     = require("beautiful")
local naughty       = require("naughty")
local lain          = require("lain")
-- local menubar       = require("menubar")
-- local freedesktop   = require("freedesktop")
local hotkeys_popup = require("awful.hotkeys_popup").widget
                      require("awful.hotkeys_popup.keys")
local my_table      = awful.util.table or gears.table -- 4.{0,1} compatibility
local dpi           = require("beautiful.xresources").apply_dpi
local HOME          = os.getenv("HOME")

-- ERROR HANDLING ==============================================================
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

-- AUTOSTART ===================================================================
-- This function will run once every time Awesome is started
local function run_once(cmd_arr)
    for _, cmd in ipairs(cmd_arr) do
        awful.spawn.with_shell(
            string.format(
                "pgrep -u $USER -fx '%s' > /dev/null || (%s)",cmd, cmd))
    end
end

run_once({ "dunst", "greenclip daemon", "xset -b", "xset s off -dpms" })


-- VARIABLE DEFINITIONS ========================================================
local theme_path    = string.format("%s/.config/awesome/theme.lua", HOME)
local modkey        = "Mod4"
local altkey        = "Mod1"
local terminal      = "st -e /bin/tmux"
local editor        = os.getenv("EDITOR") or "nvim"
local gui_editor    = "gvim"
local browser       = "firefox"
local script_path   = string.format("%s/.config/wm_script/", HOME)
local scrlocker     = "slock"
-- local commoners     = script_path .. "common.sh"
local scr_path      = "${HOME}/pictures/screenshot/"

awful.util.terminal = terminal

-- local tag_name = { "", "", "", "", "", "", "", "", "" }
local tag_name = { "1", "2", "3", "4", "5", "6", "7", "8", "9" }
awful.util.tagnames = tag_name

awful.layout.layouts = {
    awful.layout.suit.fair,
    awful.layout.suit.fair.horizontal,
    awful.layout.suit.max,
}

awful.util.taglist_buttons = my_table.join(
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
    awful.button({ }, 4, function(t) awful.tag.viewprev(t.screen) end),
    awful.button({ }, 5, function(t) awful.tag.viewnext(t.screen) end)
)

awful.util.tasklist_buttons = my_table.join(
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
                instance = awful.menu.clients({ theme = { width = dpi(250)}})
            end
        end
    end),
    awful.button({ }, 4, function () awful.client.focus.byidx(1) end),
    awful.button({ }, 5, function () awful.client.focus.byidx(-1) end)
)

lain.layout.termfair.nmaster            = 3
lain.layout.termfair.ncol               = 1
lain.layout.termfair.center.nmaster     = 3
lain.layout.termfair.center.ncol        = 1
lain.layout.cascade.tile.offset_x       = dpi(2)
lain.layout.cascade.tile.offset_y       = dpi(32)
lain.layout.cascade.tile.extra_padding  = dpi(5)
lain.layout.cascade.tile.nmaster        = 5
lain.layout.cascade.tile.ncol           = 2

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

-- No borders when rearranging only 1 non-floating or maximized client
screen.connect_signal("arrange", function (s)
    local only_one = #s.tiled_clients == 1
    for _, c in pairs(s.clients) do
        if only_one and not c.floating or c.maximized then
            c.border_width = 0
        else
            c.border_width = beautiful.border_width
        end
    end
end)

awful.screen.connect_for_each_screen(function(s)
                                        beautiful.at_screen_connect(s) end)

-- KEYBINDINGS =================================================================
globalkeys = my_table.join(
    awful.key({ modkey, "Shift"   }, "r",
        awesome.restart),
    awful.key({ modkey, "Shift"   }, "q",
        awesome.quit),
    awful.key({ modkey            }, "r",
        function () awful.screen.focused().mypromptbox:run()            end),
    awful.key({ modkey,           }, "space",
        function () awful.layout.inc( 1)                                end),
    awful.key({ modkey, "Shift"   }, "space",
        function () awful.layout.inc(-1)                                end),
    awful.key({ modkey,           }, "Return",
        function () awful.spawn(terminal)                               end),

    -- layout manipulation
    awful.key({ modkey,           }, "j",
        function () awful.client.focus.byidx(-1)                        end),
    awful.key({ modkey,           }, "k",
        function () awful.client.focus.byidx( 1)                        end),
    awful.key({ modkey, "Shift"   }, "j",
        function () awful.client.swap.byidx( -1)                        end),
    awful.key({ modkey, "Shift"   }, "k",
        function () awful.client.swap.byidx(  1)                        end),
    awful.key({ modkey, "Control" }, "j",
        function () awful.screen.focus_relative(-1)                     end),
    awful.key({ modkey, "Control" }, "k",
        function () awful.screen.focus_relative( 1)                     end),
    awful.key({ modkey,           }, "h",
        function () awful.tag.viewprev(awful.screen.focused())          end),
    awful.key({ modkey,           }, "l",
        function () awful.tag.viewnext(awful.screen.focused())          end),

    -- back&forth and urgent
    awful.key({ modkey,           }, "u",
        awful.client.urgent.jumpto),
    awful.key({ modkey,           }, "Tab",
        awful.tag.history.restore),

    -- reduce to icon
    awful.key({ modkey, "Shift"   }, "n",
        function ()
            local c = awful.client.restore()
            if c then
                client.focus = c
                c:raise()
            end
        end),

    -- awful.key({ modkey, }, "z",
    --     function () awful.screen.focused().quake:toggle() end),

    awful.key({ modkey,         }, "p",
        function()   os.execute("rofi -show run")           end),
    awful.key({ modkey, "Shift" }, "p",
        function()   os.execute("rofi -show")               end),
    awful.key({ modkey, "Shift" }, "v",
        function()   os.execute("networkmanager_dmenu")     end),
    awful.key({ modkey, "Shift" }, "z",
        function()   os.execute(scrlocker)                  end),
    -- awful.key({ modkey, "Shift" }, "s",
    --     function()   os.execute(commoners)                  end),
    awful.key({ modkey,         }, "F11",
        function()  os.execute("xbacklight -dec 5")         end),
    awful.key({ modkey,         }, "F12",
        function()  os.execute("xbacklight -inc 5")         end),
    awful.key({ modkey }, "F2",
        function ()
            os.execute(string.format(
                        "amixer -q set %s 5%%-",
                        beautiful.volume.channel))
            beautiful.volume.update()
        end),
    awful.key({ modkey }, "F3",
        function ()
            os.execute(string.format(
                        "amixer -q set %s 5%%+",
                        beautiful.volume.channel))
            beautiful.volume.update()
        end),
    awful.key({                 }, "Print",
        function()
            os.execute( "scrot "
                        .. scr_path ..
                        "/scr-$(date +%Y_%m_%d)-%s.png", false)
        end),
    awful.key({         "Shift" }, "Print",
        function()
            os.execute( "sleep 02 ; scrot -s "
                        .. scr_path ..
                        "/scr-$(date +%Y_%m_%d)-%s.png", false)
        end)
)

-- Client Key Bindings
clientkeys = my_table.join(
    awful.key({ modkey, "Shift" }, "c",
        function (c) c:kill()               end),
    awful.key({ modkey,         }, "n",
        function (c) c.minimized = true     end),
    awful.key({ modkey,         }, "f",
        function (c)
            c.fullscreen = not c.fullscreen
            c:raise()
        end),
    awful.key({ modkey, "Control" }, "space",
        awful.client.floating.toggle)
)

-- TAG BINDINGS ================================================================
for i = 1, 9 do
    local descr_view, descr_toggle, descr_move, descr_toggle_focus
    if i == 1 or i == 9 then
        descr_view = {  description = "view tag #",
                        group = "tag"}
        descr_toggle = {description = "toggle tag #",
                        group = "tag"}
        descr_move = {  description = "move focused client to tag #",
                        group = "tag"}
        descr_toggle_focus = {  description = "toggle focused client on tag #",
                                group = "tag"}
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

clientbuttons = gears.table.join(
    awful.button({ }, 1, function (c)
        c:emit_signal("request::activate", "mouse_click", {raise = true})
    end),
    awful.button({ modkey }, 1, function (c)
        c:emit_signal("request::activate", "mouse_click", {raise = true})
        awful.mouse.client.move(c)
    end),
    awful.button({ modkey }, 3, function (c)
        c:emit_signal("request::activate", "mouse_click", {raise = true})
        awful.mouse.client.resize(c)
    end)
)

root.keys(globalkeys)

-- RULES =======================================================================
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
     } },

    -- Floating clients.
    { rule_any = {
            instance =  { "DTA", "copyq", },
            class =     {   "Arandr", "Gpick", "Kruler",
                            "MessageWin", "Sxiv", "Wpa_gui",
                            "pinentry", "veromix", "xtightvncviewer" },
            name =      { "Event Tester", },
            role =      { "AlarmWindow", "pop-up",   }   },
            properties = { floating = true }
    },

    -- Add titlebars to normal clients and dialogs
    { rule_any = { type = { "normal", "dialog" } },
        properties = { titlebars_enabled = false } },

    -- Personal Rules
    -- 1
    { rule = { class = "Tor Browser" },
        properties = { screen = 1, tag = tag_name[1] } },
    { rule = { class = "Chromium" },
        properties = { screen = 1, tag = tag_name[1] } },
    { rule = { class = "firefox" },
        properties = { screen = 1, tag = tag_name[1] } },
    -- 4
    { rule = { class = "calibre" },
        properties = { screen = 1, tag = tag_name[4] } },
    { rule = { class = "Nemo" },
        properties = { screen = 1, tag = tag_name[4] } },
    { rule = { class = "Thunar" },
        properties = { screen = 1, tag = tag_name[4] } },
    -- 5
    { rule = { class = "libreoffice" },
        properties = { screen = 1, tag = tag_name[5] } },
    { rule = { class = "Zathura" },
        properties = { screen = 1, tag = tag_name[5] } },
    { rule = { class = "evince" },
        properties = { screen = 1, tag = tag_name[5] } },
    { rule = { class = "Subl3" },
        properties = { screen = 1, tag = tag_name[5] } },
    -- 6
    { rule = { class = "Spotify" },
        properties = { screen = 1, tag = tag_name[6] } },
    { rule = { class = "steam" },
        properties = { screen = 1, tag = tag_name[6] } },
    { rule = { class = "discord" },
        properties = { screen = 1, tag = tag_name[6] } },
    { rule = { class = "skype" },
        properties = { screen = 1, tag = tag_name[6] } },
    { rule = { class = "Gimp" },
        properties = { screen = 1, tag = tag_name[6] } },
    { rule = { class = "zoom" },
        properties = { screen = 1, tag = tag_name[6] } },
    { rule = { class = "vlc" },
        properties = { screen = 1, tag = tag_name[6] } },
    -- 7
    { rule = { instance = "cesena.slack.com__unreads"},
        properties = {  screen = 1, tag = tag_name[7],
                        maximized_vertical = true,
                        maximized_horizontal = true} },
    { rule = { instance = "web.whatsapp.com"},
        properties = {  screen = 1, tag = tag_name[7],
                        maximized_vertical = true,
                        maximized_horizontal = true} },
    { rule = { class = "TelegramDesktop" },
        properties = { screen = 1, tag = tag_name[7] } },
    { rule = { class = "Slack" },
        properties = { screen = 1, tag = tag_name[7] } },
    { rule = { class = "Signal" },
        properties = { screen = 1, tag = tag_name[7] } },
    -- 8
    { rule = { instance = "cloud.disroot.org__apps_tasks"},
        properties = {  screen = 1, tag = tag_name[8],
                        maximized_vertical = true,
                        maximized_horizontal = true} },
    { rule = { instance = "mail.disroot.org"},
        properties = {  screen = 1, tag = tag_name[8],
                        maximized_vertical = true,
                        maximized_horizontal = true} },
    { rule = { instance = "trello.com"},
        properties = {  screen = 1, tag = tag_name[8],
                        maximized_vertical = true,
                        maximized_horizontal = true} },
    -- 9
    { rule = { class = "VirtualBox Manager" },
        properties = { scrren = 1, tag = tag_name[9] } },
    { rule = { class = "VirtualBox Machine" },
        properties = { scrren = 1, tag = tag_name[9] } },
    { rule = { class = "qBittorrent" },
        properties = { screen = 1, tag = tag_name[9] } },
    { rule = { class = "Genymotion" },
        properties = { screen = 1, tag = tag_name[9] } },
    { rule = { class = "player" },
        properties = { screen = 1, tag = tag_name[9] } },
}

-- SIGNALS =====================================================================
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

-- No border for maximized clients
function border_adjust(c)
    if c.maximized then
        c.border_width = 0
    elseif #awful.screen.focused().clients > 1 then
        c.border_width = beautiful.border_width
        c.border_color = beautiful.border_focus
    end
end

client.connect_signal("mouse::enter",
    function(c)
        c:emit_signal(  "request::activate",
                        "mouse_enter",
                        {raise = false})
    end)
client.connect_signal("property::maximized", border_adjust)
client.connect_signal("focus", border_adjust)
client.connect_signal("unfocus",
    function(c)
        c.border_color = beautiful.border_normal
    end)
