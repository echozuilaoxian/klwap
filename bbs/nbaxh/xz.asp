<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%><%response.buffer=true%><%Response.ContentType = "text/vnd.wap.wml; charset=utf-8"%><?xml version="1.0" encoding="utf-8"?><!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<!--#include file="conn.inc"-->
<!--#include file="cnscucsb.asp"-->
<wml>
<head>
<meta http-equiv="Cache-Control" content="no-Cache"/>
<meta http-equiv="Cache-Control" content="max-age=0"/>
<meta http-equiv="Expires" content="Mon, 1 Jan 1990 00:00:00 GMT"/>
</head>
<card id="main" title="我要投注" >
<p>
<%
dim ky,kyzc
  ky=request("ky")
  if ky="" or ky>7 or ky<1 then
	ky=1
  end if

if lycount>0 then
Response.write "<a href='/bbs/public/ckly.asp?SessionID=" & SessionID & "'>&#x60A8;&#x6709;(" & lycount & ")&#x6761;&#x65B0;&#x4FE1;&#x606F;!</a><br/><br/>"
       Session("returnuppath")=Request.ServerVariables("PATH_INFO") & "?ky="&ky&""
End if

set rs=Server.CreateObject("ADODB.Recordset")
rsQL="select * from cpjf where cstr(ids)='"&iduse& "'"
rs.open rsQL,myc,1,2
if rs.recordcount<1 then
rs.addnew
rs("ids")=iduse
rs.update
end if
usejf=rs("usejf")
        rs.Close
	Set rs=Nothing
id=request("kd")
if id="" then
 response.write "系统提示:请不要违反规定.正在返回...<br/>-------------<br/><a href='/BBS/nba/index.Asp?SessionID=" & SessionID & "'>返回球赛博彩</a><br/><a href='/bbs/index.asp?SessionID=" & SessionID & "'>返回社区首页</a></p></card></wml>"
response.end
end if
set objgbrx=Server.CreateObject("ADODB.Recordset")
ssqlx="select * from ckjhm where id=" & id & ""
  objgbrx.open ssqlx,myc,1,1
if objgbrx.EOF then
Response.write "没有这场球赛.<br/>"
else
%>

 <%if ky="1" then%>
欢迎您<b><%=ubb(gfdsa)%></b>!<br/>您现有<%=usejf%>球币<br/>--------------<br/>

<br/>与现实球赛同步.欢迎投注<br/>
<%
Response.write "<b>第" & objgbrx("id") & "场:</b><br/>"
Response.write "" & objgbrx("ds") & "VS" & objgbrx("dx") & "<br/>说明:" & objgbrx("sx") & "<br/>赔率:1:" & objgbrx("jss") & "<br/>投注截止时间:" & objgbrx("kjtime") & ""%>
<br/>
选择要投注胜利的球队:<br/><select name='ps' >
<option value="1"><%=objgbrx("ds")%></option>
<option value="2"><%=objgbrx("dx")%></option>
</select><br/>
购买金额:<input  name="ks"  value="100" format="*N" size="7" maxlength="10"/>
<br/><anchor>[-购买-]
<go method="post" href="XZ.asp?SessionID=<%=SessionID%>">
<postfield name="ps" value="$(ps)"/>
<postfield name="ks" value="$(ks)"/>
<postfield name="kd" value="<%=id%>"/>
<postfield name="ky" value="2"/>
</go>
</anchor>
<%end if%>
<br/>

<%
if ky="2" then
ks=request("ks")
ps=request("ps")
ky=request("ky")
if ks="" or ps=""  then
  response.write "系统提示:各项不能为空<br/>-------------<br/><a href='/BBS/nba/index.Asp?SessionID=" & SessionID & "'>返回球赛博彩</a><br/><a href='/bbs/index.asp?SessionID=" & SessionID & "'>返回社区首页</a></p></card></wml>"
response.end
end if
if (objgbrx("kjtime"))<(now) then
  response.write "系统提示:本球赛在" &objgbrx("kjtime") & "时段 禁止下注,正在返回...<br/>-------------<br/><a href='index.Asp?SessionID=" & SessionID & "'>返回球赛博彩</a><br/><a href='/bbs/index.asp?SessionID=" & SessionID & "'>返回社区首页</a></p></card></wml>"
response.end
end if
if ks>"" &usejf& "" then
  response.write "系统提示:你的球币不够投注<br/>-------------<br/><a href='index.Asp?SessionID=" & SessionID & "'>返回球赛博彩</a><br/><a href='/bbs/index.asp?SessionID=" & SessionID & "'>返回社区首页</a></p></card></wml>"
response.end
end if
if ks<10  then
  response.write "系统提示:你的球币不能小于10<br/>-------------<br/><a href='index.Asp?SessionID=" & SessionID & "'>返回球赛博彩</a><br/><a href='/bbs/index.asp?SessionID=" & SessionID & "'>返回社区首页</a></p></card></wml>"
response.end
end if
sql="insert into ctm(ids,ks,idss,hm)values("
sql=sql & sqlstr(iduse) & "," 
sql=sql & sqlstr(ks) & ","
sql=sql & sqlstr(id) & ","
sql=sql & sqlstr(ps) & ")"
   myc.execute sql
sqlr="update cpjf set tmmrjf=tmmrjf+'" & ks & "' where CStr(ids)='"& iduse & "'"
myc.execute sqlr
sqlc="update cpjf set usejf=usejf-'" & ks & "' where CStr(ids)='"& iduse & "'"
myc.execute sqlc
 response.write "投注成功<br/>"	
end if

end if
   objgbrx.Close
	Set objgbrx=Nothing
%>
<a href="Index.Asp?SessionID=<%=SessionID%>">返回球赛博彩</a><br/>
<a href="/BBS/index.asp?SessionID=<%=SessionID%>">返回社区首页</a><br/>
报时:<%=time%>
</p></card></wml>
<%
myc.close
set myc=nothing%>