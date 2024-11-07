


function is_fsi  ($ob) { $ob -is [IO.FileSystemInfo] }
function sp_rel ($ob) { Resolve-Path -r $ob }

function is_file ($ob){if(is_fsi($ob)){!$ob.PSIsContainer} else { [IO.File]::Exists($ob) }
function is_dir  ($ob){if(is_fsi($ob)){ $ob.PSIsContainer} else { [IO.Directory]::Exists($ob) }
function is_exist($ob){if(is_fsi($ob)){ $true }            else { [IO.File]::Exists($ob) }


function sp_rear_copy_to( $sp_rear, $sd_head_dst ){
    $sp_rear = sp_posix(sp_rel $sp_rear).substring(2)
    $sp_dst = "$sd_head_dst/$sp_rear" 
    oooi $sp_dst
    if (! $global:dryrun) { 
        ni -i d -fo (Split-Path $sp_dst) | Out-Null
        sure_delete $sp_dst
        cpi -r -fo $sp_rear $sp_dst 
    }
}



function pipe_copy_to( $sd_head_dst, $mid="" ){
    begin { 
        $sd_dest = "$sd_head_dst$mid" 
    } 
    process { sp_rear_copy_to  $_  $sd_dest }
    # end { ooiie 'Done : pipe_copy_to' } 
}

    $sp = is_fsi($_){ Resolve-Path -r $ob } else { [IO.File]::Exists($ob) }



System.IO.FileSystemInfo


gci -r -dir -i um_*  -n | pipe_copy_to y:/aaaaaaaaaa



$sp_rear = ""
$sd_dst_base = ""


Resolve-Path -Relative  (gi "Y:\aaa\e_lib\gr_a")




sp_posix(sp_rel 'e_lib\um_top')






<#

gci -r -dir -i um_*  -n |  % { $t="y:/ooooo/$_";  cpi -r  $_  $t  }


um_subj
e_lib\um_top
e_lib\gr_a\um_root
e_lib\gr_a\a_proj\a_anderson\um_proj
e_lib\gr_a\a_proj\a_lang\um_proj
e_lib\gr_a\a_proj\a_os\um_proj
e_lib\gr_a\a_proj\a_pkg\curl\um_proj
e_lib\gr_a\a_proj\a_pkg\muPDF\um_proj
e_lib\gr_a\a_proj\a_pkg\thirdparty\um_proj
e_lib\gr_a\a_proj\a_pkg\UZip\ZipArchive\um_proj
e_lib\gr_a\a_proj\a_pkg\UZip\zip_lib\um_proj
e_lib\gr_a\a_src\a_pkg\muPDF\source\um_root
e_lib\gr_a\a_src\a_pkg\muPDF\source\tools\um_proj
e_lib\gr_b\um_root
e_lib\gr_b\b_proj\b_com\Acrobat_10\um_proj
e_lib\gr_b\b_proj\b_com\Coreldraw_15\um_proj
e_lib\gr_b\b_proj\b_com\InDesign_CS6\um_proj
e_lib\gr_b\b_proj\b_sdk\Illustrator_CS6\um_proj
e_man\um_top
e_man\o0_impo_PR\um_root
e_man\o0_impo_PR\o1_sol\o2_corel_to_pdf\to_pdf_Corel\um_proj
e_man\o0_impo_PR\o1_sol\o2_impo\o3_ImpoList_lib\um_proj
e_man\o0_impo_PR\o1_sol\o2_impo\o3_ImpoList_PR\um_proj
e_man\o0_impo_PR\o1_sol\o2_impo\o3_pdf_classify\um_proj
e_man\o0_impo_PR\o1_sol\o2_pi_ill\ImpoList_lib\um_proj
e_man\o0_impo_PR\o1_sol\o2_pi_ill\plugin_Illust\um_proj
e_man\o0_impo_PR\o1_sol\o2_pi_ind\plugin_Indesign\um_proj

#>