<% @LANGUAGE="VBSCRIPT" CODEPAGE="65001" %><% Response.ContentType="text/vnd.wap.wml; charset=utf-8" %><?xml version="1.0" encoding="utf-8"?><!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<!--#INCLUDE VIRTUAL="/bbs/reg/useregs.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/public/codeun.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/public/t22t.cn.asp"-->
<wml>
<%
SessionID=request.querystring("SessionID")
if SessionID="" then SessionID=Session("SessionID")
if Session("zh")="wap" then
 ids=request("ids")
 ltlyuan=request("ltlyuan")
       Session("returnuppath")=Request.ServerVariables("PATH_INFO") & "?ids="&ids&"&amp;ltlyuan="&ltlyuan&""
        response.redirect "/BBS/UseLogin.asp?SessionID="&SessionID&""
    End if
Server.ScriptTimeout=999
dim ltlyuan,ids,reids
reids=Session("useid")
 pages=request("pages")
 ltlyuan=request("ltlyuan")
 ids=request("ids")
ltlyuan=trim(ltlyuan)
ltlyuan=untowide(ltlyuan)
 id=request("id")

       set objgbrss=Server.CreateObject("ADODB.Recordset")
       ssql="select * from usereg where CStr(id)='" & ids & "'"
       objgbrss.open ssql,conn
if objgbrss.eof then
Response.write "<card id='card1' title='系统提示'><p align='left'>对不起，操作无法完成，原因：城里找不到这个人啊<br/>-----------<br/><a href='srxx.asp?SessionID=" & SessionID & "'>返回我的信箱</a><br/><a href='/bbs/index.asp?SessionID=" & SessionID & "'>返回社区首页</a></p></card></wml>"
     response.end
    End if
objgbrss.close
set objgbrss=nothing


if ids=0 then
     response.write "<card id='card1' title='发送信息'><p align='left'>系统信息请勿回复！<br/>-----------<br/><a href='srxx.asp?SessionID=" & SessionID & "'>返回我的信箱</a><br/><a href='/bbs/index.asp?SessionID=" & SessionID & "'>返回社区首页</a></p></card></wml>"
     response.end
  End if
  if ltlyuan="" then
     response.write "<card id='card1' title='发送信息'><p align='left'>发信内容不能为空白！<br/>-----------<br/><a href='/bbs/public/fsly.asp?ids="& ids &"&amp;SessionID=" & SessionID & "'>返回继续操作</a><br/><a href='/bbs/index.asp?SessionID=" & SessionID & "'>返回社区首页</a></p></card></wml>"
     response.end
  End if
if Session("ltlybz")="dfg34fdf_dfg554ghy_3452" then
 response.write "<card id='card1' title='发送信息'><p align='left'>"
  Response.write "对不起!您的发信权已被锁，请与管理员联系!</p></card></wml>"
  response.end
  End if
iduse=Session("useid")
  set objgbrr=Server.CreateObject("ADODB.Recordset")
  ssql="select * from guestbook where CStr(ids)='" & iduse & "' and biaozi='f'"
  objgbrr.open ssql,conn,1,1
if objgbrr.RecordCount>500 then
   Response.write "<card id='card1' title='发送信息失败'><p align='left'>您保留的旧信息超过了500条,暂时不能发信或回复,请删除一些没用的留言！<br/>-----------<br/><a href='srxx.asp?SessionID=" & SessionID & "'>返回我的信箱</a><br/><a href='/bbs/index.asp?SessionID=" & SessionID & "'>返回社区首页</a></p></card></wml>"
objgbrr.close
set objgbrr=nothing
   response.end
End if
if conn.execute("select * from myfriend where ids='"& ids &"' and friid='*" & reids & "'").eof then
  sql="insert into guestbook(ids,reids,niayo) values ("
  sql=sql & sqlstr(ids) & ","
  sql=sql & sqlstr(reids) & ","
  sql=sql & sqlstr(ltlyuan) & ")"
  Application.Lock
  conn.execute(sql)
  Application.Unlock

end if
  response.write "<card id='card1' title='成功发送信息'><p>成功发送信息<br/>------------<br/><img src='/bbs/logo/fs.gif' alt='.'/>信息发送成功!!<br/>"
if lycount>0 then
dim rs
set rs=Server.CreateObject("ADODB.Recordset")
  ssql1="select id from guestbook Where CStr(ids)='" & iduse &"' and biaozi='t' order by times desc"
  rs.open ssql1,conn
    Response.write "<a href='cklycl.asp?id=" & rs("id") & "&amp;pages=" & pages & "&amp;SessionID=" & SessionID & "'>您有" & lycount & "条未读信息</a><br/>"
rs.close
Set rs= Nothing
End if
response.write"------------<br/>"
if Session("returnuppath")<>"" then
   Response.write "<a href='" & Session("returnuppath") & "&amp;SessionID=" & SessionID & "'>返回来源页面</a><br/>"
End if
response.write"<a href='/bbs/public/srxx.asp?SessionID=" & SessionID & "'>返回我的信箱</a><br/>"

Response.write "<a href='/bbs/index.asp?SessionID=" &SessionID& "'>返回社区首页</a><br/>"

Response.write "</p></card></wml>"

	conn.close
	set conn=nothing
function sqlstr(data)
   sqlstr="'" & Replace(data,"'","'") & "'"
  End function

%>