<% @LANGUAGE="VBSCRIPT" CODEPAGE="65001" %><% Response.ContentType="text/vnd.wap.wml; charset=utf-8" %><?xml version="1.0" encoding="utf-8"?><!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<!--#INCLUDE VIRTUAL="/bbs/reg/useregs.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/public/codeun.asp"-->
<wml>
<card id="card1" title="续写文章"><p align="left">
<%
SessionID=request.querystring("SessionID")
iduse=Session("useid")
lasttlls="138"
lasttls
dim page,lendu,ForumID
lendu=request("lendu")
ForumID=request("ForumID")
page=request("page")
if page="" then page=1
id=request("id")
if Session("ltfsbz")="sdfghdfg_dfg45fg45_6554" then
  Response.write "您的发表权已被锁，请与管理员联系!</p></card></wml>"
    response.end
End if
lenss=request("len")
  set objgbrs=Server.CreateObject("ADODB.Recordset")
  ssql="select * from wuza Where CStr(id)='" & id &"' and CStr(itid)='"&ForumID&"'"
  objgbrs.open ssql,conn,1,1
  if objgbrs.eof then
      response.write "文章ID错误，你所查看的文章可能已经被删除。</p></card></wml>"
      conn.close
      set objgbrs=nothing
      set conn=nothing
      response.end
  end if
iduse=Session("useid")
if lycount>0 then
      Response.write "<a href='/bbs/public/ckly.asp?SessionID=" & SessionID & "'>您有(" & lycount & ")条新信息</a><br/>"
End if
Session("returnuppath")=Request.ServerVariables("PATH_INFO") & "?ForumID=" & ForumID & "&amp;id=" & objgbrs("id") & "&amp;page=" & page & ""
  if CStr(objgbrs("tjhm"))<>CStr(Session("useid")) then
      response.write "越权操作！</p></card></wml>"
      conn.close
      set objgbrs=nothing
      set conn=nothing
      response.end
  end if
    hfyl=left(objgbrs("biaoti"),10)
   if len(objgbrs("biaoti"))>10 then
    hfyl=hfyl+"..."
   End if

Response.Write"续写文章:"
Response.Write converttowidebaiti(objgbrs("biaoti"))
%><br/>前面已写:<b><%=lenss%></b>字符
<br/>续写内容:<input type="text" name="memo" value=""/><br/>
<anchor>[-提交-]<go method="post" href='wzjscl.asp?SessionID=<%=SessionID%>'><postfield name="memo" value="$(memo)"/><postfield name="id" value="<% =id %>"/><postfield name="page" value="<% =page %>"/><postfield name="ForumID" value="<% =ForumID %>"/></go></anchor>
<%
set objgbrsyd=Server.CreateObject("ADODB.Recordset")
rspld="select * from sclt where id="&ForumID
objgbrsyd.open rspld,conn,1,2
if objgbrsyd.eof then
dlnames="无此论坛"
Else
dlnames=objgbrsyd("name")
end if
objgbrsyd.close
Set objgbrsyd= Nothing%>
<%
Response.write "<br/>-----------<br/><a href='/BBS/Forum_Content/Contentlist.Asp?ForumID=" & ForumID & "&amp;page=" & page & "&amp;SessionID=" & SessionID & "'>返回" & dlnames & "</a>"
Response.write "<br/><a href='/BBS/index.asp?SessionID=" & SessionID & "'>返回社区首页</a></p></card></wml>"
conn.close
set conn=nothing%>