<% Response.ContentType="text/vnd.wap.wml" %><?xml version="1.0" encoding="utf-8"?><!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<!--#INCLUDE VIRTUAL="/bbs/reg/useregs.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/public/codeun.asp"-->
<wml>
<card id="card1" title="论坛签到"><p>
<%if Session("zh")="wap" then
       Session("returnuppath")=Request.ServerVariables("PATH_INFO") & "?ids=ids"
        response.redirect "/BBS/UseLogin.asp?SessionID="&SessionID&""
  	response.end
      else
        Session("ltlybz")=""
    End if
rd=Cstr(request("ForumID"))



Set rec=Server.CreateObject("ADODB.Recordset")
SQL="SELECT * FROM sclt where CStr(id)='" &rd & "'"
rec.Open SQL,conn,1,1
if rec.eof then
   response.write "无此论坛"

Else

%>
<a href="qdcl.asp?rd=<%=rd%>&amp;SessionID=<%=SessionID%>">确定领取</a><br/>
论坛签到一次就能领到<%=rec("cd")%>金币,3点魅力,3点体力
<%
end if
Response.write "<br/><a href='/bbs/index.asp?SessionID=" & SessionID & "'>返回社区首页</a><br/><a href='/BBS/forum_content/ContentlisT.asp?ForumID=" & rd & "&amp;SessionID=" & SessionID & "'>返回当前论坛</a>"
conn.close
set rec=nothing
set conn=nothing%>
</p></card></wml>