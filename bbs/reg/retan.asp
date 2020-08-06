<% @LANGUAGE="VBSCRIPT" CODEPAGE="65001" %><% Response.ContentType="text/vnd.wap.wml; charset=utf-8" %><?xml version="1.0" encoding="utf-8"?><!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<!--#INCLUDE VIRTUAL="/bbs/conn.asp"-->
<wml>
<head>
<meta http-equiv="Cache-Control" content="max-age=0"/>
<meta http-equiv="Cache-Control" content="no-cache"/>
<meta http-equiv="Expires" content="Mon, 1 Jan 1990 00:00:00 GMT"/>
</head>
<card id="card1" title="人民银行"><p>
<%
SessionID=request.querystring("SessionID")
if SessionID="" then SessionID=Session("SessionID")
Server.ScriptTimeout=999
iduse=Session("useid")
dim retan
retan=trim(request("retan"))
    Set objgbrs=Server.CreateObject("ADODB.Recordset")
    sql="select * from usereg where CStr(id)='" & iduse & "'"
    objgbrs.open sql,conn
 if retan<>"" then
     retan=Clng(retan)
     if objgbrs("subbank")=0 then
            msg="你没有贷款。想做慈善家?"

      elseif retan<0 or retan>objgbrs("subbank") then
            msg="你没有贷那么多款啊。你当前欠银行"&objgbrs("subbank")&"金币，莫非你想做慈善家?"

         elseif retan>objgbrs("usejf") then
            msg="你的金币还不够还，去赚够了再来吧！别着急我们这里的利率很低。"

         else
            sql="update usereg set subbank=subbank-" & retan & ",usejf=usejf-" & retan & ",banktime=now() Where CStr(id)='" & iduse & "'"
            Application.Lock
            conn.execute(sql)
            dim talk
talk="" & Session("ltname") & "在(url=/bbs/Reg/bank.asp)社区银行(/url)还了"& retan &"金币贷款"
sql="insert into sjzk(ids,dong,lasttlls,bu)values('"&iduse&"','"&talk&"','525','0')"
  Application.Lock
  conn.execute sql
  Application.Unlock
            msg="舍得还贷啦?看来你发了,欢迎再次光顾!"
        end if

   else
            msg="知不知道我们忙呀，不还就别捣蛋！过阵子再来"
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



