<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<%response.buffer=true%>
<%Response.ContentType = "text/vnd.wap.wml; charset=utf-8"%>
<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<!--#INCLUDE file="conn.asp"-->
<!--#INCLUDE file="conn1.asp"-->
<!--#include file="ubb.inc"-->
<!--#INCLUDE VIRTUAL="/bbs/reg/useregs.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/reg/ltonline.asp"-->
<%
id=request("id")
if Session("zh")="wap" then
       Session("returnuppath")=Request.ServerVariables("PATH_INFO") & "?id="&id&""
        response.redirect "/BBS/UseLogin.asp?SessionID="&SessionID&""
  	response.end
    End if

Server.ScriptTimeout=999
SessionID=request.querystring("SessionID")
if SessionID="" then SessionID=Session("SessionID")
iduse=Session("useid")
lasttlls="132"
lasttls

if Session("ltlybz")="dfg34fdf_dfg554ghy_3452" then
  Response.write "对不起,您的发信权已被锁，请与管理员联系！</p></card></wml>" 
    response.end
End if
txt=request("txt")
pic=request("pic")
name=request("name")
lid=request("lid")
yc=request("yc")
agent=request.serverVariables("HTTP_USER_AGENT")

if txt="" then response.redirect "/BBS/xhgg/gg.asp?SessionID=" & SessionID & ""
kword=split("fuck,他妈的,我靠,我操,去死,我叼",",")
function keyWord(s)
dim KwCount
KwCount=0
	for kwi=0 to ubound(kword)
		KwCount = KwCount + instr(s,kword(kwi))
	next
	keyWord=KwCount
end function
if keyWord(con)>0 then response.redirect "/BBS/xhgg/gg.asp?SessionID=" & SessionID & ""

set rs=Server.CreateObject("ADODB.Recordset")
rsstr="select * from [l] order by ID desc"
rs.open rsstr,liao,1,2

dim errr
errr=0
if rs.recordcount>0 then
	if rs("txt")=txt then errr=1
end if

if errr=1 then eer="请不要重复发布，<br/>正在返回社区首页！<br/>"
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
<card title="社区广播" ontimer="/bbs/index.asp?SessionID=<%=SessionID%>">
<timer value="5"/>
<p>
<%if eer="" then%>
广播发布成功，<br/>
<!--#INCLUDE VIRTUAL="bbs/xhgg/usejf.asp"-->
发布成功<br/>扣取100金币<br/>
正在返回........<br/>
<%else%>
<%=eer%>
<%end if%>
----------<br/>
<a href="/bbs/index.asp?SessionID=<%=SessionID%>">社区首页</a><br/>

</p>
</card>
</wml>