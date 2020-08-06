<!-- #include file="conn.asp" -->
<%set rsnum4=Server.CreateObject("ADODB.Recordset")
rssnum4="select * from [twapp]"
rsnum4.open rssnum4,conn,1,1
if rsnum4("wjop")=1 then%>
<%browsers=Lcase(Left(Request.ServerVariables("HTTP_USER_AGENT"),4))
if browsers="oper"  or  browsers="winw"  or  browsers="wapi" or browsers="mc21" or browsers="up.b" or browsers="upg1" or browsers="upsi" or browsers="qwap" or browsers="jigs" or browsers="java" or browsers="alca" or browsers="wapj" or browsers="cdr/" or browsers="nec-" or browsers="fetc" or browsers="r380" or browsers="winw" or browsers="mozi" or browsers="mozi" or browsers="m3ga" then response.redirect"Opera.asp"
end if
rsnum4.close   
set rsnum4=nothing
ID=request.querystring("id")
Set rs = Server.CreateObject("ADODB.Recordset")
sql="Select * from wjfile where ID="&id
rs.open sql,conn,1,1
			response.redirect rs("url")

rs.close   
set rs=nothing
%>