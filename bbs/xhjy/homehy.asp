<% @LANGUAGE="VBScript" CODEPAGE="65001" %><% Response.ContentType="text/vnd.wap.wml" %><?xml version="1.0" encoding="utf-8"?><!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<!--#INCLUDE VIRTUAL="/bbs/reg/useregs.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/public/codeun.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/reg/ltonline.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/reg/redtjname.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/reg/redtjnames.asp"-->
<wml>
<head>
<meta http-equiv="Cache-Control" content="max-age=0"/>
<meta http-equiv="Cache-Control" content="no-cache"/>
</head>
<card title="花园"><p align="left">
<img src='logo.gif' alt=''/><br/>
<%session.abandon%>
<%
Server.ScriptTimeout=999
iduse=Session("useid")
fkname=Session("ltname")
id=request("id")
yi=request("yi")
acc=request("acc")
if Session("zh")="wap" then
 Response.write " 请您<a href='/BBS/UseLogin.asp?SessionID="&SessionID&"'>登陆/注册</a><br/>"
else
Response.write " <a href='/bbs/reg/useinfo.asp?id="&iduse&"&amp;SessionID="&SessionID&"'><img src='/bbs/xhjy/id.gif' alt=''/>"& iduse &"</a>"
if lycount>0 then
    Response.write "<a href='/bbs/public/ckly.asp?SessionID="&SessionID&"'><img src='/bbs/xhjy/xx.gif' alt=''/>信息("&lycount&")</a><br/>"
Session("returnuppath")=Request.ServerVariables("PATH_INFO") & "?"
else
Response.write " <a href='/bbs/public/gygl.asp?SessionID="&SessionID&"'><img src='/bbs/xhjy/jy.gif' alt=''/>地盘</a><br/>"
end if
end if
Response.write "<a href='/bbs/xhjy/home.asp?id="&id&"&amp;SessionID="&SessionID&"'>家园</a>.<a href='/bbs/xhjy/homehy.asp?id="&id&"&amp;SessionID="&SessionID&"'>花园</a>.<a href='/bbs/reg/useinfo.asp?id="&id&"&amp;SessionID="&SessionID&"'>资料</a>.<a href='/bbs/xhjy/shop_hy.asp?SessionID="&SessionID&"'>种子</a><br/>"
if yi="" then
       set objgbrs=Server.CreateObject("ADODB.Recordset")
       ssql="select usename,id from usereg where id=" & id & ""
       objgbrs.open ssql,conn
if objgbrs("id")<>iduse then
Response.write "主人:" & objgbrs("usename") & "<br/>"
else
Response.write "=花园动态=<br/>"
set crs1=Server.CreateObject("ADODB.Recordset")
  sql="select * from jyhy where hyid=" & iduse & " and left(hylx,1)=1"
  crs1.open sql,conn,1,3
set crs2=Server.CreateObject("ADODB.Recordset")
  sql="select * from jyhy where hyid=" & iduse & " and left(hylx,1)=2"
  crs2.open sql,conn,1,3
set crs3=Server.CreateObject("ADODB.Recordset")
  sql="select * from jyhy where hyid=" & iduse & " and left(hylx,1)=3"
  crs3.open sql,conn,1,3
set crs4=Server.CreateObject("ADODB.Recordset")
  sql="select * from jyhy where hyid=" & iduse & " and hylx=4"
  crs4.open sql,conn,1,3
Response.write "种(<a href='homehy.asp?yi=zz&amp;id="&id&"&amp;SessionID="&SessionID&"'>" & crs1.RecordCount & "</a>)苗(" & crs2.RecordCount & ")蕾(" & crs3.RecordCount & ")花(<a href='homehy.asp?yi=xh&amp;id="&id&"&amp;SessionID="&SessionID&"'>" & crs4.RecordCount & "</a>)总(" & (crs1.RecordCount+crs2.RecordCount+crs3.RecordCount+crs4.RecordCount) & ")<br/>"
set crs11=Server.CreateObject("ADODB.Recordset")
  sql="select * from jyhy where hyid=" & iduse & " and left(hylx,1)=1 and DATEDIFF('s', ztime, now()) > 15*60 and DATEDIFF('s', ztime, now()) < 60*60"
  crs11.open sql,conn,1,3
