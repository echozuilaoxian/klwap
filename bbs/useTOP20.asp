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
<card id='main' title='<%=converttowidebaiti(SystemSiteName)%>-会员排行榜'>
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
  dim sort,desc
  sort=request.querystring("sort")
  if sort="" or sort>19 or sort<1 then
	sort=2
  end if
  select case sort
'================================
  case 1
  tip="智力排行"
  desc="zhili"
'================================
  case 2
  tip="最新会员"
  desc="regtimes"
'================================
  case 3
  wheretmp="where myzuan>0 "
  tip="社币排行"
  desc="myzuan"
'================================
  case 4
  tip="发帖排行"
  desc="ticont"
'================================
  case 5
  tip="登陆排行"
  desc="entcont"
'================================ 
 case 6
  tip="聊室积分排行"
  desc="roomjfjf"
'================================
  case 7
  tip="头衔排行"
  desc="lasttime-regtimes"
'================================
  case 8
  tip="金币排行"
  desc="usejf+bank"
'================================
  case 9
  tip="魅力排行"
  desc="ml"
'================================
  case 10
  tip="体力排行"
  desc="tili"
'================================
  case 11
  tip="级别排行"
  desc="ticont*5+entcont"
'================================
  case 12
  tip="情商排行"
  desc="qs"
'================================
  case 13
  tip="爱心排行"
  desc="love"
'================================
  case 14
  tip="才华排行"
  desc="caihua"
'================================
  case 15
  tip="学分排行"
  desc="xf"
'================================
  case 16
  wheretmp="where xl<>'0' "
  tip="学历排行"
  desc="xl"
'================================
  case 17
  tip="宠物生命排行"
  desc="cwsm"
'================================
  case 19
  wheretmp="where rmb<>0 "
  tip="元宝排行"
  desc="rmb"
'================================
  case 18
  tip="宠物热情排行"
  desc="cwrq"
  end select

%>
<% 
if lycount>0 then
Response.write "<a href='/bbs/public/ckly.asp?SessionID=" & SessionID & "'>&#x60A8;&#x6709;(" & lycount & ")&#x6761;&#x65B0;&#x4FE1;&#x606F;!</a><br/>------------<br/>"
       Session("returnuppath")=Request.ServerVariables("PATH_INFO") & "?sort=" & sort & ""
End if

   Response.write ""&tip&"TOP20名<br/>---------------<br/>"

if SessionID="" then SessionID=Session("SessionID")

dim objgbrs
  set objgbrs=Server.CreateObject("ADODB.Recordset")
  ssql="select top 20 * from [usereg] " & wheretmp & "  order by "& desc &" desc"
  objgbrs.open ssql,conn,1,1
if objgbrs.eof then
   Response.write "暂无记录<br/>"
 Else
bihaocont=1
do while not objgbrs.eof
Response.write ""&bihaocont&":<a href='/bbs/reg/useinfo.asp?id=" & objgbrs("id") & "&amp;SessionID=" & SessionID & "'>" & converttowidebaiti(objgbrs("usename")) & "ID:" & objgbrs("id") & "</a><br/>"
if sort = 1  then
Response.write "智力:" & objgbrs("zhili") & "点<br/>"
 Elseif sort = 2  then
Response.write "注册时间:" & objgbrs("regtimes") & "<br/>"
 Elseif sort = 3  then
Response.write "社币:" & objgbrs("myzuan") & "枚<br/>"
 Elseif sort = 4 then
Response.write "发贴:" & objgbrs("ticont") & "篇<br/>"
 Elseif sort = 5  then
Response.write "登陆:" & objgbrs("entcont") & "次<br/>"
 Elseif sort = 6  then
Response.write "积分:" & objgbrs("roomjfjf") & "点<br/>"
 Elseif sort = 7  then
Response.write "<a href='/bbs/reg/txsm.asp?SessionID=" & SessionID & "'>头衔</a>:"

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

 Elseif sort = 8  then
Response.write "金币-包括存款:" & objgbrs("usejf")+objgbrs("bank") & "枚<br/>"
 Elseif sort = 9  then
Response.write "魅力:" & objgbrs("ml") & "点<br/>"
 Elseif sort = 10  then
Response.write "体力:" & objgbrs("tili") & "点<br/>"
 Elseif sort = 11  then
Response.write "级别:" & objgbrs("ticont")*5+objgbrs("entcont") & " <br/>"
 Elseif sort = 12  then
Response.write "情商:" & objgbrs("qs") & "点<br/>"
 Elseif sort = 13  then
Response.write "爱心:" & objgbrs("love") & "点<br/>"
 Elseif sort = 14  then
Response.write "才华:" & objgbrs("caihua") & "点<br/>"
 Elseif sort = 15  then
Response.write "学分:" & objgbrs("xf") & "分<br/>"
 Elseif sort = 16  then

Response.write "学历:"
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

 Elseif sort = 17  then
Response.write "生命:" & objgbrs("cwsm") & "点<br/>"
 Elseif sort = 18  then
Response.write "热情:" & objgbrs("cwrq") & "点<br/>"
 Elseif sort = 19  then
Response.write "元宝:" & objgbrs("rmb") & "个<br/>"

 Else
Response.write "注册时间:" & objgbrs("regtimes") & "<br/>"
end if

bihaocont=bihaocont+1
objgbrs.movenext
loop
End if
objgbrs.close
set objgbrs=nothing
%>
<%
response.write("------------<br/>")
Response.write "<a href='/bbs/useTOP.asp?SessionID=" & SessionID & "'>"&converttowidebaiti("返回会员排行")&"</a><br/>"
Response.write "<a href='/bbs/Index.asp?SessionID=" & SessionID & "'>"&converttowidebaiti("返回社区首页")&"</a><br/>"
%>
<small><% 
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
%></small>
</p></card></wml>
<%conn.close
set conn=nothing%>