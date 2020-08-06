<% Response.ContentType="text/vnd.wap.wml" %><?xml version="1.0" encoding="utf-8"?><!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<!--#INCLUDE VIRTUAL="/bbs/reg/useregs.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/public/codeun2.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/reg/ltonline.asp"-->
<wml>
<head>
<meta http-equiv="Cache-Control" content="max-age=0"/>
<meta http-equiv="Cache-Control" content="no-cache"/>
<meta http-equiv="Expires" content="Mon, 1 Jan 1990 00:00:00 GMT"/>
</head>
<card id='main' title='<%=converttowidebaiti(SystemSiteName)%>'>
<p align='<%=Systemdj%>'>
<% if Systemlogo<>"" then 
    response.write "<img src='"&Systemlogo&"' alt='"&converttowidebaiti(SystemUrl)&"'/><br/>"
end if

Server.ScriptTimeout=999
SessionID=request.querystring("SessionID")
iduse=Session("useid")
lasttlss="0"
lasttlls="0"
lasttls
Session("returnuppath")=""
gfdsa=Session("ltname")

  dim ky,desc
  ky=request.querystring("ky")
  if ky="" or ky>5 or ky<1 then
	ky=5
  end if
  select case ky
'================================
  case 1
  jh="t"
  wheretmp="where jh='" & jh & "' and Cstr(itid)<>'80' "
  tip="精华"
  yxxe_net="精"
  desc="Id"
'================================
  case 2
  wheretmp="where Cstr(itid)<>'80' and DATEDIFF('s', retimes, now()) < 2880*60 "
  tip="热点"
  yxxe_net="热"
  desc="rc"
'================================
  case 3
  tj="t"
  wheretmp="where Cstr(itid)<>'80' and tj='" & tj & "'"
  tip="推荐"
  yxxe_net="荐"
  desc="Id"
'================================
  case 4
  wheretmp="where Cstr(itid)<>'80' and DATEDIFF('s', retimes, now()) < 1440*60 "
  tip="热门"
  yxxe_net="热"
  desc="hfcont+rc"
'================================
  case 5
  san="f"
  wheretmp="where Cstr(itid)<>'80' and san='" & san & "'"
  tip="最新"
  yxxe_net="新"
  desc="id"
  end select
%>
<%if gbkg<>"n" then
sql="select top 1 * from affich where DATEDIFF('s', AfficheTime, now()) order by AfficheId desc"
set rs=server.createobject("adodb.recordset")
rs.open sql,conn,1,1
if rs.eof and rs.bof then
	'response.write "&#x6682;&#x65E0;&#x516C;&#x544A;<br/>"
else
   do while not rs.eof
mome=left(rs("AfficheName"),15)
   if len(rs("AfficheName"))>15 then
    mome=mome+"..."
   End if
       
 Response.write ""&rs("vote")&"向"&rs("addvote")&"送了一朵<img src='/bbs/xhjy/hua/"&rs("voteID")&".gif' alt=''/><b>说:</b>"&converttowidebaiti(mome)&""
	rs.movenext
	loop
	end if
	rs.close
	set rs=nothing
end if%>
<%if gbkg<>"n" then
sql="select top 1 * from affic where DATEDIFF('s', AfficheTime, now()) order by AfficheId desc"
set rs=server.createobject("adodb.recordset")
rs.open sql,conn,1,1
if rs.eof and rs.bof then
	'response.write "&#x6682;&#x65E0;&#x516C;&#x544A;<br/>"
else
   do while not rs.eof
mome=left(rs("AfficheName"),30)
   if len(rs("AfficheName"))>30 then
    mome=mome+"..."
   End if
       
 Response.write "<br/><img src='/bbs/xhgg/gg.gif' alt='' /><a href='/bbs/reg/useinfo.asp?id="&rs("ids")&"&amp;SessionID=" & SessionID & "'>"&rs("vote")&"</a><b>说:</b>"&converttowidebaiti(mome)&""
	rs.movenext
	loop
	end if
	rs.close
	set rs=nothing
