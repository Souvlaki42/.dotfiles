# Powershell profile v0.2 by [Souvlaki42](https://github.com/Souvlaki42)

# Function to update Powershell
function update {
    try {
        Write-Host "Checking for PowerShell updates..." -ForegroundColor Cyan
        $updateNeeded = $false
        $currentVersion = $PSVersionTable.PSVersion.ToString()
        $gitHubApiUrl = "https://api.github.com/repos/PowerShell/PowerShell/releases/latest"
        $latestReleaseInfo = Invoke-RestMethod -Uri $gitHubApiUrl
        $latestVersion = $latestReleaseInfo.tag_name.Trim('v')
        if ($currentVersion -lt $latestVersion) {
            $updateNeeded = $true
        }

        if ($updateNeeded) {
            Write-Host "Updating PowerShell..." -ForegroundColor Yellow
            winget upgrade "Microsoft.PowerShell" --accept-source-agreements --accept-package-agreements
            Write-Host "PowerShell has been updated. Please restart your shell to reflect changes" -ForegroundColor Magenta
        } else {
            Write-Host "Your PowerShell is up to date." -ForegroundColor Green
        }
    } catch {
        Write-Error "Failed to update PowerShell. Error: $_"
    }
}

# Initialize oh-my-posh with my configuration file
oh-my-posh init pwsh --config ~/.oh-my-posh.toml | Invoke-Expression

# Initialize zoxide as the default cd command
Invoke-Expression (& { (zoxide init --cmd cd powershell | Out-String) })

# Enable the syntax highlighting module
Import-Module -Name syntax-highlighting

# Enable the terminal icons module
Import-Module -Name Terminal-Icons

# Aliases
function cl { Clear-Host @args }
function sysinfo { Get-ComputerInfo @args }
function flushdns { Clear-DnsClientCache @args }
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
function rm { gomi @args }

# Built-in functions
function grep($regex, $dir) {
    if ( $dir ) {
        Get-ChildItem $dir | select-string $regex
        return
    }
    $input | select-string $regex
}
function which($name) {
    Get-Command $name | Select-Object -ExpandProperty Definition
}
function export($name, $value) {
    set-item -force -path "env:$name" -value $value;
}
function pkill($name) {
    Get-Process $name -ErrorAction SilentlyContinue | Stop-Process
}
function pgrep($name) {
    Get-Process $name
}
function touch($file) { "" | Out-File $file -Encoding ASCII }

function unzip ($file) {
    Write-Output("Extracting", $file, "to", $pwd)
    $fullFile = Get-ChildItem -Path $pwd -Filter $file | ForEach-Object { $_.FullName }
    Expand-Archive -Path $fullFile -DestinationPath $pwd
}

# Network Utilities
function ipv4 { curl https://api.ipify.org }
function ipv6 { curl https://api64.ipify.org }

# Clipboard Utilities
function cpy { Set-Clipboard $args[0] }
function pst { Get-Clipboard }