[cmdletbinding()]
param()

function Set-VsixVersion {
    [cmdletbinding()]
    param (
        [Parameter(Mandatory=1)]
        [string]$vsixmanifestPath,

        [Parameter(Mandatory=1)]
        [string]$version
    )
    process {
        Write-Host "Setting version in:" $vsixmanifestPath "to" $version "..." -NoNewline

	    [xml]$xmlContent = Get-Content $vsixmanifestPath
	    $xmlContent.PackageManifest.Metadata.Identity.Version = $version
	    $xmlContent.Save($vsixmanifestPath)

        Write-Host "Done."
    }
}

 function Set-NuspecVersion {
    [cmdletbinding()]
    param (
        [Parameter(Mandatory=1)]
        [string]$nuspecPath,

        [Parameter(Mandatory=1)]
        [string]$version
    )
    process {
        Write-Host "Setting version in:" $nuspecPath "to" $version "..." -NoNewline

	    [xml]$xmlContent = Get-Content $nuspecPath
	    $xmlContent.package.metadata.version = $version
	    $xmlContent.Save($nuspecPath)

        Write-Host "Done."
    }
}
