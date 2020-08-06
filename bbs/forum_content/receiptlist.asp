<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%><%response.buffer=true%><%Response.ContentType = "text/vnd.wap.wml; charset=utf-8"%><?xml version="1.0" encoding="utf-8"?><!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml"><!--#INCLUDE VIRTUAL="/bbs/reg/useregs.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/reg/redtjname.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/public/codeun.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/reg/ltonline.asp"-->
<wml>
<head>
<meta http-equiv="Cache-Control" content="max-age=0"/>
<meta http-equiv="Cache-Control" content="no-cache"/>
<meta http-equiv="Expires" content="Mon, 1 Jan 1990 00:00:00 GMT"/>
</head>
<%
Dim d01(9)
d01(0)="顶礼，论坛有你更精彩!"
d01(1)="好贴大家顶住，论坛有你更加精彩! "
d01(2)="你是论坛友友福音.顶顶。"
d01(3)="顶辛勤发贴的楼主!"
d01(4)="强烈支持!"
d01(5)="向无私奉献的楼主敬意!"
d01(6)="真诚看帖,真心顶帖!"
d01(7)="感谢楼主无私的分享!"
d01(8)="好帖!大力顶上去! "
Randomize
I=Int(Rnd()*9)
adgg=d01(i)

SessionID=request.querystring("SessionID")
if SessionID="" then SessionID=Session("SessionID")
Server.ScriptTimeout=999
jdshow=CLng(Session("showjd"))
	iduse=Session("useid")
	ltname=Session("ltname")
  forumID=request("forumID")
  pages=request("pages")
  id=request("id")
  page=request("page")
if page<1 OR PAGE="" then page=1
  ids=Request("ids")
dim pages,bz,Rs,id
id=request("id")
set objgbrsy=Server.CreateObject("ADODB.Recordset")
rspl="select * from wuza where id="&id
objgbrsy.open rspl,conn,1,2
if objgbrsy.eof then
      response.write "<card id='card1' title='&#x67E5;&#x770B;&#x8D34;&#x5B50;'><p>&#x6587;&#x7AE0;ID&#x9519;&#x8BEF;&#xFF0C;&#x4F60;&#x6240;&#x67E5;&#x770B;&#x7684;&#x6587;&#x7AE0;&#x53EF;&#x80FD;&#x5DF2;&#x7ECF;&#x88AB;&#x5220;&#x9664;&#x3002;<br/><a href='/bbs/forum_content/contentlist.asp?ForumID=" & ForumID & "&amp;page=" & page & "&amp;SessionID=" & SessionID & "'>&#x8FD4;&#x56DE;</a></p></card></wml>"
      conn.close
      set objgbrsy=nothing
      set conn=nothing
      response.end
Else
dlnamess=converttowidebaiti(objgbrsy("biaoti"))
end if
objgbrsy.close
Set objgbrsy= Nothing

Response.Write "<card id='card1' title='" & dlnamess & "-" & converttowidebaiti("回复列表")& "'><p>"

if lycount>0 then
Response.write "<a href='/bbs/public/ckly.asp?SessionID=" & SessionID & "'>" & converttowidebaiti("您有")& "(" & lycount & ")" & converttowidebaiti("条新信息")& "</a><br/>"
       Session("returnuppath")=Request.ServerVariables("PATH_INFO") & "?forumID=" & forumID & "&amp;id=" & id & "&amp;page="&page&""
End if
if Session("zh")="wap" then
        Response.write "" & converttowidebaiti("游客请:")& "<a href='/BBS/UseLogiN.Asp?SessionID=" & SessionID & "'>" & converttowidebaiti("登陆/注册")& "</a><br/>"
