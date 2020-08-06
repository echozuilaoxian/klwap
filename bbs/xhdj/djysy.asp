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
ForumID=request.querystring("ForumID")
id=request.querystring("id")
page=request.querystring("page")
pagenew=request.querystring("pagenew")
dim idss
SessionID=request.querystring("SessionID")
idss=Session("useid")
        set rs1=server.createobject("adodb.recordset")
	sql1="select * from usereg where CStr(id)='" & Session("useid") & "'"
	rs1.open sql1,conn,1,3
if rs1("jsy")=0 then 
  response.write "对不起你还没有购买这类道具"
   else
        set rs=server.createobject("adodb.recordset")
	sql="select * from wuza where id="&request("id")
	rs.open sql,conn,1,3
 if rs("times")="2000-10-10 12:12:12" then 
  response.write "对不起,固底的贴子不能使用隐身衣!"
   else
 if rs("jsy")="a" then 
  response.write "对不起,该贴正在使用偷窥镜，短时间不能隐身!"
   else
 if rs("jsy")="t" then 
  response.write "对不起,该贴正在使用隐身衣,不能重复使用.!"
   else
 if rs("bntjyy1")="a" then 
  response.write "对不起,该贴已被锁,不能使用隐身衣!"
   else
        rs("jsy")="t"
  rs.update
    sql="update usereg set jsy=jsy-1 where CStr(id)='" & idss & "'"
    conn.execute(sql)
    sql="update dj set sun=sun+1 where CStr(id)='3'"
    conn.execute(sql)
	rs1.close
	set rs1=nothing
     rs.close
	set rs=nothing

response.write "隐身衣使用成功!"
  End if        
  End if        
  End if        
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