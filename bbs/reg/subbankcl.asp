<% @LANGUAGE="VBSCRIPT" CODEPAGE="65001" %><% Response.ContentType="text/vnd.wap.wml; charset=utf-8" %><?xml version="1.0" encoding="utf-8"?><!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<!--#INCLUDE VIRTUAL="/bbs/conn.asp"-->
<wml>
<head>
<meta http-equiv="Cache-Control" content="max-age=0"/>
<meta http-equiv="Cache-Control" content="no-cache"/>
<meta http-equiv="Expires" content="Mon, 1 Jan 1990 00:00:00 GMT"/>
</head>
<card id="card1" title="社区银行"><p>
<%
SessionID=request.querystring("SessionID")
if SessionID="" then SessionID=Session("SessionID")
Server.ScriptTimeout=999
iduse=Session("useid")
dim tan
tan=trim(request("tan"))
    Set objgbrs=Server.CreateObject("ADODB.Recordset")
    sql="select * from usereg where CStr(id)='" & iduse & "'"
    objgbrs.open sql,conn
 if tan<>"" then
     tan=Clng(tan)
     if tan<0 or tan>2000-objgbrs("subbank")then
            msg="是不是人家催债催得太紧？您贷款的数目超过了限制啦！最多只能贷2000元"
         else
            sql="update usereg set subbank=subbank+" & tan & ",usejf=usejf+" & tan & ",banktime=now() Where CStr(id)='" & iduse & "'"
            Application.Lock
            conn.execute(sql)
            dim talk
talk="" & Session("ltname") & "在(url=/bbs/Reg/bank.asp)社区银行(/url)贷款"& tan &"金币"
sql="insert into sjzk(ids,dong,lasttlls,bu)values('"&iduse&"','"&talk&"','525','0')"
  Application.Lock
  conn.execute sql
  Application.Unlock
            msg="贷款成功!不要拿去赌哦！"
     end if
   else
            msg="您知不知道我们忙呀，不贷就到外面玩儿去！"
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





