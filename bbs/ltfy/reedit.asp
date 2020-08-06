<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<%response.buffer=true%>
<%Response.ContentType = "text/vnd.wap.wml; charset=utf-8"%>
<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/ wml_1.1.xml">
<!--#INCLUDE VIRTUAL="/bbs/reg/useregs.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/public/codeun.asp"-->
<wml>
<card id="id" title="法官执行判决">
<%
SessionID=request.querystring("SessionID")
if SessionID="" then SessionID=Session("SessionID")
if Session("cw1")<>"" then
iduse=Session("useid")
gfdsa=Session("ltname")
id=request("id")
idid=request("idid")
page=request("page")

set rs=Server.CreateObject("ADODB.Recordset")
rsstr="select * from urls where id=" & id
rs.open rsstr,conn,1,2

if rs.recordcount=0 then 
response.write("无此案件！<br/>")
else
idd=rs("idd")
name=rs("title")
url=rs("url")
about=rs("about")
check=rs("check")
%>
<onevent type="onenterforward">
<refresh>
<setvar name="pczb" value="<% =converttowidebaiti(rs("pczb")) %>"/>
</refresh>
</onevent>
<p align="left">

请根据1审2审注明审核次数<br/>
-------------<br/>
判决陈词:<input name="fyzx" maxlength="200" value="一审：" size="20"/><br/>
执行赔偿:<select name="pcdj" value="0">
<option title="是" value="1">是</option>
<option title="否" value="0">否</option></select><br/>
赔偿金额:<input name="pczb" format="*n" maxlength="5" value="<% =converttowidebaiti(rs("pczb")) %>" />不改勿动<br/>
<anchor title="确 定">确 定
<go href="reeditcl.asp?idid=<%=idid%>&amp;SessionID=<%=SessionID%>&amp;id=<%=id%>&amp;page=<%=page%>" method="post" accept-charset='utf-8'>
<postfield name="fyzx" value="$(fyzx)_法官:<%=gfdsa%>ID:<%=iduse%>"/>
<postfield name="pcdj" value="$(pcdj)"/>
<postfield name="pczb" value="$(pczb)"/>
<postfield name="check1" value="1"/>
</go>
</anchor>
<%
Response.write "<br/>------------<br/>"
Response.write "<a href='/bbs/ltfy/index.asp?SessionID=" & SessionID & "'>返回城市法院</a><br/>"
Response.write "<a href='/BBS/index.asp?SessionID=" & SessionID & "'>返回社区首页</a><br/>"
%>
<% end if
rs.close
set rs=nothing
conn.close
set conn=nothing
 end if
%>
</p>
</card>
</wml>