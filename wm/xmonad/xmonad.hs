-- IMPORT ======================================================================================================================================
import XMonad hiding ((|||))

-- Prompt
import XMonad.Prompt
import XMonad.Prompt.Input
import XMonad.Prompt.RunOrRaise (runOrRaisePrompt)
import XMonad.Prompt.AppendFile (appendFilePrompt)

-- Hooks

import System.IO
import System.Exit

import XMonad.Util.Run
import XMonad.Util.EZConfig(additionalKeys)
import XMonad.Actions.CycleWS as CycleWS
import XMonad.Operations

import XMonad.Hooks.ManageDocks
import XMonad.Hooks.ManageHelpers
import XMonad.Hooks.SetWMName
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.UrgencyHook
import XMonad.Hooks.FadeInactive
import XMonad.Hooks.EwmhDesktops

import XMonad.Layout.NoBorders
import XMonad.Layout.Named
import XMonad.Layout.DecorationMadness
import XMonad.Layout.PerWorkspace (onWorkspace, onWorkspaces)
import XMonad.Layout.Reflect (reflectHoriz)
import XMonad.Layout.IM
import XMonad.Layout.SimpleFloat
import XMonad.Layout.Spacing
import XMonad.Layout.ResizableTile
import XMonad.Layout.LayoutHints
import XMonad.Layout.LayoutModifier
import XMonad.Layout.LayoutCombinators (JumpToLayout (..), (|||))
import XMonad.Layout.Grid

import Data.Ratio ((%))

import qualified XMonad.StackSet as W
import qualified Data.Map as M

-- CONFIG ======================================================================================================================================

myTerminal :: String
myTerminal = "st"

mymodMask :: KeyMask
mymodMask = mod4Mask

myBorderWidth :: Dimension
myBorderWidth = 1

myWorkspaces :: [String]
myWorkspaces = 
        "1:\xf269" : 
        "2:\xf120" : 
        "3:\xf120" : 
        "4:\xf120" : 
        "5:\xf07b" : 
        "6:\xf15c" : 
        "7:\xf03d" : 
        "8:\xf15a" : 
        "9:\xf1f8" :
        []

myNormalBorderColor, myFocusedBorderColor :: String
myNormalBorderColor  = "#000000"
myFocusedBorderColor = "#222222"

myDefaultGaps :: [(Integer, Integer, Integer, Integer)]
myDefaultGaps = [(0,0,0,0)]

-- MAIN ======================================================================================================================================

main = do
    xmproc <- spawnPipe "${HOME}/.cabal/bin/xmobar ${HOME}/.xmonad/xmobarrc"
    spawn "sh /home/seintz/.config/wm_script/startup.sh"
    xmonad $ docks defaultConfig {   terminal            = myTerminal
        ,   borderWidth         = myBorderWidth
        ,   modMask             = mymodMask
        ,   workspaces          = myWorkspaces
        ,   normalBorderColor   = myNormalBorderColor
        ,   focusedBorderColor  = myFocusedBorderColor
        
        ,   keys                = mykeys 

        ,   layoutHook          = avoidStruts $ myLayout 
        ,   manageHook          = mymanageHook <+> manageDocks 
        ,   logHook             = myLogHook xmproc
        -- ,   startupHook         = myStartupHook
        }

-- RULES =======================================================================================================================================

mymanageHook :: ManageHook
mymanageHook = (composeAll . concat $
    [ [resource     =? r            --> doIgnore                   |   r   <- myIgnores]
    , [className    =? c            --> doShift  "1:\xf269"        |   c   <- myOne    ]
    , [className    =? c            --> doShift  "2:\xf120"        |   c   <- myTwo    ]
    , [className    =? c            --> doShift  "3:\xf120"        |   c   <- myThr    ]
    , [className    =? c            --> doShift  "4:\xf120"        |   c   <- myFou    ]
    , [className    =? c            --> doShift  "5:\xf07b"        |   c   <- myFiv    ]
    , [className    =? c            --> doShift  "6:\xf15c"        |   c   <- mySix    ]
    , [className    =? c            --> doShift  "7:\xf03d"        |   c   <- mySev    ]
    , [className    =? c            --> doShift  "8:\xf15a"        |   c   <- myEig    ]
    , [className    =? c            --> doShift  "9:\xf1f8"        |   c   <- myNin    ]
    , [isFullscreen                 --> myDoFullFloat                               ]
    ])

    where
        role      = stringProperty "WM_WINDOW_ROLE"
        name      = stringProperty "WM_NAME"

        myIgnores   = ["desktop","desktop_window","notify-osd","stalonetray","trayer"]
        myOne       = ["Firefox","Google-chrome","Google-chrome-stable","Chromium", "Chromium-browser"]
        myTwo       = [""]
        myThr       = [""]
        myFou       = [""]
        myFiv       = ["Nautilus","Nemo","nemo", "Zathura"]
        mySix       = ["subl","LibreOffice","TeXstudio", "Sublime", "Eclipse", "eclipse"]
        mySev       = ["Vlc","Gimp", "Spotify"]
        myEig       = ["VirtualBox","Vuze Bittorrent Client", "vuze","qBittorrent"]
        myNin       = [""]

-- Trick for real fullscreen
myDoFullFloat :: ManageHook
myDoFullFloat = doF W.focusDown <+> doFullFloat

-- XMOBAR ======================================================================================================================================

myLogHook :: Handle -> X ()
myLogHook h = dynamicLogWithPP $ defaultPP
    {     ppOutput            = hPutStrLn h
        , ppVisible           = xmobarColor "#ffffff" "#000000" . shorten 50
        , ppCurrent           = xmobarColor "#00ff00" "#000000" . shorten 50
        , ppHidden            = xmobarColor "#dddddd" "#000000" . shorten 50
        , ppUrgent            = xmobarColor "#ff0000" "#000000" . shorten 50
        , ppHiddenNoWindows   = xmobarColor "#7b7b7b" "#000000" . shorten 50
    }

-- STARTUP =====================================================================================================================================

-- myStartupHook :: X()
-- myStartupHook = do
--     spawn "sh ${HOME}/.config/wm_script/startup.sh"

-- LAYOUT ======================================================================================================================================

-- default tiling algorithm partitions the screen into two panes
basic :: Tall a
basic = Tall nmaster delta ratio
  where
    -- The default number of windows in the master pane
    nmaster = 1
    -- Percent of screen to increment by when resizing panes
    delta   = 3/100
    -- Default proportion of screen occupied by master pane
    ratio   = 1/2

myLayout = smartBorders $ onWorkspace "8" simpleFloat standardLayouts
  where
    standardLayouts = tall ||| wide ||| full 
    tall   = named "tall"   $ avoidStruts basic
    wide   = named "wide"   $ avoidStruts $ Mirror basic
    full   = named "full"   $ noBorders Full

-- Set up the Layout prompt
myLayoutPrompt :: X ()
myLayoutPrompt = inputPromptWithCompl myXPConfig "Layout"
                 (mkComplFunFromList' allLayouts) ?+ (sendMessage . JumpToLayout)
  where
    allLayouts = ["tall", "wide", "full"]

    myXPConfig :: XPConfig
    myXPConfig = defaultXPConfig {
        autoComplete= Just 1000
}

-- KEYBINDS ==================================================================================================================================

mykeys conf@(XConfig {XMonad.modMask = modm}) = M.fromList $

    [ ((modm ,              xK_Return   ),      spawn $ XMonad.terminal conf                    )       -- launch terminal 
    -- , ((modm,               xK_p        ),      spawn "${HOME}/.config/wm_script/dmenu.sh"      )       -- launch dmenu
    , ((modm,               xK_p        ),      spawn "rofi -show run"                          )       -- launch dmenu
    , ((modm .|. shiftMask, xK_p        ),      spawn "rofi -show"                              )       -- launch rofi
    , ((modm .|. shiftMask, xK_c        ),      kill                                            )       -- close focused window
    , ((modm .|. shiftMask, xK_q        ),      io (exitWith ExitSuccess)                       )       -- quit xmonad
    , ((modm .|. shiftMask, xK_r        ),      spawn "xmonad --recompile && xmonad --restart"  )       -- restart xmonad

    , ((modm,               xK_space    ),      sendMessage NextLayout                          )       -- switch layout
    , ((modm .|. shiftMask, xK_space    ),      setLayout $ XMonad.layoutHook conf              )       -- reset to default layout

    , ((modm,               xK_j        ),      windows W.focusDown                             )       -- move focus to next window
    , ((modm,               xK_k        ),      windows W.focusUp                               )       -- move focus to previous window
    , ((modm .|. shiftMask, xK_j        ),      windows W.swapDown                              )       -- swap focused window with the next
    , ((modm .|. shiftMask, xK_k        ),      windows W.swapUp                                )       -- swap focused window with the previous

    , ((modm,               xK_h        ),      CycleWS.prevWS                                  )       -- swap to previous workspace
    , ((modm,               xK_l        ),      CycleWS.nextWS                                  )       -- swap to next workspace
    , ((modm,               xK_Tab      ),      CycleWS.toggleWS                                )       -- jump to last workspace
    , ((modm,               xK_u        ),      focusUrgent                                     )       -- swap to urgen workspace
    , ((modm,               xK_m        ),      windows W.focusMaster                           )       -- focus master

    , ((modm,               xK_comma    ),      sendMessage Shrink                              )       -- shrink master area
    , ((modm,               xK_period   ),      sendMessage Expand                              )       -- expand master area
    , ((modm .|. shiftMask, xK_comma    ),      sendMessage (IncMasterN 1)                      )       -- increment number of window
    , ((modm .|. shiftMask, xK_period   ),      sendMessage (IncMasterN (-1))                   )       -- deincrement number of window

    -- Personal Keybinds
    , ((modm .|. shiftMask, xK_z        ),      spawn "${HOME}/.config/wm_script/lockscr.sh")
    , ((shiftMask,          xK_Print    ),      spawn "sleep 0.2; scrot -s /home/seintz/Pictures/screenshot/scr-$(date +%Y_%m_%d)-%s.png")
    , ((0,                  xK_Print    ),      spawn "scrot /home/seintz/Pictures/screenshot/scr-$(date +%Y_%m_%d)-%s.png")       
    , ((modm,               xK_F2       ),      spawn "xbacklight -dec 10")
    , ((modm,               xK_F3       ),      spawn "xbacklight -inc 10")
    , ((modm,               xK_F9       ),      spawn "amixer sset Master 5%-")
    , ((modm,               xK_F10      ),      spawn "amixer sset Master 5%+")
    ]
    ++

    -- Change workspaces and move window to workspaces
    -- mod-[1..9], Switch to workspace N
    -- mod-shift-[1..9], Move client to workspace N
    [((m .|. modm, k), windows $ f i)
    | (i, k) <- zip (XMonad.workspaces conf) [xK_1 .. xK_9]
    , (f, m) <- [(W.greedyView, 0), (W.shift, shiftMask)]]
