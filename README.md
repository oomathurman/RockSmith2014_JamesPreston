# RockSmith 2014 James Preson Tab Downloader
## Please visit https://jamesprestonblog.wordpress.com/

## Features
This script will download all psarc's listed on James Preston's Blog.

## Config
$url = the page you want to download from, all listed on customforge, or overlaps
Both urls are in the code, uncomment the one you want.
$dest = Temp Folder to download zip files, and extract them
$rsFolder = your rocksmith install folder.

## Execution
Powershell:
```sh
PS D:\gitlab\RockSmith2014_JamesPreston> .\rs.ps1

I did not create these files, all credit for these goes to James Preston.  Please donate to them if you enjoy their work.
https://jamesprestonblog.wordpress.com/

Pulling PSARCs from :  https://jamesprestonblog.wordpress.com/rocksmith-custom-list/
Found: 3 Colours Red – Copper Girl
  Downloading
  Extracting
  Removing Trash
  Moving File to RS DLC Folder
Found: 10,000 Maniacs – Hey Jack Kerouac
  Downloading
  Extracting
  Removing Trash
  Moving File to RS DLC Folder
```
These files will show up in RockSmith after Enumeration is completed.