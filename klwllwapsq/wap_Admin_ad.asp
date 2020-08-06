<% @LANGUAGE="VBSCRIPT" CODEPAGE="65001" %><% Response.ContentType="text/vnd.wap.wml; charset=utf-8" %><?xml version="1.0" encoding="utf-8"?><!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<!--#include file="conn.asp" -->
<!--#include file="check.asp" -->
<wml>
<head>
<meta http-equiv="Cache-Control" content="max-age=0"/>
<meta http-equiv="Cache-Control" content="no-cache"/>
<meta http-equiv="Expires" content="Mon, 1 Jan 1990 00:00:00 GMT"/>
</head>
<%
id=request.querystring("id")
page=Request("page")
kyzc=request("kyzc")
if kyzc=""  then
%>
<card id="main" title="管理所有广告" >
<p>
<%
strtmp=" true "
sql="select count(adid) as adidcount, sum(toall) as toallsum,sum(tojin) as tojinsum, sum(tozuo) as tozuosum, sum(toqian) as toqiansum from ad" &" where  " & strtmp
set unioncount=conn.execute (sql)

sql="select * from ad order by totime desc"
set rs=server.createobject("adodb.recordset")
rs.open sql,conn,1,1
if rs.eof and rs.bof then
	response.write "管理所有广告<br/>-------------<br/>暂无广告记录<br/>"
else

listnum=10
Rs.pagesize=listnum
page=Request("page")
if (page-Rs.pagecount) > 0 then
page=rs.pagecount
elseif page = "" or page < 1 then
page = 1
end if
rs.absolutepage=page
'编号的实现
j=rs.recordcount
j=j-(page-1)*listnum
j=1
nn=request("page")
if nn="" then
n=0
else
nn=nn-1
n=listnum*nn
end if%>
管理所有广告<small>当前共有</small><b><%=Rs.recordcount%></b><small>条记录</small><br/>
<%
 response.write "今日点击:<b>" & unioncount("tojinsum")  & "</b><br/>昨日点击:<b>"& unioncount("tozuosum")& "</b><br/>前日点击:<b>"& unioncount("toqiansum")& "</b><br/>累计点击:<b>"& unioncount("toallsum")& " </b> " 
%>
<br/>-------------<br/>
<%do while not rs.eof and j<=listnum%>
<%=(j+(page-1)*listnum)%>.<a href="wap_Admin_ad.asp?kyzc=adxx&amp;id=<%=rs("adid")%>&amp;page=<%=page%>&amp;adminmid=<%=request("adminmid")%>"><%=ubb(rs("adname"))%></a> (今<%=outHTM(rs("tojin"))%>/总<%=outHTM(rs("toall"))%>)<br/>
<%rs.movenext 
j=j+1 
loop%>
<small><%=Rs.recordcount%>条记录|<%=listnum%> 条记录/页|共 <%=rs.pagecount%> 页 <br/></small>
      <% if page=1 then %>
      <%else%>
      <a href="wap_Admin_ad.asp?adminmid=<%=request("adminmid")%>">&lt;&lt;</a>
      <a href="wap_Admin_ad.asp?adminmid=<%=request("adminmid")%>&amp;page=<%=page-1%>"><b>[<%=page-1%>]</b></a>
      <%end if%><% if rs.pagecount=1 then%><%else%><b>[<%=page%>]</b><%end if%>
<% if rs.pagecount-page <> 0 then %>
      <a href="wap_Admin_ad.asp?adminmid=<%=request("adminmid")%>&amp;page=<%=page+1%>"><b>[<%=page+1%>]</b></a>
      <a href="wap_Admin_ad.asp?adminmid=<%=request("adminmid")%>&amp;page=<%=rs.pagecount%>">>></a>
	  <%end if%>
<%end if%>
<% if rs.pagecount-page <> 0 or page>1 then %>
      <br/>
	  <%end if%>
------------<br/>
<a href="wap_Admin_ad.asp?kyzc=add&amp;adminmid=<%=request("adminmid")%>">添加新广告</a><br/>

<%

rs.close
set rs=nothing

elseif kyzc="add"  then

%>
<card id="main" title="添加广告" >
<p>
添加广告<br/>
------------<br/>
广告名称:<input type="text" name="adName" emptyok="true" /><br/>
广告地址:<input type="text" name="adContent" emptyok="true" /><br/>
广告公司:<select name="siteclass" value="1"><br/>
<option value="1">赢点</option>
<option value="2">宜告</option>
<option value="3">未知</option>
<option value="4">未知</option></select><br />

是否显示:<select name="IsViewSite" value="True"><br/>
<option value="True">是</option>
<option value="False">否</option></select><br />

广告分类:<select name="adHots" value="1"><br/>
<option value="1">点击类</option>
<option value="5">软件类</option>
<option value="9">共享类</option>
<option value="2">未分类</option></select><br />
<anchor>添加<go method="post" href="wap_Admin_ad.asp?kyzc=addcl&amp;adminmid=<%=request("adminmid")%>" accept-charset="UTF-8">
<postfield name="adName" value="$(adName)"/>
<postfield name="adContent" value="$(adContent)"/>
<postfield name="siteclass" value="$(siteclass)"/>
<postfield name="IsViewSite" value="$(IsViewSite)"/>
<postfield name="adHots" value="$(adHots)"/>
</go></anchor><br/>------------<br/>

