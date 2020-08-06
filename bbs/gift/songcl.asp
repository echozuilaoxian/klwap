<% @LANGUAGE="VBSCRIPT" CODEPAGE="65001" %>
<% Response.ContentType="text/vnd.wap.wml; charset=utf-8" %>
<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<!--#INCLUDE VIRTUAL="/bbs/reg/useregs.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/public/codeun.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/reg/redtjname.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/reg/ltonline.asp"-->
<wml>
<head>
<meta http-equiv="Cache-Control" content="max-age=0"/>
<meta http-equiv="Cache-Control" content="no-cache"/>
<meta http-equiv="Expires" content="Mon, 1 Jan 1990 00:00:00 GMT"/>
</head>
<card id="card1" title="赠送礼品"><p>
<%
if SessionID="" then SessionID=Session("SessionID")
wpid=clng(request("wpid"))
if Session("zh")="wap" then
       Session("returnuppath")=Request.ServerVariables("PATH_INFO") & "?ky=" & ky & ""
        response.redirect "/BBS/UseLogin.asp?SessionID="&SessionID&""
     response.end
    End if
tjhm=request("useid")
yname=request("yname")
xyyz=request("xyyz")
gfjf=request("wnum")
iduse=Session("useid")
gfdsa=Session("ltname")
%>
<%
if tjhm=iduse then
response.write "系统提示！你怎么送给自己啊!<br/><anchor><prev/>返回</anchor></p></card></wml>"
response.end
end if

if tjhm="" then
response.write "系统提示！你送给谁也不说，怎么送啊!<br/><anchor><prev/>返回</anchor></p></card></wml>"
response.end
end if

if gfjf="" then
response.write "系统提示！你送多少给人家也不说，怎么送啊!<br/><anchor><prev/>返回</anchor></p></card></wml>"
response.end
end if
       set objgbrss=Server.CreateObject("ADODB.Recordset")
       ssql="select * from usereg where CStr(id)='" & tjhm & "'"
       objgbrss.open ssql,conn
if objgbrss.eof then
Response.write "系统提示！对不起，操作无法完成，原因：城里找不到这个人啊<br/><anchor><prev/>返回</anchor></p></card></wml>"
     response.end
objgbrss.close
set objgbrss=nothing
    End if

gfjf=clng(request("wnum"))
tjhm=clng(request("useid"))

set rs=Server.CreateObject("ADODB.Recordset")
sql="select wp"&wpid&" from wupin where cstr(ids)='"&iduse& "'"
rs.open sql,conn
if rs.eof then
response.write "系统提示！你还没有"&yname&",拿什么送啊!<br/><anchor><prev/>返回</anchor></p></card></wml>"
response.end
end if
if gfjf<0 or gfjf>rs("wp"&wpid&"") then
            msg="您的"&yname&"不够赠送数量!<br/><anchor><prev/>返回</anchor>"    
   else
   sql="update wupin set wp"&wpid&"=wp"&wpid&"-"&gfjf&" Where CStr(ids)='" & iduse & "'"
            Application.Lock
            conn.execute(sql)
   sql="update wupin set wp"&wpid&"=wp"&wpid&"+"&gfjf&" Where CStr(ids)="&tjhm
            conn.execute(sql)
            Application.Lock
            sql="update usereg set usejf=usejf-50 Where CStr(id)='" & iduse & "'"
            Application.Lock
            conn.execute(sql)
rs.close
set rs=nothing

set rsll=Server.CreateObject("ADODB.Recordset")
rsplll="select * from guestbook order by id desc"
rsll.open rsplll,conn,1,2
rsll.addnew
rsll("niayo")="赠送礼品 [u]"&yname&"[/u]价值:"&xyyz&"金币/个 数量"&gfjf&"个 给你,这是系统信息,请勿回复以及转发!"
rsll("ids")=tjhm
rsll("reids")="0"
rsll("yxxeid")=iduse
rsll("gn")="lw"
rsll.update
rsll.close
set rsll=nothing
          msg="成功赠送["&yname&"]数量["&gfjf&"]给" & converttowidebaiti(redtjname) & "ID:"&tjhm&"<br/>系统已发信通知对方，扣除手续费50金币。"
           end if
conn=close
set conn=nothing
 response.write msg
%>
<br/>----------<br/>
<a href="/BBS/Gift/MyItem.Asp?SessionID=<%=SessionID%>">返回我的物品</a><br/>
<a href="/BBS/index.asp?SessionID=<%=SessionID%>">返回社区首页</a><br/>
</p></card></wml>