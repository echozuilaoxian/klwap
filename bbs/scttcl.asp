<% @LANGUAGE="VBSCRIPT" CODEPAGE="65001" %><% Response.ContentType="text/vnd.wap.wml; charset=utf-8" %><?xml version="1.0" encoding="utf-8"?><!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<!--#INCLUDE VIRTUAL="/bbs/reg/useregs.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/public/codeun.asp"-->
<wml>
<head>
<meta http-equiv="Cache-Control" content="max-age=0"/>
<meta http-equiv="Cache-Control" content="no-cache"/>
<meta http-equiv="Expires" content="Mon, 1 Jan 1990 00:00:00 GMT"/>
</head>
<%
SessionID=request.querystring("SessionID")
if Session("zh")="wap" then
        response.redirect "/bbs/yksm.asp"
    End if
iduse=Session("useid")

    Set gbrs=Server.CreateObject("ADODB.Recordset")
    sqld="select * from usereg where CStr(id)='" & iduse & "' and DATEDIFF('s', regtimes, now()) > 21600*60"
    gbrs.open sqld,conn
if gbrs.eof then
     response.write "<card id='card1' title='系统提示'><p>您注册的时间还不满半个月，暂时不能创建帮派！<br/>------------<br/><a href='/BBS/area.asp?SessionID=" & SessionID & "'>返回社区帮派</a><br/><a href='/BBS/index.asp?SessionID=" & SessionID & "'>返回社区首页</a></p></card></wml>"
     response.end
Set gbrs= Nothing
conn.close
set conn=nothing
End if

memo=untowide(request("memo"))
name=untowide(request("name"))

  if name="" or memo="" then
     response.write "<card id='card1' title='系统提示'><p>各项必填！<br/>------------<br/><a href='/BBS/area.asp?SessionID=" & SessionID & "'>返回社区帮派</a><br/><a href='/BBS/index.asp?SessionID=" & SessionID & "'>返回社区首页</a></p></card></wml>"
     response.end
  End if

iduse=Session("useid")
dim rss
		set rss=Server.CreateObject("Adodb.Recordset")
  		sql="select tjhm from [jzbl] where CStr(tjhm)='" & iduse &"'"
  		rss.open sql,conn,1,1
		if not rss.eof then
if iduse=rss("tjhm") then
response.write "<card id='card1' title='系统提示'><p>你已经创建过帮派了!一个会员只能创建一个帮派<br/>"
Response.write "------------<br/>"
Response.write "<a href='/BBS/area.asp?SessionID=" & SessionID & "'>返回社区帮派</a>"
Response.write "<br/><a href='/BBS/index.asp?SessionID=" & SessionID & "'>返回社区首页</a><br/></p></card></wml>"
     response.end
End if
End if
rss.close
set rss=nothing


 Set objgbrss=Server.CreateObject("ADODB.Recordset")
    sqls="select usejf from usereg where CStr(id)='" & iduse & "'"
    objgbrss.open sqls,conn
if objgbrss("usejf")<5000 then
     response.write "<card id='card1' title='系统提示'><p>你的金币不够!需要身上带5000金币以上<br/>"
Response.write "------------<br/>"
Response.write "<a href='/BBS/area.asp?SessionID=" & SessionID & "'>返回社区帮派</a>"
Response.write "<br/><a href='/BBS/index.asp?SessionID=" & SessionID & "'>返回社区首页</a><br/></p></card></wml>"
     response.end
objgbrss.close
set objgbrss=nothing
    End if


set rs=Server.CreateObject("ADODB.Recordset")
rspl="select * from [jzbl] order by id desc"
rs.open rspl,conn,1,2
rs.addnew
rs("tjhm")=iduse
rs("biaoti")=name
rs("nai")=memo
rs.update
idd=rs("id")
rs.close
set rs=nothing

 sql="update usereg set usejf=usejf-5000 where CStr(id)='" & iduse & "'"
  conn.execute sql

    sql="update usereg set bzbzz=" & idd & " where CStr(id)='" & iduse & "'"
    conn.execute(sql)
    sql="update jzbl set rcx=rcx+1 where CStr(id)='" & idd & "'"
    conn.execute(sql)
  response.write "<card id='card1' title='成功申请' ontimer='/BBS/area.asp?SessionID=" & SessionID & "'><timer value='10'/><p align='left'>操作成功,正在返回...<br/><br/><a href='/BBS/area.asp?SessionID=" & SessionID & "'>返回社区帮派</a><br/><a href='/BBS/index.asp?SessionID=" & SessionID & "'>返回社区首页</a><br/></p></card></wml>"
 %>
