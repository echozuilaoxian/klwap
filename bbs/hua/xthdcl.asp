<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%><%response.buffer=true%><%Response.ContentType = "text/vnd.wap.wml; charset=utf-8"%><?xml version="1.0" encoding="utf-8"?><!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<!--#INCLUDE VIRTUAL="/md5/inc.asp"-->

<wml>
<head>
<meta http-equiv="Cache-Control" content="max-age=0"/>
<meta http-equiv="Cache-Control" content="no-cache"/>
<meta http-equiv="Expires" content="Mon, 1 Jan 1990 00:00:00 GMT"/></head>

<%
 SessionID=request.querystring("SessionID")
if SessionID="" then SessionID=Session("SessionID")
if Session("zh")="wap" then
        Session("returnuppath")=Request.ServerVariables("PATH_INFO") & "?m=m"
        response.redirect "/BBS/UseLogin.asp?SessionID="&SessionID&""
    End if
hotid=request("hotid")
Server.ScriptTimeout=9999
iduse=Session("useid")
lasttlls=525
lasttls
kid=clng(request("kid"))
dlmm=clng(request("dlmm"))
if   kid=""  or dlmm="" or Isnumeric(dlmm)=False  or Isnumeric(kid)=False  or dlmm<=0 or kid<=0  or dlmm>999999999 or kid>12    then
%>
<card id="hotpk" title="购买不成功" ontimer='/bbs/hua/index.asp?SessionID=<%=SessionID%>'><timer value='100'/><p>数据非法...正在返回花园<br/><a href='/bbs/hua/index.asp?SessionID=<%=SessionID%>'>返回我的花园空间</a>
<%
Response.Write "</p></card></wml>"
response.end
end if
%>


<card id="hotpk" title="购买鲜花"><p>
<%
set objgbrsm=Server.CreateObject("ADODB.Recordset")
       ssql="select id,usejf,usename from usereg where CStr(id)='" &iduse & "'"
       objgbrsm.open ssql,conn
  set objgbrs=Server.CreateObject("ADODB.Recordset")
       ssql="select id,usename from usereg where CStr(id)='" &soid & "'"
       objgbrs.open ssql,conn
if objgbrs.eof then
Response.write ""
else
set rs8=Server.CreateObject("ADODB.Recordset")
       ssql="select * from hua where CStr(ids)='" & iduse & "'"
       rs8.open ssql,conn,1,2
if rs8.recordcount<1 then
rs8.addnew
rs8("ids")=iduse
rs8.update
end if
end if
if lycount>0 then
    Response.write "<br/><a href='/bbs/public/ckly.asp?SessionID="&SessionID&"'>" & lycount & "条新信息</a><br/>"
Session("returnuppath")=Request.ServerVariables("PATH_INFO") & "?kid=" & kid & ""
End if
Response.write "<a href='/bbs/hua/index.asp?SessionID="&SessionID&"'>返回我的花园空间</a><br/><img src='/bbs/hua/img/1_0.gif' alt='花园'/><br/>"
if kid=1 then 
kkb=rs8("hongs")
 huaa="hongs" 
jia="1280"
voteID="1" 
elseif kid=2 then 
kkb=rs8("hmus")
huaa="hmus"
jia="1280"
voteID="2"
elseif kid=3 then 
kkb=rs8("huangs")
huaa="huangs"
 jia="1280"
voteID="3"
elseif kid=4 then 
kkb=rs8("kangs")
huaa="kangs"
 jia="1280"
voteID="4"
elseif kid=5 then 
kkb=rs8("mans")
huaa="mans"
 jia="1280"
voteID="5"
elseif kid=6 then 
kkb=rs8("zis")
huaa="zis"
 jia="1280"
voteID="6"
elseif kid=7 then 
kkb=rs8("tians")
 huaa="tians"
 jia="1280"
voteID="7"
elseif kid=8 then 
kkb=rs8("zmus")
 huaa="zmus" 
jia="1280"
voteID="8" 
elseif kid=9 then 
kkb=rs8("yis")
huaa="yis"
jia="1280"
voteID="9"
elseif kid=10 then 
kkb=rs8("qangs")
huaa="qangs"
 jia="1280"
voteID="10"
elseif kid=11 then 
kkb=rs8("qians")
huaa="qians"
 jia="1280"
voteID="11"
elseif kid=12 then 
kkb=rs8("pus")
huaa="pus"
 jia="1280"
voteID="12"
end if
if objgbrsm("usejf")<dlmm*1280 then
%>
你的金币不够...不能购买<br/><a href='/bbs/hua/sohua.asp?SessionID=<%=SessionID%>'>返回重新选择</a><br/><a href='/bbs/hua/index.asp?SessionID=<%=SessionID%>'>返回我的花园空间</a>
<%
Response.Write "</p></card></wml>"
objgbrsm.close
Set objgbrsm= Nothing
response.end
end if
jbjia=jia*dlmm
sql="update hua set "&huaa&"="&huaa&"+"&dlmm&"  where CStr(ids)='" &iduse& "'" 				
                conn.execute sql
sql="update usereg set  usejf=usejf-"&jbjia&"  where id=" &iduse& "" 				
                conn.execute sql
dim talk
talk="" & Session("ltname") & "在(url=/bbs/hua/xthd.Asp)系统花店(/url)买了"&dlmm&"朵(img)/bbs/xhjy/hua/" &voteID& ".gif(/img)，共花费"&jbjia&"金币"
sql="insert into sjzk(ids,dong,lasttlls,bu)values('"&iduse&"','"&talk&"','525','0')"
  Application.Lock
  conn.execute sql
  Application.Unlock

%>
----------<br/>成功买了<%=dlmm%>朵<img src='/bbs/xhjy/hua/<%=voteID%>.gif' alt=''/>,共花费<%=jbjia%>金币<br/>
<!--#INCLUDE VIRTUAL="/bbs/hua/klwll.asp"-->
</p></card></wml>


