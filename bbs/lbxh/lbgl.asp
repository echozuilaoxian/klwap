<% @LANGUAGE="VBSCRIPT" CODEPAGE="65001" %><% Response.ContentType="text/vnd.wap.wml; charset=utf-8" %><?xml version="1.0" encoding="utf-8"?><!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<!--#INCLUDE VIRTUAL="/bbs/reg/useregs.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/public/codeun.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/reg/ltonline.asp"-->

<wml>
<head>
<meta http-equiv="Cache-Control" content="max-age=0"/>
<meta http-equiv="Cache-Control" content="no-cache"/>
<meta http-equiv="Expires" content="hk, 1 Jan 1990 00:00:00 GMT"/>
</head>
<card id="card1" title="龙宝管理"><p>龙宝管理<br/>-----------<br/>
<!--#include file="admin.asp"-->
<% 
Server.ScriptTimeout=999
SessionID=request.querystring("SessionID")
if SessionID="" then SessionID=Session("SessionID")
iduse=Session("useid")
if Session("zh")="wap" then
        response.redirect"/bbs/yksm.asp?SessionID=" & SessionID & ""
    End if

hk=Request("hk")
if hk="" then
Response.write "<a href='lbfx.asp?SessionID=" & SessionID & "'>发行龙宝</a><br/><a href='lbgl.asp?hk=up&amp;SessionID=" & SessionID & "'>管理龙宝</a>"
end if
if hk="up" then
dim rs1
  set rs1=Server.CreateObject("ADODB.Recordset")
  ssql="select jj_id,jj_names from jj_hk order by jj_id desc"
  rs1.open ssql,conn,1,1
rs1.PageSize=10
page=CLng(Request("page"))
if page<1 then
   page=1
End if
if page>rs1.pagecount then
   page=rs1.pagecount
End if 
if rs1.eof then
   Response.write "没有龙宝<br/>"
 Else
rs1.absolutepage=page
   if page=1 then
     bihao=0
    else
     bihao=page *10-10
   End if
For i=1 to rs1.PageSize
    bihaocont=bihaocont+1
Response.write bihao+bihaocont & "." & rs1("jj_names") & "/ID:" & rs1("jj_id") & "<a href='lbgl.asp?hk=ups&amp;id=" & rs1("jj_id") & "&amp;SessionID=" & SessionID & "'>删除</a><br/>"
rs1.Movenext
if rs1.EOF then Exit for
 Next
End if
If Page<rs1.PageCount then
    Response.Write "<a href='lbgl.asp?hk=" & hk & "&amp;page=" & (page+1) & "&amp;SessionID=" & SessionID & "'>下页</a>"
End if
If page>1 then
    Response.Write "|<a href='lbgl.asp?hk=" & hk & "&amp;page=" & (page-1) & "&amp;SessionID=" & SessionID & "'>上页</a>"
End if
response.write "<br/>&#40;" &  Page & "&#47;" & rs1.PageCount & "&#41;" & "共" & rs1.RecordCount & "股龙宝"
if rs1.PageCount>1 then
response.write "<br/><input  name='page' value='2' size='2' format='*N'/>页<anchor>GO<go method='post' href='lbgl.asp?hk=" & hk & "&amp;SessionID=" & SessionID & "'><postfield name='page' value='$(page)'/></go></anchor>>><br/>"
end if
rs1.close
	set rs1=nothing
end if
if hk="ups" then
id=clng(request("id"))
dim srs
  set srs=Server.CreateObject("ADODB.Recordset")
sql="select jj_names from jj_hk where CStr(jj_id)='"&id&"'"
  srs.open sql,conn,1,1
if srs.eof then
   Response.write "错误！没有该龙宝<br/>"
 Else
  acc=request("acc")
if acc="" then
response.write "确定删除[" & srs("jj_names") & "]?<a href='lbgl.asp?acc=1&amp;hk=" & hk & "&amp;id=" & id & "&amp;SessionID=" & SessionID & "'>是</a>|<a href='index.asp?SessionID=" & SessionID & "'>否</a>"
srs.close
	set srs=nothing
else
sql="delete from jj_hk Where CStr(jj_id)='" & id & "'"
            conn.execute(sql)
  response.write "删除成功"
end if
end if
end if
end if
Response.write "<br/><a href='lbgl.asp?SessionID=" & SessionID & "'>返回龙宝管理</a><br/><a href='index.asp?SessionID=" & SessionID & "'>返回龙宝中心</a>"

%>

</p></card></wml>



