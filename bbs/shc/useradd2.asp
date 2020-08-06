
<!--#include FILE="conn.asp"-->
<!--#include FILE="head.asp"-->
<!--#include FILE="bianliang.asp"-->
<!--#include FILE="buys.asp"-->
<!--#include FILE="Ascii.asp"-->
<wml>
<%
Response.Write Ascii("<card title=""&#x53D1;&#x5E03;&#x4FE1;&#x606F;"">")
%>
<p>=&#x53D1;&#x5E03;&#x6D88;&#x606F;=<br/>

<%
Server.ScriptTimeout=999
SessionID=request.querystring("SessionID")
iduse=Session("useid")
gfdsa=Session("wapzmyaname")
if Session("zh")="wap" then
        response.redirect "/bbs/yksm.asp"
      else
        Session("wapzmyalybz")=""
    End if
If Request.TotalBytes>0 then
	txtDataBuf=ItIsAFun()
	if instr(txtDataBuf,"name=")>0 and instr(txtDataBuf,"&address=")>0 and instr(txtDataBuf,"name=")<instr(txtDataBuf,"&address=") then
		txtDataBuf=split(txtDataBuf,"&address=")
		name=mid(txtDataBuf(0),6)
		txtm=txtDataBuf(1)        
                
                x=instr(txtm,"&level=")
                m=x-1
                address=left(txtm,m)
                y=mid(txtm,x)
                ttem=mid(y,8)
                abcd=ttem
                
                
                q=instr(abcd,"&tel=")
                z=q-1
                l=mid(abcd,q)
                level=left(abcd,z)
                tel=mid(l,6)
               

                set rs=server.createobject("adodb.recordset")
                sql="select * from buys"
                 rs.open sql,conn,3,3
                 rs.addnew
                 rs("name")=name
                 rs("address")=address
                 rs("level")=level
                 rs("tel")=tel
                 rs.update
                 rs.close
                response.write Ascii("&#x53D1;&#x5E03;&#x6210;&#x529F;,&#x7D27;&#x9632;&#x6B3A;&#x8BC8;!<br/>")
		Response.Redirect "index.asp?SessionID="&SessionID&""
		
	End if
End if
%>
<%

Response.Write Ascii("&#x6635;&#x79F0;:<input name=""name"" emptyok=""true"" value='"& gfdsa &"' size='6'/><br/>")
Response.Write Ascii("&#x7C7B;&#x522B;:<select title=""level"" name=""level"" ivalue=""0"">")
Response.Write Ascii("<option value=""&#x5730;&#x4EA7;"">&#x5730;&#x4EA7;</option>")
Response.Write Ascii("<option value=""&#x8F66;&#x5B50;"">&#x8F66;&#x5B50;</option>")
Response.Write Ascii("<option value=""&#x624B;&#x673A;"">&#x624B;&#x673A;</option>")
Response.Write Ascii("<option value=""&#x914D;&#x4EF6;"">&#x914D;&#x4EF6;</option>")
Response.Write Ascii("<option value=""SIM&#x5361;"">SIM&#x5361;</option>")
Response.Write Ascii("<option value=""&#x76F8;&#x673A;"">&#x76F8;&#x673A;</option>")
Response.Write Ascii("<option value=""&#x7535;&#x5668;"">&#x7535;&#x5668;</option>")
Response.Write Ascii("<option value=""&#x8F6F;&#x4EF6;"">&#x8F6F;&#x4EF6;</option>")
Response.Write Ascii("<option value=""&#x8D26;&#x53F7;"">&#x8D26;&#x53F7;</option>")
Response.Write Ascii("<option value=""&#x4E66;&#x7C4D;"">&#x4E66;&#x7C4D;</option>")
Response.Write Ascii("<option value=""&#x914D;&#x9970;"">&#x914D;&#x9970;</option>")
Response.Write Ascii("<option value=""&#x88C5;&#x5907;"">&#x88C5;&#x5907;</option>")
Response.Write "</select><br/>"
Response.Write Ascii("&#x6D88;&#x606F;:")
Response.Write "<input name=""tel"" emptyok=""true"" size=""6""/><br/><anchor>"
Response.Write Ascii("&#x63D0;&#x4EA4;")
Response.Write "<go method=""post"" href=""useradd2.asp?SessionID="&SessionID&""" accept-charset=""utf-8"">"
Response.Write "<postfield name=""name"" value='$(name)'/>"
Response.Write "<postfield name=""address"" value='"&iduse&"'/>"
Response.Write "<postfield name=""level"" value=""$(level)""/>"
Response.Write "<postfield name=""tel"" value=""$(tel)""/>"
%>
</go>
</anchor>

<% 
Response.Write Ascii("<br/><a href=""index.asp?SessionID="&SessionID&""">&#x56DE;&#x4EA4;&#x6613;&#x5E02;&#x573A;</a>")
Response.Write Ascii("<br/><a href=""/bbs/index.asp?SessionID="&SessionID&""">&#x8FD4;&#x56DE;&#x793E;&#x533A;&#x9996;&#x9875;</a>")
%></p>
</card>
</wml>