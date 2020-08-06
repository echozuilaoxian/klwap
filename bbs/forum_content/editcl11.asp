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
    response.write "<card id='card1' title='&#x7F16;&#x8F91;&#x5E16;&#x5B50;'><p>"
    response.write "&#x5B57;&#x6BB5;&#x4E0D;&#x80FD;&#x4E3A;&#x7A7A;&#x767D;&#xFF01;&#xFF01;<br/><a href='edit3.asp?itid=" & itid & "&amp;id=" & id & "&amp;page=" & page & "&amp;wap=" & wap & "&amp;url=" & url & "'>&#x8FD4;&#x56DE;&#x91CD;&#x5199;</a>"
    response.write "<br/><a href='zcww.asp?itid=" & itid & "&amp;wap=" & wap & "'>&#x4E3B;&#x9898;&#x9996;&#x9875;</a><br/><a href='/bbs/index.asp?wap=" & wap & "'>&#x793E;&#x533A;&#x9996;&#x9875;</a></p></card></wml>"
    response.end
  End if
  iduse=Session("useid")
  set objgbrs=Server.CreateObject("ADODB.Recordset")
  ssql="select * from wuza Where CStr(id)='" & id &"' and tjhm='" & iduse & "'"
  objgbrs.open ssql,conn,1,3
  if objgbrs.eof then
      response.write "<p>ID&#x9519;&#x8BEF;</p></card></wml>"
      conn.close
      set objgbrs=nothing
      set conn=nothing
      response.end
  end if
Content=objgbrs("naiyo")
pageWordNum=1000
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
memo=Contentup & memo & Contentf
  sql="update wuza set naiyo='" & memo & "',biaoti='" & name & "' Where CStr(id)='" & id & "' and tjhm='" & iduse & "'"
  Application.Lock
  conn.Execute(sql)
  Application.Unlock
  conn.close
  set objgbrs=nothing
  set conn=nothing
  response.write "<card id='card1' title='&#x7F16;&#x8F91;&#x5E16;&#x5B50;' ontimer='zcwwcl1.asp?itid=" & itid & "&amp;id=" & id & "&amp;page=" & page & "&amp;wap=" & wap & "'>"
  response.write "<timer value='5'/><p align='left'>&#x4FEE;&#x6539;&#x6210;&#x529F;&#xFF0C;&#x6B63;&#x5728;&#x8FD4;&#x56DE;...<br/>"
  response.write "<a href='zcwwcl.asp?itid=" & itid & "&amp;id=" & id & "&amp;page=" & page & "&amp;wap=" & wap & "'>&#x56DE;&#x4E0A;&#x4E00;&#x7EA7;</a>"
  response.write "<br/><a href='zcww.asp?itid=" & itid & "&amp;wap=" & wap & "'>&#x4E3B;&#x9898;&#x9996;&#x9875;</a><br/><a href='/bbs/index.asp?wap=" & wap & "'>返回社区首页</a></p></card></wml>"
%>



