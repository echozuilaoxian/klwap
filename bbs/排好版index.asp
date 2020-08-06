<% Response.ContentType="text/vnd.wap.wml" %><?xml version="1.0" encoding="utf-8"?><!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<!--#INCLUDE VIRTUAL="/bbs/reg/useregs.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/public/codeun.asp"-->
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

<% 
if SessionID="" then SessionID=Session("SessionID")
if lycount>0 then
Response.write "<img src='/bbs/tz/chatroom/notice.gif' alt=''/><a href='/bbs/public/ckly.asp?SessionID=" & SessionID & "'>&#x60A8;&#x6709;(" & lycount & ")&#x6761;&#x65B0;&#x4FE1;&#x606F;!</a><br/><br/>"
       Session("returnuppath")=Request.ServerVariables("PATH_INFO") & "?ky="&ky&""
End if

if Session("zh")="wap" then
        Response.write "<img src='/bbs/yk.gif' alt=''/>游客请<a href='/BBS/UseLogin.asp?SessionID=" & SessionID & "'>&#x767B;&#x9646;</a>/<a href='/BBS/UseLogin.asp?Action=reg&amp;SessionID=" & SessionID & "'>&#x6CE8;&#x518C;</a><br/>"
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
Response.write "<a href='/bbs/JOB.asp?SessionID=" & SessionID & "'>"&converttowidebaiti("工作")&"</a>.<a href='/bbs/anther/gao.asp?SessionID=" & SessionID & "'>"&converttowidebaiti("日薪")&"</a>.<a href='/bbs/school/school.asp?SessionID=" & SessionID & "'>"&converttowidebaiti("上课")&"</a>.<a href='/bbs/wish/index.asp?SessionID=" & SessionID & "'>"&converttowidebaiti("许愿")&"</a><br/><a href='/bbs/gift/gift.asp?SessionID=" & SessionID & "'>"&converttowidebaiti("超市")&"</a>.<a href='/BBS/chan/xiaof.asp?SessionID=" & SessionID & "'>"&converttowidebaiti("消费")&"</a>.<a href='/BBS/Function/Index.Asp?SessionID=" & SessionID & "'>"&converttowidebaiti("酒店")&"</a>.<a href='/bbs/Reg/Bank.asp?SessionID=" & SessionID & "'>"&converttowidebaiti("银行")&"</a><br/><a href='/bbs/dg/index.asp?SessionID=" & SessionID & "'>"&converttowidebaiti("打工")&"</a>.<a href='/BBS/xinz/index.asp?SessionID=" & SessionID & "'>"&converttowidebaiti("星座")&"</a>.<a href='/BBS/sqll/index.asp?SessionID=" & SessionID & "'>"&converttowidebaiti("巡逻")&"</a>.<a href='/bbs/shc/Index.asp?SessionID=" & SessionID & "'>"&converttowidebaiti("市场")&"</a><br/>"


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

<%if ky="5" then%><%
Response.write "<a href='/BBS/Forum_ContenT/Top.Asp?ky=5&amp;SessionID="&SessionID&"'>&#x6700;&#x65B0;</a>&nbsp;."
Response.write "&nbsp;<a href='/BBS/Forum_ContenT/Top.Asp?ky=4&amp;SessionID="&SessionID&"'>&#x70ED;&#x95E8;</a>&nbsp;."
Response.write "&nbsp;<a href='/BBS/Forum_ContenT/Top.Asp?ky=1&amp;SessionID="&SessionID&"'>&#x7CBE;&#x534E;</a><br/>"%>
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
    Response.write ""&i&".<a href='/BBS/forum_content/BBs_receipt_ByContent.Asp?ForumID=" & objgbrss("itid") & "&amp;id=" & objgbrss("id") & "&amp;page=1&amp;SessionID=" & SessionID & "'>"&converttowidebaiti(hfyls)&"</a><br/>"
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
%><br/><%
response.write "<a href='/bbs/ztlb.asp?SessionID=" & SessionID & "'>"&converttowidebaiti("社区论坛中心")&"</a><br/>申请:<a href='/BBS/area.asp?SessionID=" & SessionID & "'>"&converttowidebaiti("创建帮派")&"</a><br/>"

