# RES.Automation.TaskManager.KillProcess

Version 1.0.0 - 24 april 2017
By Patrick Kaak (p.kaak@res.com)


Requirements:
Powershell 4.x or higher

RES ONE Automation buildingblocks:
Modules and Runbooks included.

List All Processes of a user
Needs a username without domainname to run. Uses builtin filter, but the filter parameter can be changed. 
!The filter works with partial process names! Process names in the filter need to be seperated by a semicolon ( ; )
Returns a Tasklist with filtered running processes by a user in a format for RES ONE Identity Director to handle.
TaskList is semicolon seperated for columns, pipe symbol ( | )seperated for rows
TaskList is built up with [processname];[process id]

Kill Process
Needs only a process ID, which can be found with List All Processes of a user


RES ONE Identity Director samples
Kill Process
This services can be used by a requester only, as it uses the Requester DeviceID to run the Runbook on the right client.
It uses List All Processes of a user in ROA to get a list of all processes that are running for the user. After this it returns the list to to requester, so he/she can select a process to kill. After this it runs Kill Process Runbook with the DeviceID of the Requester and the Process ID that need to be killed, to kill a process. This service needs the SAMaccount person identifier in place with the SAMaccountname of the user.

Kill process for a user
This service can be used by any user. Recommended to change the qualification so not all users can use this service. It requires to input the username (without the domain) and the client on which to user is logged on. Rest of the process works the same as the Kill Process service.
