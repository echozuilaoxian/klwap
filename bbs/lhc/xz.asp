<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<%response.buffer=true%>
<%Response.ContentType = "text/vnd.wap.wml; charset=utf-8"%>
<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<!--#include file="conn.inc"-->
<!--#include file="cnscucsb.asp"-->
<wml>
<head>
<meta http-equiv="Cache-Control" content="no-Cache"/>
<meta http-equiv="Cache-Control" content="max-age=0"/>
<meta http-equiv="Expires" content="Mon, 1 Jan 1990 00:00:00 GMT"/>
</head>
<card id="main" title="我要投注" >
<p>
<%
dim ky,kyzc
  ky=request.querystring("ky")
  if ky="" or ky>7 or ky<1 then
	ky=7
  end if

if lycount>0 then
Response.write "<a href='/bbs/public/ckly.asp?SessionID=" & SessionID & "'>&#x60A8;&#x6709;(" & lycount & ")&#x6761;&#x65B0;&#x4FE1;&#x606F;!</a><br/><br/>"
       Session("returnuppath")=Request.ServerVariables("PATH_INFO") & "?ky="&ky&""
End if

set rs=Server.CreateObject("ADODB.Recordset")
rsQL="select * from cpjf where cstr(ids)='"&iduse& "'"
rs.open rsQL,myc,1,2
if rs.recordcount<1 then
rs.addnew
rs("ids")=iduse
rs.update
end if
usejf=rs("usejf")
        rs.Close
	Set rs=Nothing

set objgbrx=Server.CreateObject("ADODB.Recordset")
ssqlx="select * from ckjhm"
  objgbrx.open ssqlx,myc,1,1
if objgbrx.EOF then
idss="1"
idssl="1"
else
objgbrx.movelast
idss=objgbrx("idss")
pms=objgbrx("pm")
tms=objgbrx("tm")
dss=objgbrx("ds")
dxs=objgbrx("dx")
pss=objgbrx("ps")
sxs=objgbrx("sx")
wxs=objgbrx("wx")
idssl=objgbrx("idss")+1
end if

  select case ky
'================================
  case 1
  tip="特码投注"
  StrFont="特码投注[赔率41倍]<br/><a href='/BBS/LHC/xz.Asp?ky=2&amp;SessionID=" & SessionID & "'>生肖投注</a>[赔率11倍]<br/><a href='/BBS/LHC/xz.Asp?ky=3&amp;SessionID=" & SessionID & "'>单双投注</a>[赔率1.8倍]<br/><a href='/BBS/LHC/xz.Asp?ky=4&amp;SessionID=" & SessionID & "'>波色投注</a>[赔率2.6倍]<br/><a href='/BBS/LHC/xz.Asp?ky=5&amp;SessionID=" & SessionID & "'>大小投注</a>[赔率1.8倍]<br/><a href='/BBS/LHC/xz.Asp?ky=6&amp;SessionID=" & SessionID & "'>五行投注</a>[赔率5.0倍]<br/>"
'================================
  case 2
  tip="生肖投注"
  StrFont="<a href='/BBS/LHC/xz.Asp?ky=1&amp;SessionID=" & SessionID & "'>特码投注</a>[赔率41倍]<br/>生肖投注[赔率11倍]<br/><a href='/BBS/LHC/xz.Asp?ky=3&amp;SessionID=" & SessionID & "'>单双投注</a>[赔率1.8倍]<br/><a href='/BBS/LHC/xz.Asp?ky=4&amp;SessionID=" & SessionID & "'>波色投注</a>[赔率2.6倍]<br/><a href='/BBS/LHC/xz.Asp?ky=5&amp;SessionID=" & SessionID & "'>大小投注</a>[赔率1.8倍]<br/><a href='/BBS/LHC/xz.Asp?ky=6&amp;SessionID=" & SessionID & "'>五行投注</a>[赔率5.0倍]<br/>"
'================================
  case 3
  tip="单双投注"
  StrFont="<a href='/BBS/LHC/xz.Asp?ky=1&amp;SessionID=" & SessionID & "'>特码投注</a>[赔率41倍]<br/><a href='/BBS/LHC/xz.Asp?ky=2&amp;SessionID=" & SessionID & "'>生肖投注</a>[赔率11倍]<br/>单双投注[赔率1.8倍]<br/><a href='/BBS/LHC/xz.Asp?ky=4&amp;SessionID=" & SessionID & "'>波色投注</a>[赔率2.6倍]<br/><a href='/BBS/LHC/xz.Asp?ky=5&amp;SessionID=" & SessionID & "'>大小投注</a>[赔率1.8倍]<br/><a href='/BBS/LHC/xz.Asp?ky=6&amp;SessionID=" & SessionID & "'>五行投注</a>[赔率5.0倍]<br/>"
