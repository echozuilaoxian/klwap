
<!--#INCLUDE VIRTUAL="/md5/inc.asp"-->
<%
Server.ScriptTimeout=999
SessionID=request.querystring("SessionID")
ID=untowide(request.querystring("ID"))
dim rsgg
  set rsgg=Server.CreateObject("ADODB.Recordset")
  conn.CommandTimeOut=999
     ssql="select id,biao,ggurl from gg  where id="&id&""
rsgg.open ssql,conn,1,1
if rsgg.eof then
%>
<card id='main' title='广告'>
<p>
<%
response.redirect"/index.asp?"
Else
ggurl=rsgg("ggurl")
%>
<card id='main' title='<%=rsgg("biao")%>'>
<p>

<%
sql="update gg set dacs=dacs+1 where id=" & id
    Application.Lock
	conn.execute(sql)
response.redirect""&ggurl&""
end if
%>

</p></card></wml>
<%conn.close
set conn=nothing%>