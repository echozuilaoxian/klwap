<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<%response.buffer=true%>
<%Response.ContentType = "text/vnd.wap.wml; charset=utf-8"%>
<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<!--#INCLUDE file="conn.asp"-->
<!--#INCLUDE file="conn1.asp"-->
<%
SessionID=request.querystring("SessionID")
if SessionID="" then SessionID=Session("SessionID")
if session("useid")="" then
       Session("returnuppath")=Request.ServerVariables("PATH_INFO") & "?iipp=iipp"
        response.redirect "/BBS/UseLogin.asp?SessionID="&SessionID&""
    End if
txt=request("txt")
pic=request("pic")
name=request("name")
lid=request("lid")
yc=request("yc")
agent=request.serverVariables("HTTP_USER_AGENT")

if txt="" then response.redirect "/BBS/yxxe/add.asp?SessionID=" & SessionID & ""
kword=split("fuck,他妈的,我靠,我操,去死,我叼",",")
function keyWord(s)
dim KwCount
KwCount=0
	for kwi=0 to ubound(kword)
		KwCount = KwCount + instr(s,kword(kwi))
	next
	keyWord=KwCount
end function
if keyWord(con)>0 then response.redirect "/BBS/yxxe/add.asp?SessionID=" & SessionID & ""

set rs=Server.CreateObject("ADODB.Recordset")
rsstr="select * from [l] order by ID desc"
rs.open rsstr,liao,1,2

dim errr
errr=0
if rs.recordcount>0 then
	if rs("txt")=txt then errr=1
end if

if errr=1 then eer="请不要重复发布，<br/>正在返回江湖发布！<br/>"
if errr<>1 then

rs.addnew

if txt<>"" then rs("txt")=txt

rs("pic")=pic
rs("lid")=lid
rs("name")=name
rs("yc")=yc
rs.update

end if


if rs.recordcount=0 then
rs.addnew

if txt<>"" then rs("txt")=txt

rs("pic")=pic
rs("lid")=lid
rs("name")=name
rs("yc")=yc
rs.update
end if

rs.close
set rs=Nothing
liao.close
set liao=nothing
%>
<wml>
<head>
<meta http-equiv="Cache-Control" content="no-Cache"/>
<meta http-equiv="Cache-Control" content="max-age=0"/>
</head>
<card title="江湖消息" ontimer="index.asp?SessionID=<%=SessionID%>">
<timer value="5"/>
<p>
<%if eer="" then%>
信息发布成功，<br/>
<%sql="update wupin set yz=yz-10 where cstr(ids)="&lid
  conn.Execute(sql)%>
发布成功<br/>
正在返回........<br/>
<%else%>
<img src="pic/05.gif" alt="" />
<%=eer%>
<%end if%>
----------<br/>
<a href="index.asp?SessionID=<%=SessionID%>">江湖首页</a><br/>
<a href="/bbs/index.asp?SessionID=<%=SessionID%>">社区首页</a><br/>

</p>
</card>
</wml>