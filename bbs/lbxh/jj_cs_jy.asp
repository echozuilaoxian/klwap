<% @LANGUAGE="VBSCRIPT" CODEPAGE="65001" %><% Response.ContentType="text/vnd.wap.wml" %><?xml version="1.0" encoding="utf-8"?><!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<!--#INCLUDE VIRTUAL="/bbs/reg/useregs.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/public/codeun.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/reg/ltonline.asp"-->

<wml>
<card id="card1" title="交易记录">
<p>
<%
Server.ScriptTimeout=999
SessionID=request.querystring("SessionID")
if SessionID="" then SessionID=Session("SessionID")
iduse=Session("useid")
hk=Request("hk")
if hk="" then
dim zrs
  set zrs=Server.CreateObject("ADODB.Recordset")
  sql="select * from jj_hk_my order by mytime desc"
  zrs.open sql,conn,1,1
zrs.PageSize=10
pages =CLng(Request("pages"))
if pages<1 then pages=1
if pages>zrs.PageCount then pages=zrs.PageCount
if zrs.eof then
Response.write "<br/>暂时没有交易记录<br/>"
else
zrs.absolutepage=pages
if pages=1 then
bihao=0
else
bihao=pages*10-10
End if
For z=1 to zrs.PageSize
    bihaocont=bihaocont+1
Response.write bihao+bihaocont & ".<a href='/bbs/reg/useinfo.asp?id=" & zrs("ids") & "&amp;SessionID=" & SessionID & "'>" & zrs("idsname") & "</a>以" & zrs("myjjjg") &"金币的价格买入[<a href='afund_buy.asp?jjid=" & zrs("myjjid") & "&amp;SessionID=" & SessionID & "'>" & zrs("myjjnames") & "</a>]" & zrs("jjsl") &"股<br/>"
zrs.Movenext
if zrs.EOF then Exit for
 Next
end if
Response.write "---------------<br/>"
If Pages<zrs.PageCount then
    Response.Write "<a href='JJ_cs_jy.asp?pages=" & (pages+1) & "&amp;SessionID=" & SessionID & "'>下页</a>"
End if
If pages>1 then
    Response.Write "|<a href='JJ_cs_jy.asp?pages=" & (pages-1) & "&amp;SessionID=" & SessionID & "'>上页</a>"
End if
response.write "<br/>&#40;" &  Pages & "&#47;" & zrs.PageCount & "&#41;" & "共" & zrs.RecordCount & "条记录"
zrs.close
	set zrs=nothing
end if

Response.Write "<br/><a href='afund.asp?pages=" & pages & "&amp;SessionID=" & SessionID & "'>龙宝大厅</a>.<a href='index.asp?SessionID=" & SessionID & "'>龙宝中心</a><br/><a href='/BBS/index.asp?SessionID=" & SessionID & "'>社区首页</a>.<a href='/index.asp'>网站首页</a>"

%>
<%
conn.close
set conn=nothing%>
</p></card></wml>


