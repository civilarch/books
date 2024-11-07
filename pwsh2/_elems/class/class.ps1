#! pwsh
# ---------------------------------------- 
# Title         : _elems/class/class.ps1
# Environment   : 
# Descriptions  : ---------------
# Date          : 240405_034744
# Created by    : Swami Nirav Atasa
# powershell C:/_var/_win/powershell2/_elems/class/class.ps1
# ---------------------------------------- 
# ---------------------------------------- 
# ------------------ 





# ---------------------------------------- 
# ------------------ 





# ---------------------------------------- 
# ------------------ 



class PublishedWork {
    static [PublishedWork[]] $List    = @()
    static [string[]]        $Artists = @()

static [void] RegisterWork([PublishedWork]$Work) {
        $wName   = $Work.Name
        $wArtist = $Work.Artist
        if ($Work -notin [PublishedWork]::List) {
            Write-Verbose "Adding work '$wName' to works list"
            [PublishedWork]::List += $Work
        } else {
            Write-Verbose "Work '$wName' already registered."
        }
        if ($wArtist -notin [PublishedWork]::Artists) {
            Write-Verbose "Adding artist '$wArtist' to artists list"
            [PublishedWork]::Artists += $wArtist
        } else {
            Write-Verbose "Artist '$wArtist' already registered."
        }
    }

static [void] ClearRegistry() {
        Write-Verbose "Clearing PublishedWork registry"
        [PublishedWork]::List    = @()
        [PublishedWork]::Artists = @()
    }

[string] $Name
    [string] $Artist
    [string] $Category

[void] Init([string]$WorkType) {
        if ([string]::IsNullOrEmpty($this.Category)) {
            $this.Category = "${WorkType}s"
        }
    }

PublishedWork() {
        $WorkType = $this.GetType().FullName
        $this.Init($WorkType)
        Write-Verbose "Defined a published work of type [$WorkType]"
    }

PublishedWork([string]$Name, [string]$Artist) {
        $WorkType    = $this.GetType().FullName
        $this.Name   = $Name
        $this.Artist = $Artist
        $this.Init($WorkType)

Write-Verbose "Defined '$Name' by $Artist as a published work of type [$WorkType]"
    }

PublishedWork([string]$Name, [string]$Artist, [string]$Category) {
        $WorkType    = $this.GetType().FullName
        $this.Name   = $Name
        $this.Artist = $Artist
        $this.Init($WorkType)

Write-Verbose "Defined '$Name' by $Artist ($Category) as a published work of type [$WorkType]"
    }

[void]   Register() { [PublishedWork]::RegisterWork($this) }
    [string] ToString() { return "$($this.Name) by $($this.Artist)" }
}




class Album : PublishedWork {
    [string[]] $Genres   = @()
}




$VerbosePreference = 'Continue'
$Albums = @(
    [Album]@{
        Name   = 'The Dark Side of the Moon'
        Artist = 'Pink Floyd'
        Genres = 'Progressive rock', 'Psychedelic rock'
    }
    [Album]@{
        Name   = 'The Wall'
        Artist = 'Pink Floyd'
        Genres = 'Progressive rock', 'Art rock'
    }
    [Album]@{
        Name   = '36 Chambers'
        Artist = 'Wu-Tang Clan'
        Genres = 'Hip hop'
    }
)

$Albums | Format-Table
$Albums | ForEach-Object { [Album]::RegisterWork($_) }
$Albums | ForEach-Object { [PublishedWork]::RegisterWork($_) }




# ---------------------------------------- 
# ------------------ 





# ---------------------------------------- 
# ------------------ 



