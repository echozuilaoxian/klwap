<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%> 
<% Response.ContentType="text/vnd.wap.wml" %><?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<wml>
<head>
<meta http-equiv="Cache-Control" content="max-age=0"/>
<meta http-equiv="Cache-Control" content="no-cache"/>
</head>
<card title="英汉在线互译">
<p align="left">英汉在线互译</p>
<%SessionID=request.querystring("SessionID")%>
<%
keyword=trim(request("keyword"))
langpair=request("langpair")
if keyword="" or langpair="" then 
	call form1
	response.Write "</card></wml>"
	response.end
else
	call ax
end if
 %>
 <% function uni(Byval chinese)
	  dim i,a
	  str=""
	  for i=1 to len(chinese)
	   a=mid(chinese,i,1)
	   str=str+"&#x"& hex(ascw(a))+";"
	   next
	   uni=str
	   end function %>
<%sub form1 %>	   
<p align="left">
<%= uni("请输入内容:") %><br/><input type="text" name="keyword1" value="" /><br/>
<anchor><%= uni("翻译到英语") %><go href="fan.asp" method="get" >
<postfield name="keyword" value="$keyword1" />
<postfield name="langpair" value="zh|en" />
</go></anchor><br/>
<anchor><%= uni("翻译到汉语") %><go href="fan.asp" method="get" >
<postfield name="keyword" value="$keyword1" />
<postfield name="langpair" value="en|zh" />
</go></anchor>
</p>
<a href='/index.asp'>返回wap建站天堂</a><br/>
<% end sub %>
<% sub ax
dim Http 
set Http=server.createobject("MICROSOFT.XMLHTTP") 
Http.open "GET","http://translate.google.com/translate_t",false 
Http.send("langpair="&langpair&"&hl=zh-CN"&"&ie=utf-8"&"&text="&keyword) 
getHTTPPage=Http.responsetext
set http=nothing
beginpos=instr(getHTTPPage,"id=result_box")
if beginpos<1 then
	response.write uni("错误!")
	response.Write "</card></wml>"
	response.end
end if
getHTTPPage=right(getHTTPPage,len(getHTTPPage)-beginpos-23)
getHTTPPage=left(getHTTPPage,instr(getHTTPPage,"</div")-1)
if langpair="en|zh" then
	response.write uni(getHTTPPage)
else
	response.write getHTTPPage
end if
call form1
end sub
%>
</card>
</wml>
