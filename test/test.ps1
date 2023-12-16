function Write-Title($title) {
    Write-Output "`n#`n# $title`n#`n"
}

Write-Title "chown-guests.txt"
Get-Acl chown-guests.txt | Format-List

Write-Title "chown-administrator.txt"
Get-Acl chown-administrator.txt | Format-List

Write-Title "chown-containeruser.txt"
Get-Acl chown-containeruser.txt | Format-List
