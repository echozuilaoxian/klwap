<% @LANGUAGE="VBSCRIPT" CODEPAGE="65001" %>
<% Response.ContentType="text/vnd.wap.wml; charset=utf-8" %>
<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<!--#INCLUDE VIRTUAL="/bbs/410616.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/public/codeun.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/public/t22t.cn.asp"-->
<!--#include FILE="md5.asp"-->
<wml>
<head>
<meta http-equiv="Cache-Control" content="max-age=0"/>
<meta http-equiv="Cache-Control" content="no-cache"/>
<meta http-equiv="Expires" content="Mon, 1 Jan 1990 00:00:00 GMT"/>
</head>
<%
SessionID=request.querystring("SessionID")
if SessionID="" then SessionID=Session("SessionID")
iduse=Session("useid")
sjhm=Session("zh")
if Session("zh")<>"wap" then
        response.redirect "/BBS/UseLoginS.asp?sjhm="&sjhm&"&pass="&LKXXX&""
     response.end
End if

IF (Request.QueryString("Action")="reg") Then
	call reg
elseIF (Request.QueryString("Action")="exit") Then
   		session("name")= ""
		session("pid")= ""
elseIF (Request.QueryString("Action")="login") Then
	call login
elseIF (Request.QueryString("Action")="save") Then
	call save
else
	call main

End IF
%>
<%sub main
%><card id="login" title="会员登陆">
		<p align="left">游客注册/登陆
<br/>手机号:<input name="sjhm" format="*N" size="12" maxlength="11"/>
<br/>密  码:<input type="password" name="pass" maxlength="100" size="12"/>
<br/><anchor>安全登陆<go method="post" href="/bbs/ltdlcl.asp"><postfield name="sjhm" value="$(sjhm)"/><postfield name="pass" value="$(pass)"/></go></anchor>|<anchor>一般登陆<go method="post" href="/bbs/ltdlcl1.asp"><postfield name="sjhm" value="$(sjhm)"/><postfield name="pass" value="$(pass)"/></go></anchor><br/>
安全登陆可以使以前书签失效
<br/><a href="/BBS/UseLogin.asp?Action=reg&amp;SessionID=guest000000000000000000001000009">免费注册</a>
<br/><a href="/BBS/zhmm.asp">找回密码</a><br/>------------<br/>

<%
if Session("returnuppath")<>"" then
   Response.write "<a href='" & Session("returnuppath") & "&amp;SessionID=" & SessionID & "'>返回来源面页</a><br/>"
      else
   Response.write "<a href='/BBS/index.asp?SessionID=" & SessionID & "'>返回社区首页</a><br/>"
end if   
%><a href="/index.asp">网站首页</a>
		</p>
  </card>
</wml>
	
<%end sub
sub reg%>
	<card id="add" title="免费注册"><p>
注意:<u>登陆密码</u>必须使用<b>英文字母</b>或者<b>数字</b>,否则部分手机可能无法登陆<br/>
------------<br/>
手机号码:<input name="sjhm" maxlength="11" format="*N" size="20"/><br/>
社区昵称:<input name="ltnc" title="社区昵称" type="text" format="*M" emptyok="true" maxlength="20" value=""/><br/>
登陆密码:<input name="dlmm" title="登陆密码" type="text" format="*M" emptyok="true" maxlength="50" value=""/><br/>
选择性别:<select name='xb' value='0'>
<option value="0">男性</option>
<option value="1">女性</option>
</select><br/>
<b><u>密码保护</u></b><br/>
密码问题:<input name="mmwt" title="密码问题" type="text" format="*M" emptyok="true" maxlength="20" value=""/><br/>
密码答案:<input name="wtda" title="密码答案" type="text" format="*M" emptyok="true" maxlength="20" value=""/><br/>
<anchor>确定提交
    <go href="/BBS/UseLogin.asp?Action=save" method="post" accept-charset="utf-8">
        <postfield name="sjhm" value="$(sjhm)"/>
        <postfield name="dlmm" value="$(dlmm)"/>
        <postfield name="ltnc" value="$(ltnc)"/>
        <postfield name="mmwt" value="$(mmwt)"/>
        <postfield name="wtda" value="$(wtda)"/>
    </go>
