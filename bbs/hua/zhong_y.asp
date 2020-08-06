<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%><%response.buffer=true%><%Response.ContentType = "text/vnd.wap.wml; charset=utf-8"%><?xml version="1.0" encoding="utf-8"?><!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<!--#INCLUDE VIRTUAL="/bbs/reg/useregs.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/public/codeun.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/reg/ltonline.asp"-->
<wml>
<head>
<meta http-equiv="Cache-Control" content="max-age=0"/>
<meta http-equiv="Cache-Control" content="no-cache"/>
<meta http-equiv="Expires" content="Mon, 1 Jan 1990 00:00:00 GMT"/></head>

<%
 SessionID=request.querystring("SessionID")
if SessionID="" then SessionID=Session("SessionID")
if Session("zh")="wap" then
        Session("returnuppath")=Request.ServerVariables("PATH_INFO") & "?m=m"
        response.redirect "/BBS/UseLogin.asp?SessionID="&SessionID&""
    End if
hotid=request("hotid")
Server.ScriptTimeout=9999
iduse=Session("useid")
wapgywz="我的花园"
wapgydz=Request.ServerVariables("PATH_INFO")&"?"
lasttlls=525
lasttls
%>
<card id="hotpk" title="浇水"  ontimer='/bbs/hua/index.asp?SessionID=<%=SessionID%>'><timer value='50'/><p>
<%

'--------------------
'宠物PK

'结束
'-------------------
set objgbrs=Server.CreateObject("ADODB.Recordset")
       ssql="select id from usereg where CStr(id)='" & iduse & "'"
       objgbrs.open ssql,conn
if objgbrs.eof then
Response.write "错误,该号不存在"
else
set rs8=Server.CreateObject("ADODB.Recordset")
       ssql="select * from hua where CStr(ids)='" & iduse & "'"
       rs8.open ssql,conn,1,2
if rs8.recordcount<1 then
rs8.addnew
rs8("ids")=iduse
rs8.update
end if
end if
if lycount>0 then
    Response.write "<br/><a href='/bbs/public/ckly.asp?SessionID="&SessionID&"'>" & lycount & "条新信息</a>"
Session("returnuppath")=Request.ServerVariables("PATH_INFO") & "?bd=&amp;"
End if
Response.write "<a href='/bbs/hua/index.asp?SessionID="&SessionID&"'>返回我的花园空间</a><br/><img src='/bbs/hua/img/1_0.gif' alt='花园'/><br/>"

if rs8("hongz")=0 then
%>
你的花园没有种花哦........<br/><a href='/bbs/hua/index.asp?SessionID=<%=SessionID%>'>返回我的花园空间</a>
<%
Response.Write "</p></card></wml>"
response.end
end if
if rs8("huas")=rs8("hongdj")+1  then
%>
你已经浇过水了........<br/>浇水太多会淋死花儿的哦!!<br/><a href='/bbs/hua/index.asp?SessionID=<%=SessionID%>'>返回我的花园空间</a>
<%
Response.Write "</p></card></wml>"
response.end
end if
sql="Delete FROM huax WHERE  CStr(topao)='5' and DATEDIFF('s', time, now()) > 60*90"
conn.Execute sql
Set rec=Server.CreateObject("ADODB.Recordset")
SQL="SELECT * FROM huax where CStr(topao)='5' and  Cstr(useid)='" &  iduse& "'"
rec.Open SQL,conn
    if not rec.eof then
       msg="浇水太多会淋死花儿的哦!!"
else
          SQL="insert into huax(useid,topao)values("
            SQL=SQL & sqlstr(iduse) & ","
          SQL=SQL & sqlstr(5) & ")"
          Application.Lock
          conn.execute SQL

sql="update hua set timed='"&(now()+cdate("01:30:00"))&"',huas=huas+1,nongdj=nongdj+1,huaxxx=huaxxx+1  where CStr(ids)='" &iduse & "'"
conn.execute sql
Application.Unlock
msg="<img src='/bbs/hua/img/seed.gif' alt='.'/><br/>浇水成功了,记得下次还要帮它浇水哦!"
if rs8("huaxxx")=1and rs8("hongdj")=0 then
sql="update hua set hongdj=hongdj+1  where CStr (ids)='" &iduse & "'"
conn.execute sql
Application.Unlock
end if
if rs8("huaxxx")=3 and rs8("hongdj")=1 then
sql="update hua set hongdj=hongdj+1  where CStr (ids)='" &iduse & "'"
conn.execute sql
Application.Unlock
end if
if rs8("huaxxx")=6 and rs8("hongdj")=2 then
sql="update hua set hongdj=hongdj+1  where CStr (ids)='" &iduse & "'"
conn.execute sql
Application.Unlock
end if
if rs8("huaxxx")=9 and rs8("hongdj")=3 then
sql="update hua set hongdj=hongdj+1  where CStr (ids)='" &iduse & "'"
conn.execute sql
Application.Unlock
end if

end if
response.write msg
rec.close
Set rec= Nothing
objgbrs.close
Set objgbrs= Nothing
rs8.close
Set rs8= Nothing
conn.close
set conn=nothing
%>
<!--#INCLUDE VIRTUAL="/bbs/hua/klwll.asp"-->
</p></card></wml>


