<% @LANGUAGE="VBSCRIPT" CODEPAGE="65001" %><% Response.ContentType="text/vnd.wap.wml; charset=utf-8" %><?xml version="1.0" encoding="utf-8"?><!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<!--#INCLUDE VIRTUAL="/bbs/conn.asp"-->
<wml>
<head>
<meta http-equiv="Cache-Control" content="max-age=0"/>
<meta http-equiv="Cache-Control" content="no-cache"/>
<meta http-equiv="Expires" content="Mon, 1 Jan 1990 00:00:00 GMT"/>
</head>
<card id="card1" title="人民银行-为人民"><p>
<%
SessionID=request.querystring("SessionID")
if SessionID="" then SessionID=Session("SessionID")
Server.ScriptTimeout=999
iduse=Session("useid")
dim out
out=trim(request("out"))
    Set objgbrs=Server.CreateObject("ADODB.Recordset")
    sql="select * from usereg where CStr(id)='" & iduse & "'"
    objgbrs.open sql,conn
 if out<>"" then
     out=Clng(out)
     if out<0 or out>objgbrs("bank") then
            msg="哈！您真是英勇无比，请问银行很好抢吗？小心飞虎队呀！哈哈~~（请注意您的存款还有多少）" 
         else
            sql="update usereg set bank=bank-" & out & ",usejf=usejf+" & out & ",banktime=now() Where CStr(id)='" & iduse & "'"
            Application.Lock
            conn.execute(sql)
            dim talk
talk="" & Session("ltname") & "在(url=/bbs/Reg/bank.asp)社区银行(/url)取款"& out &"金币"
sql="insert into sjzk(ids,dong,lasttlls,bu)values('"&iduse&"','"&talk&"','525','0')"
  Application.Lock
  conn.execute sql
  Application.Unlock
            msg="取款成功!请节约用钱！" 
     end if
   else
            msg="您想清楚取还是不取没有？递个空条干嘛！？后面还有好多人排队哦！哼哼！" 
 end if
    response.write msg
Set objgbrs= Nothing
conn.close
set conn=nothing
%>
<br/>-------------
<br/><a href='bank.asp?SessionID=<%=SessionID%>'>返回社区银行</a>
<br/><a href='/bbs/index.asp?SessionID=<%=SessionID%>'>返回社区首页</a>
</p></card></wml>
