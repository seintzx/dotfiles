-- My awesome theme, based on my xmonad layout

local theme = {}

-- WALLPAPER =================================================================================================================================================================================

-- theme.wallpaper = "/usr/share/awesome/themes/default/background.png"
theme.wallpaper = "~/Pictures/wall/wallpaper.png"

-- FONT ======================================================================================================================================================================================

theme.font          = "Hack 9"

-- COLOR =====================================================================================================================================================================================

-- border
theme.useless_gap   = 0
theme.border_width  = 1
theme.border_normal = "#000000"     --black, non-focused border
theme.border_focus  = "#202020"     --dark grey, focused window border
theme.border_marked = "#00ffff"     --cyan, unknown 

-- taglist
theme.taglist_fg_focus      =   "#00ff00"
theme.taglist_bg_focus      =   "#000000"
theme.taglist_fg_urgent     =   "#ffffff"
theme.taglist_bg_urgent     =   "#ff0000"
theme.taglist_fg_occupied   =   "#ffffff"
theme.taglist_bg_occupied   =   "#000000"
theme.taglist_fg_empty      =   "#7b7b7b"
theme.taglist_bg_empty      =   "#000000"

-- tasklist
theme.tasklist_fg_focus      =   "#00ff00"
theme.tasklist_bg_focus      =   "#000000"
theme.tasklist_fg_urgent     =   "#ffffff"
theme.tasklist_bg_urgent     =   "#ff0000"

-- titlebar
theme.titlebar_fg_focus      =   "#0000ff"
theme.titlebar_bg_focus      =   "#0000ff"
theme.titlebar_fg_normal     =   "#0000ff"
theme.titlebar_bg_normal     =   "#0000ff"

-- TAGLIST SQUARE ============================================================================================================================================================================

-- theme.taglist_squares_sel   = "/usr/share/awesome/themes/default/taglist/squarefw.png"
-- theme.taglist_squares_unsel = "/usr/share/awesome/themes/default/taglist/squarew.png"

-- TITLEBAR BUTTON ===========================================================================================================================================================================

theme.titlebar_close_button_normal = "/usr/share/awesome/themes/default/titlebar/close_normal.png"
theme.titlebar_close_button_focus  = "/usr/share/awesome/themes/default/titlebar/close_focus.png"

theme.titlebar_minimize_button_normal = "/usr/share/awesome/themes/default/titlebar/minimize_normal.png"
theme.titlebar_minimize_button_focus  = "/usr/share/awesome/themes/default/titlebar/minimize_focus.png"

theme.titlebar_ontop_button_normal_inactive = "/usr/share/awesome/themes/default/titlebar/ontop_normal_inactive.png"
theme.titlebar_ontop_button_focus_inactive  = "/usr/share/awesome/themes/default/titlebar/ontop_focus_inactive.png"
theme.titlebar_ontop_button_normal_active = "/usr/share/awesome/themes/default/titlebar/ontop_normal_active.png"
theme.titlebar_ontop_button_focus_active  = "/usr/share/awesome/themes/default/titlebar/ontop_focus_active.png"

theme.titlebar_sticky_button_normal_inactive = "/usr/share/awesome/themes/default/titlebar/sticky_normal_inactive.png"
theme.titlebar_sticky_button_focus_inactive  = "/usr/share/awesome/themes/default/titlebar/sticky_focus_inactive.png"
theme.titlebar_sticky_button_normal_active = "/usr/share/awesome/themes/default/titlebar/sticky_normal_active.png"
theme.titlebar_sticky_button_focus_active  = "/usr/share/awesome/themes/default/titlebar/sticky_focus_active.png"

theme.titlebar_floating_button_normal_inactive = "/usr/share/awesome/themes/default/titlebar/floating_normal_inactive.png"
theme.titlebar_floating_button_focus_inactive  = "/usr/share/awesome/themes/default/titlebar/floating_focus_inactive.png"
theme.titlebar_floating_button_normal_active = "/usr/share/awesome/themes/default/titlebar/floating_normal_active.png"
theme.titlebar_floating_button_focus_active  = "/usr/share/awesome/themes/default/titlebar/floating_focus_active.png"

