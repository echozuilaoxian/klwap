<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%><%response.buffer=true%><%Response.ContentType = "text/vnd.wap.wml; charset=utf-8"%><?xml version="1.0" encoding="utf-8"?><!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
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
<%=Now%>
</p>
<p align="left">

<%
if Cstr(Session("yxxecp"))<>"" or Session("cg")<>"" or Session("Counter")="pass_numbers_55556666" then

dim ky,kyzc
  ky=request.querystring("ky")
  id=request.querystring("id")
  if ky="" then
	ky=1
  end if
if lycount>0 then
Response.write "<a href='/bbs/public/ckly.asp?SessionID=" & SessionID & "'>&#x60A8;&#x6709;(" & lycount & ")&#x6761;&#x65B0;&#x4FE1;&#x606F;!</a><br/><br/>"
       Session("returnuppath")=Request.ServerVariables("PATH_INFO") & "?ky="&ky&""
End if
if ky="1" then
%>

球队名称:<br/><input name='txt' title='' type="text" format="*M" emptyok="true" maxlength="20"  value=''/><br/>
VS:<br/><input name="txt1" title="" type="text" format="*M" emptyok="true" maxlength="20" value=""/><br/>
让球说明:<br/><input name="txt2" title="" type="text" format="*M" emptyok="true" maxlength="20" value=""/><br/>
设置赔率:<input name="sjhm" maxlength="11" size="20"/><br/>
比赛时间:(格式2009-9-1 1:12:8)<br/><input name="txt4" title="比赛时间" type="text" format="*M" emptyok="true" maxlength="20" value="2009-9-1 2:12:10"/><br/>
停止投注时间:(格式2009-9-1 1:12:8)<br/><input name="txt3" title="停止投注时间" type="text" format="*M" emptyok="true" maxlength="20" value="2009-9-1 2:12:10"/><br/>
<anchor>确定设置
		<go href="Admin2.asp?ky=2&amp;SessionID=<%=SessionID%>" method="post"  accept-charset="utf-8">
		<postfield name="txt" value="$(txt)" />
		<postfield name="txt1" value="$(txt1)"/>
		<postfield name="txt2" value="$(txt2)" />
		<postfield name="sjhm" value="$(sjhm)" />
                                      <postfield name="txt3" value="$(txt3)" />
                                      <postfield name="txt4" value="$(txt4)" />
                                      </go>
		</anchor> 
<%
elseif ky="2" then
txt=request("txt")
txt1=request("txt1")
txt2=request("txt2")
txt3=request("txt3")
txt4=request("txt4")
sjhm=request("sjhm")
 if txt="" or txt1=""  or txt2="" or txt3=""  or sjhm=""   or txt4="" then
     response.write "发表不成功,选项都不能为空！"
     response.write "<br/><a href='Admin2.asp?ky=1&amp;SessionID=" & SessionID & "'>返回继续操作</a><br/><a href='/BBS/index.asp?SessionID=" & SessionID & "'>返回社区首页</a></p></card></wml>"
     response.end
  End if

set objgbrc1=Server.CreateObject("ADODB.Recordset")
ssql6="select * from ckjhm order by id desc"
  objgbrc1.open ssql6,myc,1,2
 objgbrc1.addnew
if txt<>"" then  objgbrc1("ds")=txt
if txt1<>"" then  objgbrc1("dx")=txt1
if txt2<>"" then  objgbrc1("sx")=txt2
if sjhm<>"" then  objgbrc1("jss")=sjhm
if txt3<>"" then  objgbrc1("kjtime")=txt3
if txt4<>"" then  objgbrc1("kjtimes")=txt4
objgbrc1.update
Response.write "发表成功<br/>" & objgbrc1("ds") & "VS" & objgbrc1("dx") & "<br/>说明:" & objgbrc1("sx") & "<br/>赔率:1:" & objgbrc1("jss") & "<br/><a href='Admin2.asp?ky=3&amp;kd=" &objgbrc1("id")& "&amp;SessionID=" & SessionID & "'>返回继续修改</a><br/>"
objgbrc1.close
Set objgbrc1= Nothing
elseif ky="3" then
id=request("kd")
set objgbrc=Server.CreateObject("ADODB.Recordset")
ssql6="select * from ckjhm where id=" & id & ""
  objgbrc.open ssql6,myc,1,1
 if objgbrc.EOF then
