<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<%response.buffer=true%>
<%Response.ContentType = "text/vnd.wap.wml; charset=utf-8"%>
<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<!--#include file="conn.asp"-->
<!--#include FILE="check.asp"-->
<wml>
<head>
<meta http-equiv="Cache-Control" content="no-Cache"/>
<meta http-equiv="Cache-Control" content="max-age=0"/>
<meta http-equiv="Expires" content="Mon, 1 Jan 1990 00:00:00 GMT"/>
</head>
<card id="index" title="点击广告金币设置"><p>
<%If Request("SubmitFlag") <> "" Then
       ggzb=Request.Form("ggzb")       
				set rs=server.CreateObject("adodb.recordset")
				sql="select ggzb from ltsy"
				rs.open sql,conn,1,3
				if not (rs.bof and rs.eof) then
                                        rs("ggzb")=ggzb
                                        
				rs.update()
				Response.Write "成功设置！"
                        end if	
rs.close
set rs=nothing
else
                                set rs1=server.CreateObject("adodb.recordset")
				sql1="select ggzb from ltsy"
				rs1.open sql1,conn,1,1 %>

                       点击广告金币<br/>
                       <input name="ggzb<%=minute(now)%><%=second(now)%>" value="<%=rs1("ggzb")%>"/><br/>
			<anchor>保存修改
			<go href="djgg.asp?SubmitFlag=true&amp;adminmid=<%=request("adminmid")%>" method="post">
                        <postfield name="ggzb" value="$(ggzb<%=minute(now)%><%=second(now)%>)" />
                         </go>
			</anchor>
<%rs1.close
set rs1=nothing
conn.close
set conn=nothing
end if%>		
<br/>----------<br/>
<a href='admingg.asp?adminmid=<%=request("adminmid")%>'>返回广告管理</a><br/>
<a href="wapAdmin_bbs.asp?adminmid=<%=request("adminmid")%>">返回社区管理</a><br/>
<a href="wapAdmin_index.asp?adminmid=<%=request("adminmid")%>">返回管理首页</a><br/>
报时:<%=time%>
</p></card></wml>