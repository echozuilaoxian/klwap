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
kd=request("kd")
kdkd=request("kdkd")
soid=request("soid")
id=request("soid")
memo=request("memo")
memo=untowide(memo)
if kd="" or kd>12 then
%>
<card id="hotpk" title="送花不成功" ontimer='/bbs/hua/index.asp?SessionID=<%=SessionID%>'><timer value='100'/><p>请不要提交空数据...正在返回花园<br/><a href='/bbs/hua/index.asp?SessionID=<%=SessionID%>'>返回我的花园空间</a>
<%
Response.Write "</p></card></wml>"
response.end
end if
if CStr(soid)=CStr(Session("useid")) then
%>
<card id="hotpk" title="送花不成功" ontimer='/bbs/hua/index.asp?SessionID=<%=SessionID%>'><timer value='100'/><p>不能给自己送花...正在返回花园<br/><a href='/bbs/hua/index.asp?SessionID=<%=SessionID%>'>返回我的花园空间</a>
<%
Response.Write "</p></card></wml>"
response.end
end if
if memo="" or len(memo)>20 then
%>
<card id="hotpk" title="送花不成功" ontimer='/bbs/hua/index.asp?SessionID=<%=SessionID%>'><timer value='20'/><p>留言不能为空或者大于20个字符...正在返回花园<br/><a href='/bbs/hua/index.asp?SessionID=<%=SessionID%>'>返回我的花园空间</a>
<%
Response.Write "</p></card></wml>"
response.end
end if
%>



<card id="hotpk" title="送花"><p>
<%
set objgbrs=Server.CreateObject("ADODB.Recordset")
       ssql="select id from usereg where CStr(id)='" &soid & "'"
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
Response.write "<a href='/bbs/hua/index.asp?SessionID="&SessionID&"'>返回我的花园空间</a><br/><img src='/bbs/hua/img/1_0.gif' alt='花园'/><br/>"
if kd=1 then huaa="hongs" 
if kd=2 then huaa="hmus"
if kd=3 then huaa="huangs"
if kd=4 then huaa="kangs"
if kd=5 then huaa="mans" 
if kd=6 then huaa="zis"
if kd=7 then huaa="tians"
if kd=8 then huaa="zmus"
if kd=9 then huaa="yis" 
if kd=10 then huaa="qangs"
if kd=11 then huaa="qians"
if kd=12 then huaa="pus"
if kd=1 then huaas="hongss" 
if kd=2 then huaas="hmuss"
if kd=3 then huaas="huangss"
if kd=4 then huaas="kangss"
if kd=5 then huaas="manss" 
if kd=6 then huaas="ziss"
if kd=7 then huaas="tianss"
if kd=8 then huaas="zmuss"
if kd=9 then huaas="yiss" 
if kd=10 then huaas="qangss"
if kd=11 then huaas="qianss"
if kd=12 then huaas="puss"
if kd=1 then voteID="1" 
if kd=2 then voteID="2"
if kd=3 then voteID="3"
if kd=4 then voteID="4"
if kd=5 then voteID="5" 
if kd=6 then voteID="6"
if kd=7 then voteID="7"
if kd=8 then voteID="8"
if kd=9 then voteID="9" 
if kd=10 then voteID="10"
if kd=11 then voteID="11"
if kd=12 then voteID="12"
if kd=1 then abbb="80"
if kd=2 then abbb="60"
if kd=3 then abbb="40"
if kd=4 then abbb="20"

if CStr(rs8(""&huaa&""))<1 then
%>
你没有这种鲜花...<br/><a href='/bbs/hua/index.asp?SessionID=<%=SessionID%>'>返回我的花园空间</a>
<%
Response.Write "</p></card></wml>"
response.end
end if
sql="update hua set "&huaa&"="&huaa&"-1  where CStr(ids)='" &iduse& "'" 				
                conn.execute sql
sql="update hua set "&huaas&"="&huaas&"+1  where CStr(ids)='" &soid& "'" 				
                conn.execute sql

     ltlyuan="(url=/bbs/reg/useinfo.asp?id=" & iduse & ")" & Session("ltname") & "ID:" & iduse & "(/url)向你送了一朵(img)/bbs/xhjy/hua/" &voteID& ".gif(/img)/说:"&memo&"<br/>这是系统信息,请勿回复以及转发!"
 gftz
sql="update myfriend set haoyo=haoyo+"&abbb&"  where Cstr(ids)='" & iduse& "' and Cstr(friid)='"&soid&"'"
conn.execute sql
Application.Unlock

response.write "<br/>送花成功了"
response.write "<br/><a href='/bbs/hua/sohua.asp?SessionID="&SessionID&"'>返回继续送花</a>"
sql="update hua set huaf=huaf+1  where CStr(ids)='" &soid & "'"
conn.execute sql
Application.Unlock
objgbrs.close
Set objgbrs= Nothing
rs8.close
Set rs8= Nothing
conn.close
set conn=nothing
%>
<!--#INCLUDE VIRTUAL="/bbs/hua/klwll.asp"-->
</p></card></wml>


