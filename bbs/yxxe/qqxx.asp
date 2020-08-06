<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<%response.buffer=true%>
<%Response.ContentType = "text/vnd.wap.wml; charset=utf-8"%>
<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<% LANGUAGE="VBSCRIPT" %>
<!--#INCLUDE file="conn.asp"-->
<wml>
<%Server.ScriptTimeout=999
id=request("id")
ii=request("ii")
if ii="" then ii="0"
SessionID=request.querystring("SessionID")
if SessionID="" then SessionID=Session("SessionID")
if session("useid")="" then
       Session("returnuppath")=Request.ServerVariables("PATH_INFO") & "?id="&id&""
        response.redirect "/BBS/UseLogin.asp?SessionID="&SessionID&""
    End if
%>
<head>
<meta http-equiv="Cache-Control" content="no-Cache"/>
<meta http-equiv="Cache-Control" content="max-age=0"/>
</head>
<%
ids=session("useid")
%>
<card id="main" title="删除发布">
<p>
<%if ii=1 then%>
		注意：确定要删除该信息吗？<br/>
		<a href="qqxx.asp?id=<%=id%>&amp;ii=2&amp;SessionID=<%=SessionID%>">确定</a>|<a href="qqxx.asp?SessionID=<%=SessionID%>">取消</a><br/>
<%elseif ii=0 then%>
<!--#include file="conn1.asp"-->
<%Set Rsl = Server.CreateObject("Adodb.Recordset")
			Sqll = "SELECT top 500 id,txt,lid,tm,yc,name,jg FROM tz where cstr(lid)='"&ids& "' order by tm desc"
			Rsl.Open Sqll,liao,1,1
			if not (rsl.bof and rsl.eof)  then 
				if rsl.RecordCount>5 then
					aaaaa=5
				else
					aaaaa=rsl.RecordCount
				end if%>

				==您发布的竞技消息==<br/>

				<%For i=1 to aaaaa
					If Rsl.Eof Then
						exit For
					end if%>
					<%=i%>.时间：[<%=rsl("tm")%>]<br/>挑战金额<%=rsl("txt")%>两银子
<%if rsl("jg")=0 then%>
[<a href='qqxx.asp?id=<%=rsl("id")%>&amp;SessionID=<%=SessionID%>&amp;ii=1'>取消</a>]<br/>
<%else%>
[结束]<br/>
<%end if%>
				<%Rsl.MoveNext
				Next
			end if
			Rsl.close
			set rsl=nothing
                         liao.close
			set liao=nothing%>


<%elseif ii=2 then%>
<!--#include file="conn1.asp"-->
<%
Set Rs2 = Server.CreateObject("Adodb.Recordset")
			Sql2 = "select * FROM tz WHERE id=" & id
			Rs2.Open Sql2,liao,1,3
                          txt=rs2("txt")
			if not (rs2.eof and rs2.bof) then

			rs2.Delete

			end if

			rs2.Close
			Set rs2 = Nothing
                        liao.close
			set liao=nothing%>
<%sql="update wupin set yz=yz+"&txt&" where cstr(ids)="&ids
  conn.Execute(sql)%>
			
			删除发布成功!<br/>
返还银子<%=txt%>两<br/>
			<a href="tt.asp?SessionID=<%=SessionID%>">返回江湖大厅</a><br/>
			<a href="index.asp?SessionID=<%=SessionID%>">返回江湖首页</a><br/>
			


<%else%>
错误信息！
<%end if%>	
----------<br/>
<a href="index.asp?SessionID=<%=SessionID%>">江湖首页</a>|
<a href="/bbs/index.asp?SessionID=<%=SessionID%>">社区首页</a><br/>
</p>
		</card>
</wml>