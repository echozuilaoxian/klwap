<% @LANGUAGE="VBSCRIPT" CODEPAGE="65001" %>
<% Response.ContentType="text/vnd.wap.wml; charset=utf-8" %>
<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<!--#include file="conn.inc"-->
<!--#include file="cnscucsb.asp"-->
<!--#include file="redtjnamecp.asp"-->
<wml>
<head>
<meta http-equiv="Cache-Control" content="max-age=0"/>
<meta http-equiv="Cache-Control" content="no-cache"/>
<meta http-equiv="Expires" content="Mon, 1 Jan 1990 00:00:00 GMT"/>
</head>
<%

if Cstr(Session("yxxecp"))<>"" or Session("cg")<>"" or Session("Counter")="pass_numbers_55556666" then
Action=request("Action")

if Action="" or Action="main" then Action="main"

if Action="main" then 
%>
	<card id="main" title="彩迷管理">
		<p>

<%
txt=request("txt")
if txt<>"" then txtt="where cstr(ids)="&txt&""
sql="select * from cpjf "&txtt&" order by ids desc"
set rs=server.createobject("adodb.recordset")
rs.open sql,myc,1,1
if rs.eof and rs.bof then
	response.write "暂无内容<br/>"
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
<b><u>管理彩迷</u></b><br/><small>当前共有</small><b><%=Rs.recordcount%></b><small>条记录</small>

<br/>-------------<br/>
<%do while not rs.eof and j<=listnum%>
<%
'========================================================================================
name=request.servervariables("script_name") 'name为当前文件名
'========================================================================================
tjhms=rs("ids")
%>
<b><u><a href="cai_Usegl.asp?id=<%=rs("ids")%>&amp;Action=kyzc&amp;SessionID=<%=request("SessionID")%>&amp;page=<%=page%>">[管理]</a></u></b><%=(j+(page-1)*listnum)%>:<a href="cai_Usegl.asp?id=<%=rs("ids")%>&amp;Action=kyzc&amp;SessionID=<%=request("SessionID")%>&amp;page=<%=page%>"><%=ubb(redtjnames)%></a>ID:<%=ubb(rs("ids"))%> [加入时间<%=ubb(rs("times"))%>]<br/>
<%rs.movenext 
j=j+1 
loop%>
<small><%=Rs.recordcount%>条记录|<%=listnum%> 条记录/页|共 <%=rs.pagecount%> 页 <br/></small>
      <% if page=1 then %>
      <%else%>
      <a href="cai_Usegl.asp?SessionID=<%=request("SessionID")%>&amp;Action=main">&lt;&lt;</a>
      <a href="cai_Usegl.asp?SessionID=<%=request("SessionID")%>&amp;page=<%=page-1%>&amp;Action=main"><b>[<%=page-1%>]</b></a>
      <%end if%><% if rs.pagecount=1 then%><%else%><b>[<%=page%>]</b><%end if%>
<% if rs.pagecount-page <> 0 then %>
      <a href="cai_Usegl.asp?SessionID=<%=request("SessionID")%>&amp;page=<%=page+1%>&amp;Action=main"><b>[<%=page+1%>]</b></a>
      <a href="cai_Usegl.asp?SessionID=<%=request("SessionID")%>&amp;page=<%=rs.pagecount%>&amp;Action=main">>></a>
	  <%end if%>
<%end if%>
<% if rs.pagecount-page <> 0 or page>1 then %>
      <br/>
	  <%end if%>

------------<br/>
搜索ID:<input name='txt<%=minute(now)%><%=second(now)%>' title='搜ID' size='7' value=''/>
<br/>
<anchor>确定
    <go href="Cai_Usegl.asp?SessionID=<%=request("SessionID")%>&amp;Action=main" method="post" accept-charset="utf-8">
        <postfield name="txt" value="$(txt<%=minute(now)%><%=second(now)%>)"/></go></anchor><br/>