End if
Response.write"" & converttowidebaiti("帖子")& ":<a href='/bbs/forum_content/BBs_receipt_ByContent.Asp?forumID=" & forumID & "&amp;sort=" & sort & "&amp;id=" & id& "&amp;page=" & page & "&amp;SessionID=" & SessionID & "'>"&dlnamess&"</a><br/>"
%>
<select name="face" value="">
<option value="">表情</option><option value="(imgs)1(/imgs)">胜利</option><option value="(imgs)2(/imgs)">偷笑</option><option value="(imgs)3(/imgs)">送花</option><option value="(imgs)4(/imgs)">调皮</option><option value="(imgs)5(/imgs)">欢迎</option><option value="(imgs)6(/imgs)">微笑</option><option value="(imgs)7(/imgs)">暴汗</option><option value="(imgs)8(/imgs)">大笑</option><option value="(imgs)9(/imgs)">晕了</option><option value="(imgs)10(/imgs)">疑惑</option><option value="(imgs)11(/imgs)">别吵</option><option value="(imgs)12(/imgs)">流泪</option><option value="(imgs)13(/imgs)">脸红</option><option value="(imgs)14(/imgs)">色色</option><option value="(imgs)15(/imgs)">惊讶</option><option value="(imgs)16(/imgs)">上火</option><option value="(imgs)17(/imgs)">飞吻</option><option value="(imgs)18(/imgs)">摆酷</option><option value="(imgs)19(/imgs)">睡觉</option><option value="(imgs)20(/imgs)">闭嘴</option><option value="(imgs)21(/imgs)">再见</option><option value="(imgs)0(/imgs)">疑问</option></select><input type="text" name="name<%=minute(now)%><%=second(now)%>" maxlength="300" value="<%=converttowidebaiti(adgg)%>" size="8"/>
<anchor>&#x56DE;&#x590D;<go method="post" href='/bbs/forum_content/forum_receipt.Asp?SessionID=<%=SessionID%>'><postfield name="name" value="$(name<%=minute(now)%><%=second(now)%>)"/><postfield name="face" value="$(face)"/><%
       Response.write "<postfield name='id' value='" & id & "'/>"
       Response.write "<postfield name='page' value='" & page & "'/>"
       Response.write "<postfield name='ForumID' value='" & ForumID & "'/>"
%></go></anchor>.<%Response.write "<a href='/BBS/forum_content/Receiptlist.asp?ForumID=" & ForumID & "&amp;ID=" & id & "&amp;Page=" & page & "&amp;SessionID=" & SessionID & "'>刷新</a><br/>-------------<br/>"%>
<%
set Rs=Server.CreateObject("ADODB.Recordset")
rspl="select * from lthf where CStr(id)=" & id & " order by times desc"
Rs.open rspl,conn,1,2
if Rs.eof then
   Response.write "" & converttowidebaiti("暂无回复记录")& "<br/>"
else
a=rs.recordcount
'分页的实现 
rs.PageSize=10
pages =CLng(Request("pages"))
if pages<1 then pages=1
if pages>rs.PageCount then pages=rs.PageCount
rs.absolutepage=pages
if pages=1 then
bihao=0
else
'========================================================================================
name=request.servervariables("script_name") 'name为当前文件名
'========================================================================================
bihao=pages*10-10
End if
For k=1 to rs.PageSize
bihaocont=bihaocont+1
tjhm=rs("tjhm")
	sqlll="select * from usereg where CStr(id)='" & tjhm & "'"
	set rsSS=conn.execute(sqlll)
	rtjname=rsSS("usename")
set rsSS=nothing
ids=rs("ids")
Content=left(rs("name"),1440)
if len(rs("name"))>1440 then
Content=Content+"(url=/BBS/forum_content/rezcwwcl.asp?forumID="&forumID&"&id="&id&"&ids="&ids& "&page="&page&"&pages="&pages&"&SessionID=" &SessionID&")详...(/url)"
End if
louid=rs.RecordCount-CLng(bihao+bihaocont)+1
if louid=1 then 
louid="沙发:"
elseif louid=2 then 
louid="椅子:"
elseif louid=3 then 
louid="凳子:"
elseif louid>3 then 
louid=cstr(louid)+"楼:"
end if
Response.Write ""&louid&hyvipimg&""
set objgbrsd=Server.CreateObject("ADODB.Recordset")
  ssqld="select * from wuza Where CStr(id)='" & id &"'"
  objgbrsd.open ssqld,conn,1,1