Response.write "没有这场球赛.<br/>"
else %>

球队名称:<br/><input name='txt' title='' type="text" format="*M" emptyok="true" maxlength="20"  value='<%=objgbrc("ds")%>'/><br/>
VS:<br/><input name="txt1" title="" type="text" format="*M" emptyok="true" maxlength="20" value="<%=objgbrc("dx")%>"/><br/>
让球说明:<br/><input name="txt2" title="" type="text" format="*M" emptyok="true" maxlength="20" value="<%=objgbrc("sx")%>"/><br/>
设置赔率:<input name="sjhm" maxlength="11" format="*N" size="20"/><br/>
比赛时间:(格式2009-9-1 1:12:8)<br/><input name="txt4" title="比赛时间" type="text" format="*M" emptyok="true" maxlength="20" value="<%=objgbrc("kjtimes")%>"/><br/>
停止投注时间:(格式2009-9-1 1:12:8)<br/><input name="txt3" title="停止投注时间" type="text" format="*M" emptyok="true" maxlength="20" value="<%=objgbrc("kjtime")%>"/><br/>
<anchor>确定修改
		<go href="Admin2.asp?ky=4&amp;kd=<%=objgbrc("id")%>&amp;SessionID=<%=SessionID%>" method="post"  accept-charset="utf-8">
		<postfield name="txt" value="$(txt)" />
		<postfield name="txt1" value="$(txt1)"/>
		<postfield name="txt2" value="$(txt2)" />
		<postfield name="sjhm" value="$(sjhm)" />
                                      <postfield name="txt3" value="$(txt3)" />
                                       <postfield name="txt4" value="$(txt4)" />
                                      </go>
		</anchor> 
<%
End if
objgbrc.close
Set objgbrc= Nothing
elseif ky="4" then
id=request("kd")
set objgbrc2=Server.CreateObject("ADODB.Recordset")
ssql6="select * from ckjhm where id=" & id & ""
  objgbrc2.open ssql6,myc,1,2
 if objgbrc2.EOF then
Response.write "没有这场球赛.<br/>"
else
txt4=request("txt4")
txt=request("txt")
txt1=request("txt1")
txt2=request("txt2")
txt3=request("txt3")
sjhm=request("sjhm")
 if txt="" or txt1=""  or txt2="" or txt3=""  or sjhm="" then
     response.write "发表不成功,选项都不能为空！"
     response.write "<br/><a href='Admin2.asp?ky=1&amp;SessionID=" & SessionID & "'>返回继续操作</a><br/><a href='/BBS/index.asp?SessionID=" & SessionID & "'>返回社区首页</a></p></card></wml>"
     response.end
  End if
if txt4<>"" then  objgbrc2("kjtimes")=txt4
if txt<>"" then  objgbrc2("ds")=txt
if txt1<>"" then  objgbrc2("dx")=txt1
if txt2<>"" then  objgbrc2("sx")=txt2
if sjhm<>"" then  objgbrc2("jss")=sjhm
if txt3<>"" then  objgbrc2("kjtime")=txt3
objgbrc2.update
Response.write "修改成功<br/>" & objgbrc2("ds") & "VS" & objgbrc2("dx") & "<br/>说明:" & objgbrc2("sx") & "<br/>赔率:1:" & objgbrc2("jss") & "<br/><a href='Admin2.asp?ky=3&amp;kd=" &objgbrc2("id")& "&amp;SessionID=" & SessionID & "'>返回继续修改</a><br/>"
objgbrc2.close
Set objgbrc2= Nothing
End if
End if
%>
<br/>--------------<br/>
<a href="Admin_system.asp?SessionID=<%=SessionID%>">网站设置</a>-<a href="admin_affiche.asp?SessionID=<%=SessionID%>">公告管理</a><br/>
<a href="Cai_Usegl.asp?SessionID=<%=SessionID%>&amp;Action=delky">删除数据</a>-<a href="Index.Asp?SessionID=<%=SessionID%>">球赛博彩</a><br/>
--------------<br/>
<a href="/BBS/index.asp?SessionID=<%=SessionID%>">返回社区首页</a><br/>
报时:<%=time%>
<%else%>
你没有这个权力
<a href="/BBS/index.asp?SessionID=<%=SessionID%>">返回社区首页</a><br/>
<%End if
%>
</p></card></wml>
<%
myc.close
set myc=nothing%>