if crs11.eof then
  sql="update jyhy set hylx='2',mtime=now() where hylx=11 and DATEDIFF('s', ztime, now()) > 60*60"
  conn.execute sql
  Application.Unlock
  sql="update jyhy set hylx='2',mtime=now() where hylx=1 and DATEDIFF('s', ztime, now()) > 100*60"
  conn.execute sql
  Application.Unlock
else
if crs11("hylx")=1 then
Response.write "有一粒" & crs11("hname") & "种子需要<a href='homehy.asp?yi=js&amp;id="&id&"&amp;hid=" & crs11("id") & "&amp;SessionID="&SessionID&"'>浇水</a>一次哦~<br/>"
end if
end if
set crs22=Server.CreateObject("ADODB.Recordset")
  sql="select * from jyhy where hyid=" & iduse & " and hylx=2 and DATEDIFF('s', ztime, now()) > 60*60 and DATEDIFF('s', ztime, now()) < 120*60 order by ztime desc"
  crs22.open sql,conn,1,3
if crs22.eof then
  sql="update jyhy set hylx='3',ltime=now() where DATEDIFF('s', mtime, now()) > 120*60 and hylx=2"
  conn.execute sql
  Application.Unlock
  sql="update jyhy set hylx='3',ltime=now() where DATEDIFF('s', mtime, now()) > 150*60 and hylx=22"
  conn.execute sql
  Application.Unlock
else
if crs22("hylx")="2" then
Response.write "有一珠" & crs22("hname") & "花苗需要<a href='homehy.asp?yi=sf&amp;id="&id&"&amp;hid=" & crs22("id") & "&amp;SessionID="&SessionID&"'>施肥</a>一次哦~<br/>"
end if
end if
set crs33=Server.CreateObject("ADODB.Recordset")
  sql="select * from jyhy where hyid=" & iduse & " and left(hylx,1)=3 and DATEDIFF('s', ltime, now()) > 120*60 and DATEDIFF('s', ltime, now()) < 180*60"
  crs33.open sql,conn,1,3
if crs33.eof then
  sql="update jyhy set hylx='4',ctime=now() where hylx=33 and DATEDIFF('s', ltime, now()) > 180*60"
  conn.execute sql
  Application.Unlock
  sql="update jyhy set hylx='4',ctime=now() where hylx=3 and DATEDIFF('s', ltime, now()) > 230*60"
  conn.execute sql
  Application.Unlock
else
if crs33("hylx")=3 then
Response.write "有一珠" & crs33("hname") & "花蕾需要<a href='homehy.asp?yi=cc&amp;id="&id&"&amp;hid=" & crs33("id") & "&amp;SessionID="&SessionID&"'>锄草</a>一次哦~<br/>"
end if
end if
  sql="update jyhy set hylx='2',mtime=now() where DATEDIFF('s', ztime, now()) > 60*60 and hylx=1"
  conn.execute sql
  Application.Unlock
  sql="update jyhy set hylx='2',mtime=now() where DATEDIFF('s', ztime, now()) > 100*60 and hylx=11"
  conn.execute sql
  Application.Unlock
  sql="update jyhy set hylx='3',ltime=now() where DATEDIFF('s', mtime, now()) > 120*60 and hylx=2"
  conn.execute sql
  Application.Unlock
  sql="update jyhy set hylx='3',ltime=now() where DATEDIFF('s', mtime, now()) > 150*60 and hylx=22"
  conn.execute sql
  Application.Unlock
  sql="update jyhy set hylx='4',ctime=now() where DATEDIFF('s', ltime, now()) > 180*60 and hylx=3"
  conn.execute sql
  Application.Unlock
  sql="update jyhy set hylx='4',ctime=now() where DATEDIFF('s', ltime, now()) > 230*60 and hylx=33"
  conn.execute sql
  Application.Unlock
 dim zrf
  set zrf=Server.CreateObject("ADODB.Recordset")
  zsqls="select wpmc,wpid,wpsl,dengji from my_show where ids=" & iduse &" and wpflid=5 order by wptime desc"
  zrf.open zsqls,conn,1,1
