--[[
     This is the original Powerarrow Dark Awesome WM theme by github.com/lcpz
     I have modified it to my own like.
--]]
local gears     = require("gears")
local lain      = require("lain")
local awful     = require("awful")
local wibox     = require("wibox")
local watch     = require("awful.widget.watch")
local beautiful = require("beautiful")
local os        = { getenv = os.getenv }
local my_table  = awful.util.table or gears.table -- 4.{0,1} compatibility
local markup    = lain.util.markup
local separator = lain.util.separators

local theme                                     = {}
theme.dir                                       = os.getenv("HOME") .. "/.config/awesome"
theme.wallpaper                                 = os.getenv("HOME") .. "/Pictures/wall/wallpaper.png"
theme.font                                      = "Hack 9"

theme.fg_normal                                 = "#DDDDFF"
theme.fg_focus                                  = "#EA6F81"
theme.fg_urgent                                 = "#CC9393"
theme.bg_normal                                 = "#1A1A1A"
theme.bg_focus                                  = "#313131"
theme.bg_urgent                                 = "#1A1A1A"

theme.useless_gap                               = 0
theme.border_width                              = 1
theme.border_normal                             = "#3F3F3F"
theme.border_focus                              = "#7F7F7F"
theme.border_marked                             = "#CC9393"

theme.tasklist_bg_focus                         = "#1A1A1A"
theme.tasklist_plain_task_name                  = true
theme.tasklist_disable_icon                     = true

theme.titlebar_bg_focus                         = theme.bg_focus
theme.titlebar_bg_normal                        = theme.bg_normal
theme.titlebar_fg_focus                         = theme.fg_focus

theme.menu_height                               = 16
theme.menu_width                                = 140
theme.menu_submenu_icon                         = theme.dir .. "/icons/submenu.png"

theme.taglist_squares_sel                       = theme.dir .. "/icons/square_sel.png"
theme.taglist_squares_unsel                     = theme.dir .. "/icons/square_unsel.png"

theme.layout_tile                               = theme.dir .. "/icons/tile.png"
theme.layout_tileleft                           = theme.dir .. "/icons/tileleft.png"
theme.layout_tilebottom                         = theme.dir .. "/icons/tilebottom.png"
theme.layout_tiletop                            = theme.dir .. "/icons/tiletop.png"
theme.layout_fairv                              = theme.dir .. "/icons/fairv.png"
theme.layout_fairh                              = theme.dir .. "/icons/fairh.png"
theme.layout_spiral                             = theme.dir .. "/icons/spiral.png"
theme.layout_dwindle                            = theme.dir .. "/icons/dwindle.png"
theme.layout_max                                = theme.dir .. "/icons/max.png"
theme.layout_fullscreen                         = theme.dir .. "/icons/fullscreen.png"
theme.layout_magnifier                          = theme.dir .. "/icons/magnifier.png"
theme.layout_floating                           = theme.dir .. "/icons/floating.png"

theme.widget_ac                                 = theme.dir .. "/icons/ac.png"
theme.widget_battery                            = theme.dir .. "/icons/battery.png"
theme.widget_battery_low                        = theme.dir .. "/icons/battery_low.png"
theme.widget_battery_empty                      = theme.dir .. "/icons/battery_empty.png"
theme.widget_mem                                = theme.dir .. "/icons/mem.png"
theme.widget_cpu                                = theme.dir .. "/icons/cpu.png"
theme.widget_temp                               = theme.dir .. "/icons/temp.png"
theme.widget_net                                = theme.dir .. "/icons/net.png"
theme.widget_net_wired                          = theme.dir .. "/icons/net_wired.png"
theme.widget_con_on                             = theme.dir .. "/icons/internet.png"
theme.widget_con_of                             = theme.dir .. "/icons/internet_na.png"
theme.widget_hdd                                = theme.dir .. "/icons/hdd.png"
theme.widget_music                              = theme.dir .. "/icons/note.png"
theme.widget_music_on                           = theme.dir .. "/icons/note_on.png"
theme.widget_vol                                = theme.dir .. "/icons/vol.png"
theme.widget_vol_low                            = theme.dir .. "/icons/vol_low.png"
theme.widget_vol_no                             = theme.dir .. "/icons/vol_no.png"
theme.widget_vol_mute                           = theme.dir .. "/icons/vol_mute.png"
theme.widget_mail                               = theme.dir .. "/icons/mail.png"
theme.widget_mail_on                            = theme.dir .. "/icons/mail_on.png"

