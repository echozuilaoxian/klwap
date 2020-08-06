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
<!-- #include file="../conn.asp" -->
<!--#include file="../admin.asp"-->
<head>
<meta http-equiv="Cache-Control" content="must-revalidate" forua="true"/>
<meta http-equiv="Cache-Control" content="no-cache" forua="true"/>
<meta http-equiv="Cache-Control" content="max-age=0" forua="true"/>
<meta http-equiv="Expires" content="0" forua="true"/>
<meta http-equiv="Pragma" content="no-cache" forua="true"/>
</head>
<card id="index" title="网友上传文章设置"><p>
<%If Request("SubmitFlag") <> "" Then
        open=Request.Form("open")       
				set rs=server.CreateObject("adodb.recordset")
				sql="select * from twapp"
				rs.open sql,conn,1,3
				if not (rs.bof and rs.eof) then
                                        rs("open")=open
                                        
				rs.update()
				Response.Write "成功设置！"
                        end if	
rs.close
set rs=nothing
else
                                set rs1=server.CreateObject("adodb.recordset")
				sql1="select * from twapp"
				rs1.open sql1,conn,1,3 %>

                        上传设置:<br/>
			<select name="open<%=minute(now)%><%=second(now)%>" value="1">
			<option value="1">文章开放上传</option>
			<option value="2">文章关闭上传</option>
			</select><br/>
			<anchor>保存修改
			<go href="wzsq.asp?SubmitFlag=true&amp;sid=<%=sid%>" method="post">
                        <postfield name="open" value="$(open<%=minute(now)%><%=second(now)%>)" />
                         </go>
			</anchor>
<%rs1.close
set rs1=nothing
conn.close
set conn=nothing
end if%>		
<br/>----------<br/>
<a href="wzcl.asp?sid=<%=sid%>">[文章管理]</a><br/>
<a href="../index.asp?sid=<%=sid%>">[后台管理]</a>
</p>
</card>
</wml>