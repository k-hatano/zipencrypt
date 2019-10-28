on open fileItem
	zipencrypt(fileItem)
end open

on run
	tell application "Finder"
		set fileItem to (choose file)
		set aliasPath to fileItem as text
		set posixFile to aliasPath as POSIX file
	end tell
	zipencrypt(fileItem)
end run

on zipencrypt(fileItem)
	set theFilePath to POSIX path of fileItem
	tell application "Terminal"
		activate
		do script "zipcloak " & quote & theFilePath & quote & " -O " & quote & theFilePath & "_encrypted.zip" & quote
	end tell
end zipencrypt