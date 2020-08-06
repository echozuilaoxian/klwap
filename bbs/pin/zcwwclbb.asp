<% @LANGUAGE="VBSCRIPT" CODEPAGE="65001" %><% Response.ContentType="text/vnd.wap.wml; charset=utf-8" %><?xml version="1.0" encoding="utf-8"?><!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<!--#INCLUDE VIRTUAL="/bbs/reg/useregs.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/reg/redtjname.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/public/codeun.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/reg/ltonline.asp"-->
<wml>
<head>
<meta http-equiv="Cache-Control" content="max-age=0"/>
<meta http-equiv="Cache-Control" content="no-cache"/>
<meta http-equiv="Expires" content="Mon, 1 Jan 1990 00:00:00 GMT"/>
</head>
<% wap=request.querystring("wap") %>
<card id="card1" title="查看评论"><p>
<%
Server.ScriptTimeout=999
itid=request("itid")
Session("returnuppath")=""
  dim id,page
  page=request("page")
  id=Request("id")
  sql="update wuzayy set rc=rc+1 Where CStr(id)='" & id & "'"
  conn.Execute(sql)
  set objgbrs=Server.CreateObject("ADODB.Recordset")
  ssql="select * from wuzayy Where CStr(id)='" & id &"'"
  objgbrs.open ssql,conn,1,1
  if objgbrs.eof then
      response.write "ID错误</p></card></wml>"
      conn.close
      set objgbrs=nothing
      set conn=nothing
      response.end
  end if
Content=objgbrs("naiyo")
iduse=Session("useid")
if lycount>0 then
      Response.write "<a href='/bbs/public/ckly.asp?wap=" & wap & "'>" & lycount & "新信息</a><br/>"
End if
      Session("returnuppath")=Request.ServerVariables("PATH_INFO") & "?itid=" & itid & "&amp;id=" & objgbrs("id") & "&amp;page=" & page
pageWordNum=200
StartWord = 1
Length=len(Content)
PageAll=(Length+PageWordNum-1)\PageWordNum
i=request("i")
if isnull(i) or i="" then
i=0
end if
Content = mid(Content,StartWord+i*PageWordNum,PageWordNum)
Response.Write converttowide(UBBCodes(Content)) & "<br/>------------<br/>"
if CStr(objgbrs("tjhm"))=CStr(Session("useid")) then
       response.write "<a href='wzjsbb.asp?itid=" & itid & "&amp;id=" & objgbrs("id") & "&amp;page=" & page & "&amp;lendu=" & Length & "&amp;wap=" & wap & "'>续写</a>"
end if
if  Session("Counter")="pass_numbers_55556666" then
response.write " <a href='delwwssa.asp?itid=" & itid & "&amp;id=" & objgbrs("id") & "&amp;ids=" & objgbrs("tjhm") & "&amp;page=" & page & "&amp;debz=t" & "&amp;wap=" & wap & "'>全部删</a>"
End if
if Cstr(Session("ltglzdl"))=itid or Session("Counter")="pass_numbers_55556666" then
       response.write " <a href='delwwbb.asp?itid=" & itid & "&amp;id=" & objgbrs("id") & "&amp;ids=" & objgbrs("tjhm") & "&amp;page=" & page & "&amp;debz=t" & "&amp;wap=" & wap & "'>删除</a>"
    end if


if 0<=i<PageAll then
   if cint(i)<cint(PageAll)-1 then
       Response.Write "<a href='zcwwclbb.asp?itid=" & itid & "&amp;i=" & i+1 & "&amp;id=" & objgbrs("id") & "&amp;page=" & page & "&amp;wap=" & wap & "'>下页</a>"
   End if
   if cint(i)>0 then 
       Response.Write "-" & "<a href='zcwwclbb.asp?itid=" & itid & "&amp;i=" & i-1 & "&amp;id=" & objgbrs("id") & "&amp;page=" & page & "&amp;wap=" & wap & "'>上页</a>"
   End if
End if
if PageAll>1 then
       response.write "<br/>&#40;" &  i+1 & "&#47;" & PageAll & "&#41;<a href='#card2&amp;usephone="&usephone&"&amp;usepass="&usepass&"'>跳页</a><br/>"
end if
tjhm=objgbrs("tjhm")
Response.write "<br/>人气：" & objgbrs("rc")
Response.write "<br/>时间：" & objgbrs("retimes")
Response.write "<br/><a href='zcwwbb.asp?itid=" & itid & "&amp;page=" & page & "&amp;wap=" & wap & "'>还回上级</a>"
response.write "<br/><a href='/bbs/index.asp?wap=" & wap & "'>返回社区首页</a></p></card>"
Response.write "<card id='card2' title='按页搜索'><p><input  name='i' value='1' format='*N'/><anchor>GO<go method='post' href='zcwwclbb.asp?wap=" & wap & "'><postfield name='itid' value='" & itid & "'/><postfield name='page' value='" & page & "'/><postfield name='i' value='$(i)'/><postfield name='id' value='" & objgbrs("id") & "'/></go></anchor></p></card></wml>"

objgbrs.close
Set objgbrs=nothing
conn.close
set conn=nothing
%>