------------<br/>
<a href="/BBS/LHC/Admin.Asp?SessionID=<%=request("SessionID")%>">返回彩票管理</a><br/>
<a href="/BBS/index.asp?SessionID=<%=request("SessionID")%>">返回社区首页</a><br/>
报时:<%=time%>
</p></card></wml>

<%
elseif Action="kyzc" then 
%>
	<card id="kyzc" title="彩迷资料管理">
		<p>

<%


id=request("id")
page=request("page")

set rs=Server.CreateObject("ADODB.Recordset")
rspl="select * from cpjf where ids="&id
rs.open rspl,myc,1,2
if rs.eof then 
response.write("没有该用户信息!<br/>")
else
tjhms=rs("ids")
%>
会员编号:<%=ubb(rs("ids"))%><br/>
会员昵称:<%=ubb(redtjnames)%><br/>
拥有港币:<%=ubb(rs("usejf"))%><br/>
------------<br/>
<b>特码:</b>总下注<b><u><%=ubb(rs("tmmrjf"))%></u></b>港币-总中奖<b><u><%=ubb(rs("tmjf"))%></u></b>港币<br/>
<b>生肖:</b>总下注<b><u><%=ubb(rs("sxmrjf"))%></u></b>港币-总中奖<b><u><%=ubb(rs("sxjf"))%></u></b>港币<br/>
<b>单双:</b>总下注<b><u><%=ubb(rs("dsmrjf"))%></u></b>港币-总中奖<b><u><%=ubb(rs("dsjf"))%></u></b>港币<br/>
<b>波色:</b>总下注<b><u><%=ubb(rs("psmrjf"))%></u></b>港币-总中奖<b><u><%=ubb(rs("psjf"))%></u></b>港币<br/>
<b>大小:</b>总下注<b><u><%=ubb(rs("dxmrjf"))%></u></b>港币-总中奖<b><u><%=ubb(rs("dxjf"))%></u></b>港币<br/>
<b>五行:</b>总下注<b><u><%=ubb(rs("wxmrjf"))%></u></b>港币-总中奖<b><u><%=ubb(rs("wxjf"))%></u></b>港币<br/>
-----<br/>
<b>历史投注累计:</b><b><%=ubb(rs("cmrjf"))%></b>港币<br/>
<b>历史中奖累计:</b><b><%=ubb(rs("czjjf"))%></b>港币<br/>
<b>历史赢利累计:</b><b><%=rs("czjjf")-rs("cmrjf")%></b>港币<br/>
------------<br/>
<a href="Cai_Usegl.asp?SessionID=<%=request("SessionID")%>&amp;id=<%=ubb(rs("ids"))%>&amp;Action=kyaa&amp;page=<%=page%>">编辑该彩迷资料</a><br/>
<a href="Cai_Usegl.asp?SessionID=<%=request("SessionID")%>&amp;id=<%=ubb(rs("ids"))%>&amp;Action=del&amp;page=<%=page%>">删除该彩迷资料</a><br/>
------------<br/>
<%end if%>
<a href="Cai_Usegl.asp?SessionID=<%=request("SessionID")%>&amp;Action=main&amp;page=<%=page%>">返回上级面页</a><br/>

<a href="/BBS/LHC/Admin.Asp?SessionID=<%=request("SessionID")%>">返回彩票管理</a><br/>
<a href="/BBS/index.asp?SessionID=<%=request("SessionID")%>">返回社区首页</a><br/>
报时:<%=time%>
</p></card></wml>

<%
elseif Action="kyaa" then 
%>
	<card id="kyaa" title="编辑彩迷资料">
		<p>
<%

id=ubb(request("id"))
page=usb(request("page"))
set rs=Server.CreateObject("ADODB.Recordset")
rspl="select * from cpjf where ids="&id
rs.open rspl,myc,1,2%>

