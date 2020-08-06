<% @LANGUAGE="VBSCRIPT" CODEPAGE="65001" %>
<%Response.ContentType = "text/vnd.wap.wml; charset=utf-8"%><?xml version="1.0" encoding="utf-8"?>
<!--#INCLUDE VIRTUAL="/bbs/reg/useregs.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/public/codeun.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/reg/ltonline.asp"-->
<!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<wml> 
<head>
<meta http-equiv='Cache-Control' content='no-Cache'/>
<meta http-equiv='Cache-Control' content='max-age=0'/>
</head>
<card id='main' title='操作提示' >
<p>
<%
SessionID=request.querystring("SessionID")
id=request.querystring("id")
ForumID=request.querystring("ForumID")
page=request.querystring("page")
pagenew=request.querystring("pagenew")
dim idss
SessionID=request.querystring("SessionID")
idss=Session("useid")
        set rs1=server.createobject("adodb.recordset")
	sql1="select * from usereg where CStr(id)='" & Session("useid") & "'"
	rs1.open sql1,conn,1,3
if rs1("zyj")=0 then 
  response.write "对不起你还没有购买这类道具"
   else
        set rs=server.createobject("adodb.recordset")
	sql="select * from wuza where id="&request("id")
	rs.open sql,conn,1,3
 if rs("jsy")="f" then 
  response.write "对不起,该贴还没有使用隐身衣,所以不能还原"
   else
        rs("jsy")="f"
        rs("jsytime")="2100-11-10 12:12:12"
  rs.update
    sql="update usereg set zyj=zyj-1 where CStr(id)='" & idss & "'"
    conn.execute(sql)
    sql="update dj set sun=sun+1 where CStr(id)='4'"
    conn.execute(sql)
	rs1.close
	set rs1=nothing
     rs.close
	set rs=nothing

response.write "还原丹使用成功!"
  End if        
  End if        
response.write "<br/><anchor>返回上级<prev/></anchor><br/>"
   Response.write "<br/>----------<br/><a href='/BBS/xhdj/index1.asp?SessionID=" & SessionID & "'>回道具商店</a><br/><a href='/BBS/xh6666/contentlist.asp?ForumID=" & ForumID & "&amp;SessionID=" & SessionID & "'>回当前版块</a><br/>"
Response.write "<a href='/BBS/index.asp?SessionID=" & SessionID & "'>返回社区首页</a></p></card></wml>"
     objgbrss.close
	set objgbrss=nothing
	conn.close
	set conn=nothing
  %>