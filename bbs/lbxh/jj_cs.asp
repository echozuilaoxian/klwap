<% @LANGUAGE="VBSCRIPT" CODEPAGE="65001" %><% Response.ContentType="text/vnd.wap.wml" %><?xml version="1.0" encoding="utf-8"?><!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<!--#INCLUDE VIRTUAL="/bbs/reg/useregs.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/public/codeun.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/reg/ltonline.asp"-->
<wml>
<card title="龙宝走势">
<p><br/>---------------<br/>序号/龙宝/现价/幅度<br/>
<%
Server.ScriptTimeout=999
iduse=Session("useid")
lasttlss="190"
lasttlls="190"
lasttls
SessionID=request.querystring("SessionID")
if SessionID="" then SessionID=Session("SessionID")
hk=Request("hk")
if hk="" then
dim zrs
  set zrs=Server.CreateObject("ADODB.Recordset")
  sql="select jj_id,jj_names,jj_jg,shengd,shengjd from jj_hk_news order by ids desc"
  zrs.open sql,conn,1,1
zrs.PageSize=10
pages =CLng(Request("pages"))
if pages<1 then pages=1
if pages>zrs.PageCount then pages=zrs.PageCount
if zrs.eof then
Response.write "<br/>暂时没有龙宝<br/>"
else
sql="Delete from jj_hk_news where DATEDIFF('s', times, now()) > 720*60*3"
conn.Execute sql

zrs.absolutepage=pages
if pages=1 then
bihao=0
else
bihao=pages*10-10
End if
For z=1 to zrs.PageSize
    bihaocont=bihaocont+1
Response.write bihao+bihaocont & ".<a href='Afund_buy.asp?jjid=" & zrs("jj_id") & "&amp;SessionID=" & SessionID & "'>" & zrs("jj_names") & "</a>" & zrs("jj_jg") & " " & zrs("shengd") & zrs("shengjd") & "<br/>"

zrs.Movenext
if zrs.EOF then Exit for
 Next
end if
Response.write "---------------<br/>"
If Pages<zrs.PageCount then
    Response.Write "<a href='JJ_cs.asp?pages=" & (pages+1) & "&amp;SessionID=" & SessionID & "'>下页</a>"
End if
If pages>1 then
    Response.Write "|<a href='JJ_cs.asp?pages=" & (pages-1) & "&amp;SessionID=" & SessionID & "'>上页</a>"
End if
response.write "<br/>&#40;" &  Pages & "&#47;" & zrs.PageCount & "&#41;" & "共" & zrs.RecordCount & "条记录"
zrs.close
	set zrs=nothing
end if
if hk="jjfls" then
jjid=CLng(Request("jjid"))
dim szrs
  set szrs=Server.CreateObject("ADODB.Recordset")
  sql1="select jj_id,jj_names,jj_jg,shengd,shengjd from jj_hk_news where cstr(jj_id)='" & jjid & "' order by ids desc"
  szrs.open sql1,conn,1,1
szrs.PageSize=10
pages =CLng(Request("pages"))
if pages<1 then pages=1
if pages>szrs.PageCount then pages=szrs.PageCount
if szrs.eof then
Response.write "<br/>该龙宝暂时没有走势记录<br/>"
else
szrs.absolutepage=pages
if pages=1 then
bihao=0
else
bihao=pages*10-10
End if
For d=1 to szrs.PageSize
    bihaocont=bihaocont+1
Response.write bihao+bihaocont & ".<a href='Afund_buy.asp?jjid=" & szrs("jj_id") & "&amp;SessionID=" & SessionID & "'>" & szrs("jj_names") & "</a>" & szrs("jj_jg") & " " & szrs("shengd") & szrs("shengjd") & "<br/>"

szrs.Movenext
if szrs.EOF then Exit for
 Next
end if
Response.write "---------------<br/>"
If Pages<szrs.PageCount then
    Response.Write "<a href='JJ_cs.asp?hk=jjfls&amp;pages=" & (pages+1) & "&amp;jjid=" & jjid & "&amp;SessionID=" & SessionID & "'>下页</a>"
End if
If pages>1 then
    Response.Write "|<a href='JJ_cs.asp?hk=jjfls&amp;pages=" & (pages-1) & "&amp;jjid=" & jjid & "&amp;SessionID=" & SessionID & "'>上页</a>"
End if
response.write "<br/>&#40;" &  Pages & "&#47;" & szrs.PageCount & "&#41;" & "共" & szrs.RecordCount & "条记录"
szrs.close
	set szrs=nothing

end if




Response.Write "<br/><a href='afund.asp?pages=" & pages & "&amp;SessionID=" & SessionID & "'>龙宝大厅</a>.<a href='index.asp?SessionID=" & SessionID & "'>龙宝中心</a><br/><a href='/BBS/index.asp?SessionID=" & SessionID & "'>社区首页</a>.<a href='/index.asp'>网站首页</a>"
%>
<%
conn.close
set conn=nothing%>
</p></card></wml>


