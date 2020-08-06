<% @LANGUAGE="VBSCRIPT" CODEPAGE="65001" %><%Response.ContentType = "text/vnd.wap.wml; charset=utf-8"%><?xml version="1.0" encoding="utf-8"?><!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml"><!--#INCLUDE VIRTUAL="/bbs/reg/useregs.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/public/codeun.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/reg/redtjname.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/reg/ltonline.asp"--><wml><head><meta http-equiv="Cache-Control" content="max-age=0"/><meta http-equiv="Cache-Control" content="no-cache"/><meta http-equiv="Expires" content="Mon, 1 Jan 1990 00:00:00 GMT"/></head><%
SessionID=request.querystring("SessionID")
if SessionID="" then SessionID=Session("SessionID")
page=int(request("page"))
iduse=Session("useid")
forumID=request("forumID")
   if Clng(forumID)<1 then
       response.end
   End if
lasttlss=ForumID
lasttlls=ForumID
lasttls
if page="" or page<=0 then
page=1
end if
%>
<!--#include file="contensx.asp"-->

<%
  sql="update sclt set rc=rc+1,times='" & now() & "' Where CStr(id)='" & ForumID & "'"
  conn.Execute(sql)

  dim sort,desc,StrFont
  sort=request.querystring("sort")
if sort="" then
sort=5
end if
  select case sort

  case 5
  wheretmp="where Cstr(itid)='" & ForumID & "'"
  desc="times"
  StrFont="<a href='/BBS/Forum_Content/forum_addcontent.asp?ForumID=" & ForumID & "&amp;sort=" & sort & "&amp;page=" & page & "&amp;SessionID=" & SessionID & "'>&#x53D1;&#x8D34;</a>.<a href='/BBS/Forum_Content/MySet.Asp?ForumID=" & ForumID & "&amp;sort=" & sort & "&amp;page=" & page & "&amp;SessionID=" & SessionID & "'>&#x529F;&#x80FD;</a>.<a href='/BBS/public/bbbz.asp?ForumID=" & ForumID & "&amp;sort=" & sort & "&amp;Page=" & Page & "&amp;SessionID=" & SessionID & "'>&#x7248;&#x52A1;</a>.<a href='/bbs/public/glcy.asp?SessionID=" & SessionID & "'>团队</a>.<a href='/BBS/public/shownum.asp?sspage=" & Request.ServerVariables("PATH_INFO") & "&amp;SessionID=" & SessionID & "&amp;ForumID=" & ForumID & "&amp;sort=" & sort & "&amp;id=" & id & "&amp;spage=" & spage & "&amp;page=" & page & "'>设置</a><br/><a href='/BBS/Forum_Content/bbs_ltzt.asp?ForumID=" & ForumID & "&amp;sort=" & sort & "&amp;page=" & page & "&amp;SessionID=" & SessionID & "'>专题</a>.<a href='/bbs/sqbz/gyqx.asp?SessionID=" & SessionID & "'>权限</a>.<a href='/BBS/Forum_Content/bbs_zcrj.asp?ForumID=" & ForumID & "&amp;sort=" & sort & "&amp;SessionID=" & SessionID & "'>&#x65E5;&#x5FD7;</a>.<a href='/BBS/Forum_Content/contentlist.asp?ForumID=" & ForumID & "&amp;sort=1&amp;SessionID=" & SessionID & "'>&#x7CBE;&#x534E;</a>.<a href='/BBS/Forum_Content/contentlist.asp?ForumID=" & ForumID & "&amp;sort=" & sort & "&amp;Page=" & Page & "&amp;SessionID=" & SessionID & "&amp;tim=" & time() & "'>&#x5237;&#x65B0;</a>"
  end select%><card id='main' title='<%=converttowidebaiti(SystemSiteName)%>-<%=converttowidebaiti(dlname)%>'><p align='<%=Systemdj%>'>
<%if len(ltlogo)>8 then%>
<img src="<%=ltlogo%>" alt="LOGO"/><br/>
<%end if%>
<%if len(dljj)>90 then%>
<%=converttowidebaiti(dljj)%><br/>
<%end if%><%
if lycount>0 then
      Response.write "<img src='/bbs/tz/chatroom/notice.gif' alt=''/><a href='/BBS/public/ckly.asp?SessionID=" & SessionID & "'>&#x60A8;&#x6709;(" & lycount & ")&#x6761;&#x65B0;&#x7559;&#x8A00;</a><br/>"
	Session("returnuppath")=Request.ServerVariables("PATH_INFO") & "?ForumID="&ForumID&"&amp;page="&page&"&amp;Sort="&Sort&""
