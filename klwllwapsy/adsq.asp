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
<!-- #include file="conn.asp" -->
<!--#include file="admin.asp"-->
<head>
<meta http-equiv="Cache-Control" content="must-revalidate" forua="true"/>
<meta http-equiv="Cache-Control" content="no-cache" forua="true"/>
<meta http-equiv="Cache-Control" content="max-age=0" forua="true"/>
<meta http-equiv="Expires" content="0" forua="true"/>
<meta http-equiv="Pragma" content="no-cache" forua="true"/>
</head>
<card id="index" title="点击广告钻币设置"><p>
<%If Request("SubmitFlag") <> "" Then
       downjb=Request.Form("downjb")       
				set rs=server.CreateObject("adodb.recordset")
				sql="select downjb from twapp"
				rs.open sql,conn,1,3
				if not (rs.bof and rs.eof) then
                                        rs("downjb")=downjb
                                        
				rs.update()
				Response.Write "成功设置！"
                        end if	
rs.close
set rs=nothing
else
                                set rs1=server.CreateObject("adodb.recordset")
				sql1="select downjb from twapp"
				rs1.open sql1,conn,1,1 %>

                       点击广告钻币<br/>
                       <input name="downjb<%=minute(now)%><%=second(now)%>" value="<%=rs1("downjb")%>"/><br/>
			<anchor>保存修改
			<go href="adsq.asp?SubmitFlag=true&amp;sid=<%=sid%>" method="post">
                        <postfield name="downjb" value="$(downjb<%=minute(now)%><%=second(now)%>)" />
                         </go>
			</anchor>
<%rs1.close
set rs1=nothing
conn.close
set conn=nothing
end if%>		
<br/>----------<br/>
<a href="admin_go.asp?sid=<%=sid%>">[广告管理]</a><br/>
<a href="index.asp?sid=<%=sid%>">[后台管理]</a>
</p>
</card>
</wml>