if zrf.eof then
   Response.write "你没有种子,到<a href='/bbs/xhjy/shop_hy.asp?SessionID="&SessionID&"'>种子公司</a>逛逛<br/>"
 Else
if zrf("wpsl")=0 and crs1.RecordCount=0 then
   Response.write "你没有种子,到<a href='/bbs/xhjy/shop_hy.asp?SessionID="&SessionID&"'>种子公司</a>逛逛<br/>"
else
if crs1.RecordCount=0 then
Response.write "<a href='homehy.asp?yi=bz&amp;id="&id&"&amp;pid=" & zrf("wpid") & "&amp;hname=" & zrf("wpmc") & "&amp;wid=5&amp;close=" & zrf("dengji") & "&amp;SessionID="&SessionID&"'>" & zrf("wpmc") & "[马上播种]</a><br/>"
end if
end if
end if
end if
Response.write "<br/><a href='home.asp?id=" &id & "&amp;SessionID="&SessionID&"'>主人家园</a>>花园"
end if
if yi="bz" then
hname=request("hname")
close=request("close")
pid=request("pid")
set crs1=Server.CreateObject("ADODB.Recordset")
  sql="select * from jyhy where hyid=" & iduse & " and hylx=1"
  crs1.open sql,conn,1,3
if crs1.RecordCount=0 then
  set srs=Server.CreateObject("ADODB.Recordset")
  sql="select id,wpsl from my_show where wpid=" & pid & " and wpflid=5 and ids=" & iduse & ""
  srs.open sql,conn
if srs("wpsl")>0 then
sql="update my_show set wpsl=wpsl-1 Where ids=" & iduse & " and wpid=" & pid & " and wpflid=5"
  Application.Lock
  conn.execute sql
  sql="insert into jyhy(hyid,hname,bh,sx5,hylx)values("
  sql=sql & sqlstr(iduse) & ","
  sql=sql & sqlstr(hname) & ","
  sql=sql & sqlstr(pid) & ","
  sql=sql & sqlstr(close) & ","
  sql=sql & sqlstr(1) & ")"
  Application.Lock
  conn.execute sql
  Application.Unlock
response.write "播种成功.请15分钟后浇水一次~别忘了哦~<br/>"
Response.write "<br/><a href='home.asp?id=" &iduse & "&amp;SessionID="&SessionID&"'>我的家园</a>><a href='homehy.asp?id=" &iduse & "&amp;SessionID="&SessionID&"'>花园</a>>播种"
else
response.write "你没花种哦~.<br/>"
Response.write "<br/><a href='home.asp?id=" &iduse & "&amp;SessionID="&SessionID&"'>我的家园</a>><a href='homehy.asp?id=" &iduse & "&amp;SessionID="&SessionID&"'>花园</a>>播种"
end if
else
response.write "请勿重复操作.<br/>"
Response.write "<br/><a href='home.asp?id=" &iduse & "&amp;SessionID="&SessionID&"'>我的家园</a>><a href='homehy.asp?id=" &iduse & "&amp;SessionID="&SessionID&"'>花园</a>>播种"
end if
end if
if yi="zz" then
Response.write "<a href='home.asp?id=" &iduse & "&amp;SessionID="&SessionID&"'>我的家园</a>><a href='homehy.asp?id=" &iduse & "&amp;SessionID="&SessionID&"'>花园</a>>种子<br/>"
set crs1=Server.CreateObject("ADODB.Recordset")
  sql="select * from jyhy where hyid=" & iduse & " and left(hylx,1)=1 and DATEDIFF('s', ztime, now()) > 10*60"
  crs1.open sql,conn,1,3