End if
%>
<%
if page=1 then
%>
<%if gbkg<>"n" then
sql="select top 1 * from affich where DATEDIFF('s', AfficheTime, now()) order by AfficheId desc"
set rs=server.createobject("adodb.recordset")
rs.open sql,conn,1,1
if rs.eof and rs.bof then
	'response.write "&#x6682;&#x65E0;&#x516C;&#x544A;<br/>"
else
   do while not rs.eof
mome=left(rs("AfficheName"),15)
   if len(rs("AfficheName"))>15 then
    mome=mome+"..."
   End if
       
 Response.write ""&rs("vote")&"向"&rs("addvote")&"送了一朵<img src='/bbs/xhjy/hua/"&rs("voteID")&".gif' alt=''/><b>说:</b>"&converttowidebaiti(mome)&"<br/>"
	rs.movenext
	loop
	end if
	rs.close
	set rs=nothing
end if%>
<%if gbkg<>"n" then
sql="select top 2 * from affic where DATEDIFF('s', AfficheTime, now()) order by AfficheId desc"
set rs=server.createobject("adodb.recordset")
rs.open sql,conn,1,1
if rs.eof and rs.bof then
	'response.write "&#x6682;&#x65E0;&#x516C;&#x544A;<br/>"
else
   do while not rs.eof
mome=left(rs("AfficheName"),30)
   if len(rs("AfficheName"))>30 then
    mome=mome+"..."
   End if
       
 Response.write "<img src='/bbs/xhgg/gg.gif' alt='' /><a href='/bbs/reg/useinfo.asp?id="&rs("ids")&"&amp;SessionID=" & SessionID & "'>"&rs("vote")&"</a><b>说:</b>"&converttowidebaiti(mome)&"<br/>"
	rs.movenext
	loop
	end if
	rs.close
	set rs=nothing
end if
%>
<%
set rsyt=Server.CreateObject("ADODB.Recordset")
sqlr="select * from sclt where yc<>1 and formid="&ForumID&" order by pid asc"
rsyt.open sqlr,conn,1,2
if rsyt.eof then 
'response.write("&#x6682;&#x65E0;&#x8BBA;&#x575B;&#x7248;&#x5757;")
   else
'response.write("-=下级版块=-<br/>")
rsyt.Move(0)
dim j
j=1
do while ((not rsyt.EOF) and j <=30)
%>
<%if rsyt("lx")="1" then%>
<a href='/BBS/Forum_Content/ContentlisT.asp?ForumID=<%=rsyt("id")%>&amp;SessionID=<%=SessionID%>'><%=converttowidebaiti(rsyt("name"))%></a>
<%elseif rsyt("lx")="2" then%>
<a href='<%=rsyt("shuo")%>'><%=rsyt("name")%></a>
<%elseif rsyt("lx")="0" then%>
<%=rsyt("name")%>
<%end if%>
<%if rsyt("brr")=1 then%><br/><%end if%>
<%
rsyt.MoveNext
j=j+1
loop

Response.write "-------------<br/>"
end if
rsyt.close
set rsyt=nothing
End if


sql="select top 1 * from affiche where DATEDIFF('s', AfficheTime, now()) < 5000*60 order by AfficheId desc"
set rs=server.createobject("adodb.recordset")
rs.open sql,conn,1,1
if rs.eof and rs.bof then
	'response.write "&#x6682;&#x65E0;&#x516C;&#x544A;<br/>"
else
   do while not rs.eof
    Response.write "&#x516C;&#x544A;:<a href='/BBS/bbs_affichecl.asp?id=" & rs("AfficheId") & "&amp;SessionID=" & SessionID & "'>"&converttowidebaiti(rs("AfficheName"))&"</a><br/>"
	rs.movenext
	loop
	end if
	rs.close
	set rs=nothing


dim jdshow,page
jdshow=CLng(Session("showjd"))
set objgbrs=Server.CreateObject("ADODB.Recordset")
ssql="select * from wuza " & wheretmp & " order by "& desc &" desc "
objgbrs.open ssql,conn,1,1
objgbrs.PageSize=jdshow

page=CLng(request("page"))
if page="" or page<=0 then
   page=1
End if
if page>objgbrs.pagecount then
   page=objgbrs.pagecount
End if

response.write StrFont
Response.write "<br/>-------------<br/>"
if objgbrs.eof then
 Response.write "没有帖子<br/>-------------<br/>"
else
 objgbrs.absolutepage=page
   if page=1 then
     bihao=0
    else
     bihao=page * jdshow-jdshow
   End if
