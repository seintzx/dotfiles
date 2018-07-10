-- REQUIRED LIBRARY ===========================================================

    -- Standard awesome library
    local gears = require("gears")
    local awful = require("awful")
    awful.rules = require("awful.rules")
    require("awful.autofocus")

    -- Widget and layout library
    local wibox = require("wibox")

    -- Theme handling library
    local beautiful = require("beautiful")

    -- Notification library
    local naughty = require("naughty")
    local hotkeys_popup = require("awful.hotkeys_popup").widget

    -- lain "plugins"
    local lain = require("lain")

-- ERROR HANDLING =============================================================

    -- Check if awesome encountered an error during startup and fell back to
    if awesome.startup_errors then
        naughty.notify({ preset = naughty.config.presets.critical,  title = "Oops, there were errors during startup!",  text = awesome.startup_errors })
    end
    -- Handle runtime errors after startup
    do
        local in_error = false
        awesome.connect_signal("debug::error", function (err)
            -- Make sure we don't go into an endless error loop
            if in_error then return end
            in_error = true
            naughty.notify({ preset = naughty.config.presets.critical,  title = "Oops, an error happened!", text = tostring(err) }) in_error = false    end)
    end

-- HELPER FUNCTIONS ===========================================================
    local function client_menu_toggle_fn()
        local instance = nil
        return function ()  if instance and instance.wibox.visible then instance:hide() instance = nil  else    instance = awful.menu.clients({ theme = { width = 250 } })  end end end

-- VARIABLE DEFINITIONS =======================================================

    -- Themes define colours, icons, font and wallpapers.
    beautiful.init("/home/seintz/.config/awesome/theme.lua")

    -- This is used later as the default terminal and editor to run.
    terminal = "st"
    editor = "nvim"
    editor_cmd = terminal .. " -e " .. editor

    -- Default modkey.
    altkey = "Mod1"
    modkey = "Mod4"
    fnkey  = "Mod5" -- Mod5 is alt_gr

    -- Table of layouts to cover with awful.layout.inc, order matters.
    awful.layout.layouts = {
        awful.layout.suit.fair,
        awful.layout.suit.floating,
        awful.layout.suit.max.fullscreen,
    }

    local tags_info = {
      names = {
        "1: ",
        "2: ",
        "3: ",
        "4: ",
        "5: ",
        "6: ",
        "7: ",
        "8: ",
        "9: "
      }
}

