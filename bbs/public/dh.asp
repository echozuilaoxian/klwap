<% Response.ContentType="text/vnd.wap.wml" %><?xml version="1.0" encoding="GB2312"?><!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<!--#INCLUDE VIRTUAL="/bbs/reg/useregs.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/public/codeun.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/reg/ltonline.asp"-->
<wml>
<head>
<meta http-equiv="Cache-Control" content="max-age=0"/>
<meta http-equiv="Cache-Control" content="no-cache"/>
<meta http-equiv="Expires" content="Mon, 1 Jan 1990 00:00:00 GMT"/>
</head>
<card id="main" title="���ߵ绰" newcontext="true">
<p>
<% wap=request.querystring("wap") %>
�绰����:<input name="CALL" value="1860" title="��ϵ�绰����" format="*N" maxlength="20" emptyok="true"/>
<a href="wtai://wp/mc;$(CALL:N)">����绰</a><br/>

ͨѶ���Ѻ����ճ�ͨ����һ����ֻ���ṩ���߰κ�ͨ�����ܣ������ʹ�á�<br/>
<a href='/bbs/index.asp?wap=<%=wap%>'>����������ҳ</a></p></card></wml>"