If Page<objgbrs.PageCount and Page>=2 then
    Response.Write "<a href='/BBS/Forum_Content/contentlist.asp?ForumID=" & ForumID & "&amp;sort=" & sort & "&amp;page=" & (page+1) & "&amp;SessionID=" & SessionID & "'>&#x4E0B;&#x9875;</a>"
End if
If page>1 then
    Response.Write "<a href='/BBS/Forum_Content/contentlist.asp?ForumID=" & ForumID & "&amp;sort=" & sort & "&amp;page=" & (page-1) & "&amp;SessionID=" & SessionID & "'>&#x4E0A;&#x9875;</a>"
End if
if objgbrs.PageCount>1 and Page>=2 then
response.write "(" &  Page & "&#47;" & objgbrs.PageCount & "&#47;" & objgbrs.RecordCount & ")<br/>"
End if
For i=1 to objgbrs.PageSize
    id=objgbrs("id")
    bihaocont=bihaocont+1
   if objgbrs("jh")="t" then
     jh="<img src='tu/jin.gif' alt='精'/>"
    else
     jh=""
   End if
   if objgbrs("pic")="k" then
     pics="<img src='tu/tu.gif' alt='图'/>"
    else
     pics=""
   End if
   if objgbrs("pic")="l" then
     ljj="<img src='tu/lian.gif' alt='链'/>"
    else
     ljj=""
   End if
   if objgbrs("pic")="r" then
     ruan="<img src='tu/luan.gif' alt='软'/>"
    else
     ruan=""
   End if
   if objgbrs("lzdname")="y" then
     yyy="<img src='tu/yin.gif' alt='隐'/>"
    else
     yyy=""
   End if

   if objgbrs("bntjyy2")="k" then
     tou="<img src='tu/tou.gif' alt='投'/>"
    else
     tou=""
   End if

   if objgbrs("lijin")="k" then
     lis="<img src='tu/bi.gif' alt='币'/>"
    else
     lis=""
   End if

   if objgbrs("maimai")="k" then
     mai="<img src='tu/mai.gif' alt='卖'/>"
    else
     mai=""
   End if

 if objgbrs("tj")="t" then
     tj="<img src='tu/jian.gif' alt='荐'/>"
    else
     tj=""
   End if
 if objgbrs("hd")="t" then
     hd="<img src='tu/huo.gif' alt='活'/>"
    else
     hd=""
   End if
 if objgbrs("bntj")="t" then
   bntj="<img src='tu/min.gif' alt='名'/>"
    else
     bntj=""
   End if
 if objgbrs("bntjyy1")="t" then
    bnt="<img src='tu/suo.gif' alt='锁'/>"
    else
     bnt=""
   End if
   if objgbrs("times")="2100-10-10 12:12:12" then
     zd="<img src='tu/din.gif' alt='顶'/>"
    else
     zd=""
   end if
if objgbrs("times")="2000-10-10 12:12:12" then
     sd="<img src='tu/di.gif' alt='底'/>"
 else 
 sd=""
End if
 if objgbrs("a")="t" then
      ggg="<img src='tu/qian.gif' alt='强'/>"
    else
     a=""
   End if
    tjhm=objgbrs("tjhm")
    hfyl=left(objgbrs("biaoti"),30)
   if len(objgbrs("biaoti"))>30 then
    hfyl=hfyl+""
   End if

Response.write bihao+bihaocont & "." & "" & ggg & "" & yyy & "" & ljj & "" & bnt & "" & pics & "" & ruan & "" & tou & "" & lis & "" & mai & "" & sd & "" & zd & "" & jh & "" & tj & "" & hd & "" & bntj & ""
Response.write"<a href='/BBS/Forum_Content/BBs_receipt_ByContent.Asp?ForumID=" & ForumID & "&amp;sort=" & sort & "&amp;id=" & objgbrs("id") & "&amp;page=" & page & "&amp;SessionID=" & SessionID & "'>" & converttowidebaiti(hfyl) & " </a>"
if objgbrs("hfcont")>=50 then
Response.write "<img src='/f.gif' alt=''/>"
end if
if objgbrs("hfcont")>=1 then
Response.write "<br/>[" & converttowidebaiti(redtjname) & "/回<a href='/BBS/Forum_Content/receiptlist.asp?ForumID=" & ForumID & "&amp;sort=" & sort & "&amp;id=" & objgbrs("id") & "&amp;page=" & page & "&amp;SessionID=" & SessionID & "'>" & objgbrs("hfcont") & "</a>/阅" & objgbrs("rc") & "]<br/>"
else
Response.write " " & converttowidebaiti(redtjname) & "(" & objgbrs("rc") & ")<br/>"
end if
    objgbrs.Movenext
  if objgbrs.EOF then Exit for
    Next