if crs1.eof then
Response.write ""
else
For i=1 to 2
Response.write "<img src='/bbs/xhjy/zz.gif' alt=''/>" & crs1("hname") & ""
crs1.Movenext
if crs1.EOF then Exit for
 Next
end if
end if

if yi="js" then
hid=request("hid")
set crs11=Server.CreateObject("ADODB.Recordset")
  sql="select * from jyhy where id=" & hid & ""
  crs11.open sql,conn,1,3
if crs11("hylx")=1 then
  sql="update jyhome set jydj=jydj+1,hy=hy+1 where jyid=" & iduse & ""
  conn.execute sql
  Application.Unlock
  sql="update jyhy set sx1=sx1+1,sx2=sx2+1,hylx='11' where hyid=" & iduse & " and id=" & hid & " and hylx=1"
  conn.execute sql
  Application.Unlock
Response.write "浇水成功！<br/><a href='home.asp?id=" &iduse & "&amp;SessionID="&SessionID&"'>我的家园</a>><a href='homehy.asp?id=" &iduse & "&amp;SessionID="&SessionID&"'>花园</a>>浇水"
else
Response.write "请勿重复操作！<br/><a href='home.asp?id=" &iduse & "&amp;SessionID="&SessionID&"'>我的家园</a>><a href='homehy.asp?id=" &iduse & "&amp;SessionID="&SessionID&"'>花园</a>>浇水"
end if
end if
if yi="sf" then
hid=request("hid")
set crs22=Server.CreateObject("ADODB.Recordset")
  sql="select * from jyhy where id=" & hid & ""
  crs22.open sql,conn,1,3
if crs22("hylx")=2 then
  sql="update jyhome set jydj=jydj+1,hy=hy+1 where jyid=" & iduse & ""
  conn.execute sql
  Application.Unlock
  sql="update jyhy set sx1=sx1+1,sx2=sx2+1,hylx='22' where hyid=" & iduse & " and id=" & hid & " and hylx=2"
  conn.execute sql
  Application.Unlock
Response.write "施肥成功！<br/><a href='home.asp?id=" &iduse & "&amp;SessionID="&SessionID&"'>我的家园</a>><a href='homehy.asp?id=" &iduse & "&amp;SessionID="&SessionID&"'>花园</a>>施肥"
else
Response.write "请勿重复操作！<br/><a href='home.asp?id=" &iduse & "&amp;SessionID="&SessionID&"'>我的家园</a>><a href='homehy.asp?id=" &iduse & "&amp;SessionID="&SessionID&"'>花园</a>>施肥"
end if
end if
if yi="cc" then
hid=request("hid")
set crs33=Server.CreateObject("ADODB.Recordset")
  sql="select * from jyhy where id=" & hid & ""
  crs33.open sql,conn,1,3
if crs33("hylx")=3 then
  sql="update jyhome set jydj=jydj+1,hy=hy+1 where jyid=" & iduse & ""
  conn.execute sql
  Application.Unlock
  sql="update jyhy set sx1=sx1+1,sx2=sx2+1,hylx='33' where hyid=" & iduse & " and id=" & hid & " and hylx=3"
  conn.execute sql
  Application.Unlock
Response.write "锄草成功！<br/><a href='home.asp?id=" &iduse & "&amp;SessionID="&SessionID&"'>我的家园</a>><a href='homehy.asp?id=" &iduse & "&amp;SessionID="&SessionID&"'>花园</a>>锄草"
else
Response.write "请勿重复操作！<br/><a href='home.asp?id=" &iduse & "&amp;SessionID="&SessionID&"'>我的家园</a>><a href='homehy.asp?id=" &iduse & "&amp;SessionID="&SessionID&"'>花园</a>>锄草"
end if
end if
if yi="xh" then
  dim page's',crs4
  pages=request("pages")