if objgbrsd("jsy")="f" then
Response.write "" &frionline& ""
Response.write "<a href='/bbs/reg/useinfo.asp?id=" & rs("tjhm") & "&amp;SessionID=" & SessionID & "'>" & converttowidebaiti(rtjname) & "(ID:" & rs("tjhm") & ")</a>:"
end if
if objgbrsd("jsy")="a" then
Response.write "" &frionline& ""
Response.write "<a href='/bbs/reg/useinfo.asp?id=" & rs("tjhm") & "&amp;SessionID=" & SessionID & "'>" & converttowidebaiti(rtjname) & "(ID:" & rs("tjhm") & ")</a>:"
end if
objgbrsd.close
set objgbrsd=nothing
Response.write "" & converttowide(UBBCodes(Content)) & ""
Response.write"(" & String(2-Len(Month(rs("times"))),"0") & Month(rs("times")) & "-" & String(2-len(Day(rs("times"))),"0") & Day(rs("times")) & " &nbsp;" & String(2-Len(hour(rs("times"))),"0") & hour(rs("times"))  & ":" & String(2-Len(minute(rs("times"))),"0") & minute(rs("times")) & ")"
if CStr(rs("tjhm"))=CStr(Session("useid")) then
response.write " [<a href='rewzjs.asp?forumID=" & forumID & "&amp;ids=" & rs("ids") & "&amp;id=" & rs("id") & "&amp;page=" & page & "&amp;SessionID=" & SessionID & "'>" & converttowidebaiti("续") & "</a>&nbsp;<a href='redelww.asp?forumID=" & forumID & "&amp;id=" & rs("tjhm") & "&amp;ids=" & rs("ids") & "&amp;idss=" &rs("id") & "&amp;page=" & page & "&amp;debz=t&amp;SessionID=" & SessionID & "'>" & converttowidebaiti("删") & "</a>&nbsp;<a href='hf.asp?forumID=" & forumID & "&amp;ids=" & rs("ids") & "&amp;id=" & rs("id") & "&amp;page=" & page & "&amp;SessionID=" & SessionID & "'>" & converttowidebaiti("编") & "</a>]"
End if
if Cstr(Session("yxxezb"))<>"" or Session("yxxexc")<>"" or Session("cw1")<>"" or Session("cg")<>"" or Session("vip")<>"" or Session("bzbz")=forumID or Session("gly")=forumID or Session("Counter")="pass_numbers_55556666" then
response.write " [<a href='redelww.asp?forumID=" & forumID & "&amp;id=" & rs("tjhm") & "&amp;ids=" & rs("ids") & "&amp;idss=" & rs("id") & "&amp;page=" & page & "&amp;debz=t&amp;SessionID=" & SessionID & "'>" & converttowidebaiti("删除") & "</a>]"
End if
Response.write "<br/>"
rs.Movenext
if rs.EOF then Exit for
 Next
if rs.pagecount>1 then
Response.write"-------------<br/>"
end if
if rs.pagecount-pages <> 0 then
response.write("<a href='/BBS/forum_content/receiptlist.asp?SessionID="&SessionID&"&amp;page=" & page & "&amp;forumID=" & forumID & "&amp;ID=" & ID & "&amp;pages="&pages+1&"'>下页</a>&nbsp;")
end if
if pages>1 then
response.write("<a href='/BBS/forum_content/receiptlist.asp?SessionID="&SessionID&"&amp;page=" & page & "&amp;forumID=" & forumID & "&amp;ID=" & ID & "&amp;pages="&pages-1&"'>上页</a>")
end if

if rs.pagecount>1 then
response.write("("&pages&"/"&rs.pagecount&"/"&a&")<br/>")
%>
                    <input name="Pages<%=minute(now)%><%=second(now)%>" title="页码" type="text" format="*N" emptyok="true" size="3" maxlength="4" value="<%if Pages>=rs.pagecount then response.write(Pages-1) else response.write(Pages+1)%>"/>页<anchor>跳页
		      <go href="/BBS/forum_content/receiptlist.asp?SessionID=<%=SessionID%>&amp;page=<%=page%>&amp;forumID=<%=forumID%>&amp;ID=<%=ID%>" accept-charset='utf-8'>
		            <postfield name="Pages" value="$(Pages<%=minute(now)%><%=second(now)%>)"/>
		      </go>
		</anchor><br/>
                <%end if