港币数量:<input name='usejf<%=minute(now)%><%=second(now)%>' title='社区头像' value='<%=rs("usejf")%>'/><br/>
特码总注:<input name='tmmrjf<%=minute(now)%><%=second(now)%>' title='社区头像' value='<%=rs("tmmrjf")%>'/><br/>
生肖总注:<input name='sxmrjf<%=minute(now)%><%=second(now)%>' title='社区头像' value='<%=rs("sxmrjf")%>'/><br/>
单双总注:<input name='dsmrjf<%=minute(now)%><%=second(now)%>' title='社区头像' value='<%=rs("dsmrjf")%>'/><br/>
波色总注:<input name='psmrjf<%=minute(now)%><%=second(now)%>' title='社区头像' value='<%=rs("psmrjf")%>'/><br/>
大小总注:<input name='dxmrjf<%=minute(now)%><%=second(now)%>' title='社区头像' value='<%=rs("dxmrjf")%>'/><br/>
五行总注:<input name='wxmrjf<%=minute(now)%><%=second(now)%>' title='社区头像' value='<%=rs("wxmrjf")%>'/><br/>
特码中奖:<input name='tmjf<%=minute(now)%><%=second(now)%>' title='社区头像' value='<%=rs("tmjf")%>'/><br/>
生肖中奖:<input name='sxjf<%=minute(now)%><%=second(now)%>' title='社区头像' value='<%=rs("sxjf")%>'/><br/>
单双中奖:<input name='dsjf<%=minute(now)%><%=second(now)%>' title='社区头像' value='<%=rs("dsjf")%>'/><br/>
波色中奖:<input name='psjf<%=minute(now)%><%=second(now)%>' title='社区头像' value='<%=rs("psjf")%>'/><br/>
大小中奖:<input name='dxjf<%=minute(now)%><%=second(now)%>' title='社区头像' value='<%=rs("dxjf")%>'/><br/>
五行中奖:<input name='wxjf<%=minute(now)%><%=second(now)%>' title='社区头像' value='<%=rs("wxjf")%>'/><br/>
投注累计:<input name='cmrjf<%=minute(now)%><%=second(now)%>' title='社区头像' value='<%=rs("cmrjf")%>'/><br/>
中奖累计:<input name='czjjf<%=minute(now)%><%=second(now)%>' title='社区头像' value='<%=rs("czjjf")%>'/><br/>

<anchor>确定修改<go href='Cai_Usegl.asp?Action=save&amp;SessionID=<%=request("SessionID")%>' method='post' accept-charset='utf-8'>
<postfield name='usejf' value='$(usejf<%=minute(now)%><%=second(now)%>)'/>
<postfield name='tmmrjf' value='$(tmmrjf<%=minute(now)%><%=second(now)%>)'/>
<postfield name='sxmrjf' value='$(sxmrjf<%=minute(now)%><%=second(now)%>)'/>
<postfield name='dsmrjf' value='$(dsmrjf<%=minute(now)%><%=second(now)%>)'/>
<postfield name='psmrjf' value='$(psmrjf<%=minute(now)%><%=second(now)%>)'/>
<postfield name='dxmrjf' value='$(dxmrjf<%=minute(now)%><%=second(now)%>)'/>
<postfield name='wxmrjf' value='$(wxmrjf<%=minute(now)%><%=second(now)%>)'/>
<postfield name='tmjf' value='$(tmjf<%=minute(now)%><%=second(now)%>)'/>
<postfield name='sxjf' value='$(sxjf<%=minute(now)%><%=second(now)%>)'/>
<postfield name='dsjf' value='$(dsjf<%=minute(now)%><%=second(now)%>)'/>
<postfield name='psjf' value='$(psjf<%=minute(now)%><%=second(now)%>)'/>
<postfield name='dxjf' value='$(dxjf<%=minute(now)%><%=second(now)%>)'/>
<postfield name='wxjf' value='$(wxjf<%=minute(now)%><%=second(now)%>)'/>
<postfield name='cmrjf' value='$(cmrjf<%=minute(now)%><%=second(now)%>)'/>
<postfield name='czjjf' value='$(czjjf<%=minute(now)%><%=second(now)%>)'/>
<postfield name='id' value='<%=rs("ids")%>'/>
</go></anchor><br/>------------<br/>
<a href="Cai_Usegl.asp?SessionID=<%=request("SessionID")%>&amp;id=<%=id%>&amp;Action=kyzc&amp;page=<%=page%>">返回上级面页</a><br/>
<a href="/BBS/LHC/Admin.Asp?SessionID=<%=request("SessionID")%>">返回彩票管理</a><br/>
<a href="/BBS/index.asp?SessionID=<%=request("SessionID")%>">返回社区首页</a><br/>
报时:<%=time%>
</p></card></wml>