%>
<!--#INCLUDE VIRTUAL="/BBs/pic.asp"-->
<%
response.write "<a href='/BBS/hk/Index0.Asp?kyzc=add&amp;SessionID=" & SessionID & "'>"&converttowidebaiti("博客")&"</a>.<a href='/bbs/Diary/Index.asp?SessionID=" & SessionID & "'>"&converttowidebaiti("日记")&"</a>.<a href='/BBS/advm.asp?kyzc=add&amp;SessionID=" & SessionID & "'>"&converttowidebaiti("广告")&"</a>.<a href='/BBS/useTOP.Asp?kyzc=add&amp;SessionID=" & SessionID & "'>"&converttowidebaiti("排行")&"</a><br/>"
Response.Write "<a href=""/bbs/zlcg/index.asp?SessionID="&SessionID&""">闯关</a>.<a href='/bbs/yxxe/Index.asp?SessionID=" & SessionID & "'>"&converttowidebaiti("江湖")&"</a>.<a href='/bbs/tz/Index.asp?SessionID=" & SessionID & "'>"&converttowidebaiti("竞技")&"</a>.<a href='/bbs/shop/Index.asp?SessionID=" & SessionID & "'>"&converttowidebaiti("礼品")&"</a><br/>"
Response.write "<a href='/bbs/jieh/index.asp?SessionID=" & SessionID & "'>"&converttowidebaiti("婚介")&"</a>.<a href='/bbs/Reg/Dongf/index.asp?SessionID=" & SessionID & "'>"&converttowidebaiti("洞房")&"</a>.<a href='/bbs/Myalbum/Index.asp?SessionID=" & SessionID & "'>"&converttowidebaiti("相册")&"</a>.<a href='/bbs/Reg/Dongf/Yiyindex.asp?SessionID=" & SessionID & "'>"&converttowidebaiti("医院")&"</a><br/>"

Response.write "<a href='/bbs/LHC/Index.asp?SessionID=" & SessionID & "'>"&converttowidebaiti("博彩")&"</a>.<a href='/bbs/SCYL.asp?SessionID=" & SessionID & "'>"&converttowidebaiti("赌场")&"</a>.<a href='/bbs/sqcp/sqcp.asp?SessionID=" & SessionID & "'>"&converttowidebaiti("彩票")&"</a>.<a href='/bbs/gp/index.asp?SessionID=" & SessionID & "'>"&converttowidebaiti("炒股")&"</a><br/>"


Response.write "<a href='/bbs/Reg/Dongf/Jcj/index.asp?SessionID=" & SessionID & "'>"&converttowidebaiti("警局")&"</a>.<a href='/bbs/ltfy/index.asp?SessionID=" & SessionID & "'>"&converttowidebaiti("法院")&"</a>.<a href='/bbs/forum_content/Xcbgs.asp?SessionID=" & SessionID & "'>"&converttowidebaiti("政府")&"</a>.<a href='/bbs/Public/Xczu.asp?SessionID=" & SessionID & "'>"&converttowidebaiti("监狱")&"</a><br/>"

%>

<%
Response.write ""&converttowidebaiti("")&"<a href='/bbs/public/find.asp?SessionID=" & SessionID & "'>"&converttowidebaiti("缘分交友")&"</a>.<a href='/bbs/sqbz/index.asp?SessionID=" & SessionID & "'>"&converttowidebaiti("新手帮助")&"</a><br/>"
Response.write "<a href='/index.asp?SessionID=" & SessionID & "'>"&converttowidebaiti("首页")&"</a>.<a href='/bbs/reg/ckzxhy.asp?SessionID=" & SessionID & "'>"&converttowidebaiti("在线会员")&"" & onliner & ""&converttowidebaiti("人")&"</a>" 
%><br/>
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
<%newyear=DateDiff("d",cdate("2008-12-13"),now)%>
<%if newyear>1 then%><%=converttowidebaiti(SystemSiteName)%>&#x6210;&#x7ACB;<%=newyear%>&#x5929;<br/>
<%elseif newyear<=1 and newyear>-5 then%>
<%end if%></small>
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