set crs4=Server.CreateObject("ADODB.Recordset")
  sql="select * from jyhy where hyid=" & iduse & " and hylx=4"
  crs4.open sql,conn,1,3
if crs4.eof then
Response.write "暂时没有成品花.<br/>"
else
crs4.PageSize=10
pages =CLng(Request("pages"))
if pages<1 then pages=1
if pages>crs4.PageCount then pages=crs4.PageCount
crs4.absolutepage=pages
if pages=1 then
bihao=0
else
bihao=pages*10-10
End if
For k=1 to crs4.PageSize
    bihaocontd=bihaocontd+1
Response.write bihao+bihaocontd & "."
Response.write "" & crs4("hname") & "[" & crs4("ctime") & "]"
if crs4("hyid")=Session("useid") then
Response.write "|<a href='homehy.asp?yi=ch&amp;ide=" & crs4("id") & "&amp;hname=" & crs4("hname") & "&amp;gn1=" & crs4("sx1") & "&amp;gn2=" & crs4("sx2") & "&amp;gn3=" & crs4("sx3") & "&amp;gn4=" & crs4("sx4") & "&amp;gn5=" & crs4("sx5") & "&amp;gn6=" & crs4("sx6") & "&amp;gn7=" & crs4("sx7") & "&amp;gn8=" & crs4("sx8") & "&amp;bh=" & crs4("bh") & "&amp;id="&id&"&amp;SessionID="&SessionID&"'>采花</a>|<a href='homehy.asp?yi=chu&amp;ide=" & crs4("id") & "&amp;id="&id&"&amp;SessionID="&SessionID&"'>丢弃</a>"
end if
Response.write "<br/>"
crs4.Movenext
if crs4.EOF then Exit for
 Next
end if
Response.write "--------------<br/>"
If Pages<crs4.PageCount then
    Response.Write "<a href='homehy.asp?yi=xh&amp;id="&iduse&"&amp;pages=" & (pages+1) & "&amp;SessionID="&SessionID&"'>下页</a>"
End if
If pages>1 then
    Response.Write "|<a href='homehy.asp?yi=xh&amp;id="&iduse&"&amp;pages=" & (pages-1) & "&amp;SessionID="&SessionID&"'>上页</a>"
End if
    if crs4.RecordCount>crs4.PageSize then
    response.write "<br/>"
End if
response.write "&#40;第" &  Pages & "页&#47;共" & crs4.PageCount & "页&#41;" & "共" & crs4.RecordCount & "珠鲜花."
if crs4.PageCount>1 then
response.write "<br/>第<input  name='pages' value='2' size='2' format='*N'/>页<anchor>GO<go method='post' href='homehy.asp?yi=xh&amp;id="&iduse&"&amp;SessionID="&SessionID&"'><postfield name='pages' value='$(pages)'/></go></anchor>>>"
End if
Response.write "<br/><a href='home.asp?id=" &iduse & "&amp;SessionID="&SessionID&"'>我的家园</a>><a href='homehy.asp?id=" &iduse & "&amp;SessionID="&SessionID&"'>花园</a>>成品花"
end if
if yi="zs" then
  bh=request("bh")
  zid=request("zid")
  ide=request("ide")
  idd=request("idd")
  gn1=request("gn1")
  gn2=request("gn2")
  gn3=request("gn3")
  gn4=request("gn4")
  gn5=request("gn5")
  gn6=request("gn6")
  gn7=request("gn7")
  gn8=request("gn8")
  hname=request("hname")