</anchor><br/>------------<br/>
		<a href="/BBS/zhmm.asp">[找回密码]</a><br/><a href="/BBS/yksm.asp">[返回登陆]</a><br/>------------<br/>
<%
if Session("returnuppath")<>"" then
   Response.write "<a href='" & Session("returnuppath") & "&amp;SessionID=" & SessionID & "'>返回来源面页</a><br/>"
      else
   Response.write "<a href='/BBS/index.asp?SessionID=" & SessionID & "'>返回社区首页</a><br/>"
end if   
%><a href="/index.asp">网站首页</a>
		</p>
	</card>
</wml>
<%end sub
sub login

name=untowide(request("name"))
pass=untowide(request("pass"))


		IF name<>"" and pass<>"" then
if len(name)<>11  then
		set rsss=Server.CreateObject("ADODB.Recordset")
		Sqsl="select * from usereg where usett=" & sqlstr(pass) & " and id=" &name
		rsss.open sqsl,conn
else
		set rsss=Server.CreateObject("ADODB.Recordset")
		Sqsl="select * from usereg where usephone=" & sqlstr(name) & " and usepass=" & sqlstr(pass)
		rsss.open sqsl,conn
end if
if rsss.eof then
%>
		<card id="login" title="出错了">
		<p>
		错误原因:请正确输入用户名或密码<br/><br/>

		<a href="/BBS/yksm.asp">返回登陆</a><br/><a href="/BBS/UseLogin.asp?Action=reg">免费注册</a><br/>
		<a href="/BBS/zhmm.asp">找回密码</a><br/>
		------------<br/><a href="/bbs/index.asp">返回社区首页</a><br/><a href="/index.asp">返回网站首页</a>
		</p>
	        </card>
</wml>

<%
  	response.end
		else
   		Session("ltname")=rsss("usename")
   		Session("useid")=rsss("id")
   		Session("showjd")=rsss("jdshow")
   		Session("showwz")=rsss("cwxq")
   		dim sid,SessionID
   		sid=Session.sessionid
   		usephone=rsss("usephone")
   		SessionID=md5(trim(usephone)*sid,32)
   		ssql="update usereg set wap='" & SessionID & "' where id="& Session("useid")
   		conn.execute(ssql)
   		sssql="select wap from usereg where id="& Session("useid")
   		set objgbres=conn.execute(sssql)
   		if Not objgbres.eof then
   		SessionID=objgbres("wap")
   		end if
		objgbres.Close
		Set objgbres = Nothing
		rsss.close
		Set rsss = Nothing
		response.Cookies("SessionID")=SessionID
		Response.Cookies("SessionID").Expires=#January 01, 2010#
		Session("SessionID")=SessionID
%>		<card id='login' title='登陆成功'>
		<p>
登陆成功,登陆后访问任何页面，将此页面存为书签，您以后再从此书签进入，将不会再要求登陆<br/>
<%
if Session("returnuppath")<>"" then
   Response.write "<a href='" & Session("returnuppath") & "&amp;SessionID=" & SessionID & "'>返回来源面页</a><br/>"
      else
   Response.write "<a href='/BBS/index.asp?SessionID=" & SessionID & "'>返回社区首页</a><br/>"
end if   
%>
ＩＤ:<%=Session("useid")%><br/>
昵称:<%=converttowidebaiti(Session("ltname"))%><br/>
手机:<%=usephone%><br/>
<a href="/bbs/reg/useinfo.asp?id=<%=Session("useid")%>&amp;SessionID=<%=SessionID%>">更多资料</a><br/>
----------<br/>
温馨提醒:<br/>
书签地址中SessionID=<%=SessionID%>为您的身份标识码, 在做提取地址时要去掉标识,不要泄露给他人.请妥善保管!<br/>
<a href="/BBS/index.asp?SessionID=<%=SessionID%>">社区首页</a><br/>
<a href="/index.asp?SessionID=<%=SessionID%>">网站首页</a><br/>
		</p>
</card>
</wml>
<%
     response.end
		end if
	else%>
		<card id="login" title="出错了">
		<p>
		错误原因:请正确输入用户名或密码<br/><br/>
		<a href="/BBS/yksm.asp">返回登陆</a><br/><a href="/BBS/UseLogin.asp?Action=reg">免费注册</a><br/>
		<a href="/BBS/zhmm.asp">找回密码</a><br/>
		------------<br/><a href="/bbs/index.asp">返回社区首页</a><br/><a href="/index.asp">返回网站首页</a>
		</p>
  </card>
