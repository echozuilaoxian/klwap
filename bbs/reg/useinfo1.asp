<% Response.ContentType="text/vnd.wap.wml" %><?xml version="1.0" encoding="utf-8"?><!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<!--#INCLUDE VIRTUAL="/bbs/reg/useregs.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/public/codeun.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/reg/ltonline.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/reg/redtjname.asp"-->
<wml>
<head>
<meta http-equiv="Cache-Control" content="max-age=0"/>
<meta http-equiv="Cache-Control" content="no-cache"/>
<meta http-equiv="Expires" content="Mon, 1 Jan 1990 00:00:00 GMT"/>
</head>
<card id="card1" title="个人资料">
<p align="left">
<%
id=request("id")
if lycount>0 then
    Response.write "<a href='/bbs/public/ckly.asp?SessionID=" & SessionID & "'>您有(" & lycount & ")条新信息</a><br/><br/>"
Session("returnuppath")=Request.ServerVariables("PATH_INFO") & "?id=" & id& ""
End if
if Session("zh")="wap" then
        response.redirect "/bbs/yksm.asp"
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
 sql="update usereg set rc=rc+1 Where CStr(id)='" & id & "'"
  conn.Execute(sql) 
       set objgbrs=Server.CreateObject("ADODB.Recordset")
       ssql="select * from usereg where CStr(id)='" & id & "'"
       objgbrs.open ssql,conn

if objgbrs.eof then
Response.write "没有该用户"
else
if objgbrs("skin")="'0.gif'" then 
    sky="0.gif"
  else
    sky=objgbrs("skin")
end if
if objgbrs("id")<>Session("useid") then
SessionID=request("SessionID")
ids=request("id")
Response.write "<input name='ltlyuan' maxlength='200'/>"
Response.write "<br/><anchor>发送留言"
Response.write "<go method='post' href='/bbs/public/fslycl.asp?SessionID=" & SessionID & "'>"
Response.write "<postfield name='ltlyuan' value='$(ltlyuan)'/>"
Response.write "<postfield name='ids' value='" & ids & "'/>"
Response.write "</go></anchor><br/>------------<br/>"
End if
%>
<%
if objgbrs("guanb")=1 and objgbrs("id")<>Session("useid") and Session("Counter")<>"pass_numbers_55556666" then 
Response.write "这家伙把家门锁上了，请下次再来吧！<br/>------------"
  else
Response.write "您是第" & objgbrs("rc")& "位来访" & converttowidebaiti(objgbrs("usename"))&"的客人<br/>"
%>
<img src="<% =sky %>"  alt="社区秀"/>
<br/>------------<br/>
<%
Response.write "ＩＤ:" & objgbrs("id")&"<br/>"
Response.write "昵称:" & converttowidebaiti(objgbrs("usename"))&"<br/>"
Response.write "状态:" & frionline&""
%>
<!--#include file="1tx.asp"-->
<%
if objgbrs("yxxezb")<>0 then Response.write "<br/>职务:论坛总版"
if objgbrs("yxxexc")<>0 then Response.write "<br/>职务:论坛巡查"
if objgbrs("yxxegg")<>0 then Response.write "<br/>职务:高级督察"
if objgbrs("gly")<>"0" then
if objgbrs("bzbz")<>0 then bbzz="版主"
if objgbrs("bzbz")=0 then bbzz="副版"
set rse=Server.CreateObject("ADODB.Recordset")
rspple="select * from sclt where id="&objgbrs("gly")
rse.open rspple,conn,1,2
if rse.eof then
bkmc="无此版块"
else
bkmc=rse("name")
end if
Response.write "<br/>职务:<a href='/bbs/forum_content/contentlist.asp?ForumID="&objgbrs("gly")&"&amp;SessionID=" & SessionID & "'>"&converttowidebaiti(bkmc)&"</a>"&converttowidebaiti(bbzz)&""
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
<br/>
<!--#include file="1gongzuo.asp"-->
<%
response.write "<br/>金币:" & objgbrs("usejf")& "枚"
response.write "<br/>狂币:" & objgbrs("myzuan")& "枚"
response.write "<br/>元宝:" & objgbrs("rmb")& "枚"
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
 response.write "<br/>配偶:未婚<a href='/bbs/jieh/jie1.asp?id=" & objgbrs("id") & "&amp;SessionID=" & SessionID & "'>追</a>" 
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
Response.write "<br/>帮派:无门无派"
else
set rse=Server.CreateObject("ADODB.Recordset")
rspple="select * from jzbl where id="&objgbrs("bzbzz")
rse.open rspple,conn,1,2
if rse.eof then
bkmc="无此帮派"
else
bkmc=rse("biaoti")
end if
Response.write "<br/>帮派:"&converttowidebaiti(bkmc)&""
rse.close
Set rse= Nothing
end if
%>
<%
Response.write "<br/>车子:" 
%>
<!--#include file="1cz.asp"-->
<%
Response.write "<br/>宠物:"
%>
<!--#include file="1cw.asp"-->
<%
response.write "<br/>聊室:" & objgbrs("roomjfjf")& "积分<br/>魅力:"& objgbrs("ml")& "<br/>体力:"& objgbrs("tili")& "<br/><a href='/bbs/dengji.asp?SessionID=" & SessionID & "'>经验</a>:" & objgbrs("entcont")+objgbrs("ticont")*5
%>
<!--#include file="1sj.asp"-->
<%
Response.write "<br/>发帖数量:" & objgbrs("ticont")
%>
<%
Response.write "<br/>入住狂野:" & INT(objgbrs("lasttime")-objgbrs("regtimes"))& "天了<br/>在线时长:" & objgbrs("entcont")& "小时"
Response.write "<br/>注册时间:" & "" & objgbrs("regtimes")& "<br/>最后在线:" & "" & objgbrs("lasttime")&""
Response.write "<br/>个人简介:" & converttowide(UBBCodes(objgbrs("usejj")))
Response.write "<br/>------------"
End if
if objgbrs("usesex")="0" then
sexe="他"
  elseif objgbrs("usesex")="1" then