Response.write "ID号:<input name='ids' size='6' format='*N'/><br/>数量:<input name='shu' size='6' format='*N'/><br/><anchor>确定赠送<go method='post' href='homehy.asp?yi=zss&amp;SessionID="&SessionID&"'><postfield name='ids' value='$(ids)'/><postfield name='shu' value='$(shu)'/><postfield name='bh' value='" & bh & "'/><postfield name='zid' value='" & zid & "'/><postfield name='ide' value='" & ide & "'/><postfield name='idd' value='" & idd & "'/><postfield name='gn1' value='" & gn1 & "'/><postfield name='gn2' value='" & gn2 & "'/><postfield name='gn3' value='" & gn3 & "'/><postfield name='gn4' value='" & gn4 & "'/><postfield name='gn5' value='" & gn5 & "'/><postfield name='gn6' value='" & gn6 & "'/><postfield name='gn7' value='" & gn7 & "'/><postfield name='gn8' value='" & gn8 & "'/><postfield name='hname' value='" & hname & "'/></go></anchor>"
Response.write "<br/><a href='home.asp?id=" &iduse & "&amp;SessionID="&SessionID&"'>我的家园</a>><a href='homehy.asp?id=" &iduse & "&amp;SessionID="&SessionID&"'>花园</a>>送花"
end if
if yi="zss" then
  bh=request("bh")
  zid=request("zid")
  ids=request("ids")
  ide=request("ide")
  idd=request("idd")
  gn1=request("gn1")
  gn2=request("gn2")
  gn3=request("gn3")
  gn4=request("gn4")
  gn5=request("gn5")
  gn6=request("gn6")
  gn7=request("gn7")
  gn8=request("gn8")
  hname=request("hname")
shu=clng(request("shu"))
ids=clng(request("ids"))
if ids="" or shu="" then
Response.write "各项不能为空！<br/><a href='home.asp?id=" &iduse & "&amp;SessionID="&SessionID&"'>我的家园</a>><a href='homehy.asp?id=" &iduse & "&amp;SessionID="&SessionID&"'>花园</a>>送花"
else
set crsg=Server.CreateObject("ADODB.Recordset")
  sqlg="select * from my_xh where id=" & ide & " and zid=" & zid & " and bh=" & bh & ""
  crsg.open sqlg,conn,1,3
if crsg.eof then
Response.write "未知错误！<br/><a href='home.asp?id=" &iduse & "&amp;SessionID="&SessionID&"'>我的家园</a>><a href='homehy.asp?id=" &iduse & "&amp;SessionID="&SessionID&"'>花园</a>>送花"
else
if crsg("shu")<shu or shu<1 then
Response.write "送出数量错误！<br/><a href='home.asp?id=" &iduse & "&amp;SessionID="&SessionID&"'>我的家园</a>><a href='homehy.asp?id=" &iduse & "&amp;SessionID="&SessionID&"'>花园</a>>送花"
else
if crsg("zid")=ids then
Response.write "送出对象错误！<br/><a href='home.asp?id=" &iduse & "&amp;SessionID="&SessionID&"'>我的家园</a>><a href='homehy.asp?id=" &iduse & "&amp;SessionID="&SessionID&"'>花园</a>>送花"
else
set crsg1=Server.CreateObject("ADODB.Recordset")
  sql="select * from usereg where id=" & ids & ""
  crsg1.open sql,conn,1,1
if crsg1.eof then
Response.write "该号不存在." & ids & "<br/>"
else
  lyfname=""&crsg1("usename")&""
  lynr=""&shu&"枝"&hname&""
  sql="insert into jyjl(lyzid,lyzname,lyfid,lyfname,lynr,lylx)values("
  sql=sql & sqlstr(iduse) & ","
  sql=sql & sqlstr(fkname) & ","
  sql=sql & sqlstr(ids) & ","
  sql=sql & sqlstr(lyfname) & ","
  sql=sql & sqlstr(lynr) & ","
  sql=sql & sqlstr(0) & ")"
  Application.Lock
  conn.execute sql
  Application.Unlock
  sql="update my_xh set shu=shu-"&shu&" where id=" & ide & " and zid=" & iduse & " and bh=" & bh & ""
  conn.execute sql
  Application.Unlock
  sql="update jyhome set f=f+"&shu&" where jyid=" & ids & ""
  conn.execute sql
  Application.Unlock
  sql="update jyhome set l=l+"&shu&" where jyid=" & iduse & ""
  conn.execute sql
  Application.Unlock