'================================
  case 4
  tip="波色投注"
  StrFont="<a href='/BBS/LHC/xz.Asp?ky=1&amp;SessionID=" & SessionID & "'>特码投注</a>[赔率41倍]<br/><a href='/BBS/LHC/xz.Asp?ky=2&amp;SessionID=" & SessionID & "'>生肖投注</a>[赔率11倍]<br/><a href='/BBS/LHC/xz.Asp?ky=3&amp;SessionID=" & SessionID & "'>单双投注</a>[赔率1.8倍]<br/>波色投注[赔率2.6倍]<br/><a href='/BBS/LHC/xz.Asp?ky=5&amp;SessionID=" & SessionID & "'>大小投注</a>[赔率1.8倍]<br/><a href='/BBS/LHC/xz.Asp?ky=6&amp;SessionID=" & SessionID & "'>五行投注</a>[赔率5.0倍]<br/>"
'================================
  case 5
  tip="大小投注"
  StrFont="<a href='/BBS/LHC/xz.Asp?ky=1&amp;SessionID=" & SessionID & "'>特码投注</a>[赔率41倍]<br/><a href='/BBS/LHC/xz.Asp?ky=2&amp;SessionID=" & SessionID & "'>生肖投注</a>[赔率11倍]<br/><a href='/BBS/LHC/xz.Asp?ky=3&amp;SessionID=" & SessionID & "'>单双投注</a>[赔率1.8倍]<br/><a href='/BBS/LHC/xz.Asp?ky=4&amp;SessionID=" & SessionID & "'>波色投注</a>[赔率2.6倍]<br/>大小投注[赔率1.8倍]<br/><a href='/BBS/LHC/xz.Asp?ky=6&amp;SessionID=" & SessionID & "'>五行投注</a>[赔率5.0倍]<br/>"
'================================
  case 6
  tip="五行投注"
  StrFont="<a href='/BBS/LHC/xz.Asp?ky=1&amp;SessionID=" & SessionID & "'>特码投注</a>[赔率41倍]<br/><a href='/BBS/LHC/xz.Asp?ky=2&amp;SessionID=" & SessionID & "'>生肖投注</a>[赔率11倍]<br/><a href='/BBS/LHC/xz.Asp?ky=3&amp;SessionID=" & SessionID & "'>单双投注</a>[赔率1.8倍]<br/><a href='/BBS/LHC/xz.Asp?ky=4&amp;SessionID=" & SessionID & "'>波色投注</a>[赔率2.6倍]<br/><a href='/BBS/LHC/xz.Asp?ky=5&amp;SessionID=" & SessionID & "'>大小投注</a>[赔率1.8倍]<br/>五行投注[赔率5.0倍]<br/>"
'================================
  case 7
  tip="我要下注"
  StrFont="<a href='/BBS/LHC/xz.Asp?ky=1&amp;SessionID=" & SessionID & "'>特码投注</a>[赔率41倍]<br/><a href='/BBS/LHC/xz.Asp?ky=2&amp;SessionID=" & SessionID & "'>生肖投注</a>[赔率11倍]<br/><a href='/BBS/LHC/xz.Asp?ky=3&amp;SessionID=" & SessionID & "'>单双投注</a>[赔率1.8倍]<br/><a href='/BBS/LHC/xz.Asp?ky=4&amp;SessionID=" & SessionID & "'>波色投注</a>[赔率2.6倍]<br/><a href='/BBS/LHC/xz.Asp?ky=5&amp;SessionID=" & SessionID & "'>大小投注</a>[赔率1.8倍]<br/><a href='/BBS/LHC/xz.Asp?ky=6&amp;SessionID=" & SessionID & "'>五行投注</a>[赔率5.0倍]"
  end select

Response.write "第"&idssl&"期"

