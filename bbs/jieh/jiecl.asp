<% @LANGUAGE="VBSCRIPT" CODEPAGE="65001" %><% Response.ContentType="text/vnd.wap.wml; charset=utf-8" %><?xml version="1.0" encoding="utf-8"?><!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<!--#INCLUDE VIRTUAL="/bbs/reg/useregs.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/public/codeun.asp"-->
<wml>
<head>
<meta http-equiv="Cache-Control" content="max-age=0"/>
<meta http-equiv="Cache-Control" content="no-cache"/>
<meta http-equiv="Expires" content="Mon, 1 Jan 1990 00:00:00 GMT"/>
</head>
<%
SessionID=request.querystring("SessionID")
if SessionID="" then SessionID=Session("SessionID")
if Session("zh")="wap" then
       Session("returnuppath")=Request.ServerVariables("PATH_INFO") & "?ids="&ids&""
        response.redirect "/BBS/UseLogin.asp?SessionID="&SessionID&""
      else
        Session("ltlybz")=""
    End if
  dim idss,ids,biao,reids
  ids=Session("useid")
  reids=request("reids")
  biao=request("biao")
  biao=trim(biao)
  biao=untowide(biao)

  if reids="" or ids="" then
     response.write "<card id='card1' title='&#x767B;&#x8BB0;&#x6210;&#x529F;!'><p>&#x5475;&#x5475;!&#x60F3;&#x7ED3;&#x5A5A;&#x4E5F;&#x8981;&#x627E;&#x4E2A;&#x5BF9;&#x8C61;&#x554A;&#x3002;"
     response.write "<br/><a href='/bbs/jieh/index.asp?SessionID="& SessionID &"'>&#x8FD4;&#x56DE;&#x5A5A;&#x59FB;&#x767B;&#x8BB0;</a><br/><a href='/bbs/index.asp?SessionID="& SessionID &"'>&#x8FD4;&#x56DE;&#x793E;&#x533A;&#x9996;&#x9875;</a></p></card></wml>"
     response.end
  End if
if reids="" & Session("useid") & "" then
     response.write "<card id='card1' title='&#x767B;&#x8BB0;&#x7ED3;&#x5A5A;!' ontimer='/bbs/jieh/index.asp?SessionID="& SessionID &"'><timer value='3'/><p>&#x60A8;&#x4E0D;&#x80FD;&#x548C;&#x81EA;&#x5DF1;&#x7ED3;&#x5A5A;&#xFF01;"	    
     response.write "<br/><a href='/bbs/jieh/index.asp?SessionID="& SessionID &"'>&#x8FD4;&#x56DE;&#x5A5A;&#x59FB;&#x767B;&#x8BB0;</a><br/><a href='/bbs/index.asp?SessionID="& SessionID &"'>&#x8FD4;&#x56DE;&#x793E;&#x533A;&#x9996;&#x9875;</a></p></card></wml>"
     response.end
    End if
bz="f"
 Set rs=Server.CreateObject("ADODB.Recordset")
    sql="select fying,usesex from usereg where CStr(id)='" & reids & "'"
    rs.open sql,conn
usesex=rs("usesex")
if rs("fying")>0 then
     response.write "<card id='card1' title='&#x767B;&#x8BB0;&#x7ED3;&#x5A5A;!'><p>&#x5BF9;&#x65B9;&#x5DF2;&#x7ECF;&#x7ED3;&#x5A5A;&#xFF0C;&#x4E0D;&#x80FD;&#x518D;&#x5411;&#x5176;&#x6C42;&#x5A5A;!<br/>"
     response.write "<br/><a href='/bbs/jieh/index.asp?SessionID="& SessionID &"'>&#x8FD4;&#x56DE;&#x5A5A;&#x59FB;&#x767B;&#x8BB0;</a><br/><a href='/bbs/index.asp?SessionID="& SessionID &"'>&#x8FD4;&#x56DE;&#x793E;&#x533A;&#x9996;&#x9875;</a></p></card></wml>"
     response.end
    End if

rs.close
 set rs=nothing
   Set objgbrs=Server.CreateObject("ADODB.Recordset")
    sql="select * from usereg where CStr(id)='" & Session("useid") & "'"
    objgbrs.open sql,conn
if objgbrs("usejf")<1314 then
     response.write "<card id='card1' title='&#x767B;&#x8BB0;&#x7ED3;&#x5A5A;!'><p>&#x5475;&#x5475;!&#x6CA1;&#x94B1;&#x4E5F;&#x60F3;&#x7ED3;&#x5A5A;&#x3002;&#x6211;&#x6655;!"
     response.write "<br/><a href='/bbs/jieh/index.asp?SessionID="& SessionID &"'>&#x8FD4;&#x56DE;&#x5A5A;&#x59FB;&#x767B;&#x8BB0;</a><br/><a href='/bbs/index.asp?SessionID="& SessionID &"'>&#x8FD4;&#x56DE;&#x793E;&#x533A;&#x9996;&#x9875;</a></p></card></wml>"
     response.end
    End if
