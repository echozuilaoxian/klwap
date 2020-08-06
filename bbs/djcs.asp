<% Response.ContentType="text/vnd.wap.wml" %><?xml version="1.0" encoding="utf-8"?><!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<!--#INCLUDE VIRTUAL="/bbs/reg/useregs.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/public/codeun.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/reg/redtjname.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/reg/ltonline.asp"-->
<wml>
<head>
<meta http-equiv="Cache-Control" content="max-age=0"/>
<meta http-equiv="Cache-Control" content="no-cache"/>
<meta http-equiv="Expires" content="Mon, 1 Jan 1990 00:00:00 GMT"/>
</head>
<%
SessionID=request.querystring("SessionID")
Server.ScriptTimeout=999
iduse=Session("useid")
id=request("id")
sql="update jzbl set hfcont=hfcont+1,times=now() Where CStr(id)='" & id & "'"
  conn.Execute(sql)

if Clng(id)<1 then
   Rresponse.end
End if
set rse=Server.CreateObject("ADODB.Recordset")
rspple="select * from jzbl where id="&id
rse.open rspple,conn,1,2
if rse.eof then
bkmc="无此帮派"
else
bkmc=rse("biaoti")
djj=rse("lzdname")
if djj="" then djj="left"
end if
tjhm=rse("tjhm")
ltlogo=rse("itid")
jjj=rse("nai")
Response.Write "<card id='card1' title='"&converttowidebaiti(bkmc)&"'>"
Response.Write "<p align='"&djj&"'>"
lasttlss=b+id
lasttlls=b+id
lasttls
if lycount>0 then
Response.write "<a href='/bbs/public/ckly.asp?SessionID=" & SessionID & "'>您有" & lycount & "条新信息</a><br/>"
Session("returnuppath")=Request.ServerVariables("PATH_INFO") & "?id=" & id & ""
End if
if len(ltlogo)>8 then
Response.write "<img src='"& ltlogo &"' alt='"&converttowidebaiti(bkmc)&"'/><br/>"
end if
Response.write ""&converttowidebaiti(jjj)&"<br/>----------<br/>"
Response.Write "<b>帮主:</b><a href='/BBS/reg/useinfo.asp?id=" & tjhm & "&amp;SessionID=" & SessionID & "'>" & converttowidebaiti(redtjname) & "ID:" & tjhm & "</a><br/>"
Response.write "----------<br/>"

set rs=Server.CreateObject("ADODB.Recordset")
sql="select * from sclt where jiazu=" & id & " order by pid asc"
rs.open sql,conn,1,2
if rs.eof then 
response.write("<a href='/BBS/bpltsq.asp?SessionID=" & SessionID & "'>申坛</a>")
   else
rs.Move(0)
dim j
j=1
do while ((not rs.EOF) and j <=30)
%>
<%lt=rs("id")
if rs("lx")="1" then%>
<a href='/BBS/forum_content/ContentlisT.asp?ForumID=<%=rs("id")%>&amp;SessionID=<%=SessionID%>'>论坛</a>
<%elseif rs("lx")="2" then%>
<a href='<%=rs("shuo")%>'><%=rs("name")%></a>
<%elseif rs("lx")="0" then%>
<%=rs("name")%>
<%end if%>
<%if rs("brr")=1 then%><%end if%>
<%
rs.MoveNext
j=j+1
loop
end if
rs.close
set rs=nothing
Response.write ".<a href='/bbs/chatroom/chatroom.asp?itid=" & id & "&amp;show=1&amp;SessionID=" & SessionID & "'>聊室</a>.<a href='/bbs/1008.asp?ForumID=" & id & "&amp;SessionID=" & SessionID & "'>公告</a><br/>----------<br/>"
%>
=最新话题=<br/>
<%
set objgbrss=Server.CreateObject("ADODB.Recordset")
     ssqls="select top 3 * from wuza where Cstr(itid)='" & lt & "'   order by id desc "
  objgbrss.open ssqls,conn,1,1
if objgbrss.eof then
   Response.write "&#x6682;&#x65E0;&#x8BB0;&#x5F55;<br/>"
Else
i=1
   do while not objgbrss.eof

    hfyls=left(objgbrss("biaoti"),11)
   if len(objgbrss("biaoti"))>11 then
    hfyls=hfyls+"..."
   End if
    Response.write ""&i&".<a href='/BBS/forum_content/BBs_receipt_ByContent.Asp?ForumID=" & objgbrss("itid") & "&amp;id=" & objgbrss("id") & "&amp;page=1&amp;SessionID=" & SessionID & "'>"&converttowidebaiti(hfyls)&"</a>(<a href='/BBS/forum_content/Receiptlist.asp?ForumID=" & objgbrss("itid") & "&amp;id=" & objgbrss("id") & "&amp;page=" & page & "&amp;SessionID=" & SessionID &  "&amp;u="&u&"'>" & objgbrss("hfcont") & "</a>/" & objgbrss("rc") & ")<br/>"
i=i+1
	objgbrss.movenext
	loop
	end if
	objgbrss.close
	set objgbrss=nothing
%>
<%
Response.write "----------<br/>"

if Session("useid")=tjhm then
Response.Write "<a href='/bbs/public/q_fsly101.asp?bz="&id&"&amp;SessionID=" & SessionID & "'>帮派群发</a><br/>"
Response.Write "<a href='/bbs/1006.asp?ForumID="&id&"&amp;SessionID=" & SessionID & "'>修改设置</a><br/>"
end if
Response.write "成员：<a href='/bbs/public/cylb.asp?bz=" & id & "&amp;SessionID=" & SessionID & "'>" & rse("rcx") & "</a>人<br/>"
obj.close
set obj=nothing
set objg=Server.CreateObject("ADODB.Recordset")
ssql="select * from sn_datb where cstr(des)='"&id&"'" 
objg.open ssql,conn,1,1
if objg.eof then
num=0
Else
num=objg("num")
objg.close
set objg=nothing
end if
Response.write "财富：<a href='/bbs/1000.asp?ForumID=" & id & "&amp;SessionID=" & SessionID & "'>"&num&"</a>金币<br/>"
Response.write "<anchor>加入<go method='post' href='/bbs/public/jzjrcl.asp?SessionID=" & SessionID & "'><postfield name='setbzczz' value='" & id & "'/><postfield name='id' value='" & iduse & "'/></go></anchor>->>><anchor>退出<go method='post' href='/bbs/public/tcjz.asp?SessionID=" & SessionID & "'><postfield name='bzbzz' value='" & id & "'/><postfield name='id' value='" & iduse & "'/></go></anchor><br/><b>本帮派ID("&id&")</b><br/>"
response.write "-------------<br/>"
Response.write "<a href='/BBS/area.asp?SessionID=" & SessionID & "'>返回社区帮派</a><br/><a href='/BBS/index.asp?SessionID=" & SessionID & "'>返回社区首页</a>"
response.write "<br/>北京时间" & Hour(Time) & ":" & Minute(Time)
response.write "<br/>访问次数:" & rse("hfcont") & "次</p></card></wml>"
rse.close
Set rse= Nothing
conn.close
set conn=nothing
%>
