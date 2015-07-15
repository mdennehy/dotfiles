-- Nice and Clean awesome theme
-- By Blazeix, based off of ghost1227's openbox theme.

theme = {}
theme.theme_dir = awful.util.getdir("config") .. "/themes/niceandclean"
theme.wallpaper_cmd = { "awsetbg -a " .. theme.theme_dir .. "/background.jpg" }

theme.font          = "DejavuSansMono-Bold 10"

theme.bg_normal     = "#222222"
theme.bg_focus      = "#d8d8d8"
theme.bg_urgent     = "#d02e54"
theme.bg_minimize   = "#444444"

theme.fg_normal     = "#cccccc"
theme.fg_focus      = "#000000"
theme.fg_urgent     = "#ffffff"
theme.fg_minimize   = "#ffffff"

theme.border_width  = "3"
theme.border_normal = "#000066"
theme.border_focus  = "#999900"
theme.border_marked = "#91231c"

-- There are other variable sets
-- overriding the default one when
-- defined, the sets are:
-- [taglist|tasklist]_[bg|fg]_[focus|urgent]
theme.tasklist_bg_focus   = "#777700"

-- titlebar_[bg|fg]_[normal|focus]
-- tooltip_[font|opacity|fg_color|bg_color|border_width|border_color]
-- mouse_finder_[color|timeout|animate_timeout|radius|factor]
-- Example:
--theme.taglist_bg_focus = "#ff0000"

-- Display the taglist squares
theme.taglist_squares_sel   = theme.theme_dir .. "/taglist/squarefw.png"
theme.taglist_squares_unsel = theme.theme_dir .. "/taglist/squarew.png"

theme.tasklist_floating_icon = theme.theme_dir .. "/tasklist/floatingw.png"

-- Variables set for theming the menu:
-- menu_[bg|fg]_[normal|focus]
-- menu_[border_color|border_width]
theme.menu_submenu_icon = theme.theme_dir .. "/submenu.png"
theme.menu_height = "20"
theme.menu_width  = "180"
theme.menu_border_width = "1"

-- You can add as many variables as
-- you wish and access them by using
-- beautiful.variable in your rc.lua
--theme.bg_widget = "#cc0000"

-- Define the image to load
theme.titlebar_close_button_normal = theme.theme_dir .. "/titlebar/close_normal.png"
theme.titlebar_close_button_focus  = theme.theme_dir .. "/titlebar/close_focus.png"

theme.titlebar_ontop_button_normal_inactive = theme.theme_dir .. "/titlebar/ontop_normal_inactive.png"
theme.titlebar_ontop_button_focus_inactive  = theme.theme_dir .. "/titlebar/ontop_focus_inactive.png"
theme.titlebar_ontop_button_normal_active = theme.theme_dir .. "/titlebar/ontop_normal_active.png"
theme.titlebar_ontop_button_focus_active  = theme.theme_dir .. "/titlebar/ontop_focus_active.png"

theme.titlebar_sticky_button_normal_inactive = theme.theme_dir .. "/titlebar/sticky_normal_inactive.png"
theme.titlebar_sticky_button_focus_inactive  = theme.theme_dir .. "/titlebar/sticky_focus_inactive.png"
theme.titlebar_sticky_button_normal_active = theme.theme_dir .. "/titlebar/sticky_normal_active.png"
theme.titlebar_sticky_button_focus_active  = theme.theme_dir .. "/titlebar/sticky_focus_active.png"

theme.titlebar_floating_button_normal_inactive = theme.theme_dir .. "/titlebar/floating_normal_inactive.png"
theme.titlebar_floating_button_focus_inactive  = theme.theme_dir .. "/titlebar/floating_focus_inactive.png"
theme.titlebar_floating_button_normal_active = theme.theme_dir .. "/titlebar/floating_normal_active.png"
theme.titlebar_floating_button_focus_active  = theme.theme_dir .. "/titlebar/floating_focus_active.png"

theme.titlebar_maximized_button_normal_inactive = theme.theme_dir .. "/titlebar/maximized_normal_inactive.png"
theme.titlebar_maximized_button_focus_inactive  = theme.theme_dir .. "/titlebar/maximized_focus_inactive.png"
theme.titlebar_maximized_button_normal_active = theme.theme_dir .. "/titlebar/maximized_normal_active.png"
theme.titlebar_maximized_button_focus_active  = theme.theme_dir .. "/titlebar/maximized_focus_active.png"


-- You can use your own layout icons like this:
theme.layout_fairh = theme.theme_dir .. "/layouts/fairhw.png"
theme.layout_fairv = theme.theme_dir .. "/layouts/fairvw.png"
theme.layout_floating  = theme.theme_dir .. "/layouts/floatingw.png"
theme.layout_magnifier = theme.theme_dir .. "/layouts/magnifierw.png"
theme.layout_max = theme.theme_dir .. "/layouts/maxw.png"
theme.layout_fullscreen = theme.theme_dir .. "/layouts/fullscreenw.png"
theme.layout_tilebottom = theme.theme_dir .. "/layouts/tilebottomw.png"
theme.layout_tileleft   = theme.theme_dir .. "/layouts/tileleftw.png"
theme.layout_tile = theme.theme_dir .. "/layouts/tilew.png"
theme.layout_tiletop = theme.theme_dir .. "/layouts/tiletopw.png"
theme.layout_spiral  = theme.theme_dir .. "/layouts/spiralw.png"
theme.layout_dwindle = theme.theme_dir .. "/layouts/dwindlew.png"

theme.awesome_icon = theme.theme_dir .. "/awesome16.png"

-- Widget icons
theme.widget_sep = theme.theme_dir .. "/widgets/seperator.png"
theme.widget_cpu = theme.theme_dir .. "/widgets/cpu.png"
theme.widget_temp = theme.theme_dir .. "/widgets/temp.png"
theme.widget_mem = theme.theme_dir .. "/widgets/mem.png"
theme.widget_spkr = theme.theme_dir .. "/widgets/spkr.png"
theme.widget_head = theme.theme_dir .. "/widgets/phones.png"
theme.widget_netdown = theme.theme_dir .. "/widgets/net_down.png"
theme.widget_netup = theme.theme_dir .. "/widgets/net_up.png"
theme.widget_mail = theme.theme_dir .. "/widgets/mail.png"
theme.widget_newmail = theme.theme_dir .. "/widgets/newmail.png"
theme.widget_pacman = theme.theme_dir .. "/widgets/pacman.png"
theme.widget_newpackage = theme.theme_dir .. "/widgets/newpackage.png"
theme.widget_batt_full = theme.theme_dir .. "/widgets/bat_full.png"
theme.widget_batt_low = theme.theme_dir .. "/widgets/bat_low.png"
theme.widget_batt_empty = theme.theme_dir .. "/widgets/bat_empty.png"
theme.widget_clock = theme.theme_dir .. "/widgets/clock.png"
theme.widget_mpd = theme.theme_dir .. "/widgets/note.png"

return theme
