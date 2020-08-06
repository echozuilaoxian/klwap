<%
set ggrs=server.createobject("adodb.recordset")
    	ggsql="select * from gogo"
      	ggrs.open ggsql,conn,1,1
	ggrs.PageSize =1
	if not (ggrs.bof and ggrs.eof)  then
                       Randomize
			str=int((ggrs.RecordCount-1+1)*rnd+1)
		ggrs.AbsolutePage=str
		Response.Write ("<a href='url.asp?id="&ubb(ggrs("id"))&"'>"&ubb(ggrs("name"))&"</a>")
	End IF
	ggrs.close
	set ggrs=nothing
%>