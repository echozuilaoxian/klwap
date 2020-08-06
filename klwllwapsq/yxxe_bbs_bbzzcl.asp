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
<card id="main" title="管理版主" >
<p>
<%id=request("id")
ky=request("ky")
cz=request("cz")
txt=request("txt")
if txt<>"" then id=txt
set rs=Server.CreateObject("ADODB.Recordset")
rspl="select * from usereg where id="&id
rs.open rspl,conn,1,2
if rs.eof then 
response.write("没有该版主!")
else
if rs("bzbz")<>0 then bbzz="正"
if rs("bzbz")=0 then bbzz="副"
set rse=Server.CreateObject("ADODB.Recordset")
rspple="select * from sclt where id="&rs("gly")
rse.open rspple,conn,1,2
if rse.eof then 
bkmc="无此版块"
else
bkmc=rse("name")
end if
%>
管理版面:<%=bkmc%>[<%=bbzz%>]<br/>
会员编号:<%=rs("id")%><br/>
手机昵称:<%=ubb(rs("usename"))%><br/>
手机号吗:<%=rs("usephone")%><br/>
登陆密码:<%=rs("usepass")%><br/>
最后登陆:<%=rs("lasttime")%><br/>
社区金币:<%=rs("usejf")%><br/>
社区钻分:<%=rs("myzuan")%><br/>
社区RMB:<%=rs("RMB")%><br/>
个人魅力:<%=rs("ml")%><br/>
个人体力:<%=rs("tili")%><br/>
----------<br/>
密码问题:<%=rs("mmwt")%><br/>
问题答案:<%=rs("wtda")%><br/>
----------<br/>
撤除版主请“高管”到社区前台撤除！<br/>
<%if rs("bzbz")<>"0" then%>
№:<a href="yxxe_bbs_bbzzcl.asp?adminmid=<%=request("adminmid")%>&amp;id=<%=id%>&amp;fid=<%=id%>&amp;cz=2"></a>撤除正版<br/>
<%else%>
№:<a href="yxxe_bbs_bbzzcl.asp?adminmid=<%=request("adminmid")%>&amp;id=<%=id%>&amp;fid=<%=id%>&amp;cz=1"></a>设为正版<br/>
<%end if%>
<%if rs("bzbz")="0" and rs("gly")="0" then%>
№:<a href="yxxe_bbs_bbzzcl.asp?adminmid=<%=request("adminmid")%>&amp;id=<%=id%>&amp;fid=<%=id%>&amp;cz=3"></a>设为副版<br/>
<%else%>
№:<a href="yxxe_bbs_bbzzcl.asp?adminmid=<%=request("adminmid")%>&amp;id=<%=id%>&amp;fid=<%=id%>&amp;cz=4"></a>撤除副版<br/>
<%end if%>
<%if rs("yxxezb")<>"0" then%>
№:<a href="Kyzc_Usegl.asp?Action=View&amp;adminmid=<%=request("adminmid")%>&amp;id=<%=id%>&amp;fid=<%=id%>&amp;ky=5">撤除总版</a><br/>
<%else%>
№:<a href="Kyzc_Usegl.asp?Action=View&amp;adminmid=<%=request("adminmid")%>&amp;id=<%=id%>&amp;fid=<%=id%>&amp;ky=6">设为总版</a><br/>
<%end if%>
<%if rs("yxxexc")="0" then%>
№:<a href="Kyzc_Usegl.asp?Action=View&amp;adminmid=<%=request("adminmid")%>&amp;id=<%=id%>&amp;fid=<%=id%>&amp;ky=7">设为巡查</a><br/>
<%else%>
№:<a href="Kyzc_Usegl.asp?Action=View&amp;adminmid=<%=request("adminmid")%>&amp;id=<%=id%>&amp;fid=<%=id%>&amp;ky=8">撤除巡查</a><br/>
<%end if%>
<%if rs("yxxegg")="0" then%>
№:<a href="Kyzc_Usegl.asp?Action=View&amp;adminmid=<%=request("adminmid")%>&amp;id=<%=id%>&amp;fid=<%=id%>&amp;ky=9">设为高管</a><br/>
<%else%>
№:<a href="Kyzc_Usegl.asp?Action=View&amp;adminmid=<%=request("adminmid")%>&amp;id=<%=id%>&amp;fid=<%=id%>&amp;ky=10">撤除高管</a><br/>
<%end if%>
<%end if%>

 ----------<br/>
<a href="yxxe_bbs_bbzz.asp?adminmid=<%=request("adminmid")%>">返回版主管理</a><br/>
<a href="BBSBoard.asp?adminmid=<%=request("adminmid")%>">返回版块管理</a><br/>
<a href="wapAdmin_bbs.asp?adminmid=<%=request("adminmid")%>">返回社区管理</a><br/>
<a href="wapAdmin_index.asp?adminmid=<%=request("adminmid")%>">返回管理首页</a><br/>
报时:<%=time%>
</p>
</card>
</wml>