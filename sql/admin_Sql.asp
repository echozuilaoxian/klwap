<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<%Response.ContentType = "text/vnd.wap.wml; charset=utf-8"%>
<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<%
sgsd="&#x624B;&#x5DE5;&#x9501;&#x5B9A;"
sgsd2="手工锁定"
set myc=Server.CreateObject("ADODB.Connection")
myc.ConnectionString="DBQ="+server.mappath("/sql/#sql.mdb")+";DRIVER={Microsoft Access Driver (*.mdb)};"
myc.open
set rs=Server.CreateObject("ADODB.Recordset")
rs.open "select * from SqlIn",myc,1,2
rs.addnew
rs("SqlIn_IP")=request("shuoji")
rs("SqlIn_TIME")=Now
rs("SqlIn_WEB")=sgsd
rs("SqlIn_FS")=sgsd
rs("SqlIn_CS")=sgsd
rs("SqlIn_SJ")=sgsd2
rs.update
rs.close
set rs=Nothing
myc.close
set myc=nothing
%>
<wml>
<head>
<meta http-equiv="Cache-Control" content="no-Cache"/>
<meta http-equiv="Cache-Control" content="max-age=0"/>
</head>
<card title="操作成功">
<p>
封锁，即该手机号以后将无法访问本站！<br/>
解锁，请进入后台<b><u>SQL管理</u></b>删除该号或者解锁即可！<br/>
----------<br/>
<anchor><prev/>请返回</anchor><br/>
</p>
</card>
</wml>