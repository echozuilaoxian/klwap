<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%><%response.buffer=true%><%Response.ContentType = "text/vnd.wap.wml; charset=utf-8"%><?xml version="1.0" encoding="utf-8"?><!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<!--#INCLUDE VIRTUAL="/bbs/reg/useregs.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/public/codeun.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/reg/ltonline.asp"-->
<wml>
<head>
<meta http-equiv="Cache-Control" content="max-age=0"/>
<meta http-equiv="Cache-Control" content="no-cache"/>
<meta http-equiv="Expires" content="Mon, 1 Jan 1990 00:00:00 GMT"/></head>
<card id="hotpk" title="送花"><p>
<%
kd=request("kd")
kdkd=request("kdkd")
soid=request("soid")
id=request("soid")
memo=request("memo")
memo=untowide(memo)
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

if Session("ltlybz")="dfg34fdf_dfg554ghy_3452" then
  Response.write "对不起,您的发信权已被锁，请与管理员联系！</p></card></wml>" 
    response.end
End if
%>

<%
  set objgbrs=Server.CreateObject("ADODB.Recordset")
       ssql="select id from usereg where CStr(id)='" &iduse & "'"
       objgbrs.open ssql,conn
if objgbrs.eof then
Response.write "错误,该号不存在"
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
Session("returnuppath")=Request.ServerVariables("PATH_INFO") & "?kd=&amp;"
End if
Response.write "<img src='/bbs/hua/img/1_0.gif' alt='花园'/><br/>"
objgbrs.close
Set objgbrs= Nothing
rs8.close
Set rs8= Nothing
conn.close
set conn=nothing
%>输入对方ID<br/><input name="soid" type="text" maxlength="15" value=""/><br/>
输入留言内容<br/><input name="memo" type="text" maxlength="100" value=""/>
<br/>选择鲜花<br/><select name='kd'>
<option value='1'>红玖瑰</option>
<option value='2'>红牡丹</option>
<option value='3'>郁金香</option>
<option value='4'>康乃馨</option>
<option value='5'>满天星</option>
<option value='6'>蓝玫瑰</option>
<option value='7'>天堂鸟</option>
<option value='8'>紫牡丹</option>
<option value='9'>向日葵</option>
<option value='10'>蔷薇花</option>
<option value='11'>牵牛花</option>
<option value='12'>蒲公英</option>
</select><br/>
<anchor title="submit">我要普通送花<go href="sohua_zcl.asp?SessionID=<%=SessionID%>" method="post">
<postfield name="soid" value="$(soid)"/>
<postfield name="memo" value="$(memo)"/>
<postfield name="kd" value="$(kd)"/>
<postfield name="kdkd" value="0"/>
</go></anchor><br/>
<anchor title="submit">我要广播送花<go href="sohua_cl.asp?SessionID=<%=SessionID%>" method="post">
<postfield name="soid" value="$(soid)"/>
<postfield name="memo" value="$(memo)"/>
<postfield name="kd" value="$(kd)"/>
<postfield name="kdkd" value="1"/>
</go></anchor><br/>
<%if Cstr(Session("vip1"))<>"" or Session("vip")<>"" or Session("Counter")="pass_numbers_55556666" then%>
<anchor title="submit">我要赠送成品花<go href="zsxhcl.asp?SessionID=<%=SessionID%>" method="post">
<postfield name="soid" value="$(soid)"/>
<postfield name="memo" value="$(memo)"/>
<postfield name="kd" value="$(kd)"/>
<postfield name="kdkd" value="1"/>
</go></anchor><br/>
<%End if%>
<b>1.普通送花免费，以内线的形式通知对方，<br/>2.广播送花收取1000金币，将会以广播的形式在社区发布并内线通知对方，<br/>3.赠送成品花会自动送到对方的成品花中，对方可以用来送人，<br/>只有VIP会员才可以成品送花，成品送花每朵收取100金币的手续费</b>
<!--#INCLUDE VIRTUAL="/bbs/hua/klwll.asp"-->
</p></card></wml>


