<% @LANGUAGE="VBSCRIPT" CODEPAGE="65001" %><% Response.ContentType="text/vnd.wap.wml" %><?xml version="1.0" encoding="utf-8"?><!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<!--#INCLUDE VIRTUAL="/bbs/reg/useregs.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/public/codeun.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/reg/ltonline.asp"-->
<wml>
<head>
<meta http-equiv="Cache-Control" content="max-age=0"/>
</head>

<card id="afund" title="龙宝大厅"><p>
<% 
Server.ScriptTimeout=999
SessionID=request.querystring("SessionID")
if SessionID="" then SessionID=Session("SessionID")
iduse=Session("useid")
Response.write "排名/龙宝/现价/升降<br/><br/>"
dim c,id,i,code
randomize 
c="1,2,3,4,5,6,7,8,9,0" 
id=split(c,",") 
for i=1 to 2
code=id(int(rnd()*10))&code 
next 
dim ssrs,k
  set ssrs=Server.CreateObject("ADODB.Recordset")
  sql1="select jj_names,shengd,jj_jg,jj_jg_y,jj_times from jj_hk WHERE cstr(jj_id)='8'"
  ssrs.open sql1,conn,1,1
if ssrs.eof then
response.write ""
else
if int(datediff("s",ssrs("jj_times"),now())/3600)>0 then
if right(code,1)=2 or right(code,1)=4 or right(code,1)=6 or right(code,1)=8 then
sql="update jj_hk set jj_times='"&(ssrs("jj_times")+cdate("1:00:00"))&"',jj_jg_y='" & ssrs("jj_jg") & "',jj_jg=jj_jg+" & code & ",shengd='升↑' where cstr(jj_id)='8'"
  Application.Lock
	conn.execute sql
else
if right(code,1)=0 or right(code,1)=9 then
sql="update jj_hk set jj_times='"&(ssrs("jj_times")+cdate("1:00:00"))&"',jj_jg_y='" & ssrs("jj_jg") & "',shengd='平→' where cstr(jj_id)='8'"
	conn.execute(sql)
else
sql="update jj_hk set jj_times='"&(ssrs("jj_times")+cdate("1:00:00"))&"',jj_jg_y='" & ssrs("jj_jg") & "',jj_jg=jj_jg-" & code & ",shengd='降↓' where cstr(jj_id)='8'"
	conn.execute(sql)
end if
end if
end if
Response.write  ssrs("jj_names") & " " & ssrs("jj_jg") & " " & ssrs("shengd") &" " & (ssrs("jj_jg")-ssrs("jj_jg_y")) & "<br/>"
ssrs.close
	set ssrs=nothing
end if
sql="Delete FROM jj_hk WHERE jj_jg<=0"
conn.Execute sql

 dim pages,srs
if pages="" then pages=1
  set srs=Server.CreateObject("ADODB.Recordset")
  sql="select jj_names,shengd,jj_jg,jj_id from jj_hk WHERE cstr(jj_id)<>'8' order by jj_jg desc"
  srs.open sql,conn,1,1
srs.PageSize=8
pages =CLng(Request("pages"))
if pages<1 then pages=1
if pages>srs.PageCount then pages=srs.PageCount
if srs.eof then
    response.write "暂时没有龙宝,稍后推出<br/>"
  else
srs.absolutepage=pages
if pages=1 then
bihao=0
else
bihao=pages*8-8
End if
For k=1 to srs.PageSize
bihaocont=bihaocont+1
Response.write bihao+bihaocont & ".<a href='Afund_buy.asp?jjid=" & srs("jj_id") & "&amp;pages=" & pages & "&amp;SessionID=" & SessionID & "'>" & srs("jj_names") & "</a> " & srs("jj_jg") & " " & srs("shengd") &"<br/>"
srs.Movenext
if srs.EOF then Exit for
 Next
End if
Response.write "---------------<br/>"
If pages<srs.PageCount then
Response.Write "<a href='Afund.asp?pages=" & (pages+1) & "&amp;SessionID=" & SessionID & "'>下一页</a>"
End if
If pages>1 then
Response.Write "|<a href='Afund.asp?pages=" & (pages-1) & "&amp;SessionID=" & SessionID & "'>上一页</a>"
End if

response.write "<br/>(" & pages & "/" & srs.PageCount & ")共" & srs.RecordCount & "股龙宝<br/>"
srs.close
	set srs=nothing
Response.Write "<br/><a href='Afund_index.asp?page=" & pages & "&amp;SessionID=" & SessionID & "'>我的龙宝</a>.<a href='index.asp?SessionID=" & SessionID & "'>龙宝中心</a><br/><a href='/BBS/index.asp?SessionID=" & SessionID & "'>社区首页</a>.<a href='/index.asp'>网站首页</a>"

%>
<%
conn.close
set conn=nothing%>

</p></card></wml>



