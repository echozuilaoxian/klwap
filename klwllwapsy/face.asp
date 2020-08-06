<% @LANGUAGE="VBSCRIPT" CODEPAGE="65001" %><% Response.ContentType="text/vnd.wap.wml; charset=utf-8" %><?xml version="1.0" encoding="utf-8"?><!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<!--#include file="conn.inc"-->
<!--#include file="ydzq.asp"-->
<wml>
<head><meta http-equiv='Cache-Control' content='no-cache'/>
</head>
<card title="查看资料">
<p>
<%
dim id
cz=usb(request("cz"))
cw=usb(request("cw"))
pagegg=request.QueryString("pagegg")
if pagegg="" then pagegg="1"
id=usb(request("id"))
if id="" or IsNumeric(id) = False then id="0"
t=usb(request("t"))
if t="" then tou="暂无"
if t<>"" then tou="(img)"&t&"(/img)"
set npp=Server.CreateObject("ADODB.Recordset")
rspl="select * from [Users] where [id]="&id&""
npp.open rspl,conn,1,2
if npp.eof then
   Response.write "没有找到记录<br/>"
Else
grjs=npp("grjs")
nini=npp("nini")
grtx=npp("grtx")
sex=npp("grsex")
zcsj=npp("zcsj")
zhsj=npp("tjj")
ftsl=npp("ftsl")
szcs=npp("szcs")
csrq=npp("csrq")
dfid=npp("id")
xuancl=npp("xuan")
myjf1=npp("myjf")
myjb1=npp("myjb")
%>
<!--#include file="xxts.asp"-->
<%if cw="1" then%>
自己不能加自己为好友<br/>
<%end if%>
<%if cw="2" then%>
对方已经是你的好友！<br/>
<%end if%>
<%if myid<>npp("id") then%>
<input name="text" title="内容" type="text" format="*M" emptyok="true" maxlength="500" value=""/><br/>
<%Response.write "<anchor>发送消息"
Response.write "<go href='addcl.asp?hk="&hk&"&amp;url="&Replace(Replace(R_url(),"hk=","o="),"hk=","o=")&"' method='post' accept-charset='utf-8'>"%>
        <postfield name="txt" value="$(text)"/>
        <postfield name="lid" value="<%=ubb(id)%>"/>
        <postfield name="tou" value="<%=ubb(t)%>"/>
        <postfield name="myid" value="<%=ubb(myid)%>"/>
    </go>
</anchor><br/>
<%end if%>
<img src="<%=ubb(grtx)%>" alt="加载头像"/><br/>
社区ID：<%=ubb(dfid)%><br/>
昵称：<%=ubb(nini)%><br/>
<%
set rs=server.CreateObject("ADODB.RecordSet")
 rs.Open "select ID from Users where tjj >= DateAdd('n', -60, Now()) and id="&dfid,conn,1,1
if rs.recordcount<>0 then
response.write "状态：在线<br/>"
else
response.write "状态：离线<br/>"
end if
rs.close
set rs=nothing
%>
性别：<%if sex="1" then%>男<%elseif sex="2" then%>女<%else%>保密<%end if%><br/>
生日：<%=ubb(csrq)%><br/>
城市：<%=ubb(szcs)%><br/>
<%
if myjf1<0 then jjbb="乞丐"
if myjf1<500 and myjf1>=0 then 
jjbb="游民" 
ddjj=1
end if
if myjf1<1000 and myjf1>500 then
jjbb="公民" 
ddjj=2
end if
if myjf1<2000 and myjf1>1000 then 
jjbb="士兵"
ddjj=3
end if
if myjf1<3500 and myjf1>2000 then 
jjbb="下士"
ddjj=4
end if
if myjf1<6000 and myjf1>3500 then
 jjbb="中士"
ddjj=5
end if
if myjf1<12000 and myjf1>6000 then 
jjbb="上士"
ddjj=6
end if
if myjf1<20000 and myjf1>12000 then 
jjbb="少尉"
ddjj=7
end if
if myjf1<27000 and myjf1>20000 then 
jjbb="中尉"
ddjj=8
end if
if myjf1<37000 and myjf1>27000 then 
jjbb="上尉"
ddjj=9
end if
if myjf1<48000 and myjf1>37000 then 
jjbb="少校"
ddjj=10
end if
if myjf1<60000 and myjf1>48000 then 
jjbb="中校"
ddjj=11
end if
if myjf1<75000 and myjf1>60000 then 
jjbb="上校"
ddjj=12
end if
if myjf1<90000 and myjf1>75000 then 
jjbb="大校"
ddjj=13
end if
if myjf1<110000 and myjf1>90000 then 
jjbb="少将"
ddjj=14
end if
if myjf1<120000 and myjf1>110000 then 
jjbb="中将"
ddjj=15
end if
if myjf1<130000 and myjf1>120000 then 
jjbb="上将"
ddjj=16
end if
if myjf1<200000 and myjf1>130000 then 
jjbb="大将"
ddjj=17
end if
if myjf1>200000 then 
jjbb="元帅"
ddjj=18
end if
%>
积分：<%=ubb(myjf1)%><br/>
等级：<%=ddjj%><br/>
财产：<%=ubb(myjb1)%><img src="img/zb.gif" alt="钻"/>币<br/>
社区权限：<% if xuancl<>"" then%>
<%=ubb2(xuancl)%>
<%else%>
普通会员
<%end if%>
<br/>
头衔：<%=jjbb%><br/>
个人介绍：<%=ubb2(grjs)%><br/>
注册时间：<%=ubb(zcsj)%><br/>
发贴数量：
<%dim rsxl,rspl,fts
set rsxl=Server.CreateObject("ADODB.Recordset")
rspl="select * from bbstz where fid="&id
rsxl.open rspl,conn,1,1

 fts=rsxl.recordcount
rsxl.close
set rsxl=nothing%>
<a href="tdtz.asp?tid=<%=id%>&amp;hk=<%=hk%>"><%=fts%></a><br/>
<%
set rsxl=Server.CreateObject("ADODB.Recordset")
rspl="select * from bbstz where id in (SELECT tid from lthf where fid= "&id&") order by dgtm desc"
rsxl.open rspl,conn,1,2
if rsxl.eof then
   Response.write "回贴数量：<a href=""tdhf.asp?tid="&id&"&amp;hk="&hk&""">0</a><br/>"
Else
   Response.write "回贴数量：<a href=""tdhf.asp?tid="&id&"&amp;hk="&hk&""">"&rsxl.recordcount&"</a><br/>"
end if
rsxl.close
set rsxl=nothing
%>
<%if myid<>npp("id") then%>
<a href="xc_list.asp?hk=<%=hk%>&amp;id=<%=id%>">查看相册</a>-<a href="zszb.asp?hk=<%=hk%>&amp;did=<%=id%>">赠送钻币</a><br/>
<a href="gethy.asp?hk=<%=hk%>&amp;did=<%=id%>">加为好友</a>-<a href="gethmd.asp?hk=<%=hk%>&amp;did=<%=id%>">加黑名单</a><br/>
<%end if%>
<%end if%>
<br/><anchor>返回上级<prev/></anchor>
<!--#include file="fanhui.asp"-->
<%
conn.close
set conn=nothing%>
</p>
</card>
</wml>