</wml>
<%	end if
end sub
sub save

mobile=untowide(request("sjhm"))
pass=untowide(request("dlmm"))
name=untowide(request("ltnc"))
xb=untowide(request("xb"))
mmwt=untowide(request("mmwt"))
wtda=untowide(request("wtda"))
grip=Request.ServerVariables("REMOTE_ADDR")

	if mobile<>"" and pass<>"" and name<>"" and  mmwt<>"" and wtda<>"" Then
	if len(mobile)<>11 or (left(mobile,2)<>13 and left(mobile,2)<>15) then
%>
		<card id="index" title="注册不成功" ontimer="/BBS/UseLogin.asp?Action=reg"><timer value='30'/><p>
		对不起,手机号码不正确<br/>
		<a href="/BBS/UseLogin.asp?Action=reg">[免费注册]</a><br/>
		<a href="/BBS/zhmm.asp">[找回密码]</a><br/>
		------------<br/>
		<a href="/bbs/index.asp">返回社区首页</a><br/><a href="/index.asp">返回网站首页</a><br/>
		</p>
</card>
</wml>
<%
     response.end
		end if

		set rs=Server.CreateObject("Adodb.Recordset")
  		sql="select * from usereg where useklsj='" &mobile&"'"
  		rs.open sql,conn,1,1
		if not rs.eof then
		if mobile=rs("useklsj") then
%>
		<card id="index" title="注册不成功" ontimer="/BBS/UseLogin.asp?Action=reg"><timer value='30'/>
		<p>
		对不起,该手机号码已被注册。<br/>
		<a href="/BBS/UseLogin.asp?Action=reg">[免费注册]</a><br/>
		<a href="/BBS/zhmm.asp">[找回密码]</a><br/>
		------------<br/><a href="/bbs/index.asp">返回社区首页</a><br/><a href="/index.asp">返回网站首页</a><br/>
</p>
</card>
</wml>
<%
     response.end
		end if
		end if

		set rs=Server.CreateObject("Adodb.Recordset")
  		sql="select * from usereg where myip='" & grip &"' order by lasttime desc"
  		rs.open sql,conn,1,1
		if not rs.eof then
		if rs("regtimes")>DateAdd("N",-1440,Now()) then
%>
		<card id="index" title="注册不成功" ontimer="/BBS/UseLogin.asp?Action=reg"><timer value='60'/>
			<p>
		对不起,该IP已注册过，为了防止刷ID，请过24小时后再来注册，谢谢。<br/>您的IP：<%=grip%> <br/>上次注册:<%=rs("regtimes")%><br/>现在时间:<%=now%><br/>
		<a href="/BBS/UseLogin.asp?Action=reg">[免费注册]</a><br/>
		<a href="/BBS/zhmm.asp">[找回密码]</a><br/>
		------------<br/><a href="/bbs/index.asp">返回社区首页</a><br/><a href="/index.asp">返回网站首页</a><br/>
		</p>
</card>
</wml>
<%
     response.end
		end if
		end if

		set rs=Server.CreateObject("Adodb.Recordset")
  		sql="select * from usereg where usename='" & name&"'"
  		rs.open sql,conn,1,1
		if not rs.eof then
		if name=rs("usename") then
%>
		<card id="index" title="注册不成功" ontimer="/BBS/UseLogin.asp?Action=reg"><timer value='30'/>
			<p>
		对不起,该用户已被注册。<br/>
		<a href="/BBS/UseLogin.asp?Action=reg">[免费注册]</a><br/>
		<a href="/BBS/zhmm.asp">[找回密码]</a><br/>
		------------<br/><a href="/bbs/index.asp">返回社区首页</a><br/><a href="/index.asp">返回网站首页</a><br/>
		</p>
</card>
</wml>
<%
     response.end
		end if
		end if


