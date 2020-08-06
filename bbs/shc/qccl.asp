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
Server.ScriptTimeout=999
SessionID=request.querystring("SessionID")
  dim ids
  ids=Session("useid")
  reids=request("reids")
  idd=request("idd")
  reids=left(reids,30)
  reids=trim(reids)
 reids=untowide(reids)
   Set objgbrs=Server.CreateObject("ADODB.Recordset")
    sql="select fanj from usereg where CStr(id)='" & ids & "'"
    objgbrs.open sql,conn
if objgbrs("fanj")=0 then
     response.write "<card id='card1' title='转让操作'><p>你没有房子...<br/><a href='index.asp?SessionID=" & SessionID & "'>回交易市场</a><br/><a href='/bbs/index.asp'>返回社区首页</a></p></card></wml>"
     response.end
    End if

  if reids="" then
     response.write "<card id='card1' title='转让操作'><p><br/>接受方ID不能为空....<br/><a href='index.asp?SessionID=" & SessionID & "'>回交易市场</a><br/><a href='/bbs/index.asp'>返回社区首页</a></p></card></wml>"
     response.end
  End if
  idd="0"
  ltlyuan="会员(url=/bbs/reg/useinfo.asp?id=" & ids & ")" & Session("ltname") & "ID:" & ids & "(/url)转让给你一栋房子.请现在(url=/bbs/chan/czt/czcla.asp?cz="&idd&")住进去(/url).系统信息1分钟内系统自动删除"  
  sql="insert into guestbook(ids,reids,niayo) values ("
  sql=sql & sqlstr(reids) & ","
  sql=sql & sqlstr(idd) & ","
  sql=sql & sqlstr(ltlyuan) & ")"
  Application.Lock
  conn.execute(sql)
 sql="update usereg set fanj=0 where CStr(id)='" & ids & "'"
  Application.Lock
  conn.execute sql
  Application.Unlock
objgbrs.close
Set objgbrs= Nothing
  conn.close
  set conn=nothing
  response.write "<card id='card1' title='转让操作' ontimer='index.asp?SessionID="&SessionID&"'><timer value='10'/><p align='left'>操作成功,正在返回...<br/><a href='index.asp?SessionID=" & SessionID & "'>回交易市场</a><br/><a href='/bbs/index.asp'>返回社区首页</a></p></card></wml>"
%>



