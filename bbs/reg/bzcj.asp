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
<card id="card1" title="管理员资料">
<p align="left">
<% 
Server.ScriptTimeout=999
SessionID=request.querystring("SessionID")
if SessionID="" then SessionID=Session("SessionID")
ForumID=request("ForumID")
iduse=Session("useid")
lasttlls="159"
lasttls

if lycount>0 then
    Response.write "<br/><a href='/bbs/public/ckly.asp?SessionID=" & SessionID & "'>您有(" & lycount & ")条新信息</a>"
       Session("returnuppath")=Request.ServerVariables("PATH_INFO") & "?ForumID=" & ForumID & "&amp;ID=" & ID & ""
End if
%>
管理员资料<br/>-------------
<%
id=request("id")
       set objgbrs=Server.CreateObject("ADODB.Recordset")
       ssql="select * from usereg where CStr(id)='" & id & "'"
       objgbrs.open ssql,conn

if objgbrs("yxxezb")<>0 then Response.write "<br/>当前职务:论坛总版"
if objgbrs("yxxexc")<>0 then Response.write "<br/>当前职务:论坛巡查"
if objgbrs("yxxegg")<>0 then Response.write "<br/>当前职务:高级督察"

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
Response.write "<br/>当前职务:<a href='/bbs/forum_content/contentlist.asp?ForumID="&objgbrs("gly")&"&amp;SessionID=" & SessionID & "'>"&converttowidebaiti(bkmc)&"</a>"&converttowidebaiti(bbzz)&""
else
Response.write ""
end if

Response.write "<br/><a href='/bbs/reg/txsm.asp?SessionID=" & SessionID & "'>个人头衔</a>:"

if objgbrs("lasttime")-objgbrs("regtimes")=0 then
Response.write "娃娃<br/>"
end if
if objgbrs("lasttime")-objgbrs("regtimes")>=0 and  objgbrs("lasttime")-objgbrs("regtimes")<10 then
Response.write "<img src='/bbs/reg/shao/2.gif' alt='下士'/><br/>"
end if
if objgbrs("lasttime")-objgbrs("regtimes")>=10 and  objgbrs("lasttime")-objgbrs("regtimes")<50 then
Response.write "<img src='/bbs/reg/shao/3.gif' alt='中士'/><br/>"
end if
if objgbrs("lasttime")-objgbrs("regtimes")>=50 and  objgbrs("lasttime")-objgbrs("regtimes")<100 then
Response.write "<img src='/bbs/reg/shao/4.gif' alt='上士'/><br/>"
end if
if objgbrs("lasttime")-objgbrs("regtimes")>=100 and  objgbrs("lasttime")-objgbrs("regtimes")<150 then
Response.write "<img src='/bbs/reg/shao/5.gif' alt='少校'/><br/>"
end if
if objgbrs("lasttime")-objgbrs("regtimes")>=150 and  objgbrs("lasttime")-objgbrs("regtimes")<200 then
Response.write "<img src='/bbs/reg/shao/6.gif' alt='中校'/><br/>"
end if
if objgbrs("lasttime")-objgbrs("regtimes")>=200 and  objgbrs("lasttime")-objgbrs("regtimes")<250 then
Response.write "<img src='/bbs/reg/shao/7.gif' alt='上校'/><br/>"
end if
if objgbrs("lasttime")-objgbrs("regtimes")>=250 and  objgbrs("lasttime")-objgbrs("regtimes")<300 then
Response.write "<img src='/bbs/reg/shao/8.gif' alt='少尉'/><br/>"
end if
if objgbrs("lasttime")-objgbrs("regtimes")>=300 and  objgbrs("lasttime")-objgbrs("regtimes")<400 then
Response.write "<img src='/bbs/reg/shao/9.gif' alt='中尉'/><br/>"
end if
if objgbrs("lasttime")-objgbrs("regtimes")>=400 and  objgbrs("lasttime")-objgbrs("regtimes")<600 then
Response.write "<img src='/bbs/reg/shao/10.gif' alt='大尉'/><br/>"
end if
if objgbrs("lasttime")-objgbrs("regtimes")>=600 and  objgbrs("lasttime")-objgbrs("regtimes")<800 then
Response.write "<img src='/bbs/reg/shao/11.gif' alt='少将'/><br/>"
end if
if objgbrs("lasttime")-objgbrs("regtimes")>=800 and  objgbrs("lasttime")-objgbrs("regtimes")<1000 then
Response.write "<img src='/bbs/reg/shao/12.gif' alt='中将'/><br/>"
end if
if objgbrs("lasttime")-objgbrs("regtimes")>=1000 and  objgbrs("lasttime")-objgbrs("regtimes")<1200 then
Response.write "<img src='/bbs/reg/shao/13.gif' alt='大将'/><br/>"
end if
if objgbrs("lasttime")-objgbrs("regtimes")>=1200 and  objgbrs("lasttime")-objgbrs("regtimes")<3000 then
Response.write "<img src='/bbs/reg/shao/14.gif' alt='元帅'/><br/>"
end if

Response.write "个人级别:" & objgbrs("ticont")*5+objgbrs("entcont") & " <br/>"
Response.write "个人学历:"
if objgbrs("xl")=0 then
Response.write "没有证书 <br/>"
end if
if objgbrs("xl")=1 then
Response.write "小学毕业 <br/>"
end if
if objgbrs("xl")=2 then
Response.write "初中毕业 <br/>"
end if
if objgbrs("xl")=3 then
Response.write "高中毕业 <br/>"
end if
if objgbrs("xl")=4 then
Response.write "大学毕业 <br/>"
end if
if objgbrs("xl")=5 then
Response.write "硕士生 <br/>"
end if
if objgbrs("xl")=6 then
Response.write "博士生 <br/>"
end if

response.write "" & "个人魅力: "& objgbrs("ml")
response.write "<br/>个人体力: "& objgbrs("tili")
Response.write "<br/>论坛经验:" & objgbrs("entcont")+objgbrs("ticont")*5
Response.write "<br/>个人文章:" & objgbrs("ticont")
Response.write "篇<br/>注册天数:" & "" 
Response.write ""& INT(objgbrs("lasttime")-objgbrs("regtimes"))
Response.write "天"
Response.write "<br/>在线时长:" & objgbrs("entcont")
Response.write "小时<br/>最后在线:" & "" & objgbrs("lasttime")
Response.Write "<br/><a href='/bbs/public/delzlbz.asp?id=" & objgbrs("id")&"&amp;SessionID=" & SessionID & "'>本月所删帖子</a><br/>"

Response.write "<a href='/BBS/public/bbbz.asp?SessionID=" & SessionID & "&amp;ForumID=" & ForumID & "'>返回上级面页</a><br/>"
Response.write "<a href='/bbs/index.asp?SessionID=" & SessionID & "'>返回社区首页</a></p></card></wml>"
objgbrs.close
Set objgbrs= Nothing
conn.close
set conn=nothing

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

%>