end if
%>
<br/><a href="/BBS/xhgg/ggbbjl.asp?SessionID=<%=SessionID%>">更多广播记录</a>
<br/>
<img src='/bbs/zi.gif' alt=''/><a href="/bbs/index1.asp?SessionID=<%=SessionID%>">炫彩版</a><br/>
<% 
if SessionID="" then SessionID=Session("SessionID")
if lycount>0 then
Response.write "<img src='/bbs/tz/chatroom/notice.gif' alt=''/><a href='/bbs/public/ckly.asp?SessionID=" & SessionID & "'>&#x60A8;&#x6709;(" & lycount & ")&#x6761;&#x65B0;&#x4FE1;&#x606F;!</a><br/><br/>"
       Session("returnuppath")=Request.ServerVariables("PATH_INFO") & "?ky="&ky&""
End if

if Session("zh")="wap" then
        Response.write "<img src='/bbs/yk.gif' alt=''/>游客请<a href='/BBS/UseLogin.asp?SessionID=" & SessionID & "'>&#x767B;&#x9646;</a>或<a href='/BBS/UseLogin.asp?Action=reg&amp;SessionID=" & SessionID & "'>&#x6CE8;&#x518C;</a><br/>"
      else
Response.write "&#x6B22;&#x8FCE;&#x60A8;:<a href='/bbs/reg/useinfo.asp?id=" & iduse & "&amp;SessionID=" & SessionID & "'>" & converttowidebaiti(gfdsa) & "</a><br/><a href='/bbs/friandbook/myfriend.asp?SessionID=" & SessionID & "'>&#x597D;&#x53CB;</a>.<a href='/bbs/public/gygl.asp?SessionID=" & SessionID & "'>&#x5730;&#x76D8;</a>.<a href='/bbs/room/from.asp?id=3&amp;SessionID=" & SessionID & "'>&#x804A;&#x5929;</a>.<a href='/bbs/public/srxx.asp?SessionID=" & SessionID & "'>&#x4FE1;&#x7BB1;</a><br/>"
End if 
dim objgbrs1,ssql1
   set objgbrs1=Server.CreateObject("ADODB.Recordset")
  ssql1="select * from marry1 where [reuseid]=" & iduse & " and [open]=0 order by id desc"
  objgbrs1.open ssql1,conn,1,1
    if objgbrs1.eof then
%>
<%
	elseif objgbrs1("about")="J" then
%>
<img src='/bbs/tz/chatroom/notice.gif' alt=''/><a href="/bbs/tz/lb.asp?SessionID=<%=SessionID%>">有人向你发起挑战</a><br/>
<%
	elseif objgbrs1("about")="D" then
%>
<img src='/bbs/tz/chatroom/notice.gif' alt=''/><a href="/bbs/tz/dxlb.asp?SessionID=<%=SessionID%>">有人向你发起挑战</a><br/>
<%
     end if 
