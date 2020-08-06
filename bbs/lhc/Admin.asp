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
<card id="main" title="<%=ubb(title)%>-后台管理" >
<p align='<%=duiji%>'>
<%
 if logo<>"" then 
    response.write "<img src='"&logo&"' alt='"&ubb(Url)&"'/><br/>"
end if
%>
<a href="/BBS/LHC/Admin.Asp?ky=zxsj&amp;SessionID=<%=SessionID%>">最新开奖数据</a><br/><%=Now%>
</p>
<p align="left">

<%
if Cstr(Session("yxxecp"))<>"" or Session("cg")<>"" or Session("Counter")="pass_numbers_55556666" then

dim ky,kyzc
  ky=request.querystring("ky")
  kyzc=request.querystring("kyzc")
  if ky="" then
	ky=1
  end if
if lycount>0 then
Response.write "<a href='/bbs/public/ckly.asp?SessionID=" & SessionID & "'>&#x60A8;&#x6709;(" & lycount & ")&#x6761;&#x65B0;&#x4FE1;&#x606F;!</a><br/><br/>"
       Session("returnuppath")=Request.ServerVariables("PATH_INFO") & "?ky="&ky&""
End if

set objgbrc=Server.CreateObject("ADODB.Recordset")
ssql6="select * from ckjhm"
  objgbrc.open ssql6,myc,1,1
if objgbrc.EOF then
idsx="1"
else
objgbrc.movelast
idsx=objgbrc("idss")+1
objgbrc.close
Set objgbrc= Nothing
End if

if ltmybz1<>"0" or mycjbz="1" then
if cpkg="1" then yxxe_net_kg="开放|<a href='/bbs/LHC/kg.asp?pp=2&amp;SessionID="&SessionID&"'>关闭</a>"
if cpkg="2" then yxxe_net_kg="关闭|<a href='/bbs/LHC/kg.asp?pp=1&amp;SessionID="&SessionID&"'>开放</a>"

if ky="1" then
%>
第<b><%=idsx%></b>期开奖操作<br/>
<%Response.write "<b>第"&idsx&"</b>期开奖时间:"&ubb(wel)&"<br/>"%>
----------------<br/>
开奖期数:<input  name="idd<%=minute(now)%><%=second(now)%>"  value="<%=idsx%>" format="*N"  size="7" maxlength="3"/><br/>
开奖平码:<input name="pm" emptyok="false" value="00.00.00.00.00.00"  maxlength="50"/><br/>
开奖特码:<input  name="tm"  value="1" format="*N"  size="20" maxlength="2"/><br/>
<anchor>确定开奖
<go method="post" href="/BBS/LHC/Admin.Asp?ky=2&amp;SessionID=<%=SessionID%>">
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

<%
elseif ky="heip" then
%>
管理帮助<br/>
-------------<br/>
关于:<b><u>投注状态:开放|关闭</u></b><br/>
如果是开奖日,请于晚上19:30左右进入后台点击关闭,这样网友就无法下注<br/>
<br/>
关于:<b><u>开奖期数:</u></b>没特殊原因不要变动！<br/>
如果要开奖必须得到当期真实的开奖数据,并且认真填写开奖数据,确认无误后点击“<b><u>确定开奖</u></b>”即开奖完毕！若点击“<b><u>确定开奖</u></b>”长时间没反应,也不能再次点击,你必须返回博彩首页看当期的期数是否对应,如果期数不变那就证明刚才的操作无效,可返回继续操作, 尽量在最早时间(以现实六合开奖时间为准)内开奖
<%
elseif ky="zxsj" then
%>
说明<br/>
-------------<br/>
该站是一个专业的六合站点.开奖时间很准确,进入可看到最新开奖数据<br/>
<a href='http://bm.viphk.net/index.asp?url=http://xhbao.cn'>确认进入</a><br/>
进入请不要点他们的连接.否则可能点到广告！<br/><br/><br/><br/><br/>
<a href="/BBS/LHC/Admin.Asp?SessionID=<%=SessionID%>">返回后台管理</a><br/>

