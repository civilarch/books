
 
# >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> 
# ---------------------------------------- $sf_self
$sf_self  = sp_posix $PSCommandPath 
$sd_pwd   = pop_slash(sp_posix $PSScriptRoot)
oo_vars sf_self sd_pwd  
Set-Location (sp_posix $PSScriptRoot)
# ---------------------------------------- 
$sp_par_self, $sfn_self, $_Z = sp_split $sf_self
$fld_last = (sfnb_last_field $sf_self)
$ext_os   = '.' + $fld_last

# ---------------------------------------- Variables
$sn_find = 'SSSS'
$sn_subj = ''

$sdPar, $spn, $R_ = sp_split $sd_pwd
$sn_subj = $spn
echo  " -- `$sn_subj    :$sn_subj ";

# >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> 



# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 
# :: sContent_tmpl
# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 
$sContent_tmpl = @'
<!DOCTYPE html>
<html>
    <head>
        <title>${subj}</title>
    </head>
    <body>
        <h1>Hello, ${subj}!</h1>
        <p>This is my first web page.</p>
        <p>It contains a 
             <strong>main heading</strong> and <em> paragraph </em>.
        </p>
    </body>
</html>
'@


# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 
# :: folder : list
# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 
$tDirs = @'
Tables
    Table_Borders
    Table_Sizes
        xxxxxx
            yyyyyyy
    Table_Headers
Lists
'@

# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 
# :: 
# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 
$aLines = $tDirs -split '\r?\n'
$aLines  = ($aLines | ?{ ($_ -notmatch '^\s*$') -and ($_ -notmatch '^\s*#')  } )
# ---------------------------------------- 
# $sdns = New-Object string[] 9;  $sdns = [string[]]::new(9)
$sdns = @('') * 9; $lvl = 0
# ---------------------------------------- 
ForEach ($line in $aLines) {
    $line -match '^(\t*)(.*)'
    $sSps, $sdn = $line -split '(?=\S)', 2
    $sTabs = $sSps -replace  '    ',  "`t"
    $lvl   = $sTabs.length
    
    $sdns[$lvl] = $sdn
    if ($lvl) {
        $sd_par = ($sdns[0..($lvl-1)]) -join '/'
        $sd = $sd_par + '/' + $sdn
    } else {
        $sd = $sdn
    }
    ni -i d $sd
    
    # ------------------ 
    $sContent = $sContent_tmpl -replace '\${subj}', $sdn
    sc ($sd + '/' + "$sdn.html") $sContent
}







# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 
echo ''; oooi "$(':'*50)";
Sleep -m 200; $nSec = [int]$env:PSRUNWAIT; Sleep -m 200
__Chect_out__  $nSec
# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 
# exit