if objgbrs("usesex")=usesex then
     response.write "<card id='card1' title='&#x767B;&#x8BB0;&#x7ED3;&#x5A5A;!'><p>&#x672C;&#x7CFB;&#x7EDF;&#x76EE;&#x524D;&#x4E0D;&#x5F00;&#x653E;&#x540C;&#x6027;&#x7ED3;&#x5A5A;&#xFF01;!"
     response.write "<br/><a href='/bbs/jieh/index.asp?SessionID="& SessionID &"'>&#x8FD4;&#x56DE;&#x5A5A;&#x59FB;&#x767B;&#x8BB0;</a><br/><a href='/bbs/index.asp?SessionID="& SessionID &"'>&#x8FD4;&#x56DE;&#x793E;&#x533A;&#x9996;&#x9875;</a></p></card></wml>"
     response.end
    End if
if objgbrs("fanj")=0 then
     response.write "<card id='card1' title='&#x767B;&#x8BB0;&#x7ED3;&#x5A5A;!'><p>&#x4F60;&#x6CA1;&#x6709;&#x623F;&#x5B50;&#xFF0C;&#x600E;&#x4E48;&#x8BA9;&#x4F60;&#x7684;&#x7231;&#x505C;&#x7559;&#xFF1F;&#x8D76;&#x5FEB;&#x53BB;&#x4E70;&#x5957;&#x623F;&#x5B50;&#x5427;."
     response.write "<br/><a href='/bbs/jieh/index.asp?SessionID="& SessionID &"'>&#x8FD4;&#x56DE;&#x5A5A;&#x59FB;&#x767B;&#x8BB0;</a><br/><a href='/bbs/index.asp?SessionID="& SessionID &"'>&#x8FD4;&#x56DE;&#x793E;&#x533A;&#x9996;&#x9875;</a></p></card></wml>"
     response.end
    End if    
if objgbrs("fying")>0 then
     response.write "<card id='card1' title='&#x767B;&#x8BB0;&#x7ED3;&#x5A5A;!'><p>&#x5475;&#x5475;!&#x60A8;&#x786E;&#x5B9A;&#x8981;&#x91CD;&#x5A5A;&#x5417;?&#x91CD;&#x5A5A;&#x7F6A;&#x4E0D;&#x5C0F;&#x54E6;!"
     response.write "<br/><a href='/bbs/jieh/index.asp?SessionID="& SessionID &"'>&#x8FD4;&#x56DE;&#x5A5A;&#x59FB;&#x767B;&#x8BB0;</a><br/><a href='/bbs/index.asp?SessionID="& SessionID &"'>&#x8FD4;&#x56DE;&#x793E;&#x533A;&#x9996;&#x9875;</a></p></card></wml>"
     response.end
    End if

  sql="insert into jief(ids,idss,biao,bz)values("
  sql=sql & sqlstr(ids) & ","
  sql=sql & sqlstr(reids) & ","
  sql=sql & sqlstr(biao) & ","
  sql=sql & sqlstr(bz) & ")"
  Application.Lock
  conn.execute sql
  sql="update usereg set usejf=usejf-1314 where CStr(id)='" & ids & "'"
  conn.execute sql
  Application.Unlock
  idd="0"
  bzz="j"
  ltlyuan="向您求婚!如果不接受,可不必理会并可以删除此信息!"  
  sql="insert into guestbook(ids,reids,yxxeid,gn,niayo) values ("
  sql=sql & sqlstr(reids) & ","
  sql=sql & sqlstr(idd) & ","
  sql=sql & sqlstr(ids) & ","
  sql=sql & sqlstr(bzz) & ","
  sql=sql & sqlstr(ltlyuan) & ")"
  Application.Lock
  conn.execute(sql)
  conn.close
 set objgbrs=nothing
  set conn=nothing
  response.write "<card id='card1' title='&#x767B;&#x8BB0;&#x6210;&#x529F;!' ontimer='/bbs/jieh/index.asp?SessionID="& SessionID &"'><timer value='10'/><p>&#x767B;&#x8BB0;&#x6210;&#x529F;!&#x5B89;&#x5FC3;&#x7684;&#x7B49;&#x7740;&#x5FC3;&#x7231;&#x7684;&#x4EBA;&#x7684;&#x63A5;&#x53D7;&#x5427;!&#x6B63;&#x5728;&#x8FD4;&#x56DE;..."
  response.write "<br/><a href='/bbs/jieh/index.asp?SessionID="& SessionID &"'>&#x8FD4;&#x56DE;&#x5A5A;&#x59FB;&#x767B;&#x8BB0;</a><br/><a href='/bbs/index.asp?SessionID="& SessionID &"'>&#x8FD4;&#x56DE;&#x793E;&#x533A;&#x9996;&#x9875;</a></p></card></wml>"
%>