Response.write "送花成功！<br/><a href='home.asp?id=" &iduse & "&amp;SessionID="&SessionID&"'>我的家园</a>><a href='homehy.asp?id=" &iduse & "&amp;SessionID="&SessionID&"'>花园</a>>送花"
end if
end if
end if
end if
end if
end if
if yi="ch" then
  dim crs99
  bh=request("bh")
  hname=request("hname")
  ide=request("ide")
  gn1=request("gn1")
  gn2=request("gn2")
  gn3=request("gn3")
  gn4=request("gn4")
  gn5=request("gn5")
  gn6=request("gn6")
  gn7=request("gn7")
  gn8=request("gn8")
set crs4=Server.CreateObject("ADODB.Recordset")
  sql="select * from jyhy where id=" & ide & ""
  crs4.open sql,conn,1,3
if crs4.eof then
Response.write "该花不存在！<br/><a href='home.asp?id=" &iduse & "&amp;SessionID="&SessionID&"'>我的家园</a>><a href='homehy.asp?id=" &iduse & "&amp;SessionID="&SessionID&"'>花园</a>>采花"
else
set crs99=Server.CreateObject("ADODB.Recordset")
  sql="select * from my_xh where zid=" & iduse & " and bh="& bh &" and fl="& gn5 &""
  crs99.open sql,conn,1,3
if crs99.eof then
  sql="insert into my_xh(zid,hname,bh,fl,gn1,gn2,gn3,gn4,gn5,gn6,gn7,shu,gn8)values("
  sql=sql & sqlstr(iduse) & ","
  sql=sql & sqlstr(hname) & ","
  sql=sql & sqlstr(bh) & ","
  sql=sql & sqlstr(gn5) & ","
  sql=sql & sqlstr(gn1) & ","
  sql=sql & sqlstr(gn2) & ","
  sql=sql & sqlstr(gn3) & ","
  sql=sql & sqlstr(gn4) & ","
  sql=sql & sqlstr(gn5) & ","
  sql=sql & sqlstr(gn6) & ","
  sql=sql & sqlstr(gn7) & ","
  sql=sql & sqlstr(1) & ","
  sql=sql & sqlstr(gn8) & ")"
  Application.Lock
  conn.execute sql
  Application.Unlock
  sql="delete from jyhy Where  hyid=" & iduse &" and id=" & ide &""
  Application.Lock
  conn.Execute(sql)
Response.write "采花成功！<br/><a href='home.asp?id=" &iduse & "&amp;SessionID="&SessionID&"'>我的家园</a>><a href='homehy.asp?id=" &iduse & "&amp;SessionID="&SessionID&"'>花园</a>>采花"
else
  sql="delete from jyhy Where  hyid=" & iduse &" and id=" & ide &""
  Application.Lock
  conn.Execute(sql)
sql="update my_xh set shu=shu+1 Where zid=" & iduse & " and bh="& bh &" and fl="& gn5 &""
  conn.Execute(sql)
Response.write "采花成功！<br/><a href='home.asp?id=" &iduse & "&amp;SessionID="&SessionID&"'>我的家园</a>><a href='homehy.asp?id=" &iduse & "&amp;SessionID="&SessionID&"'>花园</a>>采花"
end if
end if
end if
if yi="chu" then
  ide=request("ide")
  sql="delete from jyhy Where  hyid=" & iduse &" and id=" & ide &""
  Application.Lock
  conn.Execute(sql)
Response.write "丢弃成功！<br/><a href='home.asp?id=" &iduse & "&amp;SessionID="&SessionID&"'>我的家园</a>><a href='homehy.asp?id=" &iduse & "&amp;SessionID="&SessionID&"'>花园</a>>丢弃"
end if
if yi="chuu" then
  ide=request("ide")
  sql="delete from my_xh Where  zid=" & iduse &" and id=" & ide &""
  Application.Lock
  conn.Execute(sql)
