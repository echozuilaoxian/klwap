<% @LANGUAGE="VBSCRIPT" CODEPAGE="65001" %><% Response.ContentType="text/vnd.wap.wml; charset=utf-8" %><?xml version="1.0" encoding="utf-8"?><!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<!--#INCLUDE VIRTUAL="/bbs/reg/useregs.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/public/codeun.asp"-->
<wml>
<head>
<meta http-equiv="Cache-Control" content="max-age=0"/>
<meta http-equiv="Cache-Control" content="no-cache"/>
<meta http-equiv="Expires" content="Mon, 1 Jan 1990 00:00:00 GMT"/>
</head>
<% SessionID=request.querystring("SessionID")
  Server.ScriptTimeout=999
iduse=Session("useid")
Session("returnuppath")=""
gfdsa=Session("ltname")
dim memo
id=request("id")
ids=request("ids")
p=request("p")
 check=request("check")
if p="" or p<1 then p=1
   memo=request.form("memo")
   memo=untowide(memo)
    if memo="" then
    response.write "<card id='card1' title='证据补充'><p>"
    response.write "证据不能为空白！！<br/><a href='wzjs.asp?ids=" & ids & "&amp;id=" & id & "&amp;SessionID=" & SessionID & "'>返回重写</a>"
    response.write "<br/><a href='index.asp?SessionID=" & SessionID & "'>法院</a>-<a href='/bbs/index.asp?SessionID=" & SessionID & "'>返回社区首页</a></p></card></wml>"
    response.end
  End if
Set objgbrs=Server.CreateObject("ADODB.Recordset")
    sql="select usejf from usereg where CStr(id)='" & iduse & "'"
    objgbrs.open sql,conn
if objgbrs("usejf")<500 then
     response.write "<card id='card1' title='错误!'><p>你的金币不足!"
     response.write "<br/><a href='index.asp'>法院</a>-<a href='/bbs/index.asp'>返回社区首页</a></p></card></wml>"
     response.end
objgbrrs.close
set objgbrrs=nothing
    End if
   if Session("ltftzl")=memo then
     response.write "<card id='card1' title='证据补充'><p>"
     response.write "你已补充成功，请不要重复。<br/><a href='view.asp?ids=" & ids & "&amp;id=" & id & "&amp;SessionID=" & SessionID & "'>回上一级</a>"
     response.write "<br/><a href='index.asp?wap=" & wap & "'>法院</a>-<a href='/bbs/index.asp?SessionID=" & SessionID & "'>返回社区首页</a></p></card></wml>"
     response.end
    End if
        Session("ltftzl")=memo
		Session.Timeout=10
  iduse=Session("useid")
  sql="update urls set zj=zj+'" & memo & "' Where CStr(id)='" & id & "'"
  Application.Lock
  conn.Execute(sql)
  Application.Unlock
 sql="update usereg set usejf=usejf-300 where CStr(id)='" & iduse & "'"
  conn.execute sql
  Application.Unlock
  conn.close
  set conn=nothing
  response.write "<card id='card1' title='证据补充' ontimer='hf.asp?check=" & check & "&amp;ids=" & ids & "&amp;id=" & id & "&amp;p=" & p & "&amp;SessionID=" & SessionID & "'>"
  response.write "<timer value='5'/><p align='left'>证据补充成功,正在进入申请,请不要返回...<br/>"
  response.write "<a href='hf.asp?check=" & check & "&amp;ids=" & ids & "&amp;id=" & id & "&amp;p=" & p & "&amp;SessionID=" & SessionID & "'>点击进入</a>"
  response.write "<br/><a href='index.asp?SessionID=" & SessionID & "'>法院</a>-<a href='/bbs/index.asp?SessionID=" & SessionID & "'>返回社区首页</a></p></card></wml>"
%>



