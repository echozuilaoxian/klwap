<% @LANGUAGE="VBSCRIPT" CODEPAGE="65001" %><% Response.ContentType="text/vnd.wap.wml" %><?xml version="1.0" encoding="utf-8"?><!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<!--#INCLUDE VIRTUAL="/bbs/reg/useregs.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/public/codeun.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/reg/ltonline.asp"-->
<wml>
<head>
<meta http-equiv="Cache-Control" content="max-age=0"/>
<meta http-equiv="Cache-Control" content="no-cache"/>
<meta http-equiv="Expires" content="hk, 1 Jan 1990 00:00:00 GMT"/>
</head>

<card id="card1" title="龙宝详情"><p>
<% 
Server.ScriptTimeout=999
SessionID=request.querystring("SessionID")
if SessionID="" then SessionID=Session("SessionID")
iduse=Session("useid")

  pages=request("pages")
if pages="" then pages=1
  jjid=request("jjid")
if jjid=8 then
 response.write "错误,总龙宝不可交易<br/>"
else

dim srs
  set srs=Server.CreateObject("ADODB.Recordset")
  sql="select * from jj_hk WHERE cstr(jj_id)='" & jjid & "'"
  srs.open sql,conn,1,1
if srs.eof then
    response.write "错误,没有该龙宝<br/>"
  else
if int(datediff("s",srs("jj_times"),now())/1800)>0 then
response.redirect"s.asp?pages=" & pages & "&amp;t=" & time() & "&jjid=" & jjid & "&SessionID=" & SessionID & ""
end if
Response.write "龙宝:" & srs("jj_names") & "<br/>发行:" & srs("fh_name") & "<br/>发行数量:" & srs("jj_fh_sl") & "<br/>发行价:" & srs("fh_jg") & "<br/>现价:" & srs("jj_jg") & "<br/>上次价格:" & srs("jj_jg_y") & "<br/>状况:" & srs("shengd") & " "&(srs("jj_jg")-srs("jj_jg_y"))&"<br/>剩余:" & srs("jj_sl") & "<br/>更新时间:" & srs("jj_times") & "<br/>发行时间:" & srs("jj_time") & "<br/>"

dim ssrs
set ssrs=Server.CreateObject("ADODB.Recordset")
  sql1="select bank from usereg WHERE cstr(id)='" & iduse & "'"
  ssrs.open sql1,conn,1,1
if ssrs.eof then
    response.write "游客,登陆后更精彩<br/>"
  else
Response.write "<a href='/bbs/reg/bank.asp?pages=" & pages & "&amp;SessionID=" & SessionID & "'>银行账户</a>:" & ssrs("bank") & "<br/>可以购买:"&int(ssrs("bank")/srs("jj_jg"))&"份<br/>"
ssrs.close
	set ssrs=nothing

End if
Response.write "<a href='JJ_cs.asp?hk=jjfls&amp;jjid=" & srs("jj_id") & "&amp;SessionID=" & SessionID & "'>龙宝走势</a><br/>数量:<input  name='jjsls' size='3' format='*N'/><br/><anchor>购买[" & srs("jj_names") & "]<go method='post' href='Buy_Afund_s.asp?jjid=" & srs("jj_id") & "&amp;pages=" & pages & "&amp;SessionID=" & SessionID & "'><postfield name='jjsls' value='$(jjsls)'/></go></anchor><br/>"
srs.close
	set srs=nothing
end if
End if
Response.write "---------------<br/><a href='afund.asp?pages=" & pages & "&amp;SessionID=" & SessionID & "'>龙宝大厅</a>.<a href='index.asp?SessionID=" & SessionID & "'>龙宝中心</a><br/><a href='/BBS/index.asp?SessionID=" & SessionID & "'>社区首页</a>.<a href='/index.asp'>网站首页</a>"

%><%
conn.close
set conn=nothing%>
</p></card></wml>



