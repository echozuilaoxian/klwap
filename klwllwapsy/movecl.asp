<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<% 
'============================================================
' 更新: 2007-12-10
' 主页: http://wap.twapp.cn
' 电邮: xivn@163.com
' Q Q : QQ:531233814
' 版权: 燃点真情All Rights Reserved.
'============================================================ 
%>
<%Response.ContentType = "text/vnd.wap.wml; charset=utf-8"%><?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.2//EN" "http://www.wapforum.org/DTD/wml12.dtd">
<wml>
<!--#include file="conn.asp"-->
<!--#include file="admin.asp"-->
<head>
<meta http-equiv="Cache-Control" content="must-revalidate" forua="true"/>
<meta http-equiv="Cache-Control" content="no-cache" forua="true"/>
<meta http-equiv="Cache-Control" content="max-age=0" forua="true"/>
<meta http-equiv="Expires" content="0" forua="true"/>
<meta http-equiv="Pragma" content="no-cache" forua="true"/>
</head>
<card id="index" title="栏目移动"><p>
<%id= int(request.QueryString("id"))  
  iid= int(request.QueryString("iid"))
   lxl= request.QueryString("lx")
        set rs=server.createobject("adodb.recordset")
sql = "select * from class Where classid="&id
rs.open sql,conn,1,3
if rs.eof then 
response.write("操作失败!没有此栏目")
else
rs("parent")=iid
rs.update()
response.write("移动栏目成功")
end if
rs.close
set rs=nothing
%>
<br/>----------<br/>
<%if id<>0 then %>
<a href="Clist.asp?sid=<%=sid%>&amp;id=<%=id%>&amp;lx=<%=lxl%>">[栏目分类]</a><br/>
<%end if%>
<a href="class.asp?sid=<%=sid%>">[栏目管理]</a><br/>
<a href="index.asp?sid=<%=sid%>">[后台管理]</a>
</p></card></wml>