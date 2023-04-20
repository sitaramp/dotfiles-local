oh-my-posh init pwsh | Invoke-Expression

Import-Module -Name Terminal-Icons

Import-Module PSReadLine
#if (PSVersionTable.PSVersion.Major -le 5) { $OutputEncoding = [System.Text.Encoding]::UTF8 }
#Set-PSReadLineOption -PredictionSource History
#Set-PSReadLineOption -PredictionViewStyle ListView
Set-PSReadLineOption -EditMode Emacs
Set-PSReadLineKeyHandler -Key UpArrow -Function HistorySearchBackward
Set-PSReadLineKeyHandler -Key DownArrow -Function HistorySearchForward
#Set-PSReadLineKeyHandler -Key Tab -Function Complete

# PSFzf Config
#Remove-PSReadlineKeyHandler 'Ctrl+r'
#Remove-PSReadlineKeyHandler 'Ctrl+t'

Import-Module PSFzf

## replace 'Ctrl+r' and 'Ctrl+t' with your preferred bingings
Set-PSFzfOption -PSReadlineChordProvider 'Ctrl+t' -PSReadlineChordReverseHistory 'Ctrl+r'
Set-PSReadLineKeyHandler -Key Tab -ScriptBlock { Invoke-FzfTabCompletion }
#$env:FZF_DEFAULT_COMMAND = 'fd --type f --hidden --follow --exclude .git'
#$env:FZF_CTRL_T_COMMAND = $env:FZF_DEFAULT_COMMAND

$env:DISPLAY = "127.0.0.1:0"