<%
elseif Action="save" then 
%>
	<card id="save" title="编辑彩迷资料">
		<p>
<%

id=usb(request("id"))
tjhms=usb(request("id"))

page=usb(request("page"))

usejf=usb(request("usejf"))
tmmrjf=usb(request("tmmrjf"))
sxmrjf=usb(request("sxmrjf"))
dsmrjf=usb(request("dsmrjf"))
psmrjf=usb(request("psmrjf"))
dxmrjf=usb(request("dxmrjf"))
wxmrjf=usb(request("wxmrjf"))
tmjf=usb(request("tmjf"))
sxjf=usb(request("sxjf"))
dsjf=usb(request("dsjf"))
psjf=usb(request("psjf"))
dxjf=usb(request("dxjf"))
wxjf=usb(request("wxjf"))
cmrjf=usb(request("cmrjf"))
czjjf=usb(request("czjjf"))


set rs=Server.CreateObject("ADODB.Recordset")
rspl="select * from cpjf where ids="&id
rs.open rspl,myc,1,2
if usejf<>"" then rs("usejf")=usejf
if tmmrjf<>"" then rs("tmmrjf")=tmmrjf
if sxmrjf<>"" then rs("sxmrjf")=sxmrjf
if dsmrjf<>"" then rs("dsmrjf")=dsmrjf
if psmrjf<>"" then rs("psmrjf")=psmrjf
if dxmrjf<>"" then rs("dxmrjf")=dxmrjf
if wxmrjf<>"" then rs("wxmrjf")=wxmrjf

if tmjf<>"" then rs("tmjf")=tmjf
if sxjf<>"" then rs("sxjf")=sxjf
if dsjf<>"" then rs("dsjf")=dsjf
if psjf<>"" then rs("psjf")=psjf
if dxjf<>"" then rs("dxjf")=dxjf
if wxjf<>"" then rs("wxjf")=wxjf

if cmrjf<>"" then rs("cmrjf")=cmrjf
if czjjf<>"" then rs("czjjf")=czjjf
rs.update
'---关闭数据----
rs.close
set rs=nothing
%>
成功修改会员<u>[<%=ubb(redtjnames)%>]</u>的六合资料<br/>------------<br/>
<a href="/BBS/LHC/cai_Usegl.asp?SessionID=<%=request("SessionID")%>&amp;page=<%=page%>">返回会员管理</a><br/>

<a href="/BBS/LHC/Admin.Asp?SessionID=<%=request("SessionID")%>">返回彩票管理</a><br/>
<a href="/BBS/index.asp?SessionID=<%=request("SessionID")%>">返回社区首页</a><br/>
报时:<%=time%>
</p></card></wml>

<%
elseif Action="del" then 
%>
	<card id="del" title="删除彩迷资料">
		<p>
<%

id=usb(request("id"))
tjhms=usb(request("id"))
page=usb(request("page"))

%>
是否删除<u>[<%=ubb(redtjnames)%>]</u>的六合资料?<br/>
<a href="Cai_Usegl.asp?SessionID=<%=request("SessionID")%>&amp;id=<%=ubb(id)%>&amp;Action=delok&amp;page=<%=page%>">是</a><br/>
<a href="Cai_Usegl.asp?SessionID=<%=request("SessionID")%>&amp;id=<%=ubb(id)%>&amp;Action=kyzc&amp;page=<%=page%>">否</a><br/>------------<br/>