<%elseif ky="2" then
ctm=request("ctm")
ctm=clng(ctm)
if ctm="1" then
csx="牛"
cds="单"
cps="红"
cdx="小"
cwx="火"
elseif ctm="2" then
csx="鼠"
cds="双"
cps="红"
cdx="小"
cwx="土"
elseif ctm="3" then
csx="猪"
cds="单"
cps="蓝"
cdx="小"
cwx="土"
elseif ctm="4" then
csx="狗"
cds="双"
cps="蓝"
cdx="小"
cwx="水"
elseif ctm="5" then
csx="鸡"
cds="单"
cps="绿"
cdx="小"
cwx="水"
elseif ctm="6" then
csx="猴"
cds="双"
cps="绿"
cdx="小"
cwx="木"
elseif ctm="7" then
csx="羊"
cds="单"
cps="红"
cdx="小"
cwx="木"
elseif ctm="8" then
csx="马"
cds="双"
cps="红"
cdx="小"
cwx="金"
elseif ctm="9" then
csx="蛇"
cds="单"
cps="蓝"
cdx="小"
cwx="金"
elseif ctm="10" then
csx="龙"
cds="双"
cps="蓝"
cdx="小"
cwx="土"
elseif ctm="11" then
csx="兔"
cds="单"
cps="绿"
cdx="小"
cwx="土"
elseif ctm="12" then
csx="虎"
cds="双"
cps="红"
cdx="小"
cwx="水"
elseif ctm="13" then
csx="牛"
cds="单"
cps="红"
cdx="小"
cwx="水"
elseif ctm="14" then
csx="鼠"
cds="双"
cps="蓝"
cdx="小"
cwx="火"
elseif ctm="15" then
csx="猪"
cds="单"
cps="蓝"
cdx="小"
cwx="火"
elseif ctm="16" then
csx="狗"
cds="双"
cps="绿"
cdx="小"
cwx="金"
elseif ctm="17" then
csx="鸡"
cds="单"
cps="绿"
cdx="小"
cwx="金"
elseif ctm="18" then
csx="猴"
cds="双"
cps="红"
cdx="小"
cwx="土"
elseif ctm="19" then
csx="羊"
cds="单"
cps="红"
cdx="小"
cwx="土"
elseif ctm="20" then
csx="马"
cds="双"
cps="蓝"
cdx="小"
cwx="木"
elseif ctm="21" then
csx="蛇"
cds="单"
cps="绿"
cdx="小"
cwx="木"
elseif ctm="22" then
csx="龙"
cds="双"
cps="绿"
cdx="小"
cwx="火"
elseif ctm="23" then
csx="兔"
cds="单"
cps="红"
cdx="小"
cwx="火"
elseif ctm="24" then
csx="虎"
cds="双"
cps="红"
cdx="小"
cwx="金"
elseif ctm="25" then
csx="牛"
cds="单"
cps="蓝"
cdx="小"
cwx="金"
elseif ctm="26" then
csx="鼠"
cds="双"
cps="蓝"
cdx="大"
cwx="水"
elseif ctm="27" then
csx="猪"
cds="单"
cps="绿"
cdx="大"
cwx="水"
elseif ctm="28" then
csx="狗"
cds="双"
cps="绿"
cdx="大"
cwx="木"
elseif ctm="29" then
csx="鸡"
cds="单"
cps="红"
cdx="大"
cwx="木"
elseif ctm="30" then
csx="猴"
cds="双"
cps="红"
cdx="大"
cwx="火"
elseif ctm="31" then
csx="羊"
cds="单"
cps="蓝"
cdx="大"
cwx="火"
elseif ctm="32" then
csx="马"
cds="双"
cps="绿"
cdx="大"
cwx="土"
elseif ctm="33" then
csx="蛇"
cds="单"
cps="绿"
cdx="大"
cwx="土"
elseif ctm="34" then
csx="龙"
cds="双"
cps="红"
cdx="大"
cwx="水"
elseif ctm="35" then
csx="兔"
cds="单"
cps="红"
cdx="大"
cwx="水"
elseif ctm="36" then
csx="虎"
cds="双"
cps="蓝"
cdx="大"
cwx="木"
elseif ctm="37" then
csx="牛"
cds="单"
cps="蓝"
cdx="大"
cwx="木"
elseif ctm="38" then
csx="鼠"
cds="双"
cps="绿"
cdx="大"
cwx="金"
elseif ctm="39" then
csx="猪"
cds="单"
cps="绿"
cdx="大"
cwx="金"
elseif ctm="40" then
csx="狗"
cds="双"
cps="红"
cdx="大"
cwx="土"
elseif ctm="41" then
csx="鸡"
cds="单"
cps="蓝"
cdx="大"
cwx="土"
elseif ctm="42" then
csx="猴"
cds="双"
cps="蓝"
cdx="大"
cwx="水"
elseif ctm="43" then
csx="羊"
cds="单"
cps="绿"
cdx="大"
cwx="水"
elseif ctm="44" then
csx="马"
cds="双"
cps="绿"
cdx="大"
cwx="火"
elseif ctm="45" then
csx="蛇"
cds="单"
cps="红"
cdx="大"
cwx="火"
elseif ctm="46" then
csx="龙"
cds="双"
cps="红"
cdx="大"
cwx="金"
elseif ctm="47" then
csx="兔"
cds="单"
cps="蓝"
cdx="大"
cwx="金"
elseif ctm="48" then
csx="虎"
cds="双"
cps="蓝"
cdx="大"
cwx="土"
elseif ctm="49" then
csx="牛"
cds="单"
cps="绿"
cdx="大"
cwx="土"
end if