<a href="wap_Admin_ad.asp?adminmid=<%=request("adminmid")%>">返回广告管理</a><br/>

 <%
elseif kyzc="addcl"  then
%>

<card id="main" title="添加广告" >
<p>
 <%
if session("Adminid")="1" then
adname=usb(request("adname"))
adContent=usb(request("adContent"))
adHots=request("adHots")
siteclass=request("siteclass")
IsViewSite=request("IsViewSite")

if adname="" or adContent="" or adHots="" then
Response.Write "广告名称,地址不能为空!<br/>"

else
set rs=server.createobject("adodb.recordset")
sql="select * from ad order by adid desc"
rs.open sql,conn,1,3
rs.addnew
rs("adname")=adname
rs("adContent")=adContent
rs("adHots")=adHots
rs("siteclass")=siteclass
rs("IsViewSite")=IsViewSite
rs.update
rs.close
set rs=nothing

Response.Write "成功添加！"&adname &"<br/>"
end if

else
Response.Write "欢迎参观本系统,请不要做任何修改,谢谢!<br/>"
end if
%>
-----------<br/>
<a href="wap_Admin_ad.asp?adminmid=<%=request("adminmid")%>">返回广告管理</a><br/>

<%
elseif kyzc="addxg"  then
%>
<card id="card1" title="修改广告">
<%
id=request("id")
page=request("page")
  set objgbrs=Server.CreateObject("ADODB.Recordset")
  ssql="select * from ad Where CStr(adid)="&id
  objgbrs.open ssql,conn,1,3
  if objgbrs.eof then
      response.write "<p>ID错误</p></card></wml>"
      conn.close
      set objgbrs=nothing
      set conn=nothing
      response.end
  end if
%>
<onevent type="onenterforward">
<refresh>
<setvar name="adName" value="<% =ubb(objgbrs("adName")) %>"/>
<setvar name="adContent" value="<% =ubb(objgbrs("adContent"))%>"/>
<setvar name="adHots" value="<% =objgbrs("adHots") %>"/>
<setvar name="siteclass" value="<% =objgbrs("siteclass") %>"/>
<setvar name="IsViewSite" value="<% =objgbrs("IsViewSite") %>"/>
</refresh>
</onevent>
<p align="left">
修改_<% =ubb(objgbrs("adname")) %>广告<br/>
----------<br/>
广告名称:<input type="text" name="adName" emptyok="true" value="<% =ubb(objgbrs("adname")) %>"/><br/>
广告地址:<input type="text" name="adContent" emptyok="true" value="<% =ubb(objgbrs("adContent")) %>"/><br/>
公司分类:<select name="siteclass" value="<% =objgbrs("siteclass") %>"><br/>
<option value="1">赢点</option>
<option value="2">宜告</option>
<option value="3">未知</option>
<option value="4">未知</option></select><br />
是否显示:<select name="IsViewSite" value="<% =objgbrs("IsViewSite") %>">
<option value="True">是</option>
<option value="False">否</option></select><br />
广告分类:<select name="adHots" value="<% =objgbrs("adHots") %>"><br/>
<option value="1">点击类</option>
<option value="5">软件类</option>
<option value="9">共享类</option>
<option value="2">未分类</option></select><br />
<anchor>修改
<go method="post" href='wap_Admin_ad.asp?kyzc=xgcl&amp;adminmid=<%=request("adminmid")%>'>
<postfield name="adName" value="$(adName)"/>
<postfield name="adContent" value="$(adContent)"/>
<postfield name="siteclass" value="$(siteclass)"/>
<postfield name="IsViewSite" value="$(IsViewSite)"/>
<postfield name="adHots" value="$(adHots)"/>
<postfield name="page" value="<% =page %>"/>
<postfield name="id" value="<% =objgbrs("adid") %>"/>
</go>
</anchor>
<br/>
<%
response.write "------------<br/>"
response.write("<a href='wap_Admin_ad.asp?adminmid="&request("adminmid")&"'>返回广告管理</a><br />")
      objgbrs.close
      set objgbrs=nothing

elseif kyzc="xgcl"  then
%>
<card id="card1" title="修改广告">
<p align="left">
<%
page=request("page")
id=request("id")
adname=usb(request("adname"))
adContent=usb(request("adContent"))
adHots=request("adHots")
siteclass=request("siteclass")
IsViewSite=request("IsViewSite")
if session("Adminid")="1" then

if adname="" or adContent="" or adHots="" then
Response.Write "广告名称,地址不能为空!<br/>"

else
set rs=server.createobject("adodb.recordset")
sql="select * from ad Where CStr(adid)="&id
rs.open sql,conn,1,3

