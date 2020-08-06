<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<%Response.ContentType = "text/vnd.wap.wml; charset=utf-8"%>
<!-- #include file="conn.asp" -->
<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<wml>
<head><meta http-equiv='Cache-Control' content='no-cache'/>
</head>
<card title='图片DIY'><p align='left'>
<%
'============================================================
' Copyright 2007-09 燃点真情. All Rights Reserved.
' Last Update: 2008-3-22  13:28
' E-Mail: xivn@163.com  QQ:531233814
'============================================================
set rsnum4=Server.CreateObject("ADODB.Recordset")
rssnum4="select * from [twapp]"
rsnum4.open rssnum4,conn,1,1
if rsnum4("wjop")=1 then%>
<%browsers=Lcase(Left(Request.ServerVariables("HTTP_USER_AGENT"),4))
if browsers="oper"  or  browsers="winw"  or  browsers="wapi" or browsers="mc21" or browsers="up.b" or browsers="upg1" or browsers="upsi" or browsers="qwap" or browsers="jigs" or browsers="java" or browsers="alca" or browsers="wapj" or browsers="cdr/" or browsers="nec-" or browsers="fetc" or browsers="r380" or browsers="winw" or browsers="mozi" or browsers="mozi" or browsers="m3ga" then response.redirect"Opera.asp"
end if
rsnum4.close   
set rsnum4=nothing
dim cid,id,zc,pa,class1
if request.querystring("zc")<>"1" then
ID=request.querystring("id")
cid=request.querystring("cid")
pa=request.querystring("pa")
class1=request.querystring("class")
Set rs = Server.CreateObject("ADODB.Recordset")
sql="Select url from wjfile where ID="&id
rs.open sql,conn,1,1
if rs.eof then
response.write"附件不存在或者已经删除<br/>"
ELSE
response.write("<img src='"&rs("url")&"' alt="".""/><br/><a href='"&rs("url")&"'>下载原图</a><br/>")
dim pic
pic=rs("url")

end if
end if
	response.write("<br/><a href=""soft_viwe.asp?id="&id&"&amp;class="&class1&"&amp;cid="&cid&"&amp;pa="&pa&"&amp;hk="&hk&""">返回上级</a>")
%></p></card></wml>