theme.titlebar_close_button_focus               = theme.dir .. "/icons/titlebar/close_focus.png"
theme.titlebar_close_button_normal              = theme.dir .. "/icons/titlebar/close_normal.png"
theme.titlebar_ontop_button_focus_active        = theme.dir .. "/icons/titlebar/ontop_focus_active.png"
theme.titlebar_ontop_button_normal_active       = theme.dir .. "/icons/titlebar/ontop_normal_active.png"
theme.titlebar_ontop_button_focus_inactive      = theme.dir .. "/icons/titlebar/ontop_focus_inactive.png"
theme.titlebar_ontop_button_normal_inactive     = theme.dir .. "/icons/titlebar/ontop_normal_inactive.png"
theme.titlebar_sticky_button_focus_active       = theme.dir .. "/icons/titlebar/sticky_focus_active.png"
theme.titlebar_sticky_button_normal_active      = theme.dir .. "/icons/titlebar/sticky_normal_active.png"
theme.titlebar_sticky_button_focus_inactive     = theme.dir .. "/icons/titlebar/sticky_focus_inactive.png"
theme.titlebar_sticky_button_normal_inactive    = theme.dir .. "/icons/titlebar/sticky_normal_inactive.png"
theme.titlebar_floating_button_focus_active     = theme.dir .. "/icons/titlebar/floating_focus_active.png"
theme.titlebar_floating_button_normal_active    = theme.dir .. "/icons/titlebar/floating_normal_active.png"
theme.titlebar_floating_button_focus_inactive   = theme.dir .. "/icons/titlebar/floating_focus_inactive.png"
theme.titlebar_floating_button_normal_inactive  = theme.dir .. "/icons/titlebar/floating_normal_inactive.png"
theme.titlebar_maximized_button_focus_active    = theme.dir .. "/icons/titlebar/maximized_focus_active.png"
theme.titlebar_maximized_button_normal_active   = theme.dir .. "/icons/titlebar/maximized_normal_active.png"
theme.titlebar_maximized_button_focus_inactive  = theme.dir .. "/icons/titlebar/maximized_focus_inactive.png"
theme.titlebar_maximized_button_normal_inactive = theme.dir .. "/icons/titlebar/maximized_normal_inactive.png"

-- clock
local clockicon = wibox.widget.imagebox(theme.widget_clock)
local clock = awful.widget.watch(
    "date +'%y-%m-%d %a, %I:%M %p'", 60,
    function(widget, stdout)
        widget:set_markup(" " .. markup.font(theme.font, stdout))
    end
)

-- calendar
theme.cal = lain.widget.calendar({
    attach_to = { clock },
    notification_preset = {
        font = theme.font,
        fg   = theme.fg_normal,
        bg   = theme.bg_normal
    }
})

-- mem
local memicon = wibox.widget.imagebox(theme.widget_mem)
local mem = lain.widget.mem({
    settings = function()
        widget:set_markup(markup.font(theme.font, " " .. mem_now.perc .. "% "))
    end
})

-- cpu
local cpuicon = wibox.widget.imagebox(theme.widget_cpu)
local cpu = lain.widget.cpu({
    settings = function()
        widget:set_markup(markup.font(theme.font, " " .. cpu_now.usage .. "% "))
    end
})

-- coretemp
local tempicon = wibox.widget.imagebox(theme.widget_temp)
local temp = lain.widget.temp({
    settings = function()
        widget:set_markup(markup.font(theme.font, " " .. coretemp_now .. "°C "))
    end
})

