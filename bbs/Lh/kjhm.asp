<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<%response.buffer=true%>
<%Response.ContentType = "text/vnd.wap.wml; charset=utf-8"%>
<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<!--#INCLUDE VIRTUAL="/bbs/reg/useregs.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/public/codeun.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/reg/ltonline.asp"-->
<wml>
<head>
<meta http-equiv="Cache-Control" content="no-Cache"/>
<meta http-equiv="Cache-Control" content="max-age=0"/>
<meta http-equiv="Expires" content="Mon, 1 Jan 1990 00:00:00 GMT"/>
</head>
<card id="main" title="后台管理-开奖操作" >
<p>
<%
dim ky,kyzc
  ky=request.querystring("ky")
  kyzc=request.querystring("kyzc")
  if ky="" or ky>3 or ky<1 then
	ky=1
  end if

SessionID=request.querystring("SessionID")
if SessionID="" then SessionID=Session("SessionID")
if Session("zh")="wap" then
       Session("returnuppath")=Request.ServerVariables("PATH_INFO") & "?ky=" & ky & ""
        response.redirect "/BBS/UseLogin.asp?SessionID="&SessionID&""
     response.end
    End if

iduse=Session("useid")
if lycount>0 then
Response.write "<a href='/bbs/public/ckly.asp?SessionID=" & SessionID & "'>&#x60A8;&#x6709;(" & lycount & ")&#x6761;&#x65B0;&#x4FE1;&#x606F;!</a><br/><br/>"
       Session("returnuppath")=Request.ServerVariables("PATH_INFO") & "?ky=" & ky & ""
End if

set objgbrc=Server.CreateObject("ADODB.Recordset")
ssqlc="select * from ckjhm"
  objgbrc.open ssqlc,conn,1,1
if objgbrc.EOF then
idsx="1"
else
objgbrc.movelast
idsx=objgbrc("idss")+1
objgbrc.close
Set objgbrc= Nothing
End if

if Cstr(Session("yxxezb"))<>"" or Cstr(Session("yxxexc"))<>"" or Session("Counter")="pass_numbers_55556666" then

if ky="1" then
%>
<a href="/BBS/LHC/Help.Asp?SessionID=<%=SessionID%>">请看-相关帮助</a><br/>
第<b><%=idsx%></b>期开奖操作<br/>
<%
if Systcpkg="1" then yxxe_net_kg="开放|<a href='/bbs/LHC/kg.asp?pp=2&amp;SessionID="&SessionID&"'>关闭</a>"
if Systcpkg="2" then yxxe_net_kg="关闭|<a href='/bbs/LHC/kg.asp?pp=1&amp;SessionID="&SessionID&"'>开放</a>"
%>
投注状态:<b><%=yxxe_net_kg%></b><br/>
<%Response.write "<b>第"&idsx&"</b>期开奖时间:"&converttowidebaiti(Systemhy)&"<br/>"%>
----------------<br/>
开奖期数:<input  name="idd<%=minute(now)%><%=second(now)%>"  value="<%=idsx%>" format="*N"  size="7" maxlength="3"/><br/>
开奖平码:<input name="pm" emptyok="false" value="00.00.00.00.00.00"  maxlength="50"/><br/>
开奖特码:<input  name="tm"  value="1" format="*N"  size="20" maxlength="2"/><br/>
开奖生肖:<select name='sx' value='猪'>
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
开奖单双:<select name='ds' value='单'>
<option value="单">单</option>
<option value="双">双</option>
</select><br/>
开奖波色:<select name='ps' value='红'>
<option value="红">红波</option>
<option value="蓝">蓝波</option>
<option value="绿">绿波</option>
</select><br/>
开奖大小:<select name='dx' value='大'>
<option value="大">大</option>
<option value="小">小</option>
</select><br/>
开奖五行:<select name='wx' value='土'>
<option value="金">金行</option>
<option value="木">木行</option>
<option value="水">水行</option>
<option value="火">火行</option>
<option value="土">土行</option>
</select><br/>
<anchor>[-确定-]
<go method="post" href="/bbs/LHC/kjhm.asp?ky=2&amp;SessionID=<%=SessionID%>">
<postfield name="ctm" value="$(tm)"/>
<postfield name="cpm" value="$(pm)"/>
<postfield name="csx" value="$(sx)"/>
<postfield name="cds" value="$(ds)"/>
<postfield name="cps" value="$(ps)"/>
<postfield name="cdx" value="$(dx)"/>
<postfield name="cwx" value="$(wx)"/>
<postfield name="idd" value="$(idd<%=minute(now)%><%=second(now)%>)"/>
</go>
</anchor><br/>
<%elseif ky="2" then
idd=request("idd")
ctm=request("ctm")
csx=request("csx")
cds=request("cds")
cps=request("cps")
cdx=request("cdx")
cwx=request("cwx")
cpm=request("cpm")
ky=request("ky")
if ctm="" or csx="" or cds="" or cps="" or cdx="" or cwx="" or idd="" or cpm="" then
  response.write "各项不能为空,请正确添写开奖结果<br/><br/><a href='/BBS/LHC/index.Asp?SessionID=" &SessionID & "'>[虚拟博彩]</a><br/><a href='/bbs/index.asp?SessionID=" &SessionID & "'>[社区首页]</a></p></card></wml>"
response.end
end if
sql="insert into ckjhm(idss,pm,tm,ds,dx,ps,sx,wx)values("
sql=sql & sqlstr(idd) & "," 
sql=sql & sqlstr(cpm) & "," 
sql=sql & sqlstr(ctm) & "," 
sql=sql & sqlstr(cds) & "," 
sql=sql & sqlstr(cdx) & "," 
sql=sql & sqlstr(cps) & "," 
sql=sql & sqlstr(csx) & "," 
sql=sql & sqlstr(cwx) & ")"
   conn.execute sql
  response.write "第"&idd&"期 开奖完成,开奖结果："&cpm&"特"&ctm&"("&cds&"/"&cdx&"/"&cps&"/"&csx&"/"&cwx&")<br/>"
%>
<!--#INCLUDE VIRTUAL="/bbs/lhc/kjhmcl.asp"-->
<%end if%>
<%end if%>
--------------<br/>
<a href="/BBS/LHC/Sz.Asp?SessionID=<%=SessionID%>">设置下期开奖</a><br/>
<a href="/BBS/LHC/Help.Asp?SessionID=<%=SessionID%>">管理相关帮助</a><br/>
<a href="/BBS/LHC/Index.Asp?SessionID=<%=SessionID%>">返回虚拟博彩</a><br/>
<a href="/BBS/index.asp?SessionID=<%=SessionID%>">返回社区首页</a><br/>
报时:<%=time%>
</p></card></wml>
<%
conn.close
set conn=nothing%>