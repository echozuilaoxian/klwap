<% @LANGUAGE="VBSCRIPT" CODEPAGE="65001" %>
<% Response.ContentType="text/vnd.wap.wml" %><?xml version="1.0" encoding="utf-8"?><!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<!--#INCLUDE VIRTUAL="/bbs/reg/useregs.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/public/codeun.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/reg/ltonline.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/reg/redtjname.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/reg/redtjnames.asp"-->
<wml>
<head>
<meta http-equiv="Cache-Control" content="max-age=0"/>
<meta http-equiv="Cache-Control" content="no-cache"/>
<meta http-equiv="Expires" content="hk, 1 Jan 1990 00:00:00 GMT"/>
</head>
<card id="card1" title="我的物品"><p>==我的物品==<br/>
<%if Session("zh")="wap" then
        response.redirect"/BBS/UseLogin.asp?SessionID="&SessionID&"&pkurl="&Request.ServerVariables("PATH_INFO")&"?"
    End if
Server.ScriptTimeout=999
iduse=Session("useid")
wapgywz="我的种子"
lasttls
if lycount>0 then
   Response.write "<a href='/bbs/public/ckly.asp?SessionID="&SessionID&"'>您有" & lycount & "条新信息</a><br/>"
Session("returnuppath")=Request.ServerVariables("PATH_INFO") & "?"
End if
  yi=request("yi")
sql="Delete FROM my_show WHERE wpsl=0"
conn.execute sql
if yi="hy" then
Response.write "<a href='Mywp.asp?yi=hy&amp;SessionID="&SessionID&"'>种子</a><br/>"
 dim zrf
  set zrf=Server.CreateObject("ADODB.Recordset")
  zsqls="select wpmc,wpid,wpsl from my_show where ids=" & iduse &" and wpflid=5 order by id desc"
  zrf.open zsqls,conn,1,1
zrf.PageSize=8
pages=CLng(Request("pages"))
if pages<1 then
   pages=1
End if
if pages>zrf.pagecount then
   pages=zrf.pagecount
End if 
if zrf.eof then
   Response.write "你没有种子,到<a href='/bbs/xhjy/shop_hy.asp?SessionID="&SessionID&"'>种子公司</a>逛逛<br/>"
 Else
zrf.absolutepage=pages
   if pages=1 then
     bihao=0
    else
     bihao=pages *8-8
   End if
For a=1 to zrf.PageSize
    bihaoconts=bihaoconts+1
Response.write bihao+bihaoconts & ".<a href='wp_view_hy.asp?pid=" & zrf("wpid") & "&amp;wid=5&amp;SessionID="&SessionID&"'>" & zrf("wpmc") & "(" & zrf("wpsl") & ")</a><br/>"
zrf.Movenext
if zrf.EOF then Exit for
 Next
End if
Response.write"-----------------<br/>"
If Pages<zrf.PageCount then
    Response.Write "<a href='Mywp.asp?yi=" & yi & "&amp;pages=" & (pages+1) & "&amp;SessionID="&SessionID&"'>下页</a>"
End if
If pages>1 then
    Response.Write "|<a href='Mywp.asp?yi=" & yi & "&amp;pages=" & (pages-1) & "&amp;SessionID="&SessionID&"'>上页</a>"
End if
response.write "<br/>&#40;" &  Pages & "&#47;" & zrf.PageCount & "&#41;" & "共" & zrf.RecordCount & "个种子"
if zrf.PageCount>1 then
response.write "<br/>第<input  name='page' value='2' size='2' format='*N'/>页<br/><anchor>跳到该页<go method='post' href='Mywp.asp?yi=" & yi & "&amp;SessionID="&SessionID&"'><postfield name='pages' value='$(pages)'/></go></anchor><br/>"
zrf.close
	set zrf=nothing
end if
end if
 Response.Write "<br/><a href='shop_hy.asp?SessionID="&SessionID&"'>返回种子公司</a><br/><a href='/bbs/xhjy/home.asp?SessionID=" & SessionID & "'>返回我的家园</a>"
%>
</p></card></wml>