-- WIDGET THINGS ==============================================================

    -- Keyboard map indicator and switcher
    -- mykeyboardlayout = awful.widget.keyboardlayout()

    systray = wibox.widget.systray
    -- Create a textclock widget
    mytextclock = wibox.widget.textclock()
    local calendar = lain.widget.calendar({attach_to = mytextclock})

    -- Separator
    separators = lain.util.separators
    spr  = wibox.widget.textbox('')
    separ  = wibox.widget.textbox(' ')
    arrd = separators.arrow_left(beautiful.bg_focus, "alpha")
    arrl = separators.arrow_left("alpha", beautiful.bg_focus)

    -- -- Wifi and Wired Icon
    -- net_wireless = net_widgets.wireless({   interface="wlo1"    })
    -- net_wired    = net_widgets.indicator({  interface="eno1"    })

    -- CPU
    cpuicon = wibox.widget.imagebox(beautiful.widget_cpu)
    cpuwidget = lain.widget.cpu {   settings = function()   widget:set_markup("" .. cpu_now.usage .. "%")  end }

    -- MEM
    memicon = wibox.widget.imagebox(beautiful.widget_mem)
    memwidget = lain.widget.mem {   settings = function()   widget:set_markup("\u{f2db} " .. mem_now.perc .. "% ")  end }

    -- Battery
    baticon = wibox.widget.imagebox(beautiful.widget_battery)
    batwidget = lain.widget.bat({
      settings = function()
            if bat_now.status ~= "N/A" then
              if bat_now.ac_status == 1 then
                widget:set_markup(" AC ")
                baticon:set_image(beautiful.widget_ac)
                return
              elseif tonumber(bat_now.perc) <= 5 then
                baticon:set_image(beautiful.widget_battery_empty)
              elseif tonumber(bat_now.perc) <= 15 then
                baticon:set_image(beautiful.widget_battery_low)
              else
                baticon:set_image(beautiful.widget_battery)
              end
              widget:set_markup("\u{f240} " .. bat_now.perc .. "% ")
            else
              baticon:set_image(beautiful.widget_ac)
            end
      end})

    function show_battery_warning()
        naughty.notify{
        text = "Huston, we have a problem",
        title = "Battery is dying",
        timeout = 5, hover_timeout = 0.5,
        position = "bottom_right",
        bg = "#F06060",
        fg = "#EEE9EF",
        width = 500,
        ontop = true,
    }
    end

    -- Volume
    volicon = wibox.widget.imagebox(beautiful.widget_vol)
    volumewidget = lain.widget.alsa({
      settings = function()
            if volume_now.status == "off" then
              volicon:set_image(beautiful.widget_vol_mute)
            elseif tonumber(volume_now.level) == 0 then
              volicon:set_image(beautiful.widget_vol_no)
            elseif tonumber(volume_now.level) <= 50 then
              volicon:set_image(beautiful.widget_vol_low)
            else
              volicon:set_image(beautiful.widget_vol)
            end
            widget:set_text("\u{266A} " .. volume_now.level .. "% ")
        end})

    -- Keyboard Layout
    mykbdlayout =  awful.widget.keyboardlayout:new ()

-- WIBOX CREATION =============================================================

    -- Create a wibox for each screen and add it
    -- Taglist
    local taglist_buttons = awful.util.table.join(
                        awful.button({ }, 1, function(t) t:view_only() end),
                        awful.button({ modkey }, 1, function(t) if client.focus then    client.focus:move_to_tag(t) end end),
                        awful.button({ }, 3, awful.tag.viewtoggle),
                        awful.button({ modkey }, 3, function(t) if client.focus then    client.focus:toggle_tag(t)  end end),
                        awful.button({ }, 4, function(t) awful.tag.viewnext(t.screen) end),
                        awful.button({ }, 5, function(t) awful.tag.viewprev(t.screen) end)
                    )
    -- Tasklist
    local tasklist_buttons = awful.util.table.join(
                         awful.button({ }, 1, function (c)  if c == client.focus then   c.minimized = true  else    c.minimized = false
                                                            if not c:isvisible() and c.first_tag then   c.first_tag:view_only() end client.focus = c    c:raise()   end end),
                         awful.button({ }, 3, client_menu_toggle_fn()),
                         awful.button({ }, 4, function ()   awful.client.focus.byidx(1)     end),
                         awful.button({ }, 5, function ()   awful.client.focus.byidx(-1)    end)
                         )
    -- Wallpaper
    local function set_wallpaper(s)
        if beautiful.wallpaper then local wallpaper = beautiful.wallpaper   if type(wallpaper) == "function" then   wallpaper = wallpaper(s)    end gears.wallpaper.maximized(wallpaper, s, true)   end end

    -- Re-set wallpaper when a screen's geometry changes (e.g. different resolution)
    screen.connect_signal("property::geometry", set_wallpaper)

