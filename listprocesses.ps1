#gives all processes runned by user in format for ROID to handle
#needs Powershell 4.x or higher

#variables
$username = '$[username]'                         #username to filter processes on
$filterlist = '$[Filter]'                     #filter with processes that do not need to be shown

$returnlist = ''
$filter = $filterlist.split(';')

#get processlist on machine
#needs admin rights
$processlist = Get-Process -IncludeUserName

for ($count=0;$count -lt $processlist.Length; $count++) {
    if ($processlist[$count].username -match $username) 
    {
     #check processname with filterlist
        $found=''
        $filter|foreach{
            if ($processlist[$count].ProcessName -match $_){
                #match found
                $found='true'
            }
        }

     if ($found -notmatch 'true')     
        {
	        $returnlist = $returnlist + $processlist[$count].ProcessName + ';' + $processlist[$count].ID + '|'
        }
    }
}
$returnlist = $returnlist.TrimEnd('|')
$returnlist
