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
<card id='main' title='疯狂吹牛大王'>
<p align='left'>
<%Server.ScriptTimeout=999
SessionID=request.querystring("SessionID")
iduse=Session("useid")
gfdsa=Session("ltname")
lasttlls=524
lasttls
id =Request("kd")
hd=Request("hd")
if id="" then
 response.write "系统提示:请不要违反规定.返回...<br/>-------------<br/><a href='index.Asp?SessionID=" & SessionID & "'>返回疯狂吹牛</a><br/><a href='/bbs/index.asp?SessionID=" & SessionID & "'>返回社区首页</a></p></card></wml>"
response.end
end if
if SessionID="" then SessionID=Session("SessionID")
if Session("zh")="wap" then
       Session("returnuppath")=Request.ServerVariables("PATH_INFO") & "?ids=ids"
        response.redirect "/BBS/UseLogin.asp?SessionID="&SessionID&""
  	response.end
      else
        Session("ltlybz")=""
    End if
if lycount>0 then
    Response.write "<a href='/bbs/public/ckly.asp?SessionID=" & SessionID & "'>您有" & lycount & "条新信息</a><br/>"
Session("returnuppath")=Request.ServerVariables("PATH_INFO") & "?0=0"
End if
set rxs=Server.CreateObject("ADODB.Recordset")
rsxQL="select * from dahaa where cstr(ids)='"&iduse& "'"
rxs.open rsxQL,conn,1,2
if rxs.recordcount<1 then
rxs.addnew
rxs("ids")=iduse
rxs.update
end if
        rxs.Close
	Set rxs=Nothing%>

<%
set objgbrc1=Server.CreateObject("ADODB.Recordset")
ssql6="select * from usereg where cstr(id)=" &iduse & ""
  objgbrc1.open ssql6,conn,1,1
usejf=objgbrc1("usejf")
tzz=objgbrc1("usename")
objgbrc1.close
Set objgbrc1= Nothing
set objgbrc=Server.CreateObject("ADODB.Recordset")
ssql6="select * from daha where cstr(id)='" & id & "'"
  objgbrc.open ssql6,conn,1,1
if objgbrc.EOF then
Response.write "无这牛牛<br/>"
else
if objgbrc("da")="s" then
da="信"
else
da="不信"
end if
if objgbrc("ids")=iduse then
 response.write "系统提示:不可以自己挑战自己哦<br/>"
response.end
end if
if  objgbrc("leji")>usejf  then
 response.write "系统提示:你的金币不够,本条牛牛赛的牛金是:" & objgbrc("leji") & "<br/>"
 response.write "<a href='index.Asp?SessionID=" & SessionID & "'>返回疯狂吹牛</a><br/><a href='/bbs/index.asp?SessionID=" & SessionID & "'>返回社区首页</a></p></card></wml>"
response.end
end if
if objgbrc("jg")="h" then
 response.write "系统提示:本条已结束<br/>-------------<br/>牛主:<a href='/bbs/reg/useinfo.asp?id=" & objgbrc("ids") & "&amp;SessionID=" & SessionID & "'>" &objgbrc("lez")& "</a><br/>牛金:" & objgbrc("leji") & "<br/>日期:" &objgbrc("times")& "<br/>状态:结束<br/>答案:" &da& "<br/>"
if objgbrc("sy")="1" then
 response.write "胜:牛主<br/>"
end if
if objgbrc("sy")="2"then
 response.write "胜:挑战者<br/>"
end if
 response.write "挑战者:<a href='/bbs/reg/useinfo.asp?id=" & objgbrc("idss") & "&amp;SessionID=" & SessionID & "'>" &objgbrc("tzz")& "</a><br/>"
 response.write "<a href='index.Asp?SessionID=" & SessionID & "'>返回疯狂吹牛</a><br/><a href='/bbs/index.asp?SessionID=" & SessionID & "'>返回社区首页</a></p></card></wml>"
response.end
end if
if objgbrc("da")=hd  then
 response.write "系统提示:<br/>你胜出了,你获得本条牛牛赛的牛金:" & objgbrc("leji") & "金币<br/>"
   sql="update dahaa  set daha3=daha3+"& objgbrc("leji") &",daha1=daha1+1  where CStr(ids)='" &iduse & "'" 
			conn.execute sql
   sql="update usereg  set  usejf=usejf+"& objgbrc("leji") &"  where CStr(id)='" &iduse & "'" 
			conn.execute sql
  sql="update daha  set jg='h',tzz='" & tzz & "',sy=2,idss=" &iduse & "  where CStr(id)='" & id & "'" 
			conn.execute sql
 sql="update dahaa  set daha2=daha2+1  where CStr(ids)='" & objgbrc("ids") & "'"
			conn.execute sql
dim talk
talk="" & Session("ltname") & "赢了" & objgbrc("lez") & "(url=/bbs/dhxh/index.Asp)吹牛(/url)的擂金" & objgbrc("leji") & "金币"
sql="insert into sjzk(ids,dong,lasttlls,bu)values('"&iduse&"','"&talk&"','524','game')"
  Application.Lock
  conn.execute sql
  Application.Unlock
 response.write "<a href='index.Asp?SessionID=" & SessionID & "'>返回疯狂吹牛</a><br/><a href='/bbs/index.asp?SessionID=" & SessionID & "'>返回社区首页</a></p></card></wml>"
response.end
else
 response.write "系统提示:<br/>你输了,系统扣除:" & objgbrc("leji") & "金币<br/>答案:" &da& "<br/>"
  sql="update dahaa  set daha3=daha3-"& objgbrc("leji") &" ,daha2=daha2+1 where CStr(ids)='" &iduse & "'" 
			conn.execute sql
   sql="update usereg  set  usejf=usejf-"& objgbrc("leji") &"  where CStr(id)='" &iduse & "'" 
			conn.execute sql
  sql="update usereg  set  usejf=usejf+"& objgbrc("leji")*2 &"  where CStr(id)='" & objgbrc("ids") & "'" 
			conn.execute sql
 sql="update daha  set jg='h',tzz='" & tzz & "',sy=1,idss=" &iduse & "  where CStr(id)='" & id & "'" 
			conn.execute sql
 sql="update dahaa  set daha1=daha1+1,daha3=daha3+"& objgbrc("leji")*2 &"  where CStr(ids)='" & objgbrc("ids") & "'"
			conn.execute sql
 response.write "<a href='index.Asp?SessionID=" & SessionID & "'>返回疯狂吹牛</a><br/><a href='/bbs/index.asp?SessionID=" & SessionID & "'>返回社区首页</a></p></card></wml>"
response.end
end if
end if
objgbrc.close
Set objgbrc= Nothing
conn.close
set conn=nothing
%>

<br/>---------------<br/>
<a href="/BBS/public/gygl.asp?SessionID=<%=SessionID%>">我的地盘</a>.<a href="/BBS/index.asp?SessionID=<%=SessionID%>">社区首页</a><br/>
<% 
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
%><br/>
</p></card></wml>