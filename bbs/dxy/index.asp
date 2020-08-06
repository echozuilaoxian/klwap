<!--#INCLUDE VIRTUAL="/md5/inc.asp"-->
<!--#include file="conn.asp"-->
<%
response.write "<card title=""斗西游"" ontimer=""index.asp?SessionID="&SessionID&"&amp;num="&int(timer())&""">"
response.write "<timer value=""1000""/><p>"
Response.write "<img src='dxy.gif' alt=''/><br/>"
'检查有几条新留言
if lycount>0 then
Response.write "<a href='/bbs/public/ckly.asp?SessionID=" & SessionID & "'>您有" & lycount & "条新信息</a><br/>"
Session("returnuppath")=Request.ServerVariables("PATH_INFO") & "?id=" & id & ""
End if
Response.write "------------<br/>"
response.write"<a href=""dsq2.asp?SessionID="&SessionID&""">公开挑战</a>|"
response.write"<a href=""dsq.asp?SessionID="&SessionID&""">单人挑战</a><br/>"
response.write"<a href=""mypklist.asp?SessionID="&SessionID&""">挑战记录</a>|"
response.write"<a href=""mypklist2.asp?SessionID="&SessionID&""">应战记录</a><br/>"
response.write"【最新挑战】<a href=""index.asp?SessionID="&SessionID&"&amp;num="&int(timer())&""">刷新</a><br/>"

  dim objgbrs1,ssql1
   set objgbrs1=Server.CreateObject("ADODB.Recordset")
  ssql1="select about,useid from YD_jd where [reuseid]=" & myid & " and op=0 order by id desc"
  objgbrs1.open ssql1,ydzqconn,1,1

    if objgbrs1.eof then
    
	elseif objgbrs1("about")="J" then
response.write"<img src='new.gif' alt='.'/><a href=""jd_list.asp?SessionID="&SessionID&""">ID("&objgbrs1("useid")&")向您发起挑战</a><br/>"
	elseif objgbrs1("about")="D" then
response.write"<img src='new.gif' alt='.'/><a href=""dx_list.asp?SessionID="&SessionID&""">ID("&objgbrs1("useid")&")向您发起挑战</a><br/>"
end if

dim rs1
 set rs1=Server.CreateObject("ADODB.Recordset")
  rs1.open"select about,useid,num,id from YD_jd where op=0 and reuseid=0 and active=1 order by id desc",ydzqconn,1,1
if objgbrs1.eof and rs1.eof then       
response.write"暂无友友创建挑战...<br/>"
end if 
 If not rs1.eof Then 
 Dim PageSize,i
	PageSize=10
	Dim Count,page,pagecount,gopage			
	gopage="index.asp?SessionID="&SessionID&"&amp;"
	Count=rs1.recordcount	
	page=int(request.QueryString ("page"))
	if page<=0 or page="" then page=1		
	pagecount=(count+pagesize-1)\pagesize	
        if page>pagecount then page=pagecount
	rs1.move(pagesize*(page-1))
	For i=1 To PageSize     						
	If rs1.eof Then Exit For	
	if rs1("about")="J" then
response.write"<a href=""jd_list2.asp?ids="&rs1("id")&"&amp;SessionID="&SessionID&""">ID("&rs1("useid")&")公开挑战("&rs1("num")&getcent&")</a><br/>"
	elseif rs1("about")="D" then
response.write"<a href=""dx_list2.asp?ids="&rs1("id")&"&amp;SessionID="&SessionID&""">ID("&rs1("useid")&")公开挑战("&rs1("num")&getcent&")</a><br/>"
                 end if
rs1.moveNext
 	Next
	if page-pagecount<0 then response.write "<a href="""&gopage&"page="&page+1&""">下一页</a>"&chr(13)
	if page>1 then response.write "<a href="""&gopage&"page="&page-1&""">上一页</a>"&chr(13)
if pagecount>1 then response.write"<br/>"
	end if
objgbrs1.close
set objgbrs1=nothing
rs1.close
set rs1=nothing
response.write"【玩家排行】<br/>"
response.write"<a href=""pk_top.asp?SessionID="&SessionID&""">赢家排行</a>|"
response.write"<a href=""pk_cent.asp?SessionID="&SessionID&""">赚币排行</a>"
response.write"<br/><a href=""pklist.asp?SessionID="&SessionID&""">挑战清单</a>|"
response.write"<a href=""pk_h.asp?SessionID="&SessionID&""">游戏规则</a>"
ydzqconn.close
set ydzqconn=nothing
conn.close
set conn=nothing
Response.write "<br/><a href=""index.asp?SessionID="&SessionID&""">返回斗西游</a><br/>"
Response.write "<a href=""/bbs/SCYL.asp?SessionID="&SessionID&""">返回社区赌场</a><br/><a href=""/bbs/index.asp?SessionID="&SessionID&""">返回社区首页</a>"
Response.write "</p></card></wml> "
%>