set rs=Server.CreateObject("ADODB.Recordset")
rspl="select * from usereg order by id desc"
rs.open rspl,conn,1,2
rs.Movenext
rs.addnew
if mobile<>"" then rs("useklsj")=mobile
if pass<>"" then rs("useklmm")=pass
if name<>"" then rs("usename")=name
if xb<>"" then   rs("usesex")=xb
if mmwt<>"" then rs("mmwt")=mmwt
if wtda<>"" then rs("wtda")=wtda
if grip<>"" then rs("myip")=grip
rs.update
rs.close
set rs=nothing

	sqyl="select * from usereg where useklsj='" & mobile & "'"
	set rxs=conn.execute(sqyl)
		Session("ltname")=rxs("usename")
		Session("useid")=rxs("id")
dim sid,SessionID,ids
ids=rxs("id")
sid=Session.sessionid
useklsj=rxs("useklsj")
SessionID=md5(trim(useklsj)*sid,32)
    set rssc=Server.CreateObject("ADODB.Recordset")
    sssql="select * from usereg where wap='"&SessionID&"' order by id"
    rssc.open sssql,conn
	  if rssc.eof then
sqdl="update usereg set wap='" & SessionID & "' where id="& Session("useid")
	conn.execute(sqdl)
sql="select wap from usereg where id="& Session("useid")
set objgbrs=conn.execute(sql)
 if Not objgbrs.eof then
wap=objgbrs("wap")
end if
	  else
SessionID=md5(trim(useklsj)*sid,21)+useklsj
sqwl="update usereg set wap='" & SessionID & "' where id="& Session("useid")
	conn.execute(sqwl)
sqal="select wap from usereg where id="& Session("useid")
set objgbrss=conn.execute(sqla)
 if Not objgbrss.eof then
wap=objgbrss("wap")
end if
end if
		response.Cookies("SessionID")=wap
		Response.Cookies("SessionID").Expires=#January 01, 2010#
		Session("SessionID")=wap
set rsll=Server.CreateObject("ADODB.Recordset")
rsplll="select * from guestbook order by id desc"
rsll.open rsplll,conn,1,2
rsll.addnew
rsll("niayo")="欢迎您加入社区大家庭，希望在阳光明媚的社区里，您可以找到理想的港湾及理想的人儿。这里，将带给您快乐！[附：昵称在注册3天后就不可以修改了哟，如需修改昵称请尽快修改！还有其他问题的话可以到站务论坛发帖提问，会有很多热心的友友帮你解答哟！]"
rsll("ids")=ids
rsll("reids")="0"
rsll.update
rsll.close
set rsll=nothing
%>
<card id="index" title="成功注册" ontimer="/BBS/index.asp?SessionID=<%=wap%>"><timer value='100'/>
<p>
恭喜你成功注册<br/>
正式成为本站会员,请牢记你的个人资料<br/>
---------<br/>
手机号码:<b><u><%=mobile%></u></b><br/>
登陆密码:<b><u><%=pass%></u></b><br/>
-密码保护-<br/>
密码问题:<b><u><%=mmwt%></u></b><br/>
密码答案:<b><u><%=wtda%></u></b><br/>
登陆识别码<b><u><%=wap%></u></b><br/>
---<br/>
进入社区后保存书签.以后就可以自动登陆<br/>
---------<br/>
<a href="/bbs/Reg/gn.asp?SessionID=<%=wap%>">修改我的资料</a><br/>
<%
if Session("returnuppath")<>"" then
   Response.write "<a href='" & Session("returnuppath") & "&amp;SessionID=" & wap & "'>返回来源面页</a><br/>"
      else
   Response.write "<a href='/BBS/index.asp?SessionID=" & wap & "'>返回社区首页</a><br/>"
end if   
%>
		</p>
</card>
</wml>
<%
     response.end

	else
%>
		<card id="index" title="注册用户" ontimer="/BBS/UseLogin.asp?Action=reg"><timer value='30'/>
		<p>
		手机号/密码/昵称/密码问题/密码答案等不能为空<br/>
		<a href="/BBS/UseLogin.asp?Action=reg">[免费注册]</a><br/>
		<a href="/BBS/zhmm.asp">[找回密码]</a><br/>
		------------<br/><a href="/bbs/index.asp">返回社区首页</a><br/><a href="/index.asp">返回网站首页</a><br/>
		</p>
		</card>
</wml>
<%
     response.end
		end if
end sub%>
<%
		conn.close
		set conn=nothing
function sqlstr(data)
   sqlstr="'" & Replace(data,"'","'") & "'"
  End function
%>