-- battery
local baticon = wibox.widget.imagebox(theme.widget_battery)
local bat = lain.widget.bat({
    -- /sys/class/power_supply
    battery = "BAT0",
    ac = "ACAD",
    n_perc = {20, 50},
    settings = function()
        if bat_now.status ~= "N/A" then
            if bat_now.ac_status == 1 then
                widget:set_markup(markup.font(theme.font, " AC "))
                baticon:set_image(theme.widget_ac)
                return
            elseif not bat_now.perc and tonumber(bat_now.perc) <= 20 then
                baticon:set_image(theme.widget_battery_empty)
            elseif not bat_now.perc and tonumber(bat_now.perc) <= 50 then
                baticon:set_image(theme.widget_battery_low)
            else
                baticon:set_image(theme.widget_battery)
            end
            widget:set_markup(markup.font(theme.font, " " .. bat_now.perc .. "% "))
        else
            widget:set_markup(markup.font(theme.font, " AC "))
            baticon:set_image(theme.widget_ac)
        end
    end
})

-- volume
local volicon = wibox.widget.imagebox(theme.widget_vol)
theme.volume = lain.widget.alsa({
    settings = function()
        if volume_now.status == "off" then
            volicon:set_image(theme.widget_vol_mute)
        elseif tonumber(volume_now.level) == 0 then
            volicon:set_image(theme.widget_vol_no)
        elseif tonumber(volume_now.level) <= 50 then
            volicon:set_image(theme.widget_vol_low)
        else
            volicon:set_image(theme.widget_vol)
        end
        widget:set_markup(markup.font(theme.font, " " .. volume_now.level .. "% "))
    end
})

-- keyboard
mykdblayout_icon = wibox.widget.textbox("   ")
mykbdlayout = awful.widget.keyboardlayout()

-- wifi
local timer = 1
local WIFI_COMMAND = "awk 'NR==3 {printf \"%3.0f\" ,($3/70)*100}' /proc/net/wireless " -- ; echo -n \" \" ; iwgetid -r"
local wifi_widget = wibox.widget {
    {
        id = "icon",
        widget = wibox.widget.imagebox,
    },
    {
        id = 'wifi',
        widget = wibox.widget.textbox,
        font = theme.font
    },
    layout = wibox.layout.align.horizontal,
    set_status = function(self, mod)
        if (mod) then
            self.icon.image = theme.widget_net
        end
    end,
    set_text = function(self, path)
        self.wifi.markup = path
    end,
}
local update_wifi = function(widget, stdout, _, _, _)
    local signal = tonumber( stdout )
    if (stdout == nil) then
        widget:set_text("N/A")
        widget:set_status(false)
        widget:set_visible(false)
    else
        widget:set_text(string.format("%d%% ", signal))
        widget:set_status(true)
        widget:set_visible(true)
    end
end
watch(WIFI_COMMAND, timer, update_wifi, wifi_widget)

-- wired
local interface = "eno1"
local WIRE_COMMAND = "bash -c \"ip link show "..interface.." | awk 'NR==1 {printf \\\"%s\\\", $9}'\""
local wire_widget = wibox.widget {
    {
        id = "icon",
        widget = wibox.widget.imagebox,
    },
    {
        id = 'wire',
        widget = wibox.widget.textbox,
        font = theme.font
    },
    layout = wibox.layout.align.horizontal,
    set_status = function(self, mod)
        if (mod) then
            self.icon.image = theme.widget_net_wired
        end
    end,
    set_text = function(self, path)
        self.wire.markup = path
    end,
}
local update_wire = function(widget, stdout, _, _, _)
    local status = stdout:sub(1, stdout:len() - 1)
    if (state == "DOWN") then
        widget:set_text(string.format(" %s", string.lower(state)))
        widget:set_visible(false)
        widget:set_status(false)
    else
        widget:set_text(string.format(" %s", string.lower(state)))
        widget:set_visible(true)
        widget:set_status(true)
    end
end
watch(WIRE_COMMAND, timer, update_wire, wire_widget)

