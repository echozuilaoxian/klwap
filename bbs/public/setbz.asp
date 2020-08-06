<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<%response.buffer=true%>
<%Response.ContentType = "text/vnd.wap.wml; charset=utf-8"%>
<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<!--#INCLUDE VIRTUAL="/bbs/conn.asp"-->
<wml>
<head>
<meta http-equiv="Cache-Control" content="no-Cache"/>
<meta http-equiv="Cache-Control" content="max-age=0"/>
<meta http-equiv="Expires" content="Mon, 1 Jan 1990 00:00:00 GMT"/>
</head>
<%id=request("id")
if id="" then id="99999999999999"
SessionID=request.querystring("SessionID")
if SessionID="" then SessionID=Session("SessionID")
%>
<card id="main" title="会员权限管理" >
<p>
会员权限管理<br/>-------------<br/>
<%
if Cstr(Session("yxxezb"))<>"" or Session("Counter")="pass_numbers_55556666" then
set rs=Server.CreateObject("ADODB.Recordset")
rspl="select * from usereg where id="&id
rs.open rspl,conn,1,2
if rs.eof then 
response.write("没有该会员!")
else

if rs("gly")<>"0" then
if rs("bzbz")<>0 then bbzz="[正版]"
if rs("bzbz")=0 then bbzz="[副版]"
set rse=Server.CreateObject("ADODB.Recordset")
rspple="select * from sclt where id="&rs("gly")
rse.open rspple,conn,1,2
if rse.eof then
bkmc="无此版块"
else
bkmc=rse("name")
end if
Response.write "当前:"&bkmc&""&bbzz&" <a href='bbs_zxgl.asp?id="&id&"&amp;SessionID="&SessionID&"&amp;cz=1'>撤除</a><br/>"
else
Response.write ""
end if

if Session("Counter")="pass_numbers_55556666" then
if rs("yxxezb")<>"0" then%>
№:<a href="bbs_zxgl.asp?SessionID=<%=SessionID%>&amp;id=<%=id%>&amp;cz=4">撤除社区总管</a><br/>
<%else%>
№:<a href="bbs_zxgl.asp?SessionID=<%=SessionID%>&amp;id=<%=id%>&amp;cz=3">设为社区总管</a><br/>
<%end if%>
<%if rs("cg")="0" then%>
№:<a href="bbs_zxgl.asp?SessionID=<%=SessionID%>&amp;id=<%=id%>&amp;cz=13">设为论坛彩管</a><br/>
<%else%>
№:<a href="bbs_zxgl.asp?SessionID=<%=SessionID%>&amp;id=<%=id%>&amp;cz=14">撤除论坛彩管</a><br/>
<%end if%>
<%if rs("cw1")="0" then%>
№:<a href="bbs_zxgl.asp?SessionID=<%=SessionID%>&amp;id=<%=id%>&amp;cz=9">设为社区法官</a><br/>
<%else%>
№:<a href="bbs_zxgl.asp?SessionID=<%=SessionID%>&amp;id=<%=id%>&amp;cz=10">撤除社区法官</a><br/>
<%end if%>
<%if rs("yxxexc")="0" then%>
№:<a href="bbs_zxgl.asp?SessionID=<%=SessionID%>&amp;id=<%=id%>&amp;cz=5">设为论坛巡查</a><br/>
<%else%>
№:<a href="bbs_zxgl.asp?SessionID=<%=SessionID%>&amp;id=<%=id%>&amp;cz=6">撤除论坛巡查</a><br/>
<%end if%>
<%if rs("vip")="0" then%>
№:<a href="bbs_zxgl.asp?SessionID=<%=SessionID%>&amp;id=<%=id%>&amp;cz=7">设为VIP</a><br/>
<%else%>
№:<a href="bbs_zxgl.asp?SessionID=<%=SessionID%>&amp;id=<%=id%>&amp;cz=8">撤除VIP</a><br/>
<%end if%>
<%if rs("klwll")="0" then%>
授:<a href="bbs_zxgl.asp?SessionID=<%=SessionID%>&amp;id=<%=id%>&amp;cz=15">帮主勋章</a><br/>
<%else%>
撤:<a href="bbs_zxgl.asp?SessionID=<%=SessionID%>&amp;id=<%=id%>&amp;cz=16">帮主勋章</a><br/>
<%end if%>
<%end if%>

---设为版主---<br/>
选择版块:<%
response.write "<select name='idp'><option>版块列表</option>"
set rsez=server.createobject("ADODB.Recordset")
aqlz="select id,name from sclt order by id desc"
rsez.open aqlz,conn,1,2
z=1
do while not rsez.eof
 dim nini
nam=rsez("name")
if len(nam)>8 then nam=left(nam,8)
Response.write "<option value='" & rsez("id") & "'>" & nam & "</option>"
z=z+1
rsez.movenext
loop
rsez.close
set rsez=nothing
Response.write "</select>"%><br/>
版主性质:<%
response.write "<select name='bbzz'><option>选择正副</option>"
Response.write "<option value='1'>正版</option>"
Response.write "<option value='2'>副版</option>"
Response.write "</select>"%><br/>
<anchor>确认提交<go href='setbzcl.asp?id=<%=id%>&amp;SessionID=<%=SessionID%>' method='post' accept-charset='utf-8'>
<postfield name='idp' value='$(idp)'/>
<postfield name='bbzz' value='$(bbzz)'/>
</go></anchor><br/>-------------
<%End if%>
<%End if%>
<br/><a href="/bbs/reg/useinfo.asp?id=<%=request("id")%>&amp;SessionID=<%=SessionID%>">返回会员资料</a><br/>
<a href="/bbs/index.asp?SessionID=<%=SessionID%>">返回社区首页</a><br/>
</p>
</card>
</wml>