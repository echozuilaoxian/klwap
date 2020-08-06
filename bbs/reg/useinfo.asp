<% Response.ContentType="text/vnd.wap.wml" %><?xml version="1.0" encoding="utf-8"?><!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<!--#INCLUDE VIRTUAL="/bbs/reg/useregs.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/public/codeun.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/reg/ltonline.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/reg/redtjname.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/reg/redtjnames.asp"-->
<wml>
<head>
<meta http-equiv="Cache-Control" content="max-age=0"/>
<meta http-equiv="Cache-Control" content="no-cache"/>
<meta http-equiv="Expires" content="Mon, 1 Jan 1990 00:00:00 GMT"/>
</head>
<link rel="Shortcut Icon" href='/favicon.ico'/>
<card id="card1" title="个人资料">
<p align="left">

<%
id=request("id")
if Session("zh")="wap" then
       Session("returnuppath")=Request.ServerVariables("PATH_INFO") & "?id="&id&""
        response.redirect "/BBS/UseLogin.asp?SessionID="&SessionID&""
  	response.end
    End if

Server.ScriptTimeout=999
SessionID=request.querystring("SessionID")
if SessionID="" then SessionID=Session("SessionID")
iduse=Session("useid")
lasttlls="132"
lasttls

if Session("ltfsbz")="sdfghdfg_dfg45fg45_6554" then
  Response.write "对不起,您的进入权已被锁，请与管理员联系！</p></card></wml>" 
    response.end
End if
id=request("id")
 sql="update usereg set rc=rc+1 Where CStr(id)='" & id & "'"
  conn.Execute(sql) 
       set objgbrs=Server.CreateObject("ADODB.Recordset")
       ssql="select * from usereg where CStr(id)='" & id & "'"
       objgbrs.open ssql,conn

if objgbrs.eof then
Response.write "没有该用户<br/>"
else
if objgbrs("skin")="'0.gif'" then 
    sky="0.gif"
  else
    sky=objgbrs("skin")
end if

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
       
 Response.write ""&rs("vote")&"向"&rs("addvote")&"送了一朵<img src='/bbs/xhjy/hua/"&rs("voteID")&".gif' alt=''/><b>说:</b>"&converttowidebaiti(mome)&"<br/>"
	rs.movenext
	loop
	end if
	rs.close
	set rs=nothing
end if%>
<%if gbkg<>"n" then
sql="select top 2 * from affic where DATEDIFF('s', AfficheTime, now()) order by AfficheId desc"
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
       
 Response.write "<img src='/bbs/xhgg/gg.gif' alt='' /><a href='/bbs/reg/useinfo.asp?id="&rs("ids")&"&amp;SessionID=" & SessionID & "'>"&rs("vote")&"</a><b>说:</b>"&converttowidebaiti(mome)&"<br/>"
	rs.movenext
	loop
	end if
	rs.close
	set rs=nothing
end if
%>
<img src="<% =sky %>"  alt="社区秀"/>
<%
if lycount>0 then
    Response.write "<br/><a href='/bbs/public/ckly.asp?SessionID=" & SessionID & "'>您有(" & lycount & ")条新信息</a>"
Session("returnuppath")=Request.ServerVariables("PATH_INFO") & "?id=" & objgbrs("id") & ""
End if
if objgbrs("guanb")=1 and Session("Counter")<>"pass_numbers_55556666" then 
Response.write "<br/>这家伙把家门锁上了，请下次再来吧！<br/>最后登陆时间:" & "<br/>" & objgbrs("lasttime")
if objgbrs("id")=Session("useid") then
Response.write "<br/><a href='/bbs/public/guanb.asp?id=" & iduse & "&amp;SessionID=" & SessionID & "'>[开启房间]</a>"
End if
Response.Write "<br/><a href='/BBS/index.asp?SessionID=" & SessionID & "'>[社区首页]</a>"

if Session("Counter")="pass_numbers_55556666" then
Response.write "<br/>---------<br/><a href='/bbs/public/jycz.asp?id=" & objgbrs("id") & "&amp;SessionID=" & SessionID & "'>封锁</a> <a href='/bbs/public/ffscz.asp?id=" & objgbrs("id") & "&amp;SessionID=" & SessionID & "'>解锁</a> <a href='/bbs/public/setbz.asp?id=" & objgbrs("id") & "&amp;SessionID=" & SessionID & "'>任命</a> <a href='/bbs/public/jfzf.asp?id=" & objgbrs("id") & "&amp;SessionID=" & SessionID & "'>奖罚</a>"
End if 
Response.write "<br/>---------<br/></p></card></wml>"
response.end
end if

%>

