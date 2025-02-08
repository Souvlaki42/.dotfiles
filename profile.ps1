function cl { Clear-Host @args }
function fetch { fastfetch --gpu-driver-specific @args }
function ls { eza @args }
function la { eza -a @args }
function ll { eza -alh @args }
function tree { eza --tree @args }
function md { mkdir @args }
function cat { bat @args }
function lg { lazygit @args }
function pn { pnpm @args }
function v { nvim @args }
function c { code @args }
# function rm { Remove-Item -Recurse -Force @args }

oh-my-posh init pwsh --config ~/.oh-my-posh.toml | Invoke-Expression

Invoke-Expression (& { (zoxide init --cmd cd powershell | Out-String) })

Import-Module syntax-highlighting # https://github.com/digitalguy99/pwsh-syntax-highlighting
