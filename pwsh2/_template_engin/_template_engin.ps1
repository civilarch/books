# ---------------------------------------- 
# sf   : C:\_usr\prg\powershell2\_template_engin\_template_engin.ps1
# Time : Friday April 19, 2024 14:25:00
# ---------------------------------------- 
# ---------------------------------------- 
# ------------------ 1






# ------------------ 2

powershell template engine

Does PowerShell have a templating engine?


# ------------------ 3

https://github.com/straightdave/eps




# ------------------ 4

EPS ( Embedded PowerShell ), inspired by ERB, is a templating tool that embeds PowerShell code into a text document. It is conceptually and syntactically similar to ERB for Ruby or Twig for PHP.



Install-Module -Name EPS


# ------------------ 5


Invoke-EpsTemplate [-Template <string>] [-Binding <hashtable>] [-Safe]  [<CommonParameters>]

Invoke-EpsTemplate [-Path <string>] [-Binding <hashtable>] [-Safe]  [<CommonParameters>]



$name = "Dave"

Invoke-EpsTemplate -Template 'Hello <%= $name %>!'





Invoke-EpsTemplate -Template @'
<% 1..5 | Each { -%>
<%= $Index + 1 %>. <%= $_ %>
<% } -%>
'@


Invoke-EpsTemplate -Template @'
<% "Dave", "Bob", "Alice" | Each { -%> <%= $Index + 1 %>. <%= $_ %> <% } -%>
'@