rs("adname")=adname
rs("adContent")=adContent
rs("adHots")=adHots
rs("siteclass")=siteclass
rs("IsViewSite")=IsViewSite
rs.update
rs.close
set rs=nothing

Response.Write "成功修改！"&adname &"<br/>"



end if

else
Response.Write "欢迎参观本系统,请不要做任何修改,谢谢!<br/>"
end if
%>
<a href="wap_Admin_ad.asp?kyzc=adxx&amp;Action=y&amp;id=<%=id%>&amp;page=<%=page%>&amp;adminmid=<%=request("adminmid")%>">查看广告</a><br />
<%
response.write "------------<br/>"
response.write("<a href='wap_Admin_ad.asp?adminmid="&request("adminmid")&"'>返回广告管理</a><br />")

elseif kyzc="adxx"  then
%>
<card id="card1" title="广告详情">
<%
id=request("id")
page=request("page")

  set objgbrs=Server.CreateObject("ADODB.Recordset")
  ssql="select * from ad Where CStr(adid)='" & id &"'"
  objgbrs.open ssql,conn,1,3
  if objgbrs.eof then
      response.write "<p>ID错误</p></card></wml>"
      conn.close
      set objgbrs=nothing
      set conn=nothing
      response.end
  end if
%>
<p align="left">
广告_<% =ubb(objgbrs("adname")) %>_详情<br/>
----------<br/>
<%
'========================================================================================
name=request.servervariables("script_name") 'name为当前文件名
'========================================================================================
		If objgbrs("siteclass")=1 Then fen="赢点"
		If objgbrs("siteclass")=2 Then fen="宜告"
		If objgbrs("siteclass")=3 Then fen="未知"
		If objgbrs("siteclass")=4 Then fen="未知"
		If objgbrs("IsViewSite")=True Then xin="是"
		If objgbrs("IsViewSite")=False Then xin="否"
		If objgbrs("adHots")=1 Then adHots="点击类"
		If objgbrs("adHots")=2 Then adHots="分成类"
		If objgbrs("adHots")=5 Then adHots="软件类"
		If objgbrs("adHots")=9 Then adHots="共享类"

%>
广告编号：<b><u><%=ubb(objgbrs("adid"))%></u></b><br />
广告名称：<b><u><%=ubb(objgbrs("adname"))%></u></b><br />
广告地址：<b><u><%=ubb(objgbrs("adContent"))%></u></b><br />
广告公司：<b><u><%=ubb(fen)%></u></b><br />
广告分类：<b><u><%=adHots%></u></b><br />
今日点击：<b><u><%=ubb(objgbrs("tojin"))%></u></b><br />
昨日点击：<b><u><%=ubb(objgbrs("tozuo"))%></u></b><br />
前日点击：<b><u><%=ubb(objgbrs("toqian"))%></u></b><br />
点击总量：<b><u><%=ubb(objgbrs("toall"))%></u></b><br />
是否显示：<b><u><%=ubb(xin)%></u></b><br />
最后出站：<b><u><%=ubb(objgbrs("totime"))%></u></b><br />

<a href="wap_Admin_ad.asp?kyzc=Del&amp;id=<%=objgbrs("adid")%>&amp;page=<%=page%>&amp;adminmid=<%=request("adminmid")%>">直接删除</a>|<a href="wap_Admin_ad.asp?kyzc=addxg&amp;id=<%=objgbrs("adid")%>&amp;pagei=<%=pagei%>&amp;adminmid=<%=request("adminmid")%>">修改广告</a><br/>
<%
response.write "------------<br/>"
response.write("<a href='wap_Admin_ad.asp?adminmid="&request("adminmid")&"'>返回广告管理</a><br />")

objgbrs.close
set objgbrs=nothing


elseif kyzc="Del"  then
%>
<card id="card1" title="删除广告">
<p>
<%
if session("Adminid")="1" then
id=request("id")
page=request("page")

Action = request("Action")
If Action="" Then
%>
删除后不可恢复.确定删除吗?<br />
<a href="wap_Admin_ad.asp?kyzc=Del&amp;Action=y&amp;id=<%=id%>&amp;page=<%=page%>&amp;adminmid=<%=request("adminmid")%>">删除</a><br />
<a href="wap_Admin_ad.asp?kyzc=adxx&amp;Action=y&amp;id=<%=id%>&amp;page=<%=page%>&amp;adminmid=<%=request("adminmid")%>">取消</a><br />
<%
else
sql="Delete FROM ad WHERE adid="&id
conn.execute(sql)

response.write("删除成功!<br />")
  end if
else
Response.Write "欢迎参观本系统,请不要做任何修改,谢谢!<br/>"
  end if
response.write "------------<br/>"

response.write("<a href='wap_Admin_ad.asp?adminmid="&request("adminmid")&"'>返回广告管理</a><br />")

else
%>
<card id="card1" title="系统提示">
<p>
请不要提交非法参数!<br />
<%
  end if

response.write("<a href='wapadmin_index.asp?adminmid="&request("adminmid")&"'>返回管理首页</a><br />")
%>
<%
conn.close
set conn=nothing
%>
</p></card></wml>