%><%
Response.write "<a href='/bbs/JOB.asp?SessionID=" & SessionID & "'>"&converttowidebaiti("工作")&"</a>.<a href='/bbs/anther/gao.asp?SessionID=" & SessionID & "'>"&converttowidebaiti("日薪")&"</a>.<a href='/bbs/school/school.asp?SessionID=" & SessionID & "'>"&converttowidebaiti("上课")&"</a>.<a href='/bbs/wish/index.asp?SessionID=" & SessionID & "'>"&converttowidebaiti("许愿")&"</a><br/><a href='/bbs/gift/gift.asp?SessionID=" & SessionID & "'>"&converttowidebaiti("超市")&"</a>.<a href='/BBS/chan/xiaof.asp?SessionID=" & SessionID & "'>"&converttowidebaiti("消费")&"</a>.<a href='/BBS/Function/Index.Asp?SessionID=" & SessionID & "'>"&converttowidebaiti("酒店")&"</a>.<a href='/bbs/Reg/Bank.asp?SessionID=" & SessionID & "'>"&converttowidebaiti("银行")&"</a><br/><a href='/bbs/dg/index.asp?SessionID=" & SessionID & "'>"&converttowidebaiti("打工")&"</a>.<a href='/BBS/xinz/index.asp?SessionID=" & SessionID & "'>"&converttowidebaiti("星座")&"</a>.<a href='/BBS/sqll/index.asp?SessionID=" & SessionID & "'>"&converttowidebaiti("巡逻")&"</a>.<a href='/bbs/shc/Index.asp?SessionID=" & SessionID & "'>"&converttowidebaiti("市场")&"</a><br/><a href='/bbs/dhxh/index.asp?SessionID=" & SessionID & "'>"&converttowidebaiti("吹牛")&"</a>.<a href='/BBS/nbaxh/index.asp?SessionID=" & SessionID & "'>"&converttowidebaiti("球彩")&"</a>.<a href='/BBS/lbxh/index.asp?SessionID=" & SessionID & "'>"&converttowidebaiti("龙宝")&"</a>.<a href='/bbs/xhjy/home.asp?SessionID=" & SessionID & "'>"&converttowidebaiti("家园")&"</a><br/>"


  dim objgbrs
  set objgbrs=Server.CreateObject("ADODB.Recordset")
  ssql="select top 1 * from usereg where DATEDIFF('s', regtimes, now()) < 1200*60 order by regtimes desc"
  objgbrs.open ssql,conn
if objgbrs.eof then
 Else
For k=1 to 1
bihaocont=bihaocont+1
Response.write "&#x6B22;&#x8FCE;&#x65B0;&#x4F1A;&#x5458;:<a href='/bbs/reg/useinfo.asp?id=" & objgbrs("id") & "&amp;SessionID=" & SessionID & "'>" & converttowidebaiti(objgbrs("usename")) & "(ID:" & objgbrs("id") & ")</a><br/>"
objgbrs.Movenext
if objgbrs.EOF then Exit for
 Next
End if
        
%>
 <%
sql="select top 1 * from affiche where DATEDIFF('s', AfficheTime, now()) < 8000*60 order by AfficheId desc"
set rs=server.createobject("adodb.recordset")
rs.open sql,conn,1,1
if rs.eof and rs.bof then
	'response.write "&#x6682;&#x65E0;&#x516C;&#x544A;<br/>"
else
   do while not rs.eof
    Response.write "&#x516C;&#x544A;:<a href='/BBS/bbs_affichecl.asp?id=" & rs("AfficheId") & "&amp;SessionID=" & SessionID & "'>"&converttowidebaiti(rs("AfficheName"))&"</a><br/>"
	rs.movenext
	loop
	end if
	rs.close
	set rs=nothing
%>
<!--#INCLUDE VIRTUAL="/bbs/1hd.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/1tj.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/1gg.asp"-->

<%if ky="5" then%>
<a href='/BBS/Forum_ContenT/Top.Asp?SessionID=<%=SessionID%>&amp;ky=5'><%=converttowidebaiti("新")%></a>.<a href='/BBS/Forum_ContenT/Top.Asp?SessionID=<%=SessionID%>&amp;ky=1'><%=converttowidebaiti("精")%></a>.<a href='/BBS/Forum_ContenT/Top.Asp?SessionID=<%=SessionID%>&amp;ky=3'><%=converttowidebaiti("荐")%></a>.<a href='/BBS/Forum_ContenT/Top.Asp?SessionID=<%=SessionID%>&amp;ky=2'><%=converttowidebaiti("热")%></a>.<a href='/BBS/Forum_ContenT/Top.Asp?SessionID=<%=SessionID%>&amp;ky=8'><%=converttowidebaiti("告")%></a>.<a href='/BBS/Forum_ContenT/Top.Asp?SessionID=<%=SessionID%>&amp;ky=7'><%=converttowidebaiti("活")%></a><br/>
<%End if
  set objgbrss=Server.CreateObject("ADODB.Recordset")
     ssqls="select top "&Systemtop&" * from wuza " & wheretmp & "  order by "& desc &" desc "
  objgbrss.open ssqls,conn,1,1
