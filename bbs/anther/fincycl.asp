<% @LANGUAGE="VBSCRIPT" CODEPAGE="65001" %><% Response.ContentType="text/vnd.wap.wml; charset=utf-8" %><?xml version="1.0" encoding="utf-8"?><!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<!--#INCLUDE VIRTUAL="/bbs/reg/useregs.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/public/codeun.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/reg/ltonline.asp"-->
<wml>
<card id="min" title="&#25104;&#35821;&#35789;&#20856;">
<%
Server.ScriptTimeout=999
wap=request.querystring("wap")
iduse=Session("useid")
lasttlls="47"
lasttls
  dim objgbrs,lingnam
  lingnam=request("lingname")
   Response.write "<p>"
   response.write "<a href='fincy.asp?wap=" & wap & "'>重新搜索</a><br/>--------<br/>"
 if lingnam<>"" then
  lingnams="%" & lingnam & "%"
  set objgbrs=Server.CreateObject("ADODB.Recordset")
  ssql="select * from pic_cy where biaoti like '" & lingnams & "' order by id desc"
  objgbrs.open ssql,conn,1,1
if objgbrs.eof then
   Response.write "对不起，暂时没有您想要的词语!<br/>"
 Else
  objgbrs.PageSize=10
  page=CLng(Request("page"))
  if page<1 then page=1
  if page>objgbrs.pagecount then page=objgbrs.pagecount
objgbrs.absolutepage=page
if page=1 then
bihao=0
else
bihao=page*10-10
End if
For i=1 to objgbrs.PageSize
bihaocont=bihaocont+1
Response.write bihao+bihaocont & "." & "<a href='zcwwcl2.asp?page=" & page & "&amp;timee=" & objgbrs("id") & "&amp;lingname=" & lingnam & "&amp;wap=" & wap & "'>" & converttowide(objgbrs("biaoti")) & "</a><br/>"
objgbrs.Movenext
if objgbrs.EOF then Exit for
  Next
End if
response.write "--------<br/>"
If Page<objgbrs.PageCount then
Response.Write "<anchor>&#19979;&#39029;<go method='post' href='fincycl.asp'><postfield name='page' value='" & (page+1) & "'/><postfield name='lingname' value='" & lingnam & "'/></go></anchor>"
End if

If Page>1 then
Response.Write "&nbsp;"
Response.Write "<anchor>&#19978;&#39029;<go method='post' href='fincycl.asp'><postfield name='page' value='" & (page-1) & "'/><postfield name='lingname' value='" & lingnam & "'/></go></anchor>"
End if
response.write "&#40;" &  Page & "&#47;" & objgbrs.PageCount & "&#41;" & "<br/>&#20849;" & objgbrs.RecordCount & "&#20010;"
response.write "<a href='#card2'>&#36339;&#39029;</a>"

 else
    Response.write "&#26242;&#26102;&#27809;&#26377;&#20320;&#24819;&#35201;&#30340;&#35789;&#35821;"
end if
objgbrs.close
Set objgbrs= Nothing
conn.close
set conn=nothing
%>
<br/>-------------<br/><a href='/bbs/scfu.asp?wap=<%=wap%>'>服务广场</a>
<br/><a href='/bbs/index.asp?wap=<%=wap%>'>社区首页</a>-<a href='/index.asp?wap=<%=wap%>'>首页</a>
</p>
</card>

<card id='card2' title='&#36339;&#39029;'>
<p>
<%
response.write "&#36339;&#21040;&#31532;&#65306;<input  name='page' value='1' format='*N'/><anchor>&#39029;&#65292;&#36339;&#21543;<go method='post' href='fincycl.asp'><postfield name='page' value='$(page)'/><postfield name='lingname' value='" & lingnam & "'/></go></anchor>"
%>
</p>
</card>
</wml>



