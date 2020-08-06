<% @LANGUAGE="VBSCRIPT" CODEPAGE="65001" %>
<%
'=================================================
' Copyright 2007-05 jinqiu. All Rights Reserved.
' Last Update: 2007-05-01   HTTP://wap.czhome.net
' E-Mail: 316801451@qq.com  QQ:316801451
'=================================================
%>
<%
'=================================================
' Copyright 2005-09 jinqiu. All Rights Reserved.
' Last Update: 2005-09-24   HTTP://CZGPRS.COM
' E-Mail: 0768cz@21cn.com   QQ:316801451
'=================================================
%>
<%Response.ContentType = "text/vnd.wap.wml; charset=utf-8"%>
<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<!--#INCLUDE FILE="conn.asp"-->
<wml> 
<head>
<meta http-equiv='Cache-Control' content='no-Cache'/>
<meta http-equiv='Cache-Control' content='max-age=0'/>
</head>
<card id='main' title='&#x624B;&#x5DE5;&#x767B;&#x9646;' >
<p>&#x7BA1;&#x7406;&#x8005;&#x767B;&#x9646;
<br/>-------------
<br/>&#x7528;&#x6237;:<input type='text' name='username' size='10'/>
<br/>&#x5BC6;&#x7801;:<input type='password' name='password' size='10'/>

<br/>&#x9A8C;&#x8BC1;&#x7801;:<img src='getcode.asp'/>
<br/><input type='text' name='mofei' size='10' format='*N' emptyok='false' maxlength='4'/>
<br/><anchor>[-&#x767B;&#x9646;-]

<go href='chkadmin.asp' method='post' accept-charset='utf-8'>
<postfield name='username' value='$(username)'/>
<postfield name='password' value='$(password)'/>
<postfield name='mofei' value='$(mofei)'/>
</go>
</anchor>
<br/>------------
<br/><a href='../index.asp'>&#x8FD4;&#x56DE;&#x9996;&#x9875;</a></p>
</card>
</wml> 