End if
set objgbrssy=Server.CreateObject("ADODB.Recordset")
rspls="select * from sclt where id="&forumID
objgbrssy.open rspls,conn,1,2
if objgbrssy.eof then
dlnamse="无此论坛"
Else
dlnamse=objgbrssy("name")
end if
objgbrssy.close
Set objgbrssy= Nothing
%><select name="face" value="">
<option value="">表情</option><option value="(imgs)1(/imgs)">胜利</option><option value="(imgs)2(/imgs)">偷笑</option><option value="(imgs)3(/imgs)">送花</option><option value="(imgs)4(/imgs)">调皮</option><option value="(imgs)5(/imgs)">欢迎</option><option value="(imgs)6(/imgs)">微笑</option><option value="(imgs)7(/imgs)">暴汗</option><option value="(imgs)8(/imgs)">大笑</option><option value="(imgs)9(/imgs)">晕了</option><option value="(imgs)10(/imgs)">疑惑</option><option value="(imgs)11(/imgs)">别吵</option><option value="(imgs)12(/imgs)">流泪</option><option value="(imgs)13(/imgs)">脸红</option><option value="(imgs)14(/imgs)">色色</option><option value="(imgs)15(/imgs)">惊讶</option><option value="(imgs)16(/imgs)">上火</option><option value="(imgs)17(/imgs)">飞吻</option><option value="(imgs)18(/imgs)">摆酷</option><option value="(imgs)19(/imgs)">睡觉</option><option value="(imgs)20(/imgs)">闭嘴</option><option value="(imgs)21(/imgs)">再见</option><option value="(imgs)0(/imgs)">疑问</option></select><input type="text" name="name<%=minute(now)%><%=second(now)%>" maxlength="300" value="<%=converttowidebaiti(adgg)%>" size="8"/>
<anchor>&#x56DE;&#x590D;<go method="post" href='/bbs/forum_content/forum_receipt.Asp?SessionID=<%=SessionID%>'><postfield name="name" value="$(name<%=minute(now)%><%=second(now)%>)"/><postfield name="face" value="$(face)"/><%
       Response.write "<postfield name='id' value='" & id & "'/>"
       Response.write "<postfield name='page' value='" & page & "'/>"
       Response.write "<postfield name='ForumID' value='" & ForumID & "'/>"
%></go></anchor><%
Response.write".<a href='/BBS/forum_content/Receiptlist.asp?ForumID=" & ForumID & "&amp;ID=" & id & "&amp;Page=" & page & "&amp;SessionID=" & SessionID & "'>刷新</a><br/>-------------<br/><a href='/bbs/forum_content/BBs_receipt_ByContent.Asp?forumID=" & forumID & "&amp;sort=" & sort & "&amp;id=" &id & "&amp;page=" & page & "&amp;SessionID=" & SessionID & "'>" & converttowidebaiti("返回查看原文")& "</a><br/>"
Response.write "<a href='/bbs/forum_content/contentlist.asp?forumID=" & forumID & "&amp;page=" & page & "&amp;SessionID=" & SessionID & "'>" & converttowidebaiti("返回")& "" & converttowidebaiti(dlnamse) & "</a>"
Response.write "<br/><a href='/bbs/index.asp?SessionID=" & SessionID & "'>" & converttowidebaiti("返回社区首页")& "</a>"%>
</p></card></wml>
<%
Function frionline()
  page=request("page")
  set objgbrr=Server.CreateObject("ADODB.Recordset")
  ssql="select * from SoftDown_online where Cstr(ids)='" & tjhm  & "'"
  objgbrr.open ssql,conn
  if not objgbrr.eof then
  frionline="<img src='/bbs/forum_content/online_m.gif'  alt='&#x5728;&#x7EBF;'/>"
  else
  frionline="<img src='/bbs/forum_content/offline.gif'  alt='&#x79BB;&#x7EBF;'/>"
  end if
  set objgbrr=nothing
End function

%>