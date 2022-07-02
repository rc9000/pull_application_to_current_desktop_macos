# My struggle with macOS spaces (virtual desktops)

One thing bothered me for years in macOS:

 * I'm on desktop 3, e.g. surfing in Firefox
 * I see something that I want to make a calendar entry for, but Calendar is currently on desktop 1
 * to get it onto my desktop with from Firefox
  * I need to switch to the Calendar desktop
  * then bring up the Mission Control that allows dragging Calendar to desktop 3
  * but hey I also have five other desktops with some tiny Firefox windows on it, and it's hard to tell where I was before 
  * after a lot of dragging and guessing I'm finally there

A slight improvement is to disable `When switching to an application, switch to a Space with open windows for the application` in Mission Control. Then I can:

 * click on Calendar in the Dock
 * right-click the Dock icon -> Options -> Assign To -> This Desktop
 * but of course then Calendar will be stuck there forever, so after getting it here it's best just to unassing it again, ie.
 * right-click the Dock icon -> Options -> Assign To -> None

Still pretty cumbersome. This repo contains an Automator workflow that acts as a system service, and allows to perform all the clicking from the slight improvement above with a single keyboard shortcut.

# How to use

 * drop the workflow folder into `~/Library/Services`, this will make it show up in any application in the main menu, e.g. Calendar -> Services -> pull application to current desktop
 * assign a keyboard shortcut in System Preferences -> Keyboard -> Shortcuts -> Services, I use option-command-p
 * in Mission control, disable `When switching to an application, switch to a Space with open windows for the application`.
 * now, you can click an app that is on another desktop in the dock (so its menu bar appears), press option-command-p, and with some Applescript magic it is pulled onto the current desktop and active in the foreground 

# However

 * the first time you do this for any application, it will not work since the app needs permission to click around in your dock.
 * this can be added in Security & Privacy -> Accessibility -> add e.g. Calendar there.
 * if somebody knows a better way to implement this, please let me know 

# Therefore

 * use at your own risk

# Sources that helped make this

 * https://stackoverflow.com/questions/2819807/accessing-dock-icon-right-click-menu-items-with-applescript
 * https://apple.stackexchange.com/questions/171709/applescript-get-active-application
 * https://developer.apple.com/library/archive/documentation/LanguagesUtilities/Conceptual/MacAutomationScriptingGuide/MakeaSystem-WideService.html
 * https://apple.stackexchange.com/questions/134936/access-application-submenus-with-applescript
 * https://apple.stackexchange.com/questions/340942/applescript-how-can-i-get-ui-elements-names-attributes-properties-classe

Thanks Internet, this would have taken a lot longer otherwise!
