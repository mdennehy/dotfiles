-- Standard awesome library
require("awful")
require("awful.autofocus")
require("awful.rules")
-- Theme handling library
require("beautiful")
-- Notification library
require("naughty")
require("vicious")

-- Load Debian menu entries
require("debian.menu")
--require("menubar")
-- menubar.cache_entries = true
-- menubar.app_folders = { "/usr/share/applications/" }
-- menubar.show_categories = true

-- {{{ Error handling
-- Check if awesome encountered an error during startup and fell back to
-- another config (This code will only ever execute for the fallback config)
if awesome.startup_errors then
    naughty.notify({ preset = naughty.config.presets.critical,
                     title = "Oops, there were errors during startup!",
                     text = awesome.startup_errors })
end

-- Handle runtime errors after startup
do
    local in_error = false
    awesome.add_signal("debug::error", function (err)
        -- Make sure we don't go into an endless error loop
        if in_error then return end
        in_error = true

        naughty.notify({ preset = naughty.config.presets.critical,
                         title = "Oops, an error happened!",
                         text = err })
        in_error = false
    end)
end
-- }}}

-- If we have another screen attached, set it up
awful.util.spawn_with_shell("/home/mdennehy/bin/screensetup")

-- {{{ Variable definitions
-- Themes define colours, icons, and wallpapers
beautiful.init("/home/mdennehy/.config/awesome/themes/niceandclean/theme.lua")

-- This is used later as the default terminal and editor to run.
terminal = "x-terminal-emulator"
terminal_opts = " -bg black -fg WhiteSmoke -cr yellow -bd gray -geometry 100x24 -vb -sl 10000 +sb -st -tr -sh 90 -fade 30 -tint DarkGreen -tn rxvt " 
wide_terminal_opts = " -bg black -fg WhiteSmoke -cr yellow -bd gray -geometry 132x52 -vb -sl 10000 +sb -st -tr -sh 90 -fade 30 -tint DarkGreen -tn rxvt -fn '-*-terminus-*-r-*-*-12-*-*-*-*-*-*-*' " 
mutt_terminal_opts = " -bg black -fg WhiteSmoke -cr yellow -bd gray -geometry 132x52 -vb -sl 10000 +sb -st -tr -sh 90 -fade 30 -tint DarkGreen -tn rxvt -fn 'xft:Inconsolata:size=14' -e mutt -y" 
ssh_terminal_opts = " -bg black -fg WhiteSmoke -cr yellow -bd gray -geometry 100x24 -vb -sl 10000 +sb -st -tr -sh 90 -fade 30 -tint SlateGray -tn rxvt -e ssh -X " 
ssh_terminal_opts_aix = " -bg black -fg WhiteSmoke -cr yellow -bd gray -geometry 100x24 -vb -sl 10000 +sb -st -tr -sh 90 -fade 30 -tint SlateGray -tn xterm -e ssh -X " 
editor = os.getenv("EDITOR") or "editor"
editor_cmd = terminal .. " -e " .. editor
visual_editor_cmd = "gvim"

vimwiki_cmd = "/usr/bin/gvim -U /home/mdennehy/vimwiki/.gvimrc -c 'call vimwiki#base#goto_index(v:count1)'"

screenshot_cmd = "/usr/bin/ksnapshot"

-- Default modkey.
-- Usually, Mod4 is the key with a logo between Control and Alt.
-- If you do not like this or do not have such a key,
-- I suggest you to remap Mod4 to another key using xmodmap or other tools.
-- However, you can use another modifier like Mod1, but it may interact with others.
modkey = "Mod4"

-- Table of layouts to cover with awful.layout.inc, order matters.
layouts =
{
    awful.layout.suit.fair,
    awful.layout.suit.fair.horizontal,
    awful.layout.suit.tile,
    awful.layout.suit.tile.left,
    awful.layout.suit.tile.bottom,
    awful.layout.suit.tile.top,
    awful.layout.suit.max,
    awful.layout.suit.floating
}
-- }}}

-- {{{ Tags
-- Define a tag table which hold all screen tags.
tags = {}
for s = 1, screen.count() do
    -- Each screen has its own tag table.
    tags[s] = awful.tag({ "www", 2, 3, 4, 5, 6, 7, "comms", "sys" }, s, layouts[1])
end
-- }}}

-- Local config file
local hostname = awful.util.pread('hostname -s'):gsub('\n', '')
local host_config_file = awful.util.getdir('config') .. '/rc.' .. hostname .. '.lua'