-- spotify
local time = 5
local SPOTIFY_SONG = 'sp current-oneline'
-- local SPOTIFY_SONG = 'sp current-song'
local SPOTIFY_ARTI = 'sp current-artist'
local spotify_widget = wibox.widget {
    {
        id = "icon",
        widget = wibox.widget.imagebox,
    },
    {
        id = 'current_song',
        widget = wibox.widget.textbox,
        font = theme.font
    },
    layout = wibox.layout.align.horizontal,
    set_status = function(self, is_playing)
        if (is_playing) then
            self.icon.image = theme.widget_music_on
        else
            self.icon.image = theme.widget_music
        end
    end,
    set_text = function(self, path)
        self.current_song.markup = path
    end,
}
local update_spotify = function(widget, stdout, _, _, _)
    if string.find(stdout, 'Error: Spotify is not running.') ~= nil then
        widget:set_text('')
        widget:set_status(false)
    else
        widget:set_text(stdout)
        widget:set_status(true)
    end
end
-- watch(SPOTIFY_ARTI, time, update_spotify, spotify_widget)
watch(SPOTIFY_SONG, time, update_spotify, spotify_widget)

-- separator
local spr     = wibox.widget.textbox(' ')
local arrl_dl = separator.arrow_left(theme.bg_focus, "alpha")
local arrl_ld = separator.arrow_left("alpha", theme.bg_focus)

function theme.at_screen_connect(s)
    -- If wallpaper is a function, call it with the screen
    local wallpaper = theme.wallpaper
    if type(wallpaper) == "function" then
        wallpaper = wallpaper(s)
    end
    gears.wallpaper.maximized(wallpaper, s, true)

    -- Quake application
    s.quake = lain.util.quake({ app = awful.util.terminal })
    -- Tags
    awful.tag(awful.util.tagnames, s, awful.layout.layouts[1])
    -- Create a promptbox for each screen
    s.mypromptbox = awful.widget.prompt()
    -- Create an imagebox widget which will contains an icon indicating which layout we're using.
    -- We need one layoutbox per screen.
    s.mylayoutbox = awful.widget.layoutbox(s)
    -- Create a taglist widget
    s.mytaglist = awful.widget.taglist(s, awful.widget.taglist.filter.all, awful.util.taglist_buttons)
    -- Create a tasklist widget
    s.mytasklist = awful.widget.tasklist(s, awful.widget.tasklist.filter.minimizedcurrenttags, awful.util.tasklist_buttons)
    -- Create the wibox
    s.mywibox = awful.wibar({ position = "top", screen = s, height = 18, bg = theme.bg_normal, fg = theme.fg_normal })
    -- Add widgets to the wibox
    s.mywibox:setup {
        layout = wibox.layout.align.horizontal,
        { -- Left widgets
            layout = wibox.layout.fixed.horizontal,
            s.mytaglist,
            s.mypromptbox,
        },
        s.mytasklist, -- Middle widget
        { -- Right widgets
            layout = wibox.layout.fixed.horizontal,
            -- wibox.widget.systray(),
            arrl_ld,
            wibox.container.background(spotify_widget, theme.bg_focus),
            arrl_dl, volicon, theme.volume.widget, arrl_ld,
            wibox.container.background(tempicon, theme.bg_focus),
            wibox.container.background(temp.widget, theme.bg_focus),
            wibox.container.background(cpuicon, theme.bg_focus),
            wibox.container.background(cpu.widget, theme.bg_focus),
            arrl_dl, memicon, mem.widget, arrl_ld,
            wibox.container.background(wire_widget, theme.bg_focus),
            wibox.container.background(wifi_widget, theme.bg_focus),
            arrl_dl, mykdblayout_icon, mykbdlayout, arrl_ld,
            wibox.container.background(baticon, theme.bg_focus),
            wibox.container.background(bat.widget, theme.bg_focus),
            arrl_dl, clock, spr, arrl_ld,
            wibox.container.background(s.mylayoutbox, theme.bg_focus),
        },
    }
end
return theme
