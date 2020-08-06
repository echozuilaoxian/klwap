<%
function outHTM(str)
if str="" or isnull(str) then
	tohtm=str
	exit function
end if
outHTM = replace(str,"&","&amp;")
outHTM = replace(outHTM,"","&quot;")
outHTM = replace(outHTM,"<","&lt;")
outHTM = replace(outHTM,">","&gt;")
outHTM = replace(outHTM,"&nbsp;","")
outHTM = replace(outHTM,"'","&apos;")
outHTM = replace(outHTM,"$","$$")
outHTM = replace(outHTM,"&#xFFE5;","*")
outHTM = replace(outHTM,"&#39;","'")
outHTM = replace(outHTM,vbnewline,"<br/>")
outHTM = ubbcode(outHTM)
end function

function UBBCode(strContent)
	dim re,i
	UbbCode=strContent
	if (instr(strContent,"[")=0 or instr(strContent,"]")=0) and instr(strContent,"http://")=0 then
		exit function
	end if
	
	Set re=new RegExp
	re.IgnoreCase =true
	re.Global=True
	
	'¹ýÂËscriptÊÂ¼þ
	if instr(1,strContent,"on",1)>0 then
		re.Pattern="on(\w+)="
		strContent=re.Replace(strContent,"on_$1=")
	end if
	strContent=Replace(strContent,"file:","file :")
	strContent=Replace(strContent,"files:","files :")
	strContent=Replace(strContent,"script:","script :")
	strContent=Replace(strContent,"js:","js :")

	if instr(1,strContent,"[IMG]",1)>0 then
		re.Pattern="(\[IMG\])(.[^\[]*)(\[\/IMG\])"
		strContent=re.Replace(strContent,"<a href=""$2""><img src=""$2"" alt=""loading""/></a>")
	end if

	if instr(1,strContent,"[/url]",1)>0 then
		re.Pattern="(\[URL\])(.[^\[]*)(\[\/URL\])"
		strContent= re.Replace(strContent,"<a href=""$2"">$2</a>")
		re.Pattern="(\[URL=(.[^\]]*)\])(.[^\[]*)(\[\/URL\])"
		strContent= re.Replace(strContent,"<a href=""$2"">$3</a>")
	end if

if instr(1,strContent,"[/C]",1)>0 then
		re.Pattern="(\[C=(.[^\]]*)\])(.[^\[]*)(\[\/C\])"
		strContent= re.Replace(strContent,"<a href=""wtai://wp/mc;$2"" >$2</a>")
	end if
	
'	if instr(1,strContent,"http://",1)>0 then
'		re.Pattern = "^(http://[A-Za-z0-9\./=\?%\-&_~`@':+!]+)"
'		strContent = re.Replace(strContent,"<a href=$1>$1</a>")
'		re.Pattern = "(http://[A-Za-z0-9\./=\?%\-&_~`@':+!]+)$"
'		strContent = re.Replace(strContent,"<a href=$1>$1</a>")
'		
'		re.Pattern = "([^>=""])(http://[A-Za-z0-9\./=\?%\-&_~`@':+!]+)"
'		strContent = re.Replace(strContent,"$1<a href=$2>$2</a>")
'	end if
	
	if instr(1,strContent,"[/i]",1)>0 then
		re.Pattern="(\[i\])(.[^\[]*)(\[\/i\])"
		strContent=re.Replace(strContent,"<i>$2</i>")
	end if
	if instr(1,strContent,"[/u]",1)>0 then
		re.Pattern="(\[u\])(.[^\[]*)(\[\/u\])"
		strContent=re.Replace(strContent,"<u>$2</u>")
	end if
	if instr(1,strContent,"[/b]",1)>0 then
		re.Pattern="(\[b\])(.[^\[]*)(\[\/b\])"
		strContent=re.Replace(strContent,"<b>$2</b>")
	end if

	strContent=Replace(strContent,"(br)","<br/>")
	strContent=Replace(strContent,"[br]","<br/>")
	strContent=Replace(strContent,"[date]",""&date&"")
	strContent=Replace(strContent,"[time]",""&time&"")
	strContent=Replace(strContent,"(date)",""&date&"")
	strContent=Replace(strContent,"(time)",""&time&"")
	strContent=Replace(strContent,"[now]",""&now&"")
	strContent=Replace(strContent,"(now)",""&now&"")
	strContent=Replace(strContent,"<br/>[center]","</p><p align=""center"">")
	strContent=Replace(strContent,"[center]","</p><p align=""center"">")
	strContent=Replace(strContent,"<br/>[left]","</p><p align=""left"">")
	strContent=Replace(strContent,"[left]","</p><p align=""left"">")
	strContent=Replace(strContent,"<br/>[right]","</p><p align=""right"">")			
	strContent=Replace(strContent,"[right]","</p><p align=""right"">")	
	
	set re=Nothing
	UBBCode=strContent
end function
%>