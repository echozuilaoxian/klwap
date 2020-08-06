<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%><%response.buffer=true%><%Response.ContentType = "text/vnd.wap.wml; charset=utf-8"%><?xml version="1.0" encoding="utf-8"?><!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<!--#INCLUDE VIRTUAL="/bbs/reg/useregs.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/public/codeun.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/reg/ltonline.asp"-->
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
wapgywz="我的花园"
wapgydz=Request.ServerVariables("PATH_INFO")&"?"
lasttlls=525
lasttls



'--------------------
'宠物PK

'结束
'-------------------
%>
<card id="hotpk" title="购置农场" ontimer='/bbs/hua/index.asp?SessionID=<%=SessionID%>'><timer value='100'/><p>
<%

  set objgbrs=Server.CreateObject("ADODB.Recordset")
       ssql="select [id],[usejf] from usereg where CStr(id)='" & iduse & "'"
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
    Response.write "<br/><a href='/bbs/public/ckly.asp?SessionID="&SessionID&"'>" & lycount & "条新信息</a>"
Session("returnuppath")=Request.ServerVariables("PATH_INFO") & "?kd= &amp;"
End if
Response.write "<br/>"
if rs8("nong")="y" then
Response.write "你已经拥有一个农场.无需重复购买<br/>"
else
if objgbrs("usejf")<10000  then 
                  Response.write "对不起!购买不成功!您的金币不够扣手续费!购置农场需要10000金币手续费<br/>你当前的金币是:"&usejf&""
 else
 Response.write "哈哈!恭喜您！成功了购置农场,系统扣除掉10000金币手续费"		
sql="update usereg set usejf=usejf-10000  where CStr(id)='" & iduse & "'" 				
                conn.execute sql
sql="update hua set nong='y'  where CStr(ids)='" & iduse & "'" 				
                conn.execute sql
end if
end if
objgbrs.close
Set objgbrs= Nothing
rs8.close
Set rs8= Nothing
conn.close
set conn=nothing
%>
<!--#INCLUDE VIRTUAL="/bbs/hua/klwll.asp"-->
</p></card></wml>


