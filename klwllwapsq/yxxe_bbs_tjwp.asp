<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<%response.buffer=true%>
<%Response.ContentType = "text/vnd.wap.wml; charset=utf-8"%>
<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<!--#include file="conn.asp"-->
<!--#include FILE="check.asp"-->
<wml>
<head>
<meta http-equiv="Cache-Control" content="no-Cache"/>
<meta http-equiv="Cache-Control" content="max-age=0"/>
<meta http-equiv="Expires" content="Mon, 1 Jan 1990 00:00:00 GMT"/>
</head>
<card id="main" title="社区物品管理" >
<p>
<%
cw=dlubb(request("cw"))
scss=dlubb(request("scss"))

if scss="15" then
yname=usb(request("yname"))
tname=usb(request("tname"))
niayo=usb(request("niayo"))
xyyz=usb(request("xyyz"))
xclink=usb(request("xclink"))
fenlei=usb(request("fenlei"))
if session("Adminid")="1" then
if yname="" then response.redirect "yxxe_bbs_tjwp.asp?adminmid="&request("adminmid")&"&cw=1"
if xyyz="" then response.redirect "yxxe_bbs_tjwp.asp?adminmid="&request("adminmid")&"&cw=1"
%>
<%if cw="1" then%>
*********<br/>
啊哦，出错了<br/>
各项不能为空<br/>
*********<br/>
<%else
set rs=Server.CreateObject("ADODB.Recordset")
rspl="select * from gift order by id asc"
rs.open rspl,conn,1,2
rs.addnew
if yname<>"" then rs("yname")=yname
if xyyz<>"" then rs("xyyz")=xyyz
if fenlei<>"" then rs("fenlei")=fenlei
rs.update
'---关闭数据----
rs.close
set rs=nothing
end if
%>
成功增加名为<u>[<%=yname%>]</u>的物品<br/>
<%
else
Response.Write "欢迎参观本系统,请不要做任何修改,谢谢!<br/>"
end if
%>

<%elseif scss="14" then%>
添加社区物品<br/>-------------<br/>
注：添加商品后，请把对应的图片添加到该文件夹<br/>
物品名称:<input name='yname' title='物品名称'/><br/>
物品价格:<input name='xyyz' title='物品价格'/><br/>
物品分类:<select name='fenlei<%=minute(now)%><%=second(now)%>' value='1'>
<option value='9'>汽车专区</option>
<option value='10'>地产专区</option>
</select><br/>
<anchor>[确定提交]<go href='yxxe_bbs_tjwp.asp?adminmid=<%=request("adminmid")%>' method='post' accept-charset='utf-8'>
<postfield name='yname' value='$(yname)'/>
<postfield name='xyyz' value='$(xyyz)'/>
<postfield name='fenlei' value='$(fenlei<%=minute(now)%><%=second(now)%>)'/>
<postfield name='scss' value='15'/>
</go></anchor><br/>
<%
elseif scss="12" then
id=request("id")
set rsx=Server.CreateObject("ADODB.Recordset")
rspx="select * from gift where CStr(id)='" & id & "'"
rsx.open rspx,conn,1,2
if rsx.eof and rsx.bof then
	response.write "-------------<br/>暂无内容"
else
%>
修改物品:<%=ubb(rsx("yname"))%><br/>-------------<br/>
物品名称:<input name='yname<%=minute(now)%><%=second(now)%>' value='<%=ubb(rsx("yname"))%>'/><br/>
物品价格:<input name='xyyz<%=minute(now)%><%=second(now)%>' value='<%=ubb(rsx("xyyz"))%>'/><br/>
物品分类:<select name='fenlei<%=minute(now)%><%=second(now)%>' value='<%=ubb(rsx("fenlei"))%>'>
<option value='9'>汽车专区</option>
<option value='10'>房产专区</option>
</select><br/>
<anchor>[确定提交]<go href='yxxe_bbs_tjwp.asp?adminmid=<%=request("adminmid")%>' method='post' accept-charset='utf-8'>
<postfield name='yname' value='$(yname<%=minute(now)%><%=second(now)%>)'/>
<postfield name='xyyz' value='$(xyyz<%=minute(now)%><%=second(now)%>)'/>
<postfield name='fenlei' value='$(fenlei<%=minute(now)%><%=second(now)%>)'/>
<postfield name='ids' value='<%=rsx("id")%>'/>
<postfield name='scss' value='11'/>
</go></anchor><br/>
<%
rsx.close
set rsx=nothing
end if

