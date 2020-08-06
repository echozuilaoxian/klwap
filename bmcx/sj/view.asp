
<% @LANGUAGE="VBSCRIPT" CODEPAGE="65001" %>
<%dim sid
sid=request.querystring("sid")
%>
<%
'============================================================
' 更新: 2007/09/10
' 主页: qq.dxssb.cn 
' Q Q : 345123198
' 版权:  All Rights Reserved.
'============================================================
dim   Eurl,Wurl,listID
 Eurl=request("Eurl")
Wurl=request("Wurl")
listID=request("listID")
Str_BookName = Html2Code(Request.QueryString("bookname"))
page=request("page")
dim myThief,waps,page,page2	
On Error Resume Next
Server.ScriptTimeOut=9999999
Function getHTTPPage(Path)
 t = GetBody(Path)
End function
function getHTTPPage(url) 
dim Http 
set Http=server.createobject("Microsoft.XMLHTTP") 
Http.open "GET",url,false 
Http.send() 
if Http.readystate<>4 then 
exit function 
end if 
getHTTPPage=bytesToBSTR(Http.responseBody,"gb2312") 
set http=nothing 
if err.number<>0 then err.Clear 
end function 
Function BytesToBstr(body,Cset) 
dim objstream 
set objstream = Server.CreateObject("adodb.stream") 
objstream.Type = 1 
objstream.Mode =3 
objstream.Open 
objstream.Write body 
objstream.Position = 0 
objstream.Type = 2 
objstream.Charset = Cset 
BytesToBstr = objstream.ReadText 
objstream.Close 
set objstream = nothing 
End Function 
Dim Url,Html,body,body2
Url="http://bible.younet.com/"&Eurl&"" 
body=getHTTPPage(url) 
body2= Splits(body)
body2 = replace(body2,"																									","")
body2 = replace(body2,"-->","")
Function Splits(StrHTML)
	Dim Re,Str
	Str = StrHTML
	Set Re = New Regexp
	Re.IgnoreCase = True
	Re.Global = True
	Re.Pattern = "<html>[\s\S]+?查看/发表评论</a></font>&nbsp;&nbsp;&nbsp;</nobr></td>"
	Str = Re.Replace(Str, "")
	Re.Pattern = "查看/发表评论 >>></a>[\s\S]+?/html>"
	Str = Re.Replace(Str, "")
	Re.Pattern = "<a href=""http://user.younet.com/detail.php\?id=.+?"" target=_blank class=blue>.+?</a>.+?<font color=""#666666"">"
	Str = Re.Replace(Str, "\")
	Re.Pattern = "<div class=content>"
	Str = Re.Replace(Str, "\---------------\")
	Re.Pattern = "(</table> -->|</object>  -->)"
	Str = Re.Replace(Str, "")
re.Pattern = "</P>"	
Str = re.Replace(Str,"\")
re.Pattern = "<[^>]+>|</[^>]+>"	
Str = re.Replace(Str,"")
		Str = Replace(Str,Chr(32),"") '空格
		Str = Replace(Str,Chr(10),"")
		Str = Replace(Str,Chr(13),"") '回车符
Splits = Str
Set Re = Nothing
End Function
function UBBCodex(strContent)
	on error resume next
	strContent = HTMLEncode(strContent)
	dim objRegExp
	Set objRegExp=new RegExp
	objRegExp.IgnoreCase =true
	objRegExp.Global=True
        StrContent = Replace(StrContent,"&","&amp;")
		StrContent = Replace(StrContent,"<","&lt;")
		StrContent = Replace(StrContent,">","&gt;")
		StrContent = Replace(StrContent,Chr(34),"&quot;") '双引号
		StrContent = Replace(StrContent,Chr(32),"") '空格
		StrContent = Replace(StrContent,Chr(10),"<br/>")
		StrContent = Replace(StrContent,Chr(13),"<br/>") '回车符
		StrContent = Replace(StrContent,Chr(39),"&#39;") '单引号
        StrContent = Replace(StrContent,"&amp;amp;","&amp;")
		StrContent = Replace(StrContent,"&amp;lt;","&lt;")
		StrContent = Replace(StrContent,"&amp;gt;","&gt;")
		StrContent = Replace(StrContent,"&amp;nbsp;","&nbsp;")
		StrContent = Replace(StrContent,"　"," ") '全角空格
		StrContent = Replace(StrContent,"（","(")
		StrContent = Replace(StrContent,"）",")")
        objRegExp.Pattern="(\\)"
	strContent= objRegExp.Replace(strContent,"<br/>")
	set objRegExp=Nothing
	UBBCodex=strContent
end function	
Function Html2Code(Str)
	Dim StrContent:StrContent = Trim(Str)
	If Not IsNull(StrContent) Then
		StrContent = Replace(StrContent,"&","&amp;")
		StrContent = Replace(StrContent,"<","&lt;")
		StrContent = Replace(StrContent,">","&gt;")
		StrContent = Replace(StrContent,Chr(34),"&quot;") '双引号
		StrContent = Replace(StrContent,Chr(32),"") '空格
		StrContent = Replace(StrContent,Chr(10),"<br/>")
		StrContent = Replace(StrContent,Chr(13),"<br/>") '回车符
		StrContent = Replace(StrContent,Chr(39),"&#39;") '单引号
		'处理一些乱七八糟符合,美观一些，嘿嘿
		StrContent = Replace(StrContent,"　","") '全角空格
		StrContent = Replace(StrContent,"（","(")
		StrContent = Replace(StrContent,"）",")")
	End If
	Html2Code = StrContent
End Function
pageWordNum=350
StartWord = 1
Length=len(body2)
PageAll=(Length+PageWordNum-1)\PageWordNum
i=request("i")
if isnull(i) or i="" then
i=0
end if
page2 = mid(body2,StartWord+i*PageWordNum,PageWordNum)
ppp=request.queryString("p")
Call Head()
%>
<card id='main' title='文章内容'>
<p> 
<!--放广告处,请在下面空白处放-->



<!--放广告处-->
<%
if Str_BookName <>"" then
Response.Write Str_BookName &"<br/>"
end if 
'Response.Write "---------------<br/>"
body2 = replace(body2,"-->","")
response.write UBBCodex(page2) & "<br/>"
if cint(i)=cint(PageAll)-1 then
response.write "(完)<br/>来源:互联网(转载文章)<br/>"
End if
if 0<=i<PageAll then
if cint(i)<cint(PageAll)-1 then
Response.Write "<a href='view.asp?EURL=" & EURL & "&amp;i=" & i+1 & "&amp;id=" & id &"&amp;listID=" & listID & "&amp;Wurl=" &Wurl& "&amp;urlID=" & urlID & "&amp;page="&page&"&amp;sid="&sid&"'>下一页</a>"
End if
if cint(i)>0 then 
Response.Write "&nbsp;" & "<a href='view.asp?EURL=" & EURL & "&amp;i=" & i-1 & "&amp;listID=" & listID & "&amp;id=" & id & "&amp;Wurl=" &Wurl& "&amp;urlID=" & urlID & "&amp;page="&page&"&amp;sid="&sid&"'>上一页</a>"
End if
End if
if cint(i)<cint(PageAll)-1 then
response.write "&nbsp;" & "&#40;" &  i+1 & "&#47;" & PageAll & "&#41;"
response.write "<br/>" & "<a href='#card2'>按页搜索</a>"
End if
%>
<%
Call Last
Call jdn()
Sub Head()
    Response.ContentType = "text/vnd.wap.wml"
    Response.Write "<?xml version=""1.0"" encoding=""utf-8""?>"
    Response.Write "<!DOCTYPE wml PUBLIC ""-//WAPFORUM//DTD WML 1.1//EN"" ""http://www.wapforum.org/DTD/wml_1.1.xml"">"
    Response.Write "<wml>"
    Response.Write "<head>"
    Response.Write "<meta http-equiv=""Cache-Control"" content=""max-age=0""/>"
    Response.Write "<meta http-equiv=""Cache-Control"" content=""no-cache""/>"
    Response.Write "</head>"
End Sub
Sub Last
    Response.Write "<br/>-------------<br/>"
    Response.Write "<a href=""list.asp?Wurl="&Wurl&"&amp;listID="&listID&"&amp;page="&page&"&amp;sid="&sid&""">返回列表</a><br/>"
    Response.Write "<a href=""index.asp?sid="&sid&""">手机宝典</a><br/>"
    Response.Write "<a href=""/index.asp?sid="&sid&""">返回首页</a><br/>"
%>
<!--放广告处,请在下面空白处放-->



<!--放广告处-->
<%
Response.Write "</p>"
Response.Write "</card>"
End Sub
Sub jdn()								
response.write "<card id='card2' title='指定页面'>"
response.write "<p>"
response.write "跳到第:<input  name='i' value='0' format='*N'/><anchor>页，跳吧<go method='post' href='view.asp?EURL=" & EURL & "&amp;Wurl=" &Wurl&"&amp;sid="&sid&" '><postfield name='i' value='$(i)'/><postfield name='id' value='" & id & "'/><postfield name='sid' value='" & sid & "'/><postfield name='listID' value='" & listID & "'/><postfield name='offset' value='" & offset & "'/><postfield name='urlID' value='" & urlID & "'/><postfield name='page' value='" & page & "'/></go></anchor>"
    Response.Write "</p>"
    Response.Write "</card>"
    Response.Write "</wml>"
    Response.End
End Sub
%>
