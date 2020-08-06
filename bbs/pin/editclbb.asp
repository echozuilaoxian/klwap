<% @LANGUAGE="VBSCRIPT" CODEPAGE="65001" %><% Response.ContentType="text/vnd.wap.wml; charset=utf-8" %><?xml version="1.0" encoding="utf-8"?><!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<!--#INCLUDE VIRTUAL="/lt/reg/useregs.asp"-->
<!--#INCLUDE VIRTUAL="/lt/public/codeun.asp"-->
<wml>
<head>
<meta http-equiv="Cache-Control" content="max-age=0"/>
<meta http-equiv="Cache-Control" content="no-cache"/>
<meta http-equiv="Expires" content="Mon, 1 Jan 1990 00:00:00 GMT"/>
</head>
<% wap=request.querystring("wap") %>
<%
dim memo,page,itid,id,name,i,Contentf,Contentup,con
   i=request("i")
   itid=request("itid")
   page=request("page")
   id=request("id")
   name=request("name")
   memo=request("memo")
   name=untowide(name)
   memo=untowide(memo)
    if memo="" or name="" then
    response.write "<card id='card1' title='编辑帖子'><p>"
    response.write "字段不能为空白！！<br/><a href='editbb.asp?itid=" & itid & "&amp;id=" & id & "&amp;page=" & page & "&amp;wap=" & wap & "'>返回重写</a>"
    response.write "<br/><a href='zcwwbb.asp?itid=" & itid & "&amp;wap=" & wap & "'>主题首页</a><br/><a href='/lt/fult.asp?wap=" & wap & "'>社区首页</a></p></card></wml>"
    response.end
  End if
  iduse=Session("useid")
  set objgbrs=Server.CreateObject("ADODB.Recordset")
  ssql="select * from wuzapp Where CStr(id)='" & id &"' and tjhm='" & iduse & "'"
  objgbrs.open ssql,conn,1,3
  if objgbrs.eof then
      response.write "<p>ID错误</p></card></wml>"
      conn.close
      set objgbrs=nothing
      set conn=nothing
      response.end
  end if
Content=objgbrs("naiyo")
pageWordNum=200
StartWord = 1
Length=len(Content)
PageAll=(Length+PageWordNum-1)\PageWordNum
i=request("i")
if isnull(i) or i="" then
i=0
end if
Contentup = left(Content,StartWord+i*PageWordNum-1)
con=Length-(StartWord+i*PageWordNum+PageWordNum-1)
if con>0 then
    Contentf = right(Content,con)
  else
    Contentf = ""
end if
  Application.Unlock
  conn.close
  set objgbrs=nothing
  set conn=nothing
  response.write "<card id='card1' title='编辑帖子' ontimer='zcwwclbb.asp?itid=" & itid & "&amp;id=" & id & "&amp;page=" & page & "&amp;wap=" & wap & "'>"
  response.write "<timer value='5'/><p align='center'>修改成功，正在返回...<br/>"
  response.write "<a href='zcwwclbb.asp?itid=" & itid & "&amp;id=" & id & "&amp;page=" & page & "&amp;wap=" & wap & "'>回上一级</a>"
  response.write "<br/><a href='zcwwbb.asp?itid=" & itid & "&amp;wap=" & wap & "'>主题首页</a><br/><a href='/lt/fult.asp?wap=" & wap & "'>社区首页</a></p></card></wml>"
%>



