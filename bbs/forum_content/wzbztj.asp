<% @LANGUAGE="VBSCRIPT" CODEPAGE="65001" %><% Response.ContentType="text/vnd.wap.wml; charset=utf-8" %><?xml version="1.0" encoding="utf-8"?><!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<!--#INCLUDE VIRTUAL="/bbs/conn.asp"-->
<wml>
<card id="card1" title="版主操作"><p>
<%
wap=request.querystring("wap")
if Session("ltglzdl")<>"0" or Session("ltglzdll")<>"0" or Session("useid")=888 then
dim page,id,bnhd,ids,itid
   itid=request("itid")
   ids=request("ids")
   bnhd=request("bnhd")
   page=request("page")
   id=request("id")
  set objgbrs=Server.CreateObject("ADODB.Recordset")
  sql="select * from wuza Where CStr(id)='" & id &"' and bnhd<>'" & bnhd & "'"
  objgbrs.open sql,conn
if objgbrs.eof then
      response.write "操作已成功,请不要刷新!</p></card></wml>"
      conn.close
      set objgbrs=nothing
      set conn=nothing
      response.end
    else
      sql="update wuza set bnhd='"& bnhd & "' Where CStr(id)='" & id & "'"
      Application.Lock
      conn.Execute(sql)
      Application.Unlock
  if bnhd="t" then
    bnhdbz="+"
   else
    bnhdbz="-"
  End if
    sql="update usereg set usejf=usejf" & bnhdbz & "50 where CStr(id)=" & ids
      Application.Lock
      conn.Execute(sql)
      Application.Unlock
end if
  conn.close
  set objgbrs=nothing
  set conn=nothing
  response.write "操作成功！"
  response.write "<br/><a href='zcwwbztj.asp?itid=" & itid & "&amp;wap=" & wap & "'>返回版主推荐区</a>"
%>
<!--#include file="1fh.asp"--><%
Response.write "<br/><a href='zcww.asp?itid=" & itid & "&amp;pagenew=" & pagenew & "&amp;page=" & page & "&amp;wap=" & wap & "'>回" & itidtit & "</a>"

  response.write "<br/><a href='/bbs/index.asp?wap=" & wap & "'>返回社区首页</a></p></card></wml>"
End if
%>