if ky="1" then
%>
-<b><%=tip%></b><br/>
特码投注:<input  name="memo"  value="1" format="*N"  size="7" maxlength="2"/><br/>
购买金额:<input  name="ks"  value="100" format="*N" size="7" maxlength="10"/>
<br/><anchor>[-购买-]
<go method="post" href="/bbs/LHC/XZcl.asp?SessionID=<%=SessionID%>">
<postfield name="memo" value="$(memo)"/>
<postfield name="ks" value="$(ks)"/>
<postfield name="id" value="<%=idssl%>"/>
<postfield name="ky" value="<%=ky%>"/>
</go>
</anchor>
<%elseif ky="2" then%>
-<b><%=tip%></b><br/>
选择生肖:<select name='csx' value='猪'>
<option value="鼠">鼠</option>
<option value="牛">牛</option>
<option value="虎">虎</option>
<option value="兔">兔</option>
<option value="龙">龙</option>
<option value="蛇">蛇</option>
<option value="马">马</option>
<option value="羊">羊</option>
<option value="猴">猴</option>
<option value="鸡">鸡</option>
<option value="狗">狗</option>
<option value="猪">猪</option>
</select><br/>
购买金额:<input  name="ks"  value="100" format="*N" size="7" maxlength="10"/>
<br/><anchor>[-购买-]
<go method="post" href="/bbs/LHC/XZcl.asp?SessionID=<%=SessionID%>">
<postfield name="memo" value="$(csx)"/>
<postfield name="ks" value="$(ks)"/>
<postfield name="id" value="<%=idssl%>"/>
<postfield name="ky" value="<%=ky%>"/>
</go>
</anchor>

<%elseif ky="3" then%>
-<b><%=tip%></b><br/>
选择单双:<select name='ds' value='单'>
<option value="单">单</option>
<option value="双">双</option>
</select><br/>
购买金额:<input  name="ks"  value="100" format="*N" size="7" maxlength="10"/>
<br/><anchor>[-购买-]
<go method="post" href="/bbs/LHC/XZcl.asp?SessionID=<%=SessionID%>">
<postfield name="memo" value="$(ds)"/>
<postfield name="ks" value="$(ks)"/>
<postfield name="id" value="<%=idssl%>"/>
<postfield name="ky" value="<%=ky%>"/>
</go>
</anchor>

<%elseif ky="4" then%>
-<b><%=tip%></b><br/>
选择波色:<select name='ps' value='红波'>
<option value="红">红波</option>
<option value="蓝">蓝波</option>
<option value="绿">绿波</option>
</select><br/>
购买金额:<input  name="ks"  value="100" format="*N" size="7" maxlength="10"/>
<br/><anchor>[-购买-]
<go method="post" href="/bbs/LHC/XZcl.asp?SessionID=<%=SessionID%>">
<postfield name="memo" value="$(ps)"/>
<postfield name="ks" value="$(ks)"/>
<postfield name="id" value="<%=idssl%>"/>
<postfield name="ky" value="<%=ky%>"/>
</go>
</anchor>

<%elseif ky="5" then%>
-<b><%=tip%></b><br/>
选择大小:<select name='dx' value='大'>
<option value="大">大</option>
<option value="小">小</option>
</select><br/>
购买金额:<input  name="ks"  value="100" format="*N" size="7" maxlength="10"/>
<br/><anchor>[-购买-]
<go method="post" href="/bbs/LHC/XZcl.asp?SessionID=<%=SessionID%>">
<postfield name="memo" value="$(dx)"/>
<postfield name="ks" value="$(ks)"/>
<postfield name="id" value="<%=idssl%>"/>
<postfield name="ky" value="<%=ky%>"/>
</go>
</anchor>

<%elseif ky="6" then%>
-<b><%=tip%></b><br/>
选择五行:<select name='wx' value='土'>
<option value="金">金行</option>
<option value="木">木行</option>
<option value="水">水行</option>
<option value="火">火行</option>
<option value="土">土行</option>
</select><br/>
购买金额:<input  name="ks"  value="100" format="*N" size="7" maxlength="10"/>
<br/><anchor>[-购买-]
<go method="post" href="/bbs/LHC/XZcl.asp?SessionID=<%=SessionID%>">
<postfield name="memo" value="$(wx)"/>
<postfield name="ks" value="$(ks)"/>
<postfield name="id" value="<%=idssl%>"/>
<postfield name="ky" value="<%=ky%>"/>
</go>
</anchor>
<%elseif ky="7" then%>
欢迎您<b><%=ubb(gfdsa)%></b>!<br/>您现有<%=usejf%>港币<br/>--------------<br/>
<%response.write StrFont%>
<br/>与现实彩票同步.欢迎投注
<%end if%>
<br/>--------------<br/>
<%
if ky<>"7" then
response.write StrFont
response.write"--------------<br/>"
end if
if idss<>1 and ky<>"7" then
Response.write "<b>"&idss&"</b>期开奖"&pms&"特:<b>"&tms&"</b>("&wxs&"/"&dss&"/"&dxs&"/"&pss&"/"&sxs&")<br/>"
end if
%>
<a href="/BBS/LHC/Index.Asp?SessionID=<%=SessionID%>">返回虚拟博彩</a><br/>
<a href="/BBS/index.asp?SessionID=<%=SessionID%>">返回社区首页</a><br/>
报时:<%=time%>
</p></card></wml>
<%
myc.close
set myc=nothing%>