<%
if objgbrs("id")<>Session("useid") then
SessionID=request("SessionID")
ids=request("id")
Response.write "<br/><input name='ltlyuan' maxlength='200'/>"
Response.write "<br/><anchor>发送留言"
Response.write "<go method='post' href='/bbs/public/fslycl.asp?SessionID=" & SessionID & "'>"
Response.write "<postfield name='ltlyuan' value='$(ltlyuan)'/>"
Response.write "<postfield name='ids' value='" & ids & "'/>"
Response.write "</go></anchor><br/>------------<br/>"
if objgbrs("id")=1 then Response.write "此ID为站方管理号，<br/>有什么问题可以直接内线留言.<br/>------------<br/>"
Response.write "您是第" & objgbrs("rc")& "位来访" & converttowidebaiti(objgbrs("usename"))&"的客人<br/>------------"
End if
Response.write "<br/>会员ＩＤ&#65306;" & CStr(objgbrs("id"))&"<br/>昵称:" & converttowidebaiti(objgbrs("usename"))&"<br/>状态:" & frionline&""
%>
<!--#include file="1tx.asp"-->
<%Response.write "<br/>勋章:" & converttowide(UBBCodes(objgbrs("zamw")))%>
<%
if objgbrs("xz1")<>0 then Response.write "<img src='/bbs/xz/1.gif' alt=''/>"
if objgbrs("xz2")<>0 then Response.write "<img src='/bbs/xz/2.gif' alt=''/>"
if objgbrs("xz3")<>0 then Response.write "<img src='/bbs/xz/3.gif' alt=''/>"
if objgbrs("xz4")<>0 then Response.write "<img src='/bbs/xz/4.gif' alt=''/>"
if objgbrs("xz5")<>0 then Response.write "<img src='/bbs/xz/5.gif' alt=''/>"
if objgbrs("xz6")<>0 then Response.write "<img src='/bbs/xz/6.gif' alt=''/>"
if objgbrs("xz7")<>0 then Response.write "<img src='/bbs/xz/7.gif' alt=''/>"
if objgbrs("xz8")<>0 then Response.write "<img src='/bbs/xz/8.gif' alt=''/>"
if objgbrs("xz9")<>0 then Response.write "<img src='/bbs/xz/9.gif' alt=''/>"
if objgbrs("xz10")<>0 then Response.write "<img src='/bbs/xz/10.gif' alt=''/>"
if objgbrs("vip")<>0 then Response.write "<br/>VIP会员<img src='/bbs/vip.gif' alt='vip'/>"
if objgbrs("yxxezb")<>0 then Response.write "<br/>职务:社区总管<img src='zbb.gif' alt='总管'/>"
if objgbrs("cw1")<>0 then Response.write "<br/>职务:社区法官<img src='fg.gif' alt='法官'/>"
if objgbrs("cg")<>0 then Response.write "<br/>职务:论坛彩管<img src='cp.gif' alt='彩管'/>"
if objgbrs("yxxexc")<>0 then Response.write "<br/>职务:论坛巡查<img src='xc.gif' alt='巡查'/>"
if objgbrs("yxxegg")<>0 then Response.write "<br/>职务:站长<img src='gg.gif' alt='站长'/>"

if objgbrs("gly")<>"0" then

set rse=Server.CreateObject("ADODB.Recordset")
rspple="select * from sclt where id="&objgbrs("gly")
rse.open rspple,conn,1,2
if rse.eof then
bkmc="无此版块"
else
bkmc=rse("name")
end if
Response.write "<br/>职务:<a href='/bbs/forum_content/contentlist.asp?ForumID="&objgbrs("gly")&"&amp;SessionID=" & SessionID & "'>"&converttowidebaiti(bkmc)&"</a>"&converttowidebaiti(bbzz)&""
if objgbrs("bzbz")<>0 then Response.write"版主<img src='bz.gif' alt='版主'/>"
if objgbrs("bzbz")=0 then Response.write"副版<img src='fb.gif' alt='副版'/>"
else
Response.write ""
end if
%>

<br/>住址:<%
if objgbrs("fanj")=0 then
response.write "天桥底"
end if
%>
<!--#include file="1zz.asp"-->
<%
Response.write "<br/>车子:" 
%>
<!--#include file="1cz.asp"-->
<br/>
<!--#include file="1gongzuo.asp"-->
<%
response.write "<br/>金币:" & objgbrs("usejf")& "枚"
response.write "<br/>社币:" & objgbrs("myzuan")& "枚"
if objgbrs("bank")>0 then
    response.write "<br/>存款:" & objgbrs("bank")& ""
end if
if objgbrs("subbank")>0 then
    response.write "<br/>贷款:" & objgbrs("subbank")& ""
end if
if objgbrs("usesex")=0 then usesex="帅哥"
if objgbrs("usesex")=1 then usesex="靓女"
if objgbrs("usesex")=2 then usesex="保密"

