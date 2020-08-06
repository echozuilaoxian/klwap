<% Response.ContentType="text/vnd.wap.wml; charset=utf-8" %><?xml version="1.0" encoding="utf-8"?><!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<!--#INCLUDE VIRTUAL="/bbs/reg/useregs.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/public/codeun.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/reg/ltonline.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/reg/redtjname.asp"-->
<wml>
<head>
<meta http-equiv="Cache-Control" content="max-age=0"/>
<meta http-equiv="Cache-Control" content="no-cache"/>
<meta http-equiv="Expires" content="Mon, 1 Jan 1990 00:00:00 GMT"/>
</head>
<% 
dim idss,ids,biao
ids=request("ids")
SessionID=request.querystring("SessionID")
if SessionID="" then SessionID=Session("SessionID")
if Session("zh")="wap" then
       Session("returnuppath")=Request.ServerVariables("PATH_INFO") & "?ids=ids"
        response.redirect "/BBS/UseLogin.asp?SessionID="&SessionID&""
     response.end
    End if
%>
<%
  iduse=Session("useid")
  biao=request("biao")
  biao=trim(biao)
  btzz=Session("ltname")
  biao=untowide(biao)
   Set objgbrs=Server.CreateObject("ADODB.Recordset")
    sql="select * from usereg where CStr(id)='" & Session("useid") & "'"
    objgbrs.open sql,conn
if objgbrs("fying")=0 then
     response.write "<card id='card1' title='&#x79BB;&#x5A5A;&#x7533;&#x8BF7;!'><p>&#x5475;&#x5475;!&#x60A8;&#x8FD8;&#x6CA1;&#x6709;&#x7ED3;&#x5A5A;&#x554A;?&#x6655;&#x6655;&#x7684;!"
     response.write "<br/><a href='/bbs/jieh/index.asp?SessionID=" & SessionID & "'>&#x5A5A;&#x59FB;&#x767B;&#x8BB0;</a><br/><a href='/bbs/index.asp?SessionID=" & SessionID & "'>&#x8FD4;&#x56DE;&#x793E;&#x533A;&#x9996;&#x9875;</a></p></card></wml>"
     response.end
    End if    

if objgbrs("myjy")>50 then
     response.write "<card id='card1' title='&#x79BB;&#x5A5A;&#x7533;&#x8BF7;!'><p>&#x4F60;&#x4EEC;&#x5DF2;&#x7ECF;&#x6709;&#x5B69;&#x5B50;&#x4E86;,&#x4E0D;&#x80FD;&#x968F;&#x4FBF;&#x79BB;&#x5A5A;,&#x5982;&#x679C;&#x771F;&#x8981;&#x79BB;&#x5A5A;,&#x8BF7;&#x5230;&#x8B66;&#x5C40;&#x529E;&#x7406;&#x5B69;&#x5B50;&#x6258;&#x7BA1;&#x624B;&#x7EED;."
     response.write "<br/><a href='/bbs/jieh/index.asp?SessionID=" & SessionID & "'>&#x5A5A;&#x59FB;&#x767B;&#x8BB0;</a><br/><a href='/bbs/index.asp?SessionID=" & SessionID & "'>&#x8FD4;&#x56DE;&#x793E;&#x533A;&#x9996;&#x9875;</a></p></card></wml>"
     response.end
    End if

if objgbrs("usejf")<10000 then
     response.write "<card id='card1' title='&#x79BB;&#x5A5A;&#x7533;&#x8BF7;!'><p>&#x5475;&#x5475;!&#x6CA1;&#x94B1;&#x4E5F;&#x60F3;&#x79BB;&#x5A5A;&#x3002;&#x6211;&#x6655;!"
     response.write "<br/><a href='/bbs/jieh/index.asp?SessionID=" & SessionID & "'>&#x5A5A;&#x59FB;&#x767B;&#x8BB0;</a><br/><a href='/bbs/index.asp?SessionID=" &SessionID & "'>&#x8FD4;&#x56DE;&#x793E;&#x533A;&#x9996;&#x9875;</a></p></card></wml>"
     response.end
    End if

  sql="update usereg set usejf=usejf-10000,ml=ml-100,myfq='0' where CStr(id)='" & iduse & "'"
  Application.Lock
  conn.execute sql
%>
<%
Server.ScriptTimeout=999
bz="t"
bb="0"
ids=request("ids")
iduse=Session("useid")
  sql="update usereg set fying='" & bb & "' where CStr(id)='" & ids & "'"
  Application.Lock
  conn.Execute(sql)
   sql="update usereg set usejf=usejf+10000,myfq='0' where CStr(id)='" & ids & "'"
  Application.Lock
  conn.execute sql  
 sql="update usereg set fying='" & bb & "' where CStr(id)='" & iduse & "'"
  Application.Lock
  conn.Execute(sql)
  bzz="lh"
  sql="insert into guestbook(ids,reids,yxxeid,gn,niayo) values ("
  sql=sql & sqlstr(ids) & ","
  sql=sql & sqlstr(bb) & ","
  sql=sql & sqlstr(iduse) & ","
  sql=sql & sqlstr(bzz) & ","
  sql=sql & sqlstr(biao) & ")"
  Application.Lock
  conn.execute(sql)
response.write "<card id='card1' title='&#x79BB;&#x5A5A;&#x7533;&#x8BF7;' ontimer='index.asp?SessionID=" & SessionID & "'><timer value='20'/><p align='left'>"
response.write "<br/>&#x79BB;&#x5A5A;&#x6210;&#x529F;!&#x6263;&#x9664;10000&#x94BB;&#x5E01;&#xFF0C;&#x9B45;&#x529B;&#x51CF;&#x5C11;100&#x70B9;&#x3002;"
Response.Write "<br/><a href='/bbs/jieh/index.asp?SessionID=" & SessionID & "'>&#x56DE;&#x5A5A;&#x59FB;&#x6240;</a>"
response.write "<br/><a href='/bbs/index.asp?SessionID=" & SessionID & "'>&#x8FD4;&#x56DE;&#x793E;&#x533A;&#x9996;&#x9875;</a></p></card></wml>"
conn.close
set objgbrs=nothing
set conn=nothing
%>

