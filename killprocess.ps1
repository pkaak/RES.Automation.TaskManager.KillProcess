#needs Powershell 4.x or higher
#needs processid that can be found with listprocess.ps1

$id = '$[id]'

Stop-Process -id $id -force