theme.titlebar_maximized_button_normal_inactive = "/usr/share/awesome/themes/default/titlebar/maximized_normal_inactive.png"
theme.titlebar_maximized_button_focus_inactive  = "/usr/share/awesome/themes/default/titlebar/maximized_focus_inactive.png"
theme.titlebar_maximized_button_normal_active = "/usr/share/awesome/themes/default/titlebar/maximized_normal_active.png"
theme.titlebar_maximized_button_focus_active  = "/usr/share/awesome/themes/default/titlebar/maximized_focus_active.png"

-- LAYOUT IMAGE ==============================================================================================================================================================================

theme.layout_fairh = "/usr/share/awesome/themes/default/layouts/fairhw.png"
theme.layout_fairv = "/usr/share/awesome/themes/default/layouts/fairvw.png"
theme.layout_floating  = "/usr/share/awesome/themes/default/layouts/floatingw.png"
theme.layout_magnifier = "/usr/share/awesome/themes/default/layouts/magnifierw.png"
theme.layout_max = "/usr/share/awesome/themes/default/layouts/maxw.png"
theme.layout_fullscreen = "/usr/share/awesome/themes/default/layouts/fullscreenw.png"
theme.layout_tilebottom = "/usr/share/awesome/themes/default/layouts/tilebottomw.png"
theme.layout_tileleft   = "/usr/share/awesome/themes/default/layouts/tileleftw.png"
theme.layout_tile = "/usr/share/awesome/themes/default/layouts/tilew.png"
theme.layout_tiletop = "/usr/share/awesome/themes/default/layouts/tiletopw.png"
theme.layout_spiral  = "/usr/share/awesome/themes/default/layouts/spiralw.png"
theme.layout_dwindle = "/usr/share/awesome/themes/default/layouts/dwindlew.png"
theme.layout_cornernw = "/usr/share/awesome/themes/default/layouts/cornernww.png"
theme.layout_cornerne = "/usr/share/awesome/themes/default/layouts/cornernew.png"
theme.layout_cornersw = "/usr/share/awesome/themes/default/layouts/cornersww.png"
theme.layout_cornerse = "/usr/share/awesome/themes/default/layouts/cornersew.png"

theme.awesome_icon = "/usr/share/awesome/icons/awesome16.png"

-- WIDGET IMAGE ==============================================================================================================================================================================

theme.widget_ac                     = "/usr/share/awesome/icons/iconjak/ac.png"
theme.widget_battery                = "/usr/share/awesome/icons/iconjak/battery.png"
theme.widget_battery_low            = "/usr/share/awesome/icons/iconjak/battery_low.png"
theme.widget_battery_empty          = "/usr/share/awesome/icons/iconjak/battery_empty.png"
theme.widget_mem                    = "/usr/share/awesome/icons/iconjak/mem.png"
theme.widget_cpu                    = "/usr/share/awesome/icons/iconjak/cpu.png"
theme.widget_temp                   = "/usr/share/awesome/icons/iconjak/temp.png"
theme.widget_net                    = "/usr/share/awesome/icons/iconjak/net.png"
theme.widget_hdd                    = "/usr/share/awesome/icons/iconjak/hdd.png"
theme.widget_music                  = "/usr/share/awesome/icons/iconjak/note.png"
theme.widget_music_on               = "/usr/share/awesome/icons/iconjak/note_on.png"
theme.widget_vol                    = "/usr/share/awesome/icons/iconjak/vol.png"
theme.widget_vol_low                = "/usr/share/awesome/icons/iconjak/vol_low.png"
theme.widget_vol_no                 = "/usr/share/awesome/icons/iconjak/vol_no.png"
theme.widget_vol_mute               = "/usr/share/awesome/icons/iconjak/vol_mute.png"
theme.widget_mail                   = "/usr/share/awesome/icons/iconjak/mail.png"
theme.widget_mail_on                = "/usr/share/awesome/icons/iconjak/mail_on.png"

-- ICON THEME =============================================================================================================================================================================== 
-- Define the icon theme for application icons. If not set then the icons
-- from /usr/share/icons and /usr/share/icons/hicolor will be used.
theme.icon_theme = nil

return theme