elseif scss="11" then

yname=usb(request("yname"))
xyyz=usb(request("xyyz"))
fenlei=usb(request("fenlei"))
ids=usb(request("ids"))

set rsk=Server.CreateObject("ADODB.Recordset")
rsplk="select * from gift where id="&ids
rsk.open rsplk,conn,1,2
if yname<>"" then rsk("yname")=yname
if xyyz<>"" then rsk("xyyz")=xyyz
if fenlei<>"" then rsk("fenlei")=fenlei
rsk.update
'---关闭数据----
rsk.close
set rsk=nothing
%>
成功编辑名为<u>[<%=yname%>]</u>的物品<br/>
<%
else

set rs=Server.CreateObject("ADODB.Recordset")
rspl="select * from gift order by id asc"
rs.open rspl,conn,1,2
if rs.eof and rs.bof then
	response.write "-------------<br/>暂无内容"
else
'分页的实现 
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
<b><u>管理物品</u></b><br/><small>当前共有</small><b><%=Rs.recordcount%></b><small>条记录</small><br/>
<%do while not rs.eof and j<=listnum%>
<a href="yxxe_bbs_tjwp.asp?id=<%=rs("id")%>&amp;adminmid=<%=request("adminmid")%>&amp;page=<%=page%>&amp;scss=12">[修改]</a><%=(j+(page-1)*listnum)%>:
<img src="/bbs/gift/<%=rs("id")%>.jpg" alt="wap"/><br/>
<%=ubb(rs("yname"))%>,<%=ubb(rs("xyyz"))%>金币<br/>
<%rs.movenext 
j=j+1 
loop%>
<small><%=Rs.recordcount%>条记录|<%=listnum%> 条记录/页|共 <%=rs.pagecount%> 页 <br/></small>
      <% if page=1 then %>
      <%else%>
      <a href="<%=name%>?adminmid=<%=request("adminmid")%>&amp;scss=<%=request("scss")%>">首页</a>
      <a href="<%=name%>?adminmid=<%=request("adminmid")%>&amp;page=<%=page-1%>&amp;scss=<%=request("scss")%>"><b>[<%=page-1%>]</b></a>
      <%end if%><% if rs.pagecount=1 then%><%else%><b>[<%=page%>]</b><%end if%>
<% if rs.pagecount-page <> 0 then %>
      <a href="<%=name%>?adminmid=<%=request("adminmid")%>&amp;page=<%=page+1%>&amp;scss=<%=request("scss")%>"><b>[<%=page+1%>]</b></a>
      <a href="<%=name%>?adminmid=<%=request("adminmid")%>&amp;page=<%=rs.pagecount%>&amp;scss=<%=request("scss")%>">尾页</a>
	  <%end if%>
<%end if%>
<% if rs.pagecount-page <> 0 or page>1 then %>
      <br/>
	  <%end if%>
<%
rs.close
set rs=nothing
end if%>
----------<br/>
<a href="yxxe_bbs_tjwp.asp?adminmid=<%=request("adminmid")%>&amp;scss=13">返回物品管理</a><br/>
<a href="yxxe_bbs_tjwp.asp?adminmid=<%=request("adminmid")%>&amp;scss=14">添加新的物品</a><br/>
<a href="wapAdmin_bbs.asp?adminmid=<%=request("adminmid")%>">返回社区设计</a><br/>
<a href="wapAdmin_index.asp?adminmid=<%=request("adminmid")%>">返回管理首页</a><br/>
报时:<%=time%>
</p></card></wml>
<%
conn.close
set conn=nothing%>