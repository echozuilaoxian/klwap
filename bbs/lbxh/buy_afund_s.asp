<% @LANGUAGE="VBSCRIPT" CODEPAGE="65001" %>
<%Response.ContentType = "text/vnd.wap.wml; charset=utf-8"%>
<?xml version="1.0" encoding="utf-8"?> 
<!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml"> 
<!--#INCLUDE VIRTUAL="/bbs/reg/useregs.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/public/codeun.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/reg/ltonline.asp"-->
<wml>
<card id="afund" title="购买龙宝"><p>
<% 
SessionID=request.querystring("SessionID")
if SessionID="" then SessionID=Session("SessionID")

if Session("zh")="wap" then
       Session("returnuppath")=Request.ServerVariables("PATH_INFO") & "?ids=ids"
        response.redirect "/BBS/UseLogin.asp?SessionID="&SessionID&""
  	response.end
      else
        Session("ltlybz")=""
    End if
Server.ScriptTimeout=999
iduse=Session("useid")
wapgywz="购买龙宝"
lasttls
myname=Session("ltname")
pages=Request("pages")
jjid=CLng(Request("jjid"))
jjsls=CLng(Request("jjsls"))
if jjsls=""or jjsls<=0 then
response.write "错误,购买数量不能为空.<a href='Afund_buy.asp?jjid=" & jjid & "&amp;pages=" & pages & "&amp;SessionID=" & SessionID & "'>返回重写</a>"
else
dim objgbrs,usejfjf,jfjf,usejfj
 Set objgbrs=Server.CreateObject("ADODB.Recordset")
          sql="select banktime,bank from usereg where CStr(id)='" & iduse & "'"
          objgbrs.open sql,conn
if objgbrs("banktime")="" or objgbrs("bank")=0 then
response.write "你银行的账户没有钱或者还未开户,不能购买龙宝.<a href='/bbs/reg/bank.asp?SessionID=" & SessionID & "'>到银行看看</a>."
else
dim srs
 Set srs=Server.CreateObject("ADODB.Recordset")
          sql1="select jj_names,jj_jg,jj_id,jj_sl from jj_hk where CStr(jj_id)='" & jjid & "'"
          srs.open sql1,conn
if srs.eof then
response.write "错误,没有该龙宝"
else
usejfjf=int(jjsls*srs("jj_jg"))
jfjf=int(usejfjf*0.002)
if jfjf<1 then jfjf=1
usejfj=int(usejfjf+jfjf)
if objgbrs("bank")<usejfj then
Response.write "错误,你银行账户的金币不足以购买"&jjsls&"股龙宝.包括手续费在内"
objgbrs.close
Set objgbrs= Nothing
else
if srs("jj_sl")<jjsls or srs("jj_jg")<0 then
Response.write "错误,该龙宝剩余量没有那么多."
else
dim rs
set rs=Server.CreateObject("ADODB.Recordset")
  ssql="select ids from jj_hk_my where CStr(ids)='" & iduse &"' and CStr(myjjid)='"&jjid&"'"
  rs.open ssql,conn
if rs.eof then
sql="insert into jj_hk_my(myjjnames,myjjid,myjjjg,ids,idsname,jjsl)values("
  sql=sql & sqlstr(srs("jj_names")) & ","
  sql=sql & sqlstr(srs("jj_id")) & ","
sql=sql & sqlstr(srs("jj_jg")) & ","
sql=sql & sqlstr(iduse) & ","
sql=sql & sqlstr(myname) & ","
  sql=sql & sqlstr(jjsls) & ")"
  Application.Lock
  conn.execute sql
else
sql="update jj_hk_my set jjsl=jjsl+"&jjsls&" where cstr(myjjid)='" & jjid & "' and CStr(ids)='" & iduse &"'"
  Application.Lock
	conn.execute sql
end if
sql="update jj_hk set jj_sl=jj_sl-"&jjsls&" where cstr(jj_id)='" & jjid & "'"
	conn.execute sql
sql="update usereg set bank=bank-"&usejfj&" where cstr(id)='" & iduse & "'"
	conn.execute sql
sql="Delete FROM jj_hk_my WHERE CStr(jjsl)='0'"
  conn.Execute sql
  Application.Unlock
Response.write "购买成功,扣除"&usejfj&"金币,已包括手续费"&jfjf&"币.<a href='Afund_index.asp?page=" & pages & "&amp;SessionID=" & SessionID & "'>点击这里</a>查看我的龙宝"
srs.close
Set srs= Nothing
Response.Write "<br/><a href='Afund_buy.asp?pages=" & pages & "&amp;jjid=" & jjid & "&amp;SessionID=" & SessionID & "'>返回查看龙宝</a>"
end if
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