Response.write "<br/>性别:" & usesex & "<br/>年龄:" & objgbrs("useage")&"岁<br/>城市:" & converttowidebaiti(objgbrs("city"))&"<br/>生日:" & objgbrs("y")&"月" & objgbrs("r")&"日" 
if objgbrs("fying")=0 then
 response.write "<br/>配偶:无<a href='/bbs/jieh/jie1.asp?id=" & objgbrs("id") & "&amp;SessionID=" & SessionID & "'>[追求]</a>" 
end if
if objgbrs("fying")<>0 then
  tjhm=objgbrs("fying")
  Response.write "<br/>配偶:<a href='/bbs/reg/useinfo.asp?id=" & objgbrs("fying") & "&amp;SessionID=" & SessionID & "'>" & converttowidebaiti(redtjname) & "</a>"
if objgbrs("myjy")>50 then
dim sex

if objgbrs("usesex")="0" then
sex="<a href='/bbs/reg/dongf/tt.asp?id=" & objgbrs("fying") & "&amp;SessionID=" & SessionID & "'>" & converttowidebaiti(redtjnames)& "</a>"
  else if objgbrs("usesex")="1" then
sex="<a href='/bbs/reg/dongf/tt.asp?id=" & objgbrs("id") & "&amp;SessionID=" & SessionID & "'>"& converttowidebaiti(objgbrs("myhz"))& "</a>"
end if
end if
end if
Response.write "<br/>子女:" & sex
if objgbrs("myjy")=0 and  objgbrs("myjy")<50 then
Response.write "尚无子女"
end if
end if
%>
<%

if objgbrs("bzbzz")=0 then
Response.write "<br/>帮派:无"
else
set rse=Server.CreateObject("ADODB.Recordset")
rspple="select * from jzbl where id="&objgbrs("bzbzz")
rse.open rspple,conn,1,2
if rse.eof then
bkmc="无此帮派"
else
bkmc=rse("biaoti")
end if
Response.write "<br/>帮派:<a href='/bbs/djcs.asp?id=" & rse("id") & "&amp;SessionID=" & SessionID & "'>"&converttowidebaiti(bkmc)&"</a>"
if objgbrs("klwll")<>0 then Response.write "<img src='klwll.gif' alt='帮主'/>"
rse.close
Set rse= Nothing
end if
%>
<%
Response.write "<br/>Q Q:" & converttowide(objgbrs("qq"))&""
if objgbrs("id")=Session("useid") then
Response.write "<a href='reedit.asp?SessionID=" & SessionID & "'>修改</a>"
End if
Response.write "<br/><a href='http://blog.z.qq.com/blog.jsp?B_UID=" & converttowide(objgbrs("qq"))&"'>" & converttowide(objgbrs("usename"))&"的QQ空间</a>"
%>
<%
Response.write "<br/>宠物:"
%>
<!--#include file="1cw.asp"-->
<%
response.write "<br/>聊室:" & objgbrs("roomjfjf")& "积分<br/>魅力:"& objgbrs("ml")& "<br/>体力:"& objgbrs("tili")& "<br/><a href='/bbs/dengji.asp?SessionID=" & SessionID & "'>经验</a>:" & objgbrs("entcont")+objgbrs("ticont")*5
%>
<!--#include file="1sj.asp"-->
<%
set rsf=Server.CreateObject("ADODB.Recordset")
ssqlr="select * from lthf where tjhm='"&id&"' order by id desc "
rsf.open ssqlr,conn,1,1

aa=rsf.recordcount
rsf.close
Set rsf= Nothing

set rsff=Server.CreateObject("ADODB.Recordset")
ssqlf="select * from wuza where tjhm='"&id&"' order by id desc "
rsff.open ssqlf,conn,1,1
aaa=rsff.recordcount

rsff.close
Set rsff= Nothing

Response.write "<br/>发帖数量:<a href='/BBS/forum_content/bbstdzt.asp?id=" & objgbrs("id") & "&amp;SessionID=" & SessionID & "'>" & aaa& "</a>"
Response.write "<br/>回帖数量:<a href='/BBS/forum_content/forum_myreceipt.Asp?id=" & objgbrs("id") & "&amp;SessionID=" & SessionID & "'>" & aa& "</a>"
%>
<%
Response.write "<br/>入住社区:" & INT(objgbrs("lasttime")-objgbrs("regtimes"))& "天了"
Response.write "<br/>注册时间:" & "" & objgbrs("regtimes")& "<br/>最后在线:" & "" & objgbrs("lasttime")&""
Response.write "<br/>个性签名:" & converttowide(UBBCodes(objgbrs("usejj")))
Response.write "<br/>------------"
if objgbrs("usesex")="0" then
sexe="他"
  elseif objgbrs("usesex")="1" then
