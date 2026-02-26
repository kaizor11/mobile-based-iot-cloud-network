$config = Get-Content .env | ForEach-Object {
    if ($_ -match "(.+)=(.+)") {
        [System.Environment]::SetEnvironmentVariable($matches[1], $matches[2].Trim('"'))
    }
}

ssh -i $env:PEM_PATH "$env:EC2_USER@$env:EC2_HOST"