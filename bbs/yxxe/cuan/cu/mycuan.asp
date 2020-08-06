<% @LANGUAGE="VBSCRIPT" CODEPAGE="65001" %>
<%Response.ContentType = "text/vnd.wap.wml; charset=utf-8"%>
<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml"> 
<wml>
<head><meta http-equiv='Cache-Control' content='no-cache'/>
</head>
<card title="我的仓库">
<p>
<%
SessionID=request.querystring("SessionID")
if SessionID="" then SessionID=Session("SessionID")
if session("useid")="" then
       Session("returnuppath")=Request.ServerVariables("PATH_INFO") & "?pid=pid"
        response.redirect "/BBS/UseLogin.asp?SessionID="&SessionID&""
    End if
ids=session("useid")
Server.ScriptTimeout=999
%>
<!--#INCLUDE VIRTUAL="/BBS/yxxe/conn1.asp"-->
<%
Server.ScriptTimeout=999
set rs=Server.CreateObject("ADODB.Recordset")
strsQL="select * from cuan where cstr(ids)='"&ids& "'"
rs.open strsQL,liao,1,2
if rs.recordcount<1 then
rs.addnew
rs("ids")=ids
rs.update
end if
wqnum=clng(rs("wq")+rs("w1")+rs("w2")+rs("w3")+rs("w4")+rs("w5")+rs("w6")+rs("w7")+rs("w8")+rs("w9")+rs("w10"))
dpnum=clng(rs("dp")+rs("d1")+rs("d2")+rs("d3")+rs("d4")+rs("d5")+rs("d6")+rs("d7")+rs("d8")+rs("d9")+rs("d10"))
kyaanum=clng(rs("kyaa")+rs("k1")+rs("k2")+rs("k3")+rs("k4")+rs("k5")+rs("k6")+rs("k7")+rs("k8")+rs("k9")+rs("k10"))
tounum=clng(rs("tou")+rs("t1")+rs("t2")+rs("t3")+rs("t4")+rs("t5")+rs("t6")+rs("t7")+rs("t8")+rs("t9")+rs("t10"))
hwnum=clng(rs("hw1")+rs("hw2")+rs("hw3")+rs("hw4")+rs("hw5")+rs("hw6")+rs("hw7")+rs("hw8")+rs("hw9")+rs("hw10")+rs("hw11")+rs("hw12")+rs("hw13")+rs("hw14")+rs("hw15"))
ypnum=clng(rs("y1")+rs("y2")+rs("y3")+rs("y4")+rs("y5"))
mmpnum=clng(rs("mm1")+rs("mm2")+rs("mm3")+rs("mm4"))
jknum=clng(rs("j1")+rs("j2")+rs("j3")+rs("j4"))
hsnum=clng(rs("h1")+rs("h2")+rs("h3")+rs("h4"))
bsnum=clng(rs("bs")+rs("y6"))
mlnum=clng(rs("ml"))
yznum=clng(rs("yz"))
hcjnum=clng(rs("hcj"))
if wqnum=0 then
wname="0"
else
wname="<a href='wq.asp?SessionID=" & SessionID & "'>" & wqnum & "</a>"
end if
if dpnum=0 then
dname="0"
else
dname="<a href='dp.asp?SessionID=" & SessionID & "'>" & dpnum & "</a>"
end if
if kyaanum=0 then
kyaaname="0"
else
kyaaname="<a href='xue2.asp?SessionID=" & SessionID & "'>" & kyaanum & "</a>"
end if

if tounum=0 then
touname="0"
else
touname="<a href='tou.asp?SessionID=" & SessionID & "'>" & tounum & "</a>"
end if

if hwnum=0 then
hwname="0"
else
hwname="<a href='hw.asp?SessionID=" & SessionID & "'>" & hwnum & "</a>"
end if

if hcjnum=0 then
hcjname="0"
else
hcjname="<a href='hcj.asp?SessionID=" & SessionID & "'>" & hcjnum & "</a>"
end if

if ypnum=0 then
yname="0"
else
yname="<a href='yp.asp?SessionID=" & SessionID & "'>" & ypnum & "</a>"
end if
if mmpnum=0 then
mmname="0"
else
mmname="<a href='mm.asp?SessionID=" & SessionID & "'>" & mmpnum & "</a>"
end if
if jknum=0 then
jname="0"
else
jname="<a href='jk.asp?SessionID=" & SessionID & "'>" & jknum & "</a>"
end if
if hsnum=0 then
hname="0"
else
hname="<a href='sea.asp?SessionID=" & SessionID & "'>" & hsnum & "</a>"
end if

if bsnum=0 then
bsname="0"
else
bsname="<a href='baos.asp?SessionID=" & SessionID & "'>" & bsnum & "</a>"
end if
if mlnum=0 then
mlname="0"
else
mlname="<a href='mai.asp?wpid=ml&amp;SessionID=" & SessionID & "'>" & mlnum & "</a>"
end if
if yznum=0 then
yzname="0"
else
yzname="<a href='yz.asp?SessionID=" & SessionID & "'>" & yznum & "</a>"
end if

Response.Write "--武器:" & wname & "<br/>--衣服:" & dname & "<br/>--靴子:" & kyaaname & "<br/>--头盔:" & touname & "<br/>--药品:" & yname & "<br/>--卷轴:" & mmname & "<br/>--宝物:" & bsname & "<br/>--木料:" & mlname & "<br/>--金矿:" & jname & "<br/>--海鲜:" & hname & "<br/>--回城卷:" & hcjname & "<br/>--合成材料:" & hwname & "<br/>----------<br/>"
        rs.Close
	Set rs=Nothing
     liao.Close
      Set liao=Nothing
%>
<a href="/BBS/yxxe/yz.asp?SessionID=<%=SessionID%>">[江湖银号]</a><br/>
<a href="/BBS/yxxe/dan.asp?SessionID=<%=SessionID%>">[陈六当铺]</a><br/>
----------<br/>
<a href="/BBS/yxxe/index.asp?SessionID=<%=SessionID%>">[我的江湖]</a><br/>
<a href="/bbs/index.asp?SessionID=<%=SessionID%>">[社区首页]</a><br/>
</p>
</card>
</wml>