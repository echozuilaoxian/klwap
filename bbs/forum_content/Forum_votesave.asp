<% @LANGUAGE="VBSCRIPT" CODEPAGE="65001" %>
<%Response.ContentType = "text/vnd.wap.wml; charset=utf-8"%>
<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml"> 
<!--#INCLUDE VIRTUAL="/bbs/reg/useregs.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/reg/redtjname.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/public/codeun.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/reg/ltonline.asp"-->
<wml>
<head><meta http-equiv='Cache-Control' content='no-cache'/>
</head>
<%
SessionID=request.querystring("SessionID")
if Session("zh")="wap" then
  page=request("page")
  sort=request("sort")
  id=Request("id")
ForumID=request("ForumID")
voteid=request("voteid")
       Session("returnuppath")=Request.ServerVariables("PATH_INFO") & "?id="&id&"&amp;page="&page&"&amp;ForumID="&ForumID&"&amp;voteid="&voteid&""
        response.redirect "/BBS/UseLogiN.Asp?SessionID=" & SessionID & ""
  	response.end
      else
        Session("ltlybz")=""
    End if
  page=request("page")
  sort=request("sort")
  id=Request("id")
ForumID=request("ForumID")
voteid=request("voteid")
%>
<card title="投票成功" ontimer="/BBS/Forum_content/BBS_receipt_ByContent.Asp?ForumID=<%=ForumID%>&amp;ID=<%=id%>&amp;Page=<%=page%>&amp;Sort=<%=sort%>&amp;SessionID=<%=SessionID%>">
<timer value="10"/>
<p>
<%
if Session("useid")="" or id="" or ForumID="" or voteid=""  then%>
出错啦!请不要非法提交参数.<br/>
<%else	
Set Rs = Server.CreateObject("Adodb.Recordset")
Sql = "SELECT * FROM wuza where id="&id
Rs.Open Sql,conn,1,3
if not (rs.bof and rs.eof)  then 
if rs("addvote")<>"" then addvote=split(converttowide(rs("addvote")),"\")
vote=""
if rs("voteid")<>"" then
votei=split(converttowide(rs("voteid")),"\")
for i=0 to ubound(votei)
if votei(i)<>"" then
if cint(votei(i))=cint(Session("useid")) then
novote="true"
end if
end if
next
end if
if novote<>"true" then
for i=0 to ubound(addvote)
if addvote(i)<>"" then
if cint(i)=cint(voteid) then
vote=vote&cint(addvote(i))+1&"\"
else
vote=vote&addvote(i)&"\"
end if
end if
next
rs("addvote")=vote
rs("voteid")=rs("voteid")&Session("useid")&"\"
rs.update
end if
end if
Rs.close
set rs=nothing%>
投票成功!谢谢参与<br/>
正在返回帖子。<br/>
<%end if

set objgbrsy=Server.CreateObject("ADODB.Recordset")
rspl="select * from sclt where id="&ForumID
objgbrsy.open rspl,conn,1,2
if objgbrsy.eof then
dlname="无此论坛"
Else
dlname=objgbrsy("name")
end if
objgbrsy.close
Set objgbrsy= Nothing
Response.write "-------------<br/><a href='/BBS/Forum_Content/ContentlisT.asp?ForumID=" & ForumID & "&amp;sort=" & sort & "&amp;page=" & page & "&amp;SessionID=" & SessionID & "'>&#x8FD4;&#x56DE;" & converttowidebaiti(dlname) & "</a>"
Response.write "<br/><a href='/BBS/index.asp?SessionID=" & SessionID & "'>&#x8FD4;&#x56DE;&#x793E;&#x533A;&#x9996;&#x9875;</a><br/>"
conn.close
set conn=nothing
%>
</p>
</card>
</wml>