end if
If Page<objgbrs.PageCount then
    Response.Write "<a href='/BBS/Forum_Content/contentlist.asp?ForumID=" & ForumID & "&amp;Sort=" & Sort & "&amp;page=" & (page+1) & "&amp;SessionID=" & SessionID & "'>&#x4E0B;&#x9875;</a>"
End if
If page>1 then
    Response.Write "<a href='/BBS/Forum_Content/contentlist.asp?ForumID=" & ForumID & "&amp;Sort=" & Sort & "&amp;page=" & (page-1) & "&amp;SessionID=" & SessionID & "'>&#x4E0A;&#x9875;</a>"
End if
if objgbrs.PageCount>1 then
response.write "(" &  Page & "&#47;" & objgbrs.PageCount & "&#47;" & objgbrs.RecordCount & ")<br/><input  name='page' value='2' size='2' format='*N'/><anchor>&#x8DF3;&#x9875;<go method='post' href='/BBS/Forum_Content/contentlist.asp?SessionID=" & SessionID & "'><postfield name='SORt' value='" & SORt & "'/><postfield name='ForumID' value='" & ForumID & "'/><postfield name='page' value='$(page)'/></go></anchor><br/>"
End if
  if page=<1 or page>1 then
  End if
Response.Write "<a href='/BBS/Forum_Content/qd.asp?ForumID=" & ForumID & "&amp;sort=" & sort & "&amp;Page=" & Page & "&amp;SessionID=" & SessionID & "'>签到</a>.<a href='1.asp?ForumID=" & ForumID & "&amp;sort=" & sort & "&amp;page=" & page & "&amp;SessionID=" & SessionID & "'>基金</a>.<a href='zcwwbntj.asp?ForumID=" & ForumID & "&amp;sort=" & sort & "&amp;page=" & page & "&amp;SessionID=" & SessionID & "'>名人</a>.<a href='/bbs/reg/ckzxhyany.asp?ForumID=" & ForumID & "&amp;sort=" & sort & "&amp;lasttlss=" & lasttlss & "&amp;page=" & Request.ServerVariables("PATH_INFO") & "&amp;SessionID=" & SessionID & "'>在线</a>.<a href='/BBS/Forum_Content/ess.asp?ForumID=" & ForumID & "&amp;sort=" & sort & "&amp;Page=" & Page & "&amp;SessionID=" & SessionID & "'>搜贴</a><br/>"
if objgbrs.PageCount>1 then
%>
<% 
  End if
    Response.Write "-------------<br/>"
if formid<>0 then
response.write "<a href='/BBS/Forum_Content/ContentlisT.asp?ForumID="&formid&"&amp;SessionID=" & SessionID & "'>"&converttowidebaiti("返回上级版块")&"</a><br/>"
End if
objgbrs.close
Set objgbrs= Nothing
set rs=Server.CreateObject("ADODB.Recordset")
sql="select * from sclt where jiazu>0 and ID="&ForumID&" order by pid asc"
rs.open sql,conn,1,2
if rs.eof then 
response.write("")
response.write("<a href='/bbs/ztlb.asp?SessionID=" & SessionID & "'>&#x8FD4;&#x56DE;&#x8BBA;&#x575B;&#x4E2D;&#x5FC3;</a>")
   else
%>
<a href='/bbs/chatroom/chatroom.asp?itid=<%=rs("jiazu")%>&amp;show=1&amp;SessionID=<%=SessionID%>'>&#x5E2E;&#x6D3E;&#x804A;&#x5929;&#x5BA4;</a><br/>
<a href='/bbs/djcs.asp?id=<%=rs("jiazu")%>&amp;SessionID=<%=SessionID%>'>&#x8FD4;&#x56DE;&#x5E2E;&#x6D3E;&#x9875;&#x9762;</a><br/>
<%
end if
rs.close
set rs=nothing
%>

<%
response.write "<br/><a href='/BBS/index.asp?SessionID=" & SessionID & "'>&#x8FD4;&#x56DE;&#x793E;&#x533A;&#x9996;&#x9875;</a><br/><a href='/index.asp?SessionID=" & SessionID & "'>&#x8FD4;&#x56DE;&#x7F51;&#x7AD9;&#x9996;&#x9875;</a><br/>"%></p></card></wml>

<% 

conn.close
set conn=nothing
%>