Response.write "丢弃成功！<br/><a href='home.asp?id=" &iduse & "&amp;SessionID="&SessionID&"'>我的家园</a>><a href='homehy.asp?id=" &iduse & "&amp;SessionID="&SessionID&"'>花园</a>>丢弃"
end if

if yi="hp" then
  dim pages1,crs444
  pages1=request("pages1")
set crs444=Server.CreateObject("ADODB.Recordset")
  sql="select * from my_xh where zid=" & iduse & ""
  crs444.open sql,conn,1,3
if crs444.eof then
Response.write "暂时没有鲜花.<br/>"
else
crs444.PageSize=10
pages1 =CLng(Request("pages1"))
if pages1<1 then pages1=1
if pages1>crs444.PageCount then pages1=crs444.PageCount
crs444.absolutepage=pages1
if pages1=1 then
bihao=0
else
bihao=pages1*10-10
End if
For k=1 to crs444.PageSize
    bihaocontd=bihaocontd+1
Response.write bihao+bihaocontd & "."
Response.write "" & crs444("hname") & "[" & crs444("shu") & "朵]"
if crs444("zid")=Session("useid") then
Response.write "|<a href='homehy.asp?yi=zs&amp;ide=" & crs444("id") & "&amp;zid=" & crs444("zid") & "&amp;hname=" & crs444("hname") & "&amp;gn1=" & crs444("gn1") & "&amp;gn2=" & crs444("gn2") & "&amp;gn3=" & crs444("gn3") & "&amp;gn4=" & crs444("gn4") & "&amp;gn5=" & crs444("gn5") & "&amp;gn6=" & crs444("gn6") & "&amp;gn7=" & crs444("gn7") & "&amp;gn8=" & crs444("gn8") & "&amp;bh=" & crs444("bh") & "&amp;id="&id&"&amp;SessionID="&SessionID&"'>赠送</a>|<a href='homehy.asp?yi=chuu&amp;ide=" & crs444("id") & "&amp;id="&id&"&amp;SessionID="&SessionID&"'>丢弃</a>"
end if
Response.write "<br/>"
crs444.Movenext
if crs444.EOF then Exit for
 Next
end if
Response.write "--------------<br/>"
If pages1<crs444.PageCount then
    Response.Write "<a href='homehy.asp?yi=xh&amp;id="&iduse&"&amp;pages1=" & (pages1+1) & "&amp;id="&id&"&amp;SessionID="&SessionID&"'>下页</a>"
End if
If pages1>1 then
    Response.Write "|<a href='homehy.asp?yi=xh&amp;id="&iduse&"&amp;pages1=" & (pages1-1) & "&amp;id="&id&"&amp;SessionID="&SessionID&"'>上页</a>"
End if
    if crs444.RecordCount>crs444.PageSize then
    response.write "<br/>"
End if
response.write "&#40;第" &  pages1 & "页&#47;共" & crs444.PageCount & "页&#41;" & "共" & crs444.RecordCount & "珠鲜花."
if crs444.PageCount>1 then
response.write "<br/>第<input  name='pages1' value='2' size='2' format='*N'/>页<anchor>GO<go method='post' href='homehy.asp?yi=xh&amp;id="&iduse&"&amp;id="&id&"&amp;SessionID="&SessionID&"'><postfield name='pages1' value='$(pages1)'/></go></anchor>>>"
End if
Response.write "<br/><a href='home.asp?id=" &iduse & "&amp;SessionID="&SessionID&"'>我的家园</a>><a href='homehy.asp?id=" &iduse & "&amp;SessionID="&SessionID&"'>花园</a>>成品花"
end if
Response.write "<br/>"
%>
<br/>-------------
<br/><a href='/bbs/xhjy/home.asp?SessionID=<%=SessionID%>'>返回我的家园</a><br/>
<a href='/bbs/index.asp?SessionID=<%=SessionID%>'>返回社区首页</a>
<br/>北京时间:<%=time%>
</p></card></wml>