<a href="/BBS/LHC/Admin.Asp?SessionID=<%=request("SessionID")%>">返回彩票管理</a><br/>
<a href="/BBS/index.asp?SessionID=<%=request("SessionID")%>">返回社区首页</a><br/>
报时:<%=time%>
</p></card></wml>

<%
elseif Action="delok" then 
%>
	<card id="delok" title="删除彩迷资料">
		<p>
<%

id=usb(request("id"))
tjhms=usb(request("id"))
page=usb(request("page"))

 sql="Delete FROM cpjf where CStr(ids)='" & id & "'"
 myc.execute(sql)

 sql="Delete FROM cds where CStr(ids)='" & id & "'"
 myc.execute(sql)

 sql="Delete FROM cdx where CStr(ids)='" & id & "'"
 myc.execute(sql)

 sql="Delete FROM csx where CStr(ids)='" & id & "'"
 myc.execute(sql)

 sql="Delete FROM cps where CStr(ids)='" & id & "'"
 myc.execute(sql)

 sql="Delete FROM cwx where CStr(ids)='" & id & "'"
 myc.execute(sql)

 sql="Delete FROM ctm where CStr(ids)='" & id & "'"
 myc.execute(sql)
%>

成功删除<u>[<%=ubb(redtjnames)%>]</u>的六合资料<br/>------------<br/>
<a href="/BBS/LHC/Admin.Asp?SessionID=<%=request("SessionID")%>">返回彩票管理</a><br/>
<a href="/BBS/index.asp?SessionID=<%=request("SessionID")%>">返回社区首页</a><br/>
报时:<%=time%>
</p></card></wml>


<%
elseif Action="delky" then 
%>
	<card id="delsj" title="请选择要删除的数据">
		<p>

<a href="Cai_Usegl.asp?SessionID=<%=request("SessionID")%>&amp;Action=delsj&amp;page=<%=page%>">清空所有开奖记录</a><br/>
<a href="Cai_Usegl.asp?SessionID=<%=request("SessionID")%>&amp;Action=delcmsj&amp;page=<%=page%>">清空所有投注记录</a><br/>
<a href="Cai_Usegl.asp?SessionID=<%=request("SessionID")%>&amp;Action=delhy&amp;page=<%=page%>">清空所有彩迷资料</a><br/>
<a href="Cai_Usegl.asp?SessionID=<%=request("SessionID")%>&amp;Action=delsysj&amp;page=<%=page%>">清空所有记录</a><br/>
------------<br/>
<a href="/BBS/LHC/Admin.Asp?SessionID=<%=request("SessionID")%>">返回彩票管理</a><br/>
<a href="/BBS/index.asp?SessionID=<%=request("SessionID")%>">返回社区首页</a><br/>
报时:<%=time%>
</p></card></wml>

<%
elseif Action="delcmsj" then 
%>

	<card id="delcmsj" title="清空彩迷所有投注记录">
		<p>

是否清空<u>彩迷所有投注记录</u>?<br/>
<a href="Cai_Usegl.asp?SessionID=<%=request("SessionID")%>&amp;Action=delcmsjok">是</a><br/>
<a href="/BBS/LHC/Admin.Asp?SessionID=<%=request("SessionID")%>">否</a><br/></p></card></wml>
<%
elseif Action="delcmsjok" then 
%>
	<card id="delcmsjok" title="彩迷所有投注记录">
		<p>

<%
 sql="Delete FROM cds"
 myc.execute(sql)
 sql="Delete FROM cdx"
 myc.execute(sql)
 sql="Delete FROM csx"
 myc.execute(sql)
 sql="Delete FROM cps"
 myc.execute(sql)
 sql="Delete FROM cwx"
 myc.execute(sql)
 sql="Delete FROM ctm"
 myc.execute(sql)
