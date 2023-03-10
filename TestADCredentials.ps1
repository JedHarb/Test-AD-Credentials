$Creds = Get-Credential -Message "Test a username and password against AD"

# If the object doesn't authenticate, it returns nothing.
if ((new-object directoryservices.directoryentry "",$creds.UserName,$creds.GetNetworkCredential().Password).psbase.name) {
	Write-Host -ForegroundColor 'green' "PASS - The username and password authenticated as an AD account."
}
else {
	Write-Host -ForegroundColor 'red' "FAIL - The username and password failed to authenticate in AD."
}

if ((Read-Host "`nEnter Y to go again") -eq "Y") {
	.$PSCommandPath # Start the script from the beginning.
}