if objgbrss.eof then
   Response.write "&#x6682;&#x65E0;&#x8BB0;&#x5F55;<br/>"
Else
i=1
   do while not objgbrss.eof

    hfyls=left(objgbrss("biaoti"),13)
   if len(objgbrss("biaoti"))>13 then
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
<!--#INCLUDE VIRTUAL="/bbs/1hy.asp"-->

<%
Response.write "<a href='/BBS/Forum_ContenT/Top.Asp?ky=5&amp;SessionID="&SessionID&"'>更多新帖……</a>&nbsp;"
%><br/> 
					     
   			         

<%

 ycc="1"
set rs=Server.CreateObject("ADODB.Recordset")
sql="select * from sclt1 where yc<>1 and formid=0 and jiazu=0 order by pid asc"
rs.open sql,conn,1,2
if rs.eof then 

   else
rs.Move(0)
dim j
j=1
do while ((not rs.EOF) and j <=300)
%>
<%if rs("lx")="1" then%>
<a href='/BBS/Forum_Content/ContentlisT.asp?ForumID=<%=rs("id")%>&amp;SessionID=<%=SessionID%>'><%=converttowidebaiti(rs("name"))%></a>					     
   			         
<%elseif rs("lx")="2" then%>
<a href='<%=rs("shuo")%>?SessionID=<%=SessionID%>'><%=rs("name")%></a>
<%elseif rs("lx")="0" then%>
<%=rs("name")%>
<%end if%>
<%if rs("brr")=1 then%><br/><%end if%>
<%
rs.MoveNext
j=j+1
loop
end if
rs.close
set rs=nothing



%>					    
   			         					     
   			         

<%
Response.write "<a href='/index.asp?SessionID=" & SessionID & "'>"&converttowidebaiti("首页")&"</a>|<a href='/bbs/reg/ckzxhy.asp?SessionID=" & SessionID & "'>"&converttowidebaiti("在线会员")&"" & onliner & ""&converttowidebaiti("人")&"</a><br/>"%>
<img src='/bs.gif' alt=''/><small><%
dim kkwap,distime
kkwap=""
if Month(date)<10 then kkwap=kkwap&"0"
kkwap=kkwap&Month(date)&"&#x6708;"
if Day(date)<10 then kkwap=kkwap&"0"
kkwap=kkwap&Day(date)
response.write kkwap
Response.write"&#x65E5;("
Response.write right(""&WeekDayName(DatePart("w",Now)),1)
Response.write")"
distime=""
if hour(now())<10 then distime=distime&"0"
distime=distime&hour(now())&":"
if minute(now())<10 then distime=distime&"0"
distime=distime&minute(now())
response.write distime
%><br/>您的IP：<% =Request.ServerVariables("REMOTE_ADDR")%></small><small>
<%newyear=DateDiff("d",now,cdate("2008-8-8"))%>
<%if newyear>1 then%>&#x79BB;&#x5965;&#x8FD0;&#x8FD8;&#x6709;<%=newyear%>&#x5929;
<%elseif newyear<=6 and newyear>-10 then%>
<%end if%><br/>
<%newyear=DateDiff("d",cdate("2009-11-17"),now)%>
<%if newyear>1 then%><%=converttowidebaiti(SystemSiteName)%>&#x6210;&#x7ACB;<%=newyear%>&#x5929;<br/>
<%elseif newyear<=1 and newyear>-5 then%>
<%end if%></small>
<!--#INCLUDE VIRTUAL="/bbs/dongtai.asp"-->
</p></card></wml><%conn.close
set conn=nothing
set objgbrs2=nothing
set conn=nothing
Function frionline()
   set objgbrr=Server.CreateObject("ADODB.Recordset")
   ssql="select * from SoftDown_online where Cstr(ids)='" & tjhm & "'"
   objgbrr.open ssql,conn
   if not objgbrr.eof then
      frionline="(&#x5728;&#x7EBF;)"
   End if
   set objgbrr=nothing
End function
%>