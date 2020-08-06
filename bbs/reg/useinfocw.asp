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
<card id="card1" title="宠物资料"><p>
<%
SessionID=request.querystring("SessionID")
if SessionID="" then SessionID=Session("SessionID")
Server.ScriptTimeout=999
iduse=Session("useid")
lasttlls="324"
lasttls
       set objgbrs=Server.CreateObject("ADODB.Recordset")
       ssql="select * from usereg where CStr(id)='" & iduse & "'"
       objgbrs.open ssql,conn

if lycount>0 then
    Response.write "<a href='/bbs/public/ckly.asp?SessionID=" & SessionID & "'>您有" & lycount & "条新信息</a><br/>"
Session("returnuppath")=Request.ServerVariables("PATH_INFO") & "?id=" & objgbrs("id") & ""
End if
Response.write "<img src='cwlogo.gif' alt='LOGO'/><br/>有空该喂喂它拉...<br/>宠物<a href='/bbs/chan/indexcw.asp?SessionID=" & SessionID & "'>生命</a>: "& objgbrs("cwsm")*1
Response.write "<br/>宠物<a href='/bbs/chan/cwxy.asp?SessionID=" & SessionID & "'>热情</a>: "& objgbrs("cwrq")*1
Response.write "<br/>宠物："
if objgbrs("cw")=1 then
end if

if objgbrs("cwsm")+objgbrs("cwrq")>499999 then 
    Response.write "猫神仙<a href='/bbs/reg/cwsm.asp?SessionID=" & SessionID & "'><img src='/bbs/reg/mao/12.gif' alt='.'/></a>"

else if objgbrs("cwsm")+objgbrs("cwrq")>299999 then 
    Response.write "大猫皇<a href='/bbs/reg/cwsm.asp?SessionID=" & SessionID & "'><img src='/bbs/reg/mao/11.gif' alt='.'/></a>"

else if objgbrs("cwsm")+objgbrs("cwrq")>49999 then 
    Response.write "黄金猫<a href='/bbs/reg/cwsm.asp?SessionID=" & SessionID & "'><img src='/bbs/reg/mao/10.gif' alt='.'/></a>"

else if objgbrs("cwsm")+objgbrs("cwrq")>19999 then 
    Response.write "猫法师<a href='/bbs/reg/cwsm.asp?SessionID=" & SessionID & "'><img src='/bbs/reg/mao/9.gif' alt='.'/></a>"

else if objgbrs("cwsm")+objgbrs("cwrq")>9999 then 
    Response.write "猫将军<a href='/bbs/reg/cwsm.asp?SessionID=" & SessionID & "'><img src='/bbs/reg/mao/8.gif' alt='.'/></a>"

else if objgbrs("cwsm")+objgbrs("cwrq")>4999 then 
    Response.write "猫队长<a href='/bbs/reg/cwsm.asp?SessionID=" & SessionID & "'><img src='/bbs/reg/mao/7.gif' alt='.'/></a>"

else if objgbrs("cwsm")+objgbrs("cwrq")>3499 then 
    Response.write "猫中队<a href='/bbs/reg/cwsm.asp?SessionID=" & SessionID & "'><img src='/bbs/reg/mao/6.gif' alt='.'/></a>"

else if objgbrs("cwsm")+objgbrs("cwrq")>1999 then 
    Response.write "猫副队<a href='/bbs/reg/cwsm.asp?SessionID=" & SessionID & "'><img src='/bbs/reg/mao/5.gif' alt='.'/></a>"

else if objgbrs("cwsm")+objgbrs("cwrq")>1199 then 
    Response.write "高级猫<a href='/bbs/reg/cwsm.asp?SessionID=" & SessionID & "'><img src='/bbs/reg/mao/4.gif' alt='.'/></a>"

else if objgbrs("cwsm")+objgbrs("cwrq")>799 then 
    Response.write "中级猫<a href='/bbs/reg/cwsm.asp?SessionID=" & SessionID & "'><img src='/bbs/reg/mao/3.gif' alt='.'/></a>"

else if objgbrs("cwsm")+objgbrs("cwrq")>299 then 
    Response.write "猫咪咪<a href='/bbs/reg/cwsm.asp?SessionID=" & SessionID & "'><img src='/bbs/reg/mao/2.gif' alt='.'/></a>"

else if objgbrs("cwsm")+objgbrs("cwrq")>49 then 
    Response.write "小小猫<a href='/bbs/reg/cwsm.asp?SessionID=" & SessionID & "'><img src='/bbs/reg/mao/1.gif' alt='.'/></a>"

else if objgbrs("cwsm")+objgbrs("cwrq")<49 then 
    Response.write "不明生物<a href='/bbs/reg/cwsm.asp?SessionID=" & SessionID & "'><img src='/bbs/reg/mao/0.gif' alt='.'/></a>"


End if
End if
End if
End if
End if
End if
End if
End if
End if
End if
End if
End if
End if


Response.write "<br/><a href='/bbs/public/gygl.asp?SessionID=" & SessionID & "'>返回我的地盘</a><br/><a href='/bbs/index.asp?SessionID=" & SessionID & "'>返回社区首页</a></p></card></wml>"
objgbrs.close
Set objgbrs= Nothing
conn.close
set conn=nothing

%>