idd=request("idd")
cpm=request("cpm")
ky=request("ky")
if ctm="" or csx="" or cds="" or cps="" or cdx="" or cwx="" or idd="" or cpm="" then
  response.write "各项不能为空,请正确添写开奖结果<br/>--------------<br/><a href='/BBS/LHC/Admin.Asp?SessionID=" &SessionID & "'>返回彩票管理</a><br/><a href='/bbs/index.asp?SessionID=" &SessionID & "'>返回社区首页</a></p></card></wml>"
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
   myc.execute sql
  response.write "第"&idd&"期 开奖完成!<br/>开奖结果："&cpm&"特"&ctm&"("&cds&"/"&cdx&"/"&cps&"/"&csx&"/"&cwx&")<br/>"
%>
<!--#include file="iXs_GetCode.asp"-->
<%end if%>
<%end if%>

</p>
<p align="center">
投注状态:<%=yxxe_net_kg%><br/>
<%end if%>
--------------<br/>
<a href="/BBS/LHC/Admin_system.asp?SessionID=<%=SessionID%>">网站设置</a>-<a href="/BBS/LHC/admin_affiche.asp?SessionID=<%=SessionID%>">公告管理</a><br/>
<a href="/BBS/LHC/Admin.Asp?ky=heip&amp;SessionID=<%=SessionID%>">相关帮助</a>-<a href="/BBS/LHC/Cai_Usegl.asp?SessionID=<%=SessionID%>">彩迷管理</a><br/>
<a href="/BBS/LHC/Cai_Usegl.asp?SessionID=<%=SessionID%>&amp;Action=delky">删除数据</a>-<a href="/BBS/LHC/Index.Asp?SessionID=<%=SessionID%>">虚拟博彩</a><br/>
--------------<br/>
<a href="/BBS/index.asp?SessionID=<%=SessionID%>">返回社区首页</a><br/>
报时:<%=time%>
</p></card></wml>
<%
myc.close
set myc=nothing%>