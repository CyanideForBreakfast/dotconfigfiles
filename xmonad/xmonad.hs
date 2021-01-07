-- Imports
import XMonad
import XMonad.Actions.Minimize
import XMonad.Actions.Promote
import XMonad.Actions.GridSelect
import XMonad.Core
import Data.Ratio
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.ManageHelpers (doRectFloat)
import XMonad.Hooks.RefocusLast
import XMonad.Layout
import XMonad.Layout.Minimize
import XMonad.Layout.NoBorders
import XMonad.Layout.ResizableTile
import XMonad.Layout.SimpleDecoration
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
myKeys = \c -> mkKeymap c $
 [
  -- Xmonad 
    ("M-C-r", spawn "xmonad --recompile")
  , ("M-S-r", spawn "xmonad --restart")

  -- Grid select view
  , ("M-g", goToSelected $ myGSConfig myGridConfig)

  -- Important applications
  , ("M-S-<Return>", spawn myTerminal) -- spawn terminal	
  , ("M-p", spawn "rofi -show run")    -- spawn rofi run menu

  -- Open other applications
  , ("M-a m", spawn "termite -e pulsemixer") -- start pulsemixer
  , ("M-a f", spawn "termite -e nnn") -- nnn, terminal file manager
  , ("M-a h", spawn "termite -e htop") --- start htop

  -- Navigation 
  , ("M-b", windows W.focusMaster) -- focus on master
  , ("M-j", windows W.focusDown)   -- next window
  , ("M-k", windows W.focusUp)     -- previous window     
  , ("M-<Backspace>", promote)     -- promote window to master
  , ("M-<Tab>", toggleFocus)       -- go to last focussed window

  -- Layouts
  , ("M-<Space>", sendMessage NextLayout) -- next layout
  , ("M-S-s", sendMessage ToggleStruts) -- toggle panels

  -- Minimize & maximize
  , ("M-m", do 
              withFocused minimizeWindow
	      windows W.focusDown)  -- Minimize current window
  , ("M-S-m", withLastMinimized maximizeWindowAndFocus) -- Maximize last window

  -- Window resizing
  , ("M-S-h", sendMessage Shrink)       -- Shrink height  
  , ("M-S-l", sendMessage Expand)       -- Expand height	
  , ("M-S-j", sendMessage MirrorShrink) -- Shrink width
  , ("M-S-k", sendMessage MirrorExpand) -- Expand width

  -- Kill windows
  , ("M-S-c", kill)
 ]

-- Startup
myStartupHook = do
 spawnOnce "nitrogen --restore &"    -- load wallpaper
 spawnOnce "picom &"                 -- load compositor for effects
 spawnOnce "xmobar"

-- Layout
myLayout = minimize ( avoidStruts (noBorders Full ||| tiled ||| Mirror tiled))
 where
  tiled = Tall nmaster delta ratio
  nmaster = 1           -- default number of windows in master
  delta = 3/100         -- percent to increment when resizing
  ratio = 1/2           -- proportion of master tile

main = do
 xmonad $ docks def
  { borderWidth = myBorderWidth
  , focusedBorderColor = myFocusWindowBorderColor
  , normalBorderColor = myNormalWindowBorderColor
	, modMask = mod4Mask
  , terminal = myTerminal
  , startupHook = myStartupHook
  , layoutHook = myLayout
	, logHook = refocusLastLogHook
  , keys = myKeys
  , manageHook = manageDocks <+> myManageHook
  }

