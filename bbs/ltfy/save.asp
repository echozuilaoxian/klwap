<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<%response.buffer=true%>
<%Response.ContentType = "text/vnd.wap.wml; charset=utf-8"%>
<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/ wml_1.1.xml">
<!--#INCLUDE VIRTUAL="/bbs/reg/useregs.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/public/codeun.asp"-->
<wml>
<head>
<meta http-equiv="Cache-Control" content="no-Cache"/>
<meta http-equiv="Cache-Control" content="max-age=0"/>
</head>
<%
iduse=Session("useid")
title=request("site")
zj=untowide(request("zj"))
pczb=untowide(request("pczb"))
gfdsa=Session("ltname")
id=untowide(request("id"))
       set objgbrss=Server.CreateObject("ADODB.Recordset")
       ssql="select * from usereg where CStr(id)='" & id & "'"
       objgbrss.open ssql,conn
if objgbrss.eof then
Response.write "<card id='card1' title='系统提示'><p>对不起，操作无法完成，原因：城里找不到这个人啊<br/>"
Response.write "------------<br/>"
Response.write "<a href='/bbs/ltfy/index.asp?SessionID=" & SessionID & "'>城市法院</a>"
Response.write "<br/><a href='/BBS/index.asp?SessionID=" & SessionID & "'>社区首页</a><br/></p></card></wml>"
     response.end
objgbrss.close
set objgbrss=nothing
    End if
 Set objgbrs=Server.CreateObject("ADODB.Recordset")
    sql="select usejf from usereg where CStr(id)='" & iduse & "'"
    objgbrs.open sql,conn
if objgbrs("usejf")<500 then
     response.write "<card id='card1' title='系统提示'><p>你的金币不够缴诉讼费!需要身上带500金币以上<br/>"
Response.write "------------<br/>"
Response.write "<a href='/bbs/ltfy/index.asp?SessionID=" & SessionID & "'>城市法院</a>"
Response.write "<br/><a href='/BBS/index.asp?SessionID=" & SessionID & "'>社区首页</a><br/></p></card></wml>"
     response.end
objgbrs.close
set objgbrs=nothing
    End if
if title="" or id="" or zj="" then response.redirect "/bbs/ltfy/add.asp?SessionID=" & SessionID & ""

set rs=Server.CreateObject("ADODB.Recordset")
rspl="select * from [urls] order by id desc"
rs.open rspl,conn,1,2
rs.addnew
if title<>"" then rs("title")=title
if id<>"" then rs("url")=id
if iduse<>"" then rs("idid")=iduse
if zj<>"" then rs("zj")=zj
if pczb<>"" then rs("pczb")=pczb
rs.update
rs.close
set rs=nothing

 sql="update usereg set usejf=usejf-500 where CStr(id)='" & iduse & "'"
  conn.execute sql

  ltlyuan="起诉通知书：(url=/bbs/reg/useinfo.asp?id="& iduse &")"& gfdsa &"ID:"& iduse &"(/url)在[url=/bbs/ltfy/index.asp?SessionID=]社区法院[/url]起诉你，详情请到法院查看。"  
  sql="insert into guestbook(ids,reids,niayo) values ("
  sql=sql & sqlstr(id) & ","
  sql=sql & sqlstr(0) & ","
  sql=sql & sqlstr(ltlyuan) & ")"
  Application.Lock
  conn.execute sql
  Application.Unlock
function sqlstr(data)
   sqlstr="'" & Replace(data,"'","'") & "'"
  End function

%>

<card title="操作成功">
<p>
成功提交你的控件并发信息通知对方，法院会在最短时间内对该案件做出判决....
<%
Response.write "<br/>------------<br/>"
Response.write "<a href='/bbs/ltfy/index.asp?SessionID=" & SessionID & "'>城市法院</a>"
Response.write "<br/><a href='/BBS/index.asp?SessionID=" & SessionID & "'>社区首页</a><br/>"
%>
</p>
</card>
</wml>
<%
conn.close
set conn=nothing
%>