%>
成功删除<u>彩迷所有投注记录</u>!<br/>------------<br/>
<a href="/BBS/LHC/Admin.Asp?SessionID=<%=request("SessionID")%>">返回彩票管理</a><br/>
<a href="/BBS/index.asp?SessionID=<%=request("SessionID")%>">返回社区首页</a><br/>
报时:<%=time%>
</p></card></wml>

<%
elseif Action="delsysj" then 
%>

	<card id="delsysj" title="清空所有记录">
		<p>

是否清空<u>清空投注记录及开奖记录及彩迷资料记录</u>?<br/>
<a href="Cai_Usegl.asp?SessionID=<%=request("SessionID")%>&amp;Action=delsysjok">是</a><br/>
<a href="/BBS/LHC/Admin.Asp?SessionID=<%=request("SessionID")%>">否</a><br/></p></card></wml>
<%
elseif Action="delsysjok" then 
%>

	<card id="delsj" title="清空所有记录">
		<p>

<%
 sql="Delete FROM ckjhm "
 myc.execute(sql)

 sql="Delete FROM cpjf "
 myc.execute(sql)

 sql="Delete FROM cds"
 myc.execute(sql)

 sql="Delete FROM cdx"
 myc.execute(sql)

 sql="Delete FROM csx"
 myc.execute(sql)

 sql="Delete FROM cps"
 myc.execute(sql)

 sql="Delete FROM cwx"
 myc.execute(sql)

 sql="Delete FROM ctm"
 myc.execute(sql)
%>
成功删除<u>所有记录</u>!<br/>------------<br/>
<a href="/BBS/LHC/Admin.Asp?SessionID=<%=request("SessionID")%>">返回彩票管理</a><br/>
<a href="/BBS/index.asp?SessionID=<%=request("SessionID")%>">返回社区首页</a><br/>
报时:<%=time%>
</p></card></wml>

<%
elseif Action="delhy" then 
%>

	<card id="delhy" title="清空彩迷资料记录">
		<p>

是否清空<u>所有彩迷资料</u>?<br/>
<a href="Cai_Usegl.asp?SessionID=<%=request("SessionID")%>&amp;Action=delhyok">是</a><br/>
<a href="/BBS/LHC/Admin.Asp?SessionID=<%=request("SessionID")%>">否</a><br/></p></card></wml>
<%
elseif Action="delhyok" then 
%>
	<card id="delhyok" title="清空彩迷资料记录">
		<p>

<%
 sql="Delete FROM cpjf "
 myc.execute(sql)
%>

成功删除<u>所有彩迷资料</u>!<br/>------------<br/>
<a href="/BBS/LHC/Admin.Asp?SessionID=<%=request("SessionID")%>">返回彩票管理</a><br/>
<a href="/BBS/index.asp?SessionID=<%=request("SessionID")%>">返回社区首页</a><br/>
报时:<%=time%>
</p></card></wml>


<%
elseif Action="delsj" then 
%>

	<card id="delsj" title="清空开奖记录">
		<p>

是否清空<u>历史开奖记录</u>?<br/>
<a href="Cai_Usegl.asp?SessionID=<%=request("SessionID")%>&amp;Action=delsjok">是</a><br/>
<a href="/BBS/LHC/Admin.Asp?SessionID=<%=request("SessionID")%>">否</a><br/></p></card></wml>

<%
elseif Action="delsjok" then 
%>
	<card id="delsjok" title="清空开奖记录">
		<p>

<%
 sql="Delete FROM ckjhm "
 myc.execute(sql)
%>

成功删除<u>历史开奖记录</u>!<br/>------------<br/>
<a href="/BBS/LHC/Admin.Asp?SessionID=<%=request("SessionID")%>">返回彩票管理</a><br/>
<a href="/BBS/index.asp?SessionID=<%=request("SessionID")%>">返回社区首页</a><br/>
报时:<%=time%>
</p></card></wml>
<%
end if
end if
		myc.close
		set myc=nothing
%>