sexe="她"
  elseif objgbrs("usesex")="2" then
sexe="它"
end if

if objgbrs("id")=Session("useid") then
Response.write "<br/><a href='/bbs/myroom/from.asp?id=" & objgbrs("id") & "&amp;SessionID=" & SessionID & "'>我的大厅</a>|<a href='/bbs/myalbum/myalbum1.asp?id=" & objgbrs("id") & "&amp;SessionID=" & SessionID & "'>我的相册</a><br/><a href='/bbs/forum_content/bbstdzt.asp?id=" & objgbrs("id") & "&amp;SessionID=" & SessionID & "'>我的文章</a>|<a href='/bbs/public/gygl.asp?SessionID=" & SessionID & "'>我的地盘</a><br/><a href='/bbs/reg/useinfocw.asp?SessionID=" & SessionID & "'>我的宠物</a>|<a href='/bbs/index.asp?SessionID=" & SessionID & "'>社区首页</a>"
else
Response.Write "<br/><anchor><prev/>快速返回</anchor>|<a href='/bbs/friandbook/addcl.asp?frid=" & objgbrs("id") & "&amp;SessionID=" & SessionID & "'>加" & sexe & "为友</a><br/><a href='postbank.asp?id=" & objgbrs("id") & "&amp;SessionID=" & SessionID & "'>过户金币</a>|<a href='/bbs/myroom/from.asp?id=" & objgbrs("id") & "&amp;SessionID=" & SessionID & "'>" & sexe & "的大厅</a><br/><a href='/bbs/jieh/jie1.asp?id=" & objgbrs("id") & "&amp;SessionID=" & SessionID & "'>向" & sexe & "求婚</a>|<a href='/bbs/myalbum/myalbum1.asp?id=" & objgbrs("id") & "&amp;SessionID=" & SessionID & "'>" & sexe & "的相册</a><br/><a href='/bbs/forum_content/bbstdzt.asp?id=" & objgbrs("id") & "&amp;SessionID=" & SessionID & "'>" & sexe & "的文章</a>|<a href='/bbs/friandbook/addnocl.asp?frid=" & objgbrs("id") & "&amp;SessionID=" & SessionID & "'>将" & sexe & "加黑</a><br/><a href='/bbs/public/gygl.asp?SessionID=" & SessionID & "'>我的地盘</a>|<a href='/bbs/index.asp?SessionID=" & SessionID & "'>社区首页</a>"
End if
if Cstr(Session("yxxezb"))<>"" or Session("Counter")="pass_numbers_55556666" then
Response.write "<br/>--------------"
Response.write "<br/><a href='/bbs/public/jycz.asp?id=" & objgbrs("id") & "&amp;SessionID=" & SessionID & "'>封禁该会员</a>"
Response.write "<br/><a href='/bbs/public/ffscz.asp?id=" & objgbrs("id") & "&amp;SessionID=" & SessionID & "'>解禁该会员</a>"
Response.write "<br/><a href='/bbs/public/setbz.asp?id=" & objgbrs("id") & "&amp;SessionID=" & SessionID & "'>任命会员权</a>"
Response.write "<br/><a href='/bbs/public/jfzf.asp?id=" & objgbrs("id") & "&amp;SessionID=" & SessionID & "'>奖罚该会员</a>"
End if
if Session("useid")=1 then
Response.write "<br/><a href='/bbs/xcbgs/delwwsy.asp?ids=" & objgbrs("id") & "&amp;debz=t" & "&amp;SessionID=" & SessionID & "'>清除所有贴</a>"
End if
End if
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