print(hostname);
print(host_config_file);


if awful.util.file_readable(host_config_file) then
   local host_config_function, host_config_load_error
   host_config_function, host_config_load_error = loadfile(host_config_file)
   if not host_config_load_error then
      host_config_function()
   else
      print(string.format('[awesome] Failed to load %s: %s', host_config_file, host_config_load_error))
   end
end


-- {{{ Widgets

-- Containers
topbar = {}
bottombar = {}

-- Generic widgets
clock = awful.widget.textclock({align = "right"}, "%a %b %d (week %V), %R %Z")
mysystray = widget({ type = "systray" })
seperator = widget({ type = "textbox" })
seperator.text = " | "
spacer = widget({ type = "textbox" })
spacer.width = 6

-- Set all the icons needed
loadicon = widget ({type = "textbox" })
loadicon.bg_image = image(beautiful.widget_cpu)
loadicon.bg_align = "middle"
loadicon.width = 8
cpuicon = widget ({ type = "textbox" })
cpuicon.bg_image = image(beautiful.widget_cpu) 
cpuicon.bg_align = "middle"
cpuicon.width = 8
tempicon = widget ({ type = "textbox" })
tempicon.bg_image = image(beautiful.widget_temp)
tempicon.bg_align = "middle"
tempicon.width = 8
memicon = widget ({ type = "textbox" })
memicon.bg_image = image(beautiful.widget_mem)
memicon.bg_align = "middle"
memicon.width = 8
spkricon = widget ({ type = "textbox" })
spkricon.bg_image = image(beautiful.widget_spkr)
spkricon.bg_align = "middle"
spkricon.width = 8
netdownicon = widget ({ type = "textbox" })
netdownicon.bg_image = image(beautiful.widget_netdown)
netdownicon.bg_align = "middle"
netdownicon.width = 8
netupicon = widget ({ type = "textbox" })
netupicon.bg_image = image(beautiful.widget_netup)
netupicon.bg_align = "middle"
netupicon.width = 8
mailicon = widget ({ type = "textbox" })
mailicon.bg_image = image(beautiful.widget_mail)
mailicon.bg_align = "middle"
mailicon.width = 8
pacicon = widget ({ type = "textbox" })
pacicon.bg_image = image(beautiful.widget_pacman)
pacicon.bg_align = "middle"
pacicon.width = 8
-- batticon = widget ({ type = "textbox" })
-- batticon.bg_image = image(beautiful.widget_batt_full)
-- batticon.bg_align = "middle"
-- batticon.width = 8
clockicon = widget ({ type = "textbox" })
clockicon.bg_image = image(beautiful.widget_clock)
clockicon.bg_align = "middle"
clockicon.width = 8
mpdicon = widget ({ type = "textbox" })
mpdicon.bg_align = "middle"

-- Create some widgets...
loadinfo = widget ({ type = "textbox" })
cpuinfo = widget ({ type = "textbox" })
cputemp = widget ({ type = "textbox" })
meminfo = widget ({ type = "textbox" })
spkrinfo = widget ({ type = "textbox" })
netdowninfo = widget ({ type = "textbox" })
netupinfo = widget ({ type = "textbox" })
mailinfo = widget ({ type = "textbox" })
pacinfo = widget ({ type = "textbox" })
--  battinfo = widget ({ type = "textbox" })
mpdinfo = widget ({ type = "textbox" })

-- ... And register them
vicious.register(loadinfo, vicious.widgets.uptime, "Load $4 / $5 / $6")
vicious.register(cpuinfo, vicious.widgets.cpu, "CPU $1% / $2%")
vicious.register(cputemp, vicious.widgets.thermal, "$1 C", 19, "thermal_zone0")
vicious.cache(vicious.widgets.mem)
vicious.register(meminfo, vicious.widgets.mem, "$1% ($2Mb)", 5)
vicious.cache(vicious.widgets.volume)
vicious.register(spkrinfo, vicious.widgets.volume, "$1", 11, "Master", "HDA ATI SB")
vicious.cache(vicious.widgets.net)
vicious.register(netdowninfo, vicious.widgets.net, "${wlan0 down_kb}", 3)
vicious.register(netupinfo, vicious.widgets.net, "${wlan0 up_kb}", 3)
vicious.register(mailinfo, vicious.widgets.gmail,
  function (widget, args)
    if args["{count}"] == 0 then
      mailicon.bg_image = image(beautiful.widget_mail)
      return 0
    else
      mailicon.bg_image = image(beautiful.widget_newmail)
      return args["{count}"]
    end
  end, 61)
vicious.register(pacinfo, vicious.widgets.pkg,
  function (widget, args)
    if args[1] == 0 then
      pacicon.bg_image = image(beautiful.widget_pacman)
      return 0
    else
      pacicon.bg_image = image(beautiful.widget_newpackage)
      return args[1]
    end
  end, 301, "Arch")
--  vicious.register(battinfo, vicious.widgets.bat,
--    function (widget, args)
--      if args[2] < 25 then
--        batticon.bg_image = image(beautiful.widget_batt_empty)
--        return args[2]
--      elseif args[2] < 50 then
--        batticon.bg_image = image(beautiful.widget_batt_low)
--        return args[2]
--      else
--        batticon.bg_image = image(beautiful.widget_batt_full)
--        return args[2]
--      end
--    end, 59, "BAT0")

-- MPD widget. Hides icon and text when nothing is playing.
vicious.register(mpdinfo, vicious.widgets.mpd,
  function (widget, args)
    if args["{state}"] == "Stop" then
      mpdicon.bg_image = nil
      mpdicon.width = 0 
      return ""
    else
      mpdicon.bg_image = image(beautiful.widget_mpd)
      mpdicon.width = 8
      return "MPD: " .. args["{Artist}"] .. ' - ' .. args["{Title}"]
    end
  end)


-- {{{ Menu
-- Create a laucher widget and a main menu
myawesomemenu = {
   { "manual", terminal .. " -e man awesome" },
   { "edit config", visual_editor_cmd .. " " .. awesome.conffile },
   { "restart", awesome.restart },
   { "quit", awesome.quit }
}

home_ssh_menu = {
   { "Djinn", terminal .. terminal_opts .. " -e ssh -X djinn" },
   { "StochasticGeometry", terminal .. terminal_opts .. " -e ssh -X stochasticgeometry.ie" }
}

mymainmenu = awful.menu({ items = { { "awesome", myawesomemenu, beautiful.awesome_icon },
                                    { "Debian", debian.menu.Debian_menu.Debian },
                                    { "eMail", terminal .. mutt_terminal_opts },
                                    { "Google Chrome", "/opt/google/chrome/google-chrome"},
                                    { "Firefox", "/usr/bin/firefox"},
                                    { "Epiphany", "/usr/bin/epiphany"},
                                    { "KdenLive", "/usr/bin/kdenlive"},
                                    { "Servers", home_ssh_menu },
                                    { "open terminal", terminal .. terminal_opts },
                                    { "open wide terminal", terminal .. wide_terminal_opts },
                                    { "VimWiki",vimwiki_cmd }
                                  }
                        })

mylauncher = awful.widget.launcher({ image = image(beautiful.awesome_icon),
                                     menu = mymainmenu })
-- }}}

-- {{{ Wibox
-- Create a textclock widget
mytextclock = awful.widget.textclock({ align = "right" })

-- Create a systray
mysystray = widget({ type = "systray" })

-- Create a wibox for each screen and add it
topwibox = {}
bottomwibox = {}
mypromptbox = {}
mylayoutbox = {}
mytaglist = {}
mytaglist.buttons = awful.util.table.join(
                    awful.button({ }, 1, awful.tag.viewonly),
                    awful.button({ modkey }, 1, awful.client.movetotag),
                    awful.button({ }, 3, awful.tag.viewtoggle),
                    awful.button({ modkey }, 3, awful.client.toggletag),
                    awful.button({ }, 4, awful.tag.viewnext),
                    awful.button({ }, 5, awful.tag.viewprev)
                    )
mytasklist = {}
mytasklist.buttons = awful.util.table.join(
                     awful.button({ }, 1, function (c)
                                              if c == client.focus then
                                                  c.minimized = true
                                              else
                                                  if not c:isvisible() then
                                                      awful.tag.viewonly(c:tags()[1])
                                                  end
                                                  -- This will also un-minimize
                                                  -- the client, if needed
                                                  client.focus = c
                                                  c:raise()
                                              end
                                          end),
                     awful.button({ }, 3, function ()
                                              if instance then
                                                  instance:hide()
                                                  instance = nil
                                              else
                                                  instance = awful.menu.clients({ width=250 })
                                              end
                                          end),
                     awful.button({ }, 4, function ()
                                              awful.client.focus.byidx(1)
                                              if client.focus then client.focus:raise() end
                                          end),
                     awful.button({ }, 5, function ()
                                              awful.client.focus.byidx(-1)
                                              if client.focus then client.focus:raise() end
                                          end))

for s = 1, screen.count() do
    awful.screen.padding( screen[s], {top = 3, bottom = 3} )
    -- Create a promptbox for each screen
    mypromptbox[s] = awful.widget.prompt({ layout = awful.widget.layout.horizontal.leftright })
    -- Create an imagebox widget which will contains an icon indicating which layout we're using.
    -- We need one layoutbox per screen.
    mylayoutbox[s] = awful.widget.layoutbox(s)
    mylayoutbox[s]:buttons(awful.util.table.join(
                           awful.button({ }, 1, function () awful.layout.inc(layouts, 1) end),
                           awful.button({ }, 3, function () awful.layout.inc(layouts, -1) end),
                           awful.button({ }, 4, function () awful.layout.inc(layouts, 1) end),
                           awful.button({ }, 5, function () awful.layout.inc(layouts, -1) end)))
    -- Create a taglist widget
    mytaglist[s] = awful.widget.taglist(s, awful.widget.taglist.label.all, mytaglist.buttons)

    -- Create a tasklist widget
    mytasklist[s] = awful.widget.tasklist(function(c)
                                              return awful.widget.tasklist.label.currenttags(c, s)
                                          end, mytasklist.buttons)

    -- Create the wiboxes
    topwibox[s] = awful.wibox({ position = "top", 
                                 screen = s,
                                 border_width = 0,
                                 border_color = beautiful.border_normal})
    bottomwibox[s] = awful.wibox({ position = "bottom", 
                                 screen = s,
                                 border_width = 0,
                                 border_color = beautiful.border_normal})
    topwibox[s].widgets = {
    -- Add widgets to the wibox - order matters
        {
            mylauncher,
            spacer,
            mytaglist[s],
            seperator,
            spacer,
            mypromptbox[s],
            spacer,
            seperator,
            spacer,
            layout = awful.widget.layout.horizontal.leftright
        },
        mylayoutbox[s],
         spacer,
        s == 1 and mysystray or nil,
         spacer,
        mytasklist[s],
         spacer,
        layout = awful.widget.layout.horizontal.rightleft
    }
    bottomwibox[s].widgets = {
        clock, spacer,
        clockicon, seperator, 
--        battinfo, spacer, 
--        batticon, seperator,
        mailinfo, spacer,
        mailicon, seperator, 
        netdowninfo, spacer, 
        netdownicon, spacer, 
        netupinfo, spacer, 
        netupicon, seperator,
        spkrinfo, spacer, 
        spkricon, seperator,
        meminfo, spacer, 
        memicon, seperator, 
        cputemp, spacer, 
        tempicon, seperator, 
        cpuinfo, spacer, 
        cpuicon, seperator, 
        loadinfo, spacer,
        cpuicon, 
        layout = awful.widget.layout.horizontal.rightleft
    }
end
-- }}}

-- {{{ Mouse bindings
root.buttons(awful.util.table.join(
    awful.button({ }, 3, function () mymainmenu:toggle() end),
    awful.button({ }, 4, awful.tag.viewnext),
    awful.button({ }, 5, awful.tag.viewprev)
))
-- }}}

-- {{{ Key bindings
globalkeys = awful.util.table.join(
    awful.key({ modkey,           }, "Left",   awful.tag.viewprev       ),
    awful.key({ modkey,           }, "Right",  awful.tag.viewnext       ),
    awful.key({ modkey,           }, "Escape", awful.tag.history.restore),

    awful.key({ modkey            }, "F12", function () awful.util.spawn("xscreensaver-command -lock") end),

    awful.key({ modkey,           }, "j",
        function ()
            awful.client.focus.byidx( 1)
            if client.focus then client.focus:raise() end
        end),
    awful.key({ modkey,           }, "k",
        function ()
            awful.client.focus.byidx(-1)
            if client.focus then client.focus:raise() end
        end),
    awful.key({ modkey, "Shift"   }, "w", function () mymainmenu:show({keygrabber=true}) end),
    --awful.key({ modkey, }, "p", function () menubar.show() end),

    -- Layout manipulation
    awful.key({ modkey, "Shift"   }, "j", function () awful.client.swap.byidx(  1)    end),
    awful.key({ modkey, "Shift"   }, "k", function () awful.client.swap.byidx( -1)    end),
    awful.key({ modkey, "Control" }, "j", function () awful.screen.focus_relative( 1) end),
    awful.key({ modkey, "Control" }, "k", function () awful.screen.focus_relative(-1) end),
    awful.key({ modkey,           }, "u", awful.client.urgent.jumpto),
    awful.key({ modkey,           }, "Tab",
        function ()
            awful.client.focus.history.previous()
            if client.focus then
                client.focus:raise()
            end
        end),

    -- Standard program
    awful.key({ modkey,           }, "Return", function () awful.util.spawn(terminal .. terminal_opts ) end),
    awful.key({ modkey, "Control" }, "r", awesome.restart),
    awful.key({ modkey, "Shift"   }, "q", awesome.quit),

    awful.key({ modkey,           }, "l",     function () awful.tag.incmwfact( 0.05)    end),
    awful.key({ modkey,           }, "h",     function () awful.tag.incmwfact(-0.05)    end),
    awful.key({ modkey, "Shift"   }, "h",     function () awful.tag.incnmaster( 1)      end),
    awful.key({ modkey, "Shift"   }, "l",     function () awful.tag.incnmaster(-1)      end),
    awful.key({ modkey, "Control" }, "h",     function () awful.tag.incncol( 1)         end),
    awful.key({ modkey, "Control" }, "l",     function () awful.tag.incncol(-1)         end),
    awful.key({ modkey,           }, "space", function () awful.layout.inc(layouts,  1) end),
    awful.key({ modkey, "Shift"   }, "space", function () awful.layout.inc(layouts, -1) end),

    awful.key({ modkey, "Control" }, "n", awful.client.restore),

    awful.key({ modkey,           }, "w", function () awful.util.spawn(vimwiki_cmd) end),
    awful.key({ modkey,           }, "s", function () awful.util.spawn(screenshot_cmd) end),

    awful.key({ modkey }, "b", function ()
                                 for s = 1, screen.count() do
                                    topwibox[s].visible = not topwibox[s].visible
                                    bottomwibox[s].visible = not bottomwibox[s].visible
                                 end
                              end),
    -- Prompt
    awful.key({ modkey },            "r",     function () mypromptbox[mouse.screen]:run() end),

    awful.key({ modkey }, "x",
              function ()
                  awful.prompt.run({ prompt = "Run Lua code: " },
                  mypromptbox[mouse.screen].widget,
                  awful.util.eval, nil,
                  awful.util.getdir("cache") .. "/history_eval")
              end)
)

clientkeys = awful.util.table.join(
    awful.key({ modkey,           }, "f",      function (c) c.fullscreen = not c.fullscreen  end),
    awful.key({ modkey,           }, "c",      function (c) c:kill()                         end),
    awful.key({ modkey, "Control" }, "space",  awful.client.floating.toggle                     ),
    awful.key({ modkey, "Control" }, "Return", function (c) c:swap(awful.client.getmaster()) end),
    awful.key({ modkey,           }, "o",      awful.client.movetoscreen                        ),
    awful.key({ modkey, "Shift"   }, "r",      function (c) c:redraw()                       end),
    awful.key({ modkey,           }, "t",      function (c) c.ontop = not c.ontop            end),
    awful.key({ modkey,           }, "n",
        function (c)
            -- The client currently has the input focus, so it cannot be
            -- minimized, since minimized clients can't have the focus.
            c.minimized = true
        end),
    awful.key({ modkey,           }, "m",
        function (c)
            c.maximized_horizontal = not c.maximized_horizontal
            c.maximized_vertical   = not c.maximized_vertical
        end)
)

-- Compute the maximum number of digit we need, limited to 9
keynumber = 0
for s = 1, screen.count() do
   keynumber = math.min(9, math.max(#tags[s], keynumber));
end

-- Bind all key numbers to tags.
-- Be careful: we use keycodes to make it works on any keyboard layout.
-- This should map on the top row of your keyboard, usually 1 to 9.
for i = 1, keynumber do
    globalkeys = awful.util.table.join(globalkeys,
        awful.key({ modkey }, "#" .. i + 9,
                  function ()
                        local screen = mouse.screen
                        if tags[screen][i] then
                            awful.tag.viewonly(tags[screen][i])
                        end
                  end),
        awful.key({ modkey, "Control" }, "#" .. i + 9,
                  function ()
                      for s = 1, screen.count() do
                         if tags[s][i] then
                            awful.tag.viewonly(tags[s][i])
                         end
                      end
                  end),
--        awful.key({ modkey, "Control" }, "#" .. i + 9,
--                  function ()
--                      local screen = mouse.screen
--                      if tags[screen][i] then
--                          awful.tag.viewtoggle(tags[screen][i])
--                      end
--                  end),
        awful.key({ modkey, "Shift" }, "#" .. i + 9,
                  function ()
                      if client.focus and tags[client.focus.screen][i] then
                          awful.client.movetotag(tags[client.focus.screen][i])
                      end
                  end),
        awful.key({ modkey, "Control", "Shift" }, "#" .. i + 9,
                  function ()
                      if client.focus and tags[client.focus.screen][i] then
                          awful.client.toggletag(tags[client.focus.screen][i])
                      end
                  end))
end

clientbuttons = awful.util.table.join(
    awful.button({ }, 1, function (c) client.focus = c; c:raise() end),
    awful.button({ modkey }, 1, awful.mouse.client.move),
    awful.button({ modkey }, 3, awful.mouse.client.resize))

-- Set keys
root.keys(globalkeys)
-- }}}

-- {{{ Rules
awful.rules.rules = {
    -- All clients will match this rule.
   { rule = { },
      properties = { border_width = beautiful.border_width,
                     border_color = beautiful.border_normal,
                     focus = true,
                     keys = clientkeys,
                     buttons = clientbuttons } },
   -----------------------------------------------------------
   { rule = { class = "MPlayer" },
      properties = { floating = true } },
   { rule = { class = "pinentry" },
      properties = { floating = true } },
   { rule = { class = "gimp" },
      properties = { floating = true } },
   { rule = { class = "XTerm" },
      properties = { border_width = 3,
                     border_normal = "#ffff00"
                     } },
    -- Set Firefox to always map on tags number 2 of screen 1.
   { rule = { class = "Firefox" },
      properties = { tag = tags[1]["Web"] } },
   { rule = { class = "google-chrome" },
      properties = { tag = tags[1]["Web"] } },
    -- Set AT&T network client to always map on tags number 9 of screen 1.
   { rule = { class = "agnclient" },
      properties = { tag = tags[1]["system"] } },
   { rule = { class = "gvim", name = "journal" },
      properties = { focus = true, floating = true,  },
      callback = function(c) awful.client.movetoscreen(c,mouse.screen) end
   },
}
-- }}}

-- {{{ Signals
-- Signal function to execute when a new client appears.
client.add_signal("manage", function (c, startup)
    -- Add a titlebar
    -- awful.titlebar.add(c, { modkey = modkey })

    -- Enable sloppy focus
    c:add_signal("mouse::enter", function(c)
        if awful.layout.get(c.screen) ~= awful.layout.suit.magnifier
            and awful.client.focus.filter(c) then
            client.focus = c
        end
    end)

    if not startup then
        -- Set the windows at the slave,
        -- i.e. put it at the end of others instead of setting it master.
        -- awful.client.setslave(c)

        -- Put windows in a smart way, only if they does not set an initial position.
        if not c.size_hints.user_position and not c.size_hints.program_position then
            awful.placement.no_overlap(c)
            awful.placement.no_offscreen(c)
        end
    end
end)

client.add_signal("focus", function(c) c.border_color = beautiful.border_focus end)
client.add_signal("unfocus", function(c) c.border_color = beautiful.border_normal end)


function run_once(prg,arg_string,pname,screen)
    if not prg then
        do return nil end
    end

    if not pname then
       pname = prg
    end

    if not arg_string then 
        awful.util.spawn_with_shell("pgrep -f -u $USER -x '" .. pname .. "' || (" .. prg .. ")",screen)
    else
        awful.util.spawn_with_shell("pgrep -f -u $USER -x '" .. pname .. "' || (" .. prg .. " " .. arg_string .. ")",screen)
    end
end


-- Local init file (apps to fire off)
local host_init_file = awful.util.getdir('config') .. '/init.' .. hostname .. '.lua'

print(host_init_file);

if awful.util.file_readable(host_init_file) then
   local host_init_function, host_init_load_error
   host_init_function, host_init_load_error = loadfile(host_init_file)
   if not host_init_load_error then
      host_init_function()
   else
      print(string.format('[awesome] Failed to load %s: %s', host_init_file, host_init_load_error))
   end
end

-- }}}
