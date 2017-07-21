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
import XMonad.Actions.CycleWS
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
myTerminal = "urxvt"

mymodMask :: KeyMask
mymodMask = mod4Mask

myBorderWidth :: Dimension
myBorderWidth = 1

myWorkspaces :: [String]
myWorkspaces = ["1:www", "2:2", "3:3", "4:4", "5:explo", "6:text", "7:multi", "8:mail", "9:temp"]

myNormalBorderColor, myFocusedBorderColor :: String
myNormalBorderColor  = "#222222"
myFocusedBorderColor = "#000000"

myDefaultGaps :: [(Integer, Integer, Integer, Integer)]
myDefaultGaps = [(20,0,0,0)]

-- XMOBAR ======================================================================================================================================
myLogHook :: Handle -> X ()
myLogHook h = dynamicLogWithPP $ defaultPP
    {     ppOutput            = hPutStrLn h
        , ppVisible           = xmobarColor "white"   "#000000" . shorten 50
        , ppCurrent           = xmobarColor "#00ff00" "#000000" . shorten 50
        , ppHidden            = xmobarColor "white"   "#000000" . shorten 50
        , ppUrgent            = xmobarColor "red"     "#000000" . shorten 50
        , ppHiddenNoWindows   = xmobarColor "#7b7b7b" "#000000" . shorten 50
    }

-- RULES =======================================================================================================================================

mymanageHook :: ManageHook
mymanageHook = (composeAll . concat $
    [ [resource     =? r            --> doIgnore                |   r   <- myIgnores]
    , [className    =? c            --> doShift  "1:www"        |   c   <- myOne    ]
    , [className    =? c            --> doShift  "2:2"          |   c   <- myTwo    ]
    , [className    =? c            --> doShift  "3:3"          |   c   <- myThr    ]
    , [className    =? c            --> doShift  "4:4"          |   c   <- myFou    ]
    , [className    =? c            --> doShift  "5:exp"        |   c   <- myFiv    ]
    , [className    =? c            --> doShift  "6:text"       |   c   <- mySix    ]
    , [className    =? c            --> doShift  "7:multi"      |   c   <- mySev    ]
    , [className    =? c            --> doShift  "8:mail"       |   c   <- myEig    ]
    , [className    =? c            --> doShift  "9:temp"       |   c   <- myNin    ]
    ])

    where
        role      = stringProperty "WM_WINDOW_ROLE"
        name      = stringProperty "WM_NAME"

        myIgnores   = ["desktop","desktop_window","notify-osd","stalonetray","trayer"]
        myOne       = ["Firefox","Google-chrome","Google-chrome-stable","Chromium", "Chromium-browser"]
        myTwo       = [""]
        myThr       = [""]
        myFou       = [""]
        myFiv       = ["nautilus"]
        mySix       = ["subl","libreoffice","TeXstudio","Zathura"]
        mySev       = ["Vlc","Gimp","Spotify"]
        myEig       = ["VirtualBox","vuze","Thunderbird"]
        myNin       = [""]

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
    standardLayouts = tall ||| wide ||| full ||| circle
    tall   = named "tall"   $ avoidStruts basic
    wide   = named "wide"   $ avoidStruts $ Mirror basic
    circle = named "circle" $ avoidStruts circleSimpleDefaultResizable
    full   = named "full"   $ noBorders Full

-- Set up the Layout prompt
myLayoutPrompt :: X ()
myLayoutPrompt = inputPromptWithCompl myXPConfig "Layout"
                 (mkComplFunFromList' allLayouts) ?+ (sendMessage . JumpToLayout)
  where
    allLayouts = ["tall", "wide", "circle", "full"]

    myXPConfig :: XPConfig
    myXPConfig = defaultXPConfig {
        autoComplete= Just 1000
}

-- KEYBINDS ==================================================================================================================================

mykeys conf@(XConfig {XMonad.modMask = modm}) = M.fromList $
    -- launch terminal, default with screen
    [ ((modm ,              xK_Return), spawn $ XMonad.terminal conf)
    -- close focused window
    , ((modm,               xK_q     ), kill)
    -- Rotate through the available layout algorithms
    , ((modm,               xK_space ), sendMessage NextLayout)
    --  Reset the layouts on the current workspace to default
    , ((modm .|. shiftMask, xK_space ), setLayout $ XMonad.layoutHook conf)
    -- Resize viewed windows to the correct size
    , ((modm,               xK_n     ), refresh)
    -- Move focus to the next window
    , ((modm,               xK_j     ), windows W.focusDown)
    -- Move focus to the previous window
    , ((modm,               xK_k     ), windows W.focusUp  )
    -- Move focus to the master window
    , ((modm,               xK_m     ), windows W.focusMaster)
    -- Swap the focused window and the master window
    , ((modm,               xK_Return), windows W.swapMaster)
    -- Swap the focused window with the next window
    , ((modm .|. shiftMask, xK_j     ), windows W.swapDown  )
    -- Swap the focused window with the previous window
    , ((modm .|. shiftMask, xK_k     ), windows W.swapUp    )
    -- Shrink the master area
    , ((modm,               xK_h     ), sendMessage Shrink)
    -- Expand the master area
    , ((modm,               xK_l     ), sendMessage Expand)
    -- Push window back into tiling
    , ((modm,               xK_t     ), withFocused $ windows . W.sink)
    -- Increment the number of windows in the master area
    , ((modm,               xK_comma ), sendMessage (IncMasterN 1))
    -- Deincrement the number of windows in the master area
    , ((modm,               xK_period), sendMessage (IncMasterN (-1)))
    -- Quit xmonad
    , ((modm .|. shiftMask, xK_e     ),   io (exitWith ExitSuccess))
    -- Restart xmonad
    , ((modm .|. shiftMask, xK_q     ),   spawn "xmonad --recompile && xmonad --restart")
    -- Personal Keybinds
    , ((modm .|. shiftMask, xK_z     ),   spawn "i3lock -n --image=/home/seintz/Pictures/lockscreen.png -t -e")
    , ((shiftMask,          xK_Print),    spawn "sleep 0.2; scrot -s /home/seintz/Pictures/screenshot/scr-$(date +%Y_%m_%d)-%s.png")
    , ((0,                  xK_Print),    spawn "scrot /home/seintz/Pictures/screenshot/scr-$(date +%Y_%m_%d)-%s.png")       
    ]
    ++
    --
    -- mod-[1..9], Switch to workspace N
    -- mod-shift-[1..9], Move client to workspace N
    --
    [((m .|. modm, k), windows $ f i)
    | (i, k) <- zip (XMonad.workspaces conf) [xK_1 .. xK_9]
    , (f, m) <- [(W.greedyView, 0), (W.shift, shiftMask)]]

-- MAIN ======================================================================================================================================

main = do
    xmproc <- spawnPipe "/usr/bin/xmobar /home/seintz/.xmonad/xmobarrc"
    xmonad $ defaultConfig
        {   terminal            = myTerminal
        ,   modMask             = mymodMask
        ,   borderWidth         = myBorderWidth
        ,   workspaces          = myWorkspaces
        ,   normalBorderColor   = myNormalBorderColor
        ,   focusedBorderColor  = myFocusedBorderColor
        
        -- ,   keys                = mykeys <+> keys defaultConfig

        ,   manageHook          = mymanageHook <+> manageDocks <+> manageHook defaultConfig
        ,   layoutHook          = avoidStruts $ myLayout 
        ,   logHook             = myLogHook xmproc
        }
