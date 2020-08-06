<% @LANGUAGE="VBSCRIPT" CODEPAGE="65001" %>
<%Response.ContentType = "text/vnd.wap.wml; charset=utf-8"%>
<?xml version="1.0" encoding="utf-8"?> 
<!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml"> 
<!--#INCLUDE VIRTUAL="/bbs/reg/useregs.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/public/codeun.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/reg/ltonline.asp"-->
<wml>
<card id="card1" title="卖出龙宝"><p>
<% 
SessionID=request.querystring("SessionID")
if SessionID="" then SessionID=Session("SessionID")
  
Server.ScriptTimeout=999
iduse=Session("useid")
jjid=CLng(Request("jjid"))
jjsls=CLng(Request("jjsls"))
if jjsls="" or jjsls<=0 then
response.write "错误,数量不能为空.<a href='Afund_buys.asp?jjid=" & jjid & "&amp;SessionID=" & SessionID & "'>返回重写</a>"
else

dim srs,jfs,jfjf,jjf
 Set srs=Server.CreateObject("ADODB.Recordset")
          sql1="select jj_jg from jj_hk where CStr(jj_id)='" & jjid & "'"
          srs.open sql1,conn
if srs.eof then
response.write "错误,没有该龙宝"
else
jfs=int(jjsls*srs("jj_jg"))
jfjf=int(jfs*0.003)
if jfjf<1 then jfjf=1
jjf=jfs-jfjf
srs.close
Set srs= Nothing
dim rs
set rs=Server.CreateObject("ADODB.Recordset")
  ssql="select ids,jjsl from jj_hk_my where CStr(ids)='" & iduse &"' and CStr(myjjid)='"&jjid&"'"
  rs.open ssql,conn
if rs.eof then
response.write "错误,你不持有该龙宝"
else
if rs("jjsl")<jjsls then
response.write "错误,该龙宝你没有那么多"
else
rs.close
Set rs= Nothing
sql="update jj_hk_my set jjsl=jjsl-"&jjsls&" where cstr(myjjid)='" & jjid & "' and CStr(ids)='" & iduse &"'"
  Application.Lock
	conn.execute sql
sql="update jj_hk set jj_sl=jj_sl+"&jjsls&" where cstr(jj_id)='" & jjid & "'"
	conn.execute sql
sql="update usereg set bank=bank+"&jjf&" where cstr(id)='" & iduse & "'"
	conn.execute sql
sql="Delete FROM jj_hk_my WHERE CStr(jjsl)='0'"
  conn.Execute sql
  Application.Unlock
Response.write "成功卖出该龙宝,你获得"&jjf&"金币(已经扣除手续费:"&jfjf&"币),并存进你的银行账户<a href='Afund_index.asp?SessionID=" & SessionID & "'>点击这里</a>查看我的龙宝"
end if
end if
end if
end if

Response.Write "<br/><a href='afund.asp?pages=" & pages & "&amp;SessionID=" & SessionID & "'>龙宝大厅</a>.<a href='index.asp?SessionID=" & SessionID & "'>龙宝中心</a><br/><a href='/BBS/index.asp?SessionID=" & SessionID & "'>社区首页</a>.<a href='/index.asp'>网站首页</a>"
%>
<%
conn.close
set conn=nothing%>
</p>
</card>
</wml>
