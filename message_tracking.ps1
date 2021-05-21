#Login to the Exchange Server and open ExchangeShell
#To find a message outbound from an email address to any external recipient
#This will avoid using the EAC message tracking tool for better granular results
#Variations of time/date stamps and exports will be included

#To show a list in Powershell of all messages from a user over a date range

get-transportserver | get-messagetrackinglog -sender email@emaildomain.com -start "5/1/2021" -end "5/2/2021" | ft timestamp, source, sender, recipients, messagesubject



#Export a list of emails from a specific user to show all data included with message transport logs. Recipient not explicitly identified in this script

get-transportserver | get-messagetrackinglog -sender email@emaildomain.com -start "5/1/2021" -end "5/2/2021 | export-csv c:\temp\messagetracking.csv



#Show a list of messages from a user on a specific date within a specific time frame

get-transportserver | get-messagetrackinglog -sender email@emaildomain -start "5/1/2021 06:00:00AM -end 5/1/2021 09:00:00AM"



#To search for all messages from a user for the last 10 days. Adjust the number of days as needed. And export to CSV as needed.

get-transportserver | get-messagetrackinglog -sender email@emaildomain -start (get-date).adddays(-10) | Export-csv c:\temp\messagetracking.csv