-- EACH SCREEN ================================================================

    awful.screen.connect_for_each_screen(function(s)
        -- Wallpaper
        set_wallpaper(s)

        -- Each screen has its own tag table.
        awful.tag({ "1", "2", "3", "4", "5", "6", "7", "8", "9" }, s, awful.layout.layouts[1])
        -- 1: Firefox
        -- 234: shell
        -- 5: Nautilus
        -- 6: Text + LIbreOffice
        -- 7: VLC + GIMP
        -- 8: Spotify + Chat
        -- 9: Vbox + Vuze

        -- Create a promptbox for each screen
        s.mypromptbox = awful.widget.prompt()
        -- Create an imagebox widget which will contains an icon indicating which layout we're using.
        -- We need one layoutbox per screen.
        s.mylayoutbox = awful.widget.layoutbox(s)
        s.mylayoutbox:buttons(awful.util.table.join(
                               awful.button({ }, 1, function () awful.layout.inc( 1) end),
                               awful.button({ }, 3, function () awful.layout.inc(-1) end),
                               awful.button({ }, 4, function () awful.layout.inc( 1) end),
                               awful.button({ }, 5, function () awful.layout.inc(-1) end)))
        -- Create a taglist widget
        s.mytaglist = awful.widget.taglist(s, awful.widget.taglist.filter.all, taglist_buttons)

        -- Create a tasklist widget
        s.mytasklist = awful.widget.tasklist(s, awful.widget.tasklist.filter.currenttags, tasklist_buttons)

        -- Create the wibox
        s.mywibox = awful.wibar({ position = "top", screen = s, height = 15 })

        -- Add widgets to the wibox
        -- {Left Widget}, Middle Widget, {Right Widget}
        s.mywibox:setup
        {   layout = wibox.layout.align.horizontal,
                { layout = wibox.layout.fixed.horizontal,   s.mylayoutbox,  s.mytaglist,    s.mypromptbox,  },
                s.mytasklist,
                { layout = wibox.layout.fixed.horizontal,
                    -- arrl,   arrd,   spr,    net_wireless,               spr,
                    arrl,   arrd,   spr,    cpuicon,    cpuwidget,      spr,
                    arrl,   arrd,   spr,    memicon,    memwidget,      spr,
                    arrl,   arrd,   spr,    volicon,    volumewidget,   spr,
                    arrl,   arrd,   spr,    baticon,    batwidget,      spr,
                    arrl,   arrd,   spr,    mykbdlayout,                spr,
                    arrl,   arrd,   spr,    mytextclock,                spr,
                },
        }
    end)

-- KEYBINDINGS ================================================================

