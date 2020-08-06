<%response.buffer=true%>
<%Response.ContentType = "text/vnd.wap.wml; charset=utf-8"%>
<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/ wml_1.1.xml">
<!--#INCLUDE VIRTUAL="/data/conn.asp"-->
<!--#include file="check.asp" -->
<wml>
<head>
<meta http-equiv="Cache-Control" content="max-age=0"/>
<meta http-equiv="Cache-Control" content="no-cache"/>
<meta http-equiv="Expires" content="Mon, 1 Jan 1990 00:00:00 GMT"/>
</head>
<%
dim id,siteid,sitename,siteurl,siteabout,IsViewSite,Isfixed,siteshortname,desc,fenlei
id=encodestr(request.form("id"))
siteid=encodestr(request.form("siteid"))
sitename=encodestr(request.form("sitename"))
siteurl=encodestr(request.form("siteurl"))
siteabout=encodestr(request.form("siteabout"))
IsViewSite=encodestr(request.form("IsViewSite"))
Isfixed=encodestr(request.form("Isfixed"))
siteshortname=encodestr(request.form("siteshortname"))
fenlei=encodestr(request.form("fenlei"))
desc=encodestr(request.form("desc"))
yxxexs=encodestr(request.form("yxxexs"))
yxxesp=encodestr(request.form("yxxesp"))
yxxetu=encodestr(request.form("yxxetu"))

if siteid="" or sitename="" or siteurl="" then
response.write "<card id='card1' title='修改网站'><p align='left'>"
response.write "对不起，各项都必须填写！<br/><br/>----------<br/><a href='wap_site_infoedit.asp?id="&id&"&amp;desc="&desc&"&amp;adminmid="&request("adminmid")&"'>[返回重写]</a><br/></p></card></wml>"
response.end
End if
if id="" then
response.redirect "error.asp"
end if
 sql="update linksites set siteid=" & sqlstr(siteid) &", "
 sql=sql&"sitename=" & sqlstr(sitename) & ","
 sql=sql&"siteurl=" & sqlstr(siteurl) & ","
 sql=sql&"siteclass=" & sqlstr(fenlei) & ","
 sql=sql&"yxxexs=" & sqlstr(yxxexs) & ","
 sql=sql&"yxxesp=" & sqlstr(yxxesp) & ","
 sql=sql&"yxxetu=" & sqlstr(yxxetu) & ","
 sql=sql&"siteabout=" &sqlstr(siteabout) & ","
 sql=sql&"IsRegpass=" & true & ","
 sql=sql&"IsViewSite=" & IsViewSite & ","
 sql=sql&"Isfixed=" & Isfixed & ","
 sql=sql&"siteshortname=" & sqlstr(siteshortname) 
 sql=sql&" where CStr(id)='" & id &"'"
 conn.execute sql
  response.write "<card id='card1' title='修改网站' ontimer='wap_site_manage.asp?desc="&desc&"&amp;adminmid="&request("adminmid")&"'><timer value='5'/><p>"
  response.write"修改成功！！正在返回...<br/><br/><a href='wap_site_manage.asp?desc="&desc&"&amp;adminmid="&request("adminmid")&"'>[管理中心]</a><br/>"
  response.write "</p></card></wml>"

conn.close
set conn=nothing
%>