sexe="她"
  elseif objgbrs("usesex")="2" then
sexe="它"
end if
%>
<%
if objgbrs("id")=Session("useid") then
Response.write "<br/><a href='gn.asp?SessionID=" & SessionID & "'>修改资料</a>|<a href='/bbs/xhjy/sxft.asp?yi=jy&amp;SessionID=" & SessionID & "'>开通家园</a><br/><a href='/BBS/forum_content/forum_myreceipt.Asp?id=" & objgbrs("id") & "&amp;SessionID=" & SessionID & "'>我的回贴</a>|<a href='/bbs/myalbum/myalbum1.asp?id=" & objgbrs("id") & "&amp;SessionID=" & SessionID & "'>我的相册</a><br/><a href='/bbs/forum_content/bbstdzt.asp?id=" & objgbrs("id") & "&amp;SessionID=" & SessionID & "'>我的帖子</a>|<a href='/bbs/public/gygl.asp?SessionID=" & SessionID & "'>我的地盘</a><br/><a href='/bbs/reg/useinfocw.asp?SessionID=" & SessionID & "'>我的宠物</a>|<a href='/bbs/index.asp?SessionID=" & SessionID & "'>社区首页</a>"
else
Response.Write "<br/><a href='/bbs/yxxe/tjbg.asp?id=" & objgbrs("id") & "&amp;SessionID=" & SessionID & "'>报告</a>|<a href='/bbs/friandbook/addcl.asp?frid=" & objgbrs("id") & "&amp;SessionID=" & SessionID & "'>加友</a>|<a href='postbank.asp?id=" & objgbrs("id") & "&amp;SessionID=" & SessionID & "'>过户</a>|<a href='/BBS/forum_content/forum_myreceipt.Asp?id=" & objgbrs("id") & "&amp;SessionID=" & SessionID & "'>回帖</a><br/><a href='/bbs/jieh/jie1.asp?id=" & objgbrs("id") & "&amp;SessionID=" & SessionID & "'>求婚</a>|<a href='/bbs/myalbum/myalbum1.asp?id=" & objgbrs("id") & "&amp;SessionID=" & SessionID & "'>相册</a>|<a href='/bbs/forum_content/bbstdzt.asp?id=" & objgbrs("id") & "&amp;SessionID=" & SessionID & "'>帖子</a>|<a href='/bbs/friandbook/addnocl.asp?frid=" & objgbrs("id") & "&amp;SessionID=" & SessionID & "'>加黑</a><br/><a href='/bbs/public/gygl.asp?SessionID=" & SessionID & "'>我的地盘</a>|<a href='/bbs/index.asp?SessionID=" & SessionID & "'>社区首页</a>"
End if
if Cstr(Session("yxxezb"))<>"" or Session("Counter")="pass_numbers_55556666" then
Response.write "<br/>〓管理员操作〓"
Response.write "<br/><a href='/bbs/public/jycz.asp?id=" & objgbrs("id") & "&amp;SessionID=" & SessionID & "'>封禁会员</a>|"
Response.write "<a href='/bbs/public/ffscz.asp?id=" & objgbrs("id") & "&amp;SessionID=" & SessionID & "'>解禁会员</a>"
Response.write "<br/><a href='/bbs/public/setbz.asp?id=" & objgbrs("id") & "&amp;SessionID=" & SessionID & "'>任命会员</a>|"
Response.write "<a href='/bbs/public/jfzf.asp?id=" & objgbrs("id") & "&amp;SessionID=" & SessionID & "'>奖罚会员</a>"
Response.write "<br/><a href='/bbs/forum_content/delwwsy.asp?ids=" & objgbrs("id") & "&amp;debz=t" & "&amp;SessionID=" & SessionID & "'>清除帖子</a>|"
if Session("useid")="1" or Session("useid")="2" then 
Response.write "<a href='/bbs/wap.asp?id=" & objgbrs("id") & "&amp;SessionID=" & SessionID & "'>管理会员</a>"
End if
End if
End if
%>
<!--#include file="home0.asp"-->
<%
Response.write "<br/>北京时间:" & Hour(Time) & ":" & Minute(Time)
Response.write "</p></card></wml>"
objgbrs.close
Set objgbrs= Nothing


Function frionline()
  page=request("page")
  set objgbrr=Server.CreateObject("ADODB.Recordset")
  ssql="select * from SoftDown_online where Cstr(ids)='" & id & "'"
  objgbrr.open ssql,conn
  if not objgbrr.eof then
  frionline="在线"
  else
  frionline="离线"
  end if
  set objgbrr=nothing
End function
conn.close
set conn=nothing
%>


