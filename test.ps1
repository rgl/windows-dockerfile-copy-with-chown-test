# enable strict mode and fail the job when there is an unhandled exception.
Set-StrictMode -Version Latest
$FormatEnumerationLimit = -1
$ErrorActionPreference = 'Stop'
$ProgressPreference = 'SilentlyContinue'
trap {
    Write-Host "ERROR: $_"
    ($_.ScriptStackTrace -split '\r?\n') -replace '^(.*)$', 'ERROR: $1' | Write-Host
    ($_.Exception.ToString() -split '\r?\n') -replace '^(.*)$', 'ERROR EXCEPTION: $1' | Write-Host
    Exit 1
}

function Write-Title($title) {
    Write-Output "#`n# $title`n#"
}

# wrap the docker command (to make sure this script aborts when it fails).
function docker {
    docker.exe @Args | Out-String -Stream -Width ([int]::MaxValue)
    if ($LASTEXITCODE) {
        throw "$(@('docker')+$Args | ConvertTo-Json -Compress) failed with exit code $LASTEXITCODE"
    }
}

Write-Title 'docker info'
docker info

Write-Title 'docker.exe path'
(Get-Command docker.exe).Source

# see https://github.com/moby/moby/issues/41776
Write-Title 'containerutility.exe path'
$containerutilityCommand = Get-Command -ErrorAction SilentlyContinue containerutility.exe
if ($containerutilityCommand) {
    $containerutilityCommand.Source
} else {
    "WARNING containerutility.exe not found on PATH"
}

Write-Title 'docker info'
docker info

Push-Location test

Write-Title 'building test image'
docker build --iidfile image-id.txt .

$imageId = Get-Content -Raw image-id.txt

Write-Title 'running test image'
docker run --rm --tty $imageId

Pop-Location
