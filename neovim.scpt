-- neovim.app
-- This creates a shim Application that will enable you to open files from the Finder in neovim using iTerm

-- To use this script:
-- 1. Open Automator and create a new Application
-- 2. Add the "Run Applescript" action
-- 3. Paste this script into the Run Applescript section
-- 4. Save the application as neovim.app in your Applications folder
-- 5. In the Finder, right click on a file and select "Open With". In that window you can set meovim as a default

on run {input, parameters}
	tell application "System Events" to set terminalIsRunning to exists application process "iTerm"
	tell application "iTerm"
		if terminalIsRunning is false then
			create window with default profile
		end if
		tell front window
			if terminalIsRunning is true then
				create tab with default profile
			end if
			activate
			tell current session
				if input as string is not equal to "" then
					write text ("nvim " & quote & POSIX path of input & quote)
				else
					write text ("nvim")
				end if
			end tell
		end tell
	end tell
end run
