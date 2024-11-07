
# 
# file copy
# 
# 

# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: constants

$root_src = 'C:'
$root_dst = "Y:/arch"

$list_sd_src = @(
    'C:\_etc\pos',
    'C:\_usr\prg\Sublime_1',
    'C:\_etc\win\bin'
)


oooo  " -- `$list_sd_src :$list_sd_src ";

# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: mock
    $sf_src   = 'C:\_etc\pos\py_lib\my.py'
# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: mock

# fs_copy_one($sf_src, $root_dst)

function fs_copy_one($sf_src, $root_dst) {

    $sf_src   = sp_posix($sf_src -replace '\\\\?', '/')
    # $sd   = Split-Path $sf 
    # ---------------------------------------- 
    $sd_src   = $sf_src -replace '[\\/][^\\/]*$'
    $sfn_src  = $sf_src -replace '^.*[\\/]'

    $sd_mid   = "$($sd_src -replace '^[^\\/]*[\\/]', '')"
    $sd_dst   = "$root_dst/$sd_mid"
    $sf_dst   = "$sd_dst/$sfn_src"
    # :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: mock
    oo_vars 'sf_src'  'sd_src'  'sfn_src' 'sd_mid' 'sd_dst'  'sf_dst'  

    # ---------------------------------------- 

    # 1..3|%{"ni -i d Apache_env_$_"} | iex

    if (test-path $sf_dst)    { ri -r -fo -v  $sf_dst }

    if (!(test-path $sd_dst)) { ni -i d  $sd_dst }

    cp -r -v    $sf_src  $sf_dst
    
}


# fs_copy_one  $sf_src   $root_dst

# $list_inc = @( '*.', '*.', '*.', '*.', '*.', '*.', '*.', '*.', '*.', '*.', '*.', '', '', '')
# $list_inc = @( '*.', '*.', '*.', '*.', '*.', '*.', '*.', '*.', '*.', '*.', '*.', '', '', '')
# $exc_path = @('temp', 'cache', 'node_modules', 'XXXX', 'XXXX', 'XXXX', 'XXXX', 'XXXX',   )

$inc_exts = @('*.ps1', '*.py', '*.txt', '*.sh', '*.conf', '*.htacsess' )
$exc_path = @('temp', 'cache', 'node_modules' )

$Optkey = '-D'
$Optval = '-2'


function match_to_list($str, $list) {
    foreach ($item in $list) {
        if( $str -match  $item ) {return $true}
    }
    return $false
}

function filter_cb($of) {
    if( $of.FullName -match $exc_path ) {return $false}
    # if( match_to_list $of.FullName -match  'temp' ) {return $false}
    if( is_recent $of.LastWriteTime $Optkey $Optval ) {return true}
    
    return $false
}


$list_sd_src | %{
    
    oooo "`n`n"; 
    oooi "`# ================================================"; 
    oooi "$_"
    oooi "`# ================================================"; 
    oooo "`n"; 
    sleep 0.8
    
    # gci -r -file $_ | ?{ (is_recent $_.LastWriteTime $Optkey $Optval) } |Measure -l
    # gci -r -file -Include *.ps1,*.py  $_ | ?{ (is_recent $_.LastWriteTime $Optkey $Optval) } | %{$_.fullname}
    gci -r -file -Include $inc_exts  $_ | ?{ (is_recent $_.LastWriteTime $Optkey $Optval) } | %{
    
        fs_copy_one  $_   $root_dst
    
    }


}







# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: variables
$sd_mid   = ''


# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: gather

# gci -r -file C:\_etc\pos | ?{ (Get-Date).AddDays(-1) -le $_.LastWriteTime } | Measure -l
# 

# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: filter
# inc_cb  sf_src  sf_dst
function inc_cb {
    
}

 

