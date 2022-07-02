# plain text version of the applescript embedded in the workflow

on run {input, parameters}
	tell application "System Events"
		set activeapp to name of first process where it is frontmost
	end tell
	tell application "System Events"
		tell process "Dock"
			set frontmost to true
			activate
			tell UI element activeapp of list 1
				perform action "AXShowMenu"
				click menu item "Options" of menu 1
				click menu item "This Desktop" of menu 1 of menu item "Options" of menu 1
			end tell
                        delay 0.5
			tell UI element activeapp of list 1
				perform action "AXShowMenu"
				click menu item "Options" of menu 1
				click menu item "None" of menu 1 of menu item "Options" of menu 1
			end tell
		end tell
                tell process activeapp
                    set frontmost to true
                    activate
                end tell
	end tell
	return input
end run

