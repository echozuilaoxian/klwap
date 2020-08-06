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
  ky=request.querystring("ky")
 if ky="" then
	ky=1
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
set objgbrc1=Server.CreateObject("ADODB.Recordset")
ssql6="select * from usereg where cstr(id)=" &iduse & ""
  objgbrc1.open ssql6,conn,1,1
usejf=clng(objgbrc1("usejf"))
name=objgbrc1("usename")
objgbrc1.close
Set objgbrc1= Nothing
if ky="1" then
%>你现在有<%=usejf%>金币<br/>不能发表任何有关人身攻击和污辱性的内容,一旦发现全区加黑<br/>
主题内容:50字内<br/><input name='txt' title='内容' type="text" format="*M" emptyok="true" maxlength="50"  value='内容'/><br/>
<br/>
选择你的答案:<br/><select name='ps' >
<option value="s">是</option>
<option value="f">不是</option>
</select><br/>
输入牛金:<br/><input  name="ks"  value="100" format="*N" size="20" maxlength="10"/>
<anchor>确定放牛
		<go href="aile.Asp?ky=2&amp;SessionID=<%=SessionID%>" method="post"  accept-charset="utf-8">
		<postfield name="txt" value="$(txt)" />
		<postfield name="ps" value="$(ps)"/>
		<postfield name="ks" value="$(ks)" />
	
                                      </go>
		</anchor> 
<%elseif ky="2" then
txt=request("txt")
ps=request("ps")
ks=clng(request("ks"))
if txt="" or ps=""  or ks=""  then
     response.write "发表不成功,各项都不能为空！"
     response.write "<br/><a href='aile.Asp?ky=1&amp;SessionID=" & SessionID & "'>返回继续操作</a><br/><a href='/BBS/index.asp?SessionID=" & SessionID & "'>返回社区首页</a><br/><a href='index.asp?SessionID=" & SessionID & "'>返回疯狂吹牛</a></p></card></wml>"
     response.end
  End if
if  ks>usejf  then
   response.write "牛金不能多过身上的金币！你只有" &usejf & "金币<br/>"
     response.write "<br/><a href='aile.Asp?ky=1&amp;SessionID=" & SessionID & "'>返回继续操作</a><br/><a href='/BBS/index.asp?SessionID=" & SessionID & "'>返回社区首页</a><br/><a href='index.asp?SessionID=" & SessionID & "'>返回疯狂吹牛</a></p></card></wml>"
     response.end
  End if
if  ks<100  then
   response.write "牛金不能少于100金币！你有" &usejf & "金币<br/>"
     response.write "<br/><a href='aile.Asp?ky=1&amp;SessionID=" & SessionID & "'>返回继续操作</a><br/><a href='/BBS/index.asp?SessionID=" & SessionID & "'>返回社区首页</a><br/><a href='index.asp?SessionID=" & SessionID & "'>返回疯狂吹牛</a></p></card></wml>"
     response.end
  End if
set objgbrc=Server.CreateObject("ADODB.Recordset")
ssql6="select * from daha order by id desc"
  objgbrc.open ssql6,conn,1,2
 objgbrc.addnew
if txt<>"" then  objgbrc("baoti")=txt
if ps<>"" then  objgbrc("da")=ps
if ks<>"" then  objgbrc("leji")=ks
objgbrc("ids")=iduse
objgbrc("lez")=name
objgbrc.update
 sql="update dahaa  set daha3=daha3-" &ks & "  where CStr(ids)='" &iduse & "'" 
			conn.execute sql
 sql="update usereg  set  usejf=usejf-" &ks & "  where CStr(id)='" &iduse & "'" 
			conn.execute sql
dim talk
talk="" & objgbrc("lez") & "发起了擂金" & objgbrc("leji") & "金币的(url=/bbs/dhxh/index.Asp)牛牛(/url)"
sql="insert into sjzk(ids,dong,lasttlls,bu)values('"&iduse&"','"&talk&"','524','game')"
  Application.Lock
  conn.execute sql
  Application.Unlock
Response.write "放牛成功<br/>"
  response.write "<br/><a href='aile.Asp?ky=1&amp;SessionID=" & SessionID & "'>返回继续操作</a><br/>"
  End if
objgbrc.close
Set objgbrc= Nothing
conn.close
set conn=nothing
%>

<br/>---------------<br/><a href='index.Asp?SessionID=<%=SessionID%>'>返回吹牛</a>.<a href="/bbs/SCYL.asp?SessionID=<%=SessionID%>">返回赌场</a><br/>
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