-- general rules
--
-- mod + p = dmenu
-- mod + shift + p = rofi
--
-- see xmonad keybind for more

    -- Key bindings
    globalkeys = awful.util.table.join(
        awful.key({ modkey, "Shift" }, "r",         awesome.restart),
        awful.key({ modkey, "Shift" }, "q",         awesome.quit),
        awful.key({ modkey          }, "r",         function()  awful.screen.focused().mypromptbox:run()            end),
        awful.key({ modkey,         }, "space",     function () awful.layout.inc( 1)                                end),
        awful.key({ modkey, "Shift" }, "space",     function () awful.layout.inc(-1)                                end),
        awful.key({ modkey,         }, "Return",    function () awful.spawn(terminal)                               end),
        -- layout manipulation
        awful.key({ modkey,         }, "j",         function () awful.client.focus.byidx(-1)                        end),
        awful.key({ modkey,         }, "k",         function () awful.client.focus.byidx( 1)                        end),
        awful.key({ modkey, "Shift" }, "j",         function () awful.client.swap.byidx( -1)                        end),
        awful.key({ modkey, "Shift" }, "k",         function () awful.client.swap.byidx(  1)                        end),
        -- to be tested and understand
        awful.key({ modkey,         }, "h",         function () awful.tag.viewprev(awful.screen.focused())          end),
        awful.key({ modkey,         }, "l",         function () awful.tag.viewnext(awful.screen.focused())          end),
        awful.key({ modkey, "Shift" }, "h",         function () awful.screen.focus_relative(-1)                     end),
        awful.key({ modkey, "Shift" }, "l",         function () awful.screen.focus_relative( 1)                     end),
        -- back&forth and urgent
        awful.key({ modkey,         }, "u",         awful.client.urgent.jumpto),
        awful.key({ modkey,         }, "Tab",       awful.tag.history.restore),
        -- reduce to icon
        awful.key({ modkey, "Shift" }, "n",         function ()   local c = awful.client.restore()    if c then   client.focus = c    c:raise()   end       end),
        -- Personal keybinds
        -- awful.key({ modkey,         }, "p",         function()  awful.util.spawn_with_shell("${HOME}/.config/awesome/dmenu.sh")             end),  -- dmenu
        awful.key({ modkey,         }, "p",         function()  awful.util.spawn_with_shell("rofi -show run")                               end),  -- rofi run
        awful.key({ modkey, "Shift" }, "p",         function()  awful.util.spawn_with_shell("rofi -show")                                   end),  -- rofi clipboard and calculator
        awful.key({ modkey, "Shift" }, "z",         function()  awful.util.spawn_with_shell("${HOME}/.config/awesome/lockscr.sh")           end),  -- Lockscreen
        -- awful.key({ modkey, "Shift" }, "s",         function()  awful.util.spawn_with_shell("${HOME}/.config/awesome/chat.sh")              end),  -- open chats program
        awful.key({ modkey,         }, "F2",        function()  awful.util.spawn("sync")    awful.util.spawn("xbacklight -dec 10")          end),  -- Brightness down
        awful.key({ modkey,         }, "F3",        function()  awful.util.spawn("sync")    awful.util.spawn("xbacklight -inc 10")          end),  -- Brightness up
        awful.key({ modkey,         }, "F9",        function()  awful.util.spawn("sync")    awful.util.spawn("amixer sset Master 5%-")      end),  -- Volume Down
        awful.key({ modkey,         }, "F10",       function()  awful.util.spawn("sync")    awful.util.spawn("amixer sset Master 5%+")      end),  -- Volume Up
        awful.key({                 }, "Print",     function()
                awful.util.spawn("scrot 'scr-%Y-%m-%d_%s.png' -e 'mv $f ~/Pictures/screenshot 2>/dev/null'", false)                         end),  -- Screenshot
        awful.key({         "Shift" }, "Print",     function()
                awful.util.spawn_with_shell("sleep 0.2 ; scrot -s 'scr-%Y-%m-%d_%s.png' -e 'mv $f ~/Pictures/screenshot 2>/dev/null'")      end)   -- Screenshot with mouse
    )
    -- Client Key Bindings
    clientkeys = awful.util.table.join(
        awful.key({ modkey, "Shift" }, "c",         function (c) c:kill()                                           end),
        awful.key({ modkey,         }, "n",         function (c) c.minimized = true                                 end),
        awful.key({ modkey,         }, "f",         function (c) c.fullscreen = not c.fullscreen c:raise()          end)
    )

-- TAG BINDINGS ===============================================================

    -- Bind all key numbers to tags.
    -- Be careful: we use keycodes to make it works on any keyboard layout.
    -- This should map on the top row of your keyboard, usually 1 to 9.
    for i = 1, 9 do
        globalkeys = awful.util.table.join(globalkeys,
        -- View tag only.
            awful.key({ modkey }, "#" .. i + 9,
                function ()
                    local screen = awful.screen.focused()   local tag = screen.tags[i]
                    if tag then tag:view_only() end end,
                    {description = "view tag #"..i, group = "tag"}),
            -- Move client to tag.
            awful.key({ modkey, "Shift" }, "#" .. i + 9,
                function ()
                    if client.focus then    local tag = client.focus.screen.tags[i]
                    if tag then client.focus:move_to_tag(tag)   end end end,
                    {description = "move focused client to tag #"..i, group = "tag"})
    )end
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
    { rule = { class = "Firefox" },             properties = { screen = 1, tag = "1" } },
    { rule = { class = "tor browser" },         properties = { screen = 1, tag = "1" } },
    { rule = { class = "Chromium" },            properties = { screen = 1, tag = "1" } },
    -- 
    { rule = { class = "Nemo" },                properties = { screen = 1, tag = "4" } },
    -- 
    { rule = { class = "jetbrains-idea" },      properties = { screen = 1, tag = "5" } },
    { rule = { class = "zathura" },             properties = { screen = 1, tag = "5" } },
    { rule = { class = "db_main" },             properties = { screen = 1, tag = "5" } },
    { rule = { class = "TeXstudio" },           properties = { screen = 1, tag = "5" } },
    { rule = { class = "libreoffice" },         properties = { screen = 1, tag = "5" } },
    { rule = { class = "subl" },                properties = { screen = 1, tag = "5" } },
    { rule = { class = "Eclipse" },             properties = { screen = 1, tag = "5" } },
    -- 
    { rule = { class = "player" },              properties = { screen = 1, tag = "6" } },
    { rule = { class = "genymotion" },          properties = { screen = 1, tag = "6" } },
    { rule = { class = "spotify" },             properties = { screen = 1, tag = "6" } },
    { rule = { class = "steam" },               properties = { screen = 1, tag = "6" } },
    { rule = { class = "Vlc" },                 properties = { screen = 1, tag = "6" } },
    { rule = { class = "Gimp" },                properties = { screen = 1, tag = "6" } },
    -- 
    { rule = { class = "telegram" },            properties = { screen = 1, tag = "7" } },
    { rule = { class = "slack" },               properties = { screen = 1, tag = "7" } },
    { rule = { class = "signal" },              properties = { screen = 1, tag = "7" } },
    -- 
    { rule = { class = "qBittorrent" },         properties = { screen = 1, tag = "9" } },
    { rule = { class = "VirtualBox Manager" },  properties = { scrren = 1, tag = "9" } },
    { rule = { class = "VirtualBox Machine" },  properties = { scrren = 1, tag = "9" } },
    -- 
    { rule = { class = "keepassxc" },           properties = { scrren = 1, tag = "9" } },
}

-- SIGNALS ====================================================================

    -- Signal function to execute when a new client appears.
    -- Set the windows at the slave, i.e. put it at the end of others instead of setting it master. if not awesome.startup then awful.client.setslave(c) end
    client.connect_signal("manage", function (c)    if awesome.startup and  not c.size_hints.user_position  and not c.size_hints.program_position then  awful.placement.no_offscreen(c) end end)
    -- Add a titlebar if titlebars_enabled is set to true in the rules.
    client.connect_signal("request::titlebars", function(c)
        -- buttons for the titlebar
        local buttons = awful.util.table.join(
            awful.button({ }, 1, function() client.focus = c    c:raise()   awful.mouse.client.move(c)      end),
            awful.button({ }, 3, function() client.focus = c    c:raise()   awful.mouse.client.resize(c)    end)    )
        awful.titlebar(c) : setup {
            { awful.titlebar.widget.iconwidget(c),                                      buttons = buttons,  layout  = wibox.layout.fixed.horizontal },  -- Left
            { { align  = "center",  widget = awful.titlebar.widget.titlewidget(c)   },  buttons = buttons,  layout  = wibox.layout.flex.horizontal  },  -- Middle
            { awful.titlebar.widget.stickybutton   (c), awful.titlebar.widget.ontopbutton    (c),           layout = wibox.layout.fixed.horizontal()},  -- Right
            layout = wibox.layout.align.horizontal  }   end)

    -- Enable sloppy focus, so that focus follows mouse.
    client.connect_signal("mouse::enter", function(c)   if awful.layout.get(c.screen) ~= awful.layout.suit.magnifier    and awful.client.focus.filter(c) then   client.focus = c    end end)
    client.connect_signal("focus", function(c) c.border_color = beautiful.border_focus end)
    client.connect_signal("unfocus", function(c) c.border_color = beautiful.border_normal end)

-- STARTUP ====================================================================
