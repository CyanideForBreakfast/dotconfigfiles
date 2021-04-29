-- Imports
import XMonad
import XMonad.Actions.CycleWS
import XMonad.Actions.CopyWindow
import XMonad.Actions.DynamicWorkspaces
import XMonad.Actions.GroupNavigation
import XMonad.Actions.Promote
import XMonad.Actions.GridSelect
import XMonad.Actions.WindowGo
import XMonad.Actions.WorkspaceNames
import XMonad.Config.Desktop 
import XMonad.Core
import Data.Ratio
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.FadeWindows
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.ManageHelpers (doRectFloat)
import XMonad.Hooks.RefocusLast
import XMonad.Layout
import qualified XMonad.Layout.BoringWindows as BW
import XMonad.Layout.LimitWindows
import XMonad.Layout.Hidden
import XMonad.Layout.NoBorders
import XMonad.Layout.ResizableTile
import XMonad.Layout.SimpleDecoration
import XMonad.Layout.Simplest
import XMonad.Operations
import XMonad.Util.EZConfig
import XMonad.Util.Run
import XMonad.Util.SpawnOnce
import qualified XMonad.StackSet as W

-- Values
myTerminal = "alacritty"

myAppTerminal = "termite"

myFont = "xft:Monaco:regular:size=15:"
myBorderWidth = 3
myFocusWindowBorderColor = "#73fbd3"
myNormalWindowBorderColor = "#03312e"

myWorkspaces = ["1","2","3","4","5"]

-- Grid Select configuration
myGridConfig = colorRangeFromClassName
 (0xAE, 0xFE, 0xEC) -- lowest inactive bg
 (0xAE, 0xFE, 0xEC) -- highest inactive bg
 (0x00, 0xB9, 0xAE) -- active bg
 (0xAE, 0xFE, 0xEC) -- inactive fg
 (0x03, 0x31, 0x2E) -- active fg

myGSConfig colorizer = (buildDefaultGSConfig myGridConfig){
  gs_cellheight=30
, gs_cellwidth=200
, gs_cellpadding=10
, gs_font=myFont 
}

-- ManageHook
myManageHook = composeAll
 [
   className =? "Termite" --> doRectFloat (W.RationalRect (1 % 4) (1 % 3) (1 % 2) (1 % 3))
 ]

-- Key Bindings
myKeys c = mkKeymap c
 [
  -- Xmonad 
    ("M-C-r", spawn "xmonad --recompile")
  , ("M-S-r", spawn "xmonad --restart")

  -- Toggle Xmobar visibility
  , ("M-x",sendMessage ToggleStruts)

  -- Grid select view
  , ("M-g", goToSelected $ myGSConfig myGridConfig)

  -- Important applications
  , ("M-S-<Return>", spawn myTerminal) -- spawn terminal	
  , ("M-p", spawn "rofi -show run")    -- spawn rofi run menu
  , ("M-z f", runOrRaise "firefox" (className =? "firefox"))    -- travel to firefox
  , ("M-z q", runOrRaise "qutebrowser" (className =? "qutebrowser")) -- travel to qutebrowser
  , ("M-z a", runOrRaise "Alacritty" (className =? "Alacritty")) -- travel to alacritty
  , ("M-z t", raise (className =? "Termite")) -- travel to termite
  , ("M-z v", raise (className =? "VirtualBox Machine")) -- travel to VM
  , ("M-z d", raise (className =? "discord")) 
	
	, ("M-z z", nextMatch Forward (className =? "Zathura"))

  -- Open other applications
  , ("M-a m", spawn "termite -e pulsemixer") -- start pulsemixer
  , ("M-a f", spawn "termite -e nnn") -- nnn, terminal file manager
  , ("M-a h", spawn "termite -e htop") --- start htop
  , ("M-a y", spawn "flameshot gui") -- start flameshot screenshot

  -- Navigation 
  , ("M-b", BW.focusMaster) -- focus on master
  , ("M-j", BW.focusDown)   -- next window
  , ("M-k", BW.focusUp)     -- previous window     
  , ("M-h", windows W.focusUp)     -- previous window     
  , ("M-l", windows W.focusDown)     -- previous window     
  , ("M-<Backspace>", promote)     -- promote window to master
  , ("M-<Tab>", toggleFocus)       -- go to last focussed window
 	, ("M-o",windows W.shiftMaster)  -- move current window to top (master)

	, ("M-S-i", increaseLimit)  -- increase number of windows in Tall/mirror Tall layout
	, ("M-S-d", decreaseLimit)  -- decrease number of windows in Tall/mirror Tall layout

  -- Layouts
  , ("M-<Space>", sendMessage NextLayout) -- next layout
  , ("M-S-s", sendMessage ToggleStruts) -- toggle panels

  -- Minimize & maximize
  , ("M-m", withFocused hideWindow)  -- Minimize current window
  , ("M-S-m",  popNewestHiddenWindow) -- Maximize last window

  -- Window resizing
  , ("M-S-h", sendMessage Shrink)       -- Shrink height  
  , ("M-S-l", sendMessage Expand)       -- Expand height	
  , ("M-S-j", sendMessage MirrorShrink) -- Shrink width
  , ("M-S-k", sendMessage MirrorExpand) -- Expand width

  -- Invert colors
  , ("M-S-t", spawn "xrandr-invert-colors")

  -- Kill windows
  , ("M-S-c", kill)

  -- Workspaces
  , ("M-w n", nextWS) -- go to next WS
  , ("M-w p", prevWS) -- go to prev WS
  , ("M-w <Tab>", toggleWS) -- toggle WS
	-- swapping workspaces
  , ("M-w s 2", sequence_ [swapWithCurrent "2", windows (W.greedyView "1")])
  , ("M-w s 3", sequence_ [swapWithCurrent "3", windows (W.greedyView "1")])
  , ("M-w s 4", sequence_ [swapWithCurrent "4", windows (W.greedyView "1")])
  , ("M-w s 5", sequence_ [swapWithCurrent "5", windows (W.greedyView "1")])
  -- quick switching to the workspaces
  , ("M-w 1", windows (W.greedyView "1"))
  , ("M-w S-1", windows (W.shift "1"))
  , ("M-w 2", windows (W.greedyView "2"))
  , ("M-w S-2", windows (W.shift "2"))
  , ("M-w 3", windows (W.greedyView "3"))
  , ("M-w S-3", windows (W.shift "3"))
  , ("M-w 4", windows (W.greedyView "4"))
  , ("M-w S-4", windows (W.shift "4"))
  , ("M-w 5", windows (W.greedyView "5"))
  , ("M-w S-5", windows (W.shift "5"))
 ]

-- Startup
myStartupHook = do
 spawnOnce "nitrogen --restore &"    -- load wallpaper
 spawnOnce "picom --no-fading-openclose &"                 -- load compositor for effects
 spawnOnce "alacritty"   -- launch terminal with neofetch

-- Layout
myLayout = hiddenWindows $ avoidStruts (noBorders Full ||| tiled ||| Mirror tiled)
 where
  tiled = BW.boringAuto . limitWindows 3 $ Tall nmaster delta ratio
  nmaster = 1           -- default number of windows in master
  delta = 3/100         -- percent to increment when resizing
  ratio = 1/2           -- proportion of master tile

main = do
 xmproc <- spawnPipe "xmobar"
 xmonad $ desktopConfig
  { borderWidth = myBorderWidth
  , focusedBorderColor = myFocusWindowBorderColor
  , normalBorderColor = myNormalWindowBorderColor
  , modMask = mod4Mask
  , terminal = myTerminal
  , startupHook = myStartupHook
  , layoutHook = myLayout
  , logHook = dynamicLogWithPP xmobarPP {
        ppOutput = hPutStrLn xmproc
      , ppOrder = \(ws:l:t:_) -> [ws]
      , ppCurrent =  xmobarColor "#000000" ""
      , ppVisible =  xmobarColor "#007d6c" ""
      , ppHidden =  xmobarColor "#007d6c" ""
  }  <+> refocusLastLogHook
  , keys = myKeys
  , manageHook = manageDocks <+> myManageHook
  , workspaces = myWorkspaces
  }

