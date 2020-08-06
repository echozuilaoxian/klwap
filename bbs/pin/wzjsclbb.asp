<% @LANGUAGE="VBSCRIPT" CODEPAGE="65001" %><% Response.ContentType="text/vnd.wap.wml; charset=utf-8" %><?xml version="1.0" encoding="utf-8"?><!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<!--#INCLUDE VIRTUAL="/bbs/reg/useregs.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/public/codeun.asp"-->
<wml>
<head>
<meta http-equiv="Cache-Control" content="max-age=0"/>
<meta http-equiv="Cache-Control" content="no-cache"/>
<meta http-equiv="Expires" content="Mon, 1 Jan 1990 00:00:00 GMT"/>
</head>
<% wap=request.querystring("wap") %>
<%
dim memo,page,itid
   itid=request("itid")
   page=request("page")
   id=request("id")
   memo=request.form("memo")
   memo=untowide(memo)
    if memo="" then
    response.write "<card id='card1' title='续写'><p>"
    response.write "字段不能为空白！！<br/><a href='wzjsbb.asp?itid=" & itid & "&amp;id=" & id & "&amp;wap=" & wap & "'>返回重写</a>"
    response.write "<br/><a href='zcwwbb.asp?itid=" & itid & "&amp;wap=" & wap & "'>主题首页</a><br/><a href='/bbs/index.asp?wap=" & wap & "'>返回社区首页</a></p></card></wml>"
    response.end
  End if
   if Session("ltftzl")=memo then
     response.write "<card id='card1' title='续写'><p>"
     response.write "你已续写成功，请不要重复。<br/><a href='zcwwclbb.asp?itid=" & itid & "&amp;id=" & id & "&amp;page=" & page & "&amp;wap=" & wap & "'>回上一级</a>"
     response.write "<br/><a href='zcwwbb.asp?itid=" & itid & "&amp;wap=" & wap & "'>主题首页</a><br/><a href='/bbs/index.asp?wap=" & wap & "'>返回社区首页</a></p></card></wml>"
     response.end
    End if
        Session("ltftzl")=memo
		Session.Timeout=10
  iduse=Session("useid")
  sql="update wuzayy set naiyo=naiyo+'" & memo & "' Where CStr(id)='" & id & "' and tjhm='" & iduse & "'"
  Application.Lock
  conn.Execute(sql)
  Application.Unlock
  conn.close
  set conn=nothing
  response.write "<card id='card1' title='续写' ontimer='zcwwclbb.asp?itid=" & itid & "&amp;id=" & id & "&amp;page=" & page & "&amp;wap=" & wap & "'>"
  response.write "<timer value='5'/><p align='left'>续写成功，正在返回...<br/>"
  response.write "<a href='zcwwclbb.asp?itid=" & itid & "&amp;id=" & id & "&amp;page=" & page & "&amp;wap=" & wap & "'>回上一级</a>"
  response.write "<br/><a href='zcwwbb.asp?itid=" & itid & "&amp;wap=" & wap & "'>主题首页</a><br/><a href='/bbs/index.asp?wap=" & wap & "'>返回社区首页</a></p></card></wml>"
%>



