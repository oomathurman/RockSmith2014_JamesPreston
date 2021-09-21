write-host "I did not create these files, all credit for these goes to James Preston.  Please donate to them if you enjoy their work."
write-host "https://jamesprestonblog.wordpress.com/"
write-host ""

# $url = "https://jamesprestonblog.wordpress.com/2017/12/02/cdlc-not-submitted-to-customsforge/"
$url = "https://jamesprestonblog.wordpress.com/rocksmith-custom-list/"
$dest = "./Downloads/" # Zip File Location
$rsFolder = "C:\Program Files (x86)\Steam\steamapps\common\Rocksmith2014\dlc"
$result = Invoke-WebRequest $url

write-host "Pulling PSARCs from : " $url


foreach ($link in $result.links){
    if($link.href -like "https://www.dropbox.com/*"){
        try {
            write-host "Found:" $link.OuterText
            if ( ($link.OuterText -cmatch "\?")) {
                $link.OuterText = $link.OuterText -replace '\?', ''
                write-host "  Invalid Character (?) Replaced!"
                write-host " "$link.OuterText
            }
            $newLink = $link.href -replace "dl=0", "dl=1"
            $destFile = $dest + $link.OuterText + ".zip"
            write-host "  Downloading"
            try {
                Invoke-WebRequest -Uri $newLink -OutFile $destFile -ErrorAction Stop
            }
            catch {
                write-host "  Unable to download."
                continue
            }
            try {
                write-host "  Extracting"
                Expand-Archive -LiteralPath $destFile -DestinationPath $dest
                write-host "  Removing Trash"
                Remove-Item $destFile
            }
            catch {
                write-host "  Unable to Extract."
                continue
            }

        }
        catch {
            write-host "  Unable to download or extract file."
            continue
        }
        try {
            write-host "  Moving File to RS DLC Folder"
            Move-Item -Path $dest\*.psarc -Destination $rsFolder -ErrorAction Stop
        }
        catch {
            write-host "  Moving File FAILED - probly already exists"
            Remove-Item $dest\*.psarc
            continue
        }    
    }
}

