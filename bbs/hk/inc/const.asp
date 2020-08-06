<%
function getdevid()
	getdevid=right(Request.ServerVariables("HTTP_X_UP_CALLING_LINE_ID"),11)
end function

Function geturl()
	dim filepath,finddir
	filepath=Request.ServerVariables("url")
	finddir=""
	for i=1 to len(filepath)
	if left(right(filepath,i),1)="/" or left(right(filepath,i),1)="\" then
	  abc=i
	  exit for
	end if
	next
	if abc <> 1 then
	finddir=left(filepath,len(filepath)-abc+1)
	end if
	geturl="http://" & Request.ServerVariables("http_host") &finddir
end Function

function checkstr(str)
if str = "" or isnull(str) then exit function
checkstr = replace(str,"'","''")
end function
%>