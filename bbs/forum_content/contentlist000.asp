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
'================================
  case 1
  jh="t"
  wheretmp="where jh='" & jh & "' and Cstr(itid)='" & ForumID & "'"
  desc="Id"
  StrFont="<a href='/BBS/Forum_content/contentlist.asp?ForumID=" & ForumID & "&amp;SessionID=" & SessionID & "'>&#x666E;&#x901A;</a>|<a href='/BBS/Forum_content/forum_addcontent.asp?ForumID=" & ForumID & "&amp;sort=" & sort & "&amp;page=" & page & "&amp;SessionID=" & SessionID & "'>&#x53D1;&#x8D34;</a>|<a href='/BBS/Forum_content/MySet.Asp?ForumID=" & ForumID & "&amp;sort=" & sort & "&amp;page=" & page & "&amp;SessionID=" & SessionID & "'>&#x529F;&#x80FD;</a>|<a href='/BBS/Forum_content/bbs_zcrj.asp?ForumID=" & ForumID & "&amp;sort=" & sort & "&amp;SessionID=" & SessionID & "'>&#x65E5;&#x5FD7;</a>"
'================================
  case 2
  wheretmp="where Cstr(itid)='" & ForumID & "'"
  desc="rc"
  StrFont="<a href='/BBS/Forum_content/contentlist.asp?ForumID=" & ForumID & "&amp;SessionID=" & SessionID & "'>&#x666E;&#x901A;</a>|<a href='/BBS/Forum_content/forum_addcontent.asp?ForumID=" & ForumID & "&amp;sort=" & sort & "&amp;page=" & page & "&amp;SessionID=" & SessionID & "'>&#x53D1;&#x8D34;</a>|<a href='/BBS/Forum_content/MySet.Asp?ForumID=" & ForumID & "&amp;sort=" & sort & "&amp;page=" & page & "&amp;SessionID=" & SessionID & "'>&#x529F;&#x80FD;</a>|<a href='/BBS/Forum_content/bbs_zcrj.asp?ForumID=" & ForumID & "&amp;sort=" & sort & "&amp;SessionID=" & SessionID & "'>&#x65E5;&#x5FD7;</a>"
'================================
  case 3
  tj="t"
  wheretmp="where tj='" & tj & "' and Cstr(itid)='" & ForumID &"'"
  desc="Id"
  StrFont="<a href='/BBS/Forum_content/contentlist.asp?ForumID=" & ForumID & "&amp;SessionID=" & SessionID & "'>&#x666E;&#x901A;</a>|<a href='/BBS/Forum_content/forum_addcontent.asp?ForumID=" & ForumID & "&amp;sort=" & sort & "&amp;page=" & page & "&amp;SessionID=" & SessionID & "'>&#x53D1;&#x8D34;</a>|<a href='/BBS/Forum_content/MySet.Asp?ForumID=" & ForumID & "&amp;sort=" & sort & "&amp;page=" & page & "&amp;SessionID=" & SessionID & "'>&#x529F;&#x80FD;</a>|<a href='/BBS/Forum_content/bbs_zcrj.asp?ForumID=" & ForumID & "&amp;sort=" & sort & "&amp;SessionID=" & SessionID & "'>&#x65E5;&#x5FD7;</a>"
'================================
  case 4
  wheretmp="where Cstr(itid)='" & ForumID &"'"
  desc="hfcont"
  StrFont="<a href='/BBS/Forum_content/contentlist.asp?ForumID=" & ForumID & "&amp;SessionID=" & SessionID & "'>&#x666E;&#x901A;</a>|<a href='/BBS/Forum_content/forum_addcontent.asp?ForumID=" & ForumID & "&amp;sort=" & sort & "&amp;page=" & page & "&amp;SessionID=" & SessionID & "'>&#x53D1;&#x8D34;</a>|<a href='/BBS/Forum_content/MySet.Asp?ForumID=" & ForumID & "&amp;sort=" & sort & "&amp;page=" & page & "&amp;SessionID=" & SessionID & "'>&#x529F;&#x80FD;</a>|<a href='/BBS/Forum_content/bbs_zcrj.asp?ForumID=" & ForumID & "&amp;sort=" & sort & "&amp;SessionID=" & SessionID & "'>&#x65E5;&#x5FD7;</a>"
'================================
  case 6
  wheretmp="where Cstr(itid)='" & ForumID & "'"
  desc="id"
  StrFont="<a href='/BBS/Forum_content/contentlist.asp?ForumID=" & ForumID & "&amp;SessionID=" & SessionID & "'>&#x666E;&#x901A;</a>|<a href='/BBS/Forum_content/forum_addcontent.asp?ForumID=" & ForumID & "&amp;sort=" & sort & "&amp;page=" & page & "&amp;SessionID=" & SessionID & "'>&#x53D1;&#x8D34;</a>|<a href='/BBS/Forum_content/MySet.Asp?ForumID=" & ForumID & "&amp;sort=" & sort & "&amp;page=" & page & "&amp;SessionID=" & SessionID & "'>&#x529F;&#x80FD;</a>|<a href='/BBS/Forum_content/bbs_zcrj.asp?ForumID=" & ForumID & "&amp;sort=" & sort & "&amp;SessionID=" & SessionID & "'>&#x65E5;&#x5FD7;</a>"
'================================
  case 7
  wheretmp="where Cstr(itid)='" & ForumID & "' and tjhm='" & iduse & "'"
  desc="id"
  StrFont="<a href='/BBS/Forum_content/contentlist.asp?ForumID=" & ForumID & "&amp;SessionID=" & SessionID & "'>&#x666E;&#x901A;</a>|<a href='/BBS/Forum_content/forum_addcontent.asp?ForumID=" & ForumID & "&amp;sort=" & sort & "&amp;page=" & page & "&amp;SessionID=" & SessionID & "'>&#x53D1;&#x8D34;</a>|<a href='/BBS/Forum_content/MySet.Asp?ForumID=" & ForumID & "&amp;sort=" & sort & "&amp;page=" & page & "&amp;SessionID=" & SessionID & "'>&#x529F;&#x80FD;</a>|<a href='/BBS/Forum_content/bbs_zcrj.asp?ForumID=" & ForumID & "&amp;sort=" & sort & "&amp;SessionID=" & SessionID & "'>&#x65E5;&#x5FD7;</a>"
'================================
  case 5
  wheretmp="where Cstr(itid)='" & ForumID & "'"
  desc="times"
  StrFont="<a href='/BBS/Forum_content/forum_addcontent.asp?ForumID=" & ForumID & "&amp;sort=" & sort & "&amp;page=" & page & "&amp;SessionID=" & SessionID & "'>&#x53D1;&#x8D34;</a>|<a href='/BBS/Forum_content/MySet.Asp?ForumID=" & ForumID & "&amp;sort=" & sort & "&amp;page=" & page & "&amp;SessionID=" & SessionID & "'>&#x529F;&#x80FD;</a>|<a href='/BBS/Forum_content/bbs_zcrj.asp?ForumID=" & ForumID & "&amp;sort=" & sort & "&amp;SessionID=" & SessionID & "'>&#x65E5;&#x5FD7;</a>|<a href='/BBS/Forum_content/contentlist.asp?ForumID=" & ForumID & "&amp;sort=1&amp;SessionID=" & SessionID & "'>&#x7CBE;&#x534E;</a>"
  end select%><card id='main' title='<%=converttowidebaiti(SystemSiteName)%>-<%=converttowidebaiti(dlname)%>'><p align='<%=Systemdj%>'>
<%if len(ltlogo)>80 then%>
<img src="<%=ltlogo%>" alt="LOGO"/><br/>
<%end if%>
<%if len(dljj)>90 then%>
<%=converttowidebaiti(dljj)%><br/>
<%end if%><%
if lycount>0 then
      Response.write "<a href='/BBS/public/ckly.asp?SessionID=" & SessionID & "'>&#x60A8;&#x6709;(" & lycount & ")&#x6761;&#x65B0;&#x7559;&#x8A00;</a><br/>"
	Session("returnuppath")=Request.ServerVariables("PATH_INFO") & "?ForumID="&ForumID&"&amp;page="&page&"&amp;Sort="&Sort&""
End if
%><%
if page=1 then
response.write "<select name='wap_yxxe_net'><option>&#x7248;&#x4E3B;&#x5217;&#x8868;</option>"
set rss=Server.CreateObject("ADODB.Recordset")
ssqlll="select * from usereg where  Cstr(gly)=" & ForumID & " order by id"
rss.open ssqlll,conn,1,2
z=1
do while not rss.eof
nam=rss("usename")
if len(nam)>8 then nam=left(nam,8)
if rss("bzbz")<>"0" then zzww="[&#x4E3B;&#x7248;]"
if rss("bzbz")="0" then zzww="[&#x526F;&#x7248;]"
Response.write "<option onpick='/BBS/reg/useinfo.asp?id="&rss("id")&"&amp;SessionID="&SessionID&"'>" & zzww & "" & converttowidebaiti(nam) & "</option>"
z=z+1
rss.movenext
loop
rss.close
set rss=nothing
Response.write "</select>"
Response.write "<br/>"

%>
<%
set rsyt=Server.CreateObject("ADODB.Recordset")
sqlr="select * from sclt where yc<>1 and formid="&ForumID&" order by pid asc"
rsyt.open sqlr,conn,1,2
if rsyt.eof then 
'response.write("&#x6682;&#x65E0;&#x8BBA;&#x575B;&#x7248;&#x5757;")
   else
response.write("下级版块<br/>")
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
 Response.write "&#x6CA1;&#x6709;&#x5E16;&#x5B50;&#x8BB0;&#x5F55;<br/>-------------<br/>"
else
 objgbrs.absolutepage=page
   if page=1 then
     bihao=0
    else
     bihao=page * jdshow-jdshow
   End if
If Page<objgbrs.PageCount and Page>=2 then
    Response.Write "<a href='/BBS/Forum_content/contentlist.asp?ForumID=" & ForumID & "&amp;sort=" & sort & "&amp;page=" & (page+1) & "&amp;SessionID=" & SessionID & "'>&#x4E0B;&#x9875;</a>"
End if
If page>1 then
    Response.Write "<a href='/BBS/Forum_content/contentlist.asp?ForumID=" & ForumID & "&amp;sort=" & sort & "&amp;page=" & (page-1) & "&amp;SessionID=" & SessionID & "'>&#x4E0A;&#x9875;</a>"
End if
if objgbrs.PageCount>1 and Page>=2 then
response.write "(" &  Page & "&#47;" & objgbrs.PageCount & "&#47;" & objgbrs.RecordCount & ")<br/>"
End if
For i=1 to objgbrs.PageSize
    id=objgbrs("id")
    bihaocont=bihaocont+1
   if objgbrs("jh")="t" then
     jh="[精]"
    else
     jh=""
   End if
   if objgbrs("pic")="k" then
     pics="[图]"
    else
     pics=""
   End if
   if objgbrs("pic")="l" then
     ljj="[链]"
    else
     ljj=""
   End if
   if objgbrs("lzdname")="y" then
     yyy="[隐]"
    else
     yyy=""
   End if

   if objgbrs("pic")="r" then
     ruan="[附件]"
    else
     ruan=""
   End if

   if objgbrs("bntjyy2")="k" then
     tou="[投]"
    else
     tou=""
   End if

   if objgbrs("lijin")="k" then
     li="[礼]"
    else
     li=""
   End if

   if objgbrs("maimai")="k" then
     mai="[卖]"
    else
     mai=""
   End if

 if objgbrs("tj")="t" then
     tj="[荐]"
    else
     tj=""
   End if
 if objgbrs("hd")="t" then
     hd="[活]"
    else
     hd=""
   End if
 if objgbrs("bntj")="t" then
   bntj="[名]"
    else
     bntj=""
   End if
 if objgbrs("bntjyy1")="t" then
    bnt="[锁]"
    else
     bnt=""
   End if
   if objgbrs("times")="2100-10-10 12:12:12" then
     zd="[顶]"
    else
     zd=""
   end if
if objgbrs("times")="2000-10-10 12:12:12" then
     sd="[底]"
 else 
 sd=""
End if
 if objgbrs("a")="t" then
      a="[告]"
    else
     a=""
   End if
    tjhm=objgbrs("tjhm")
    hfyl=left(objgbrs("biaoti"),30)
   if len(objgbrs("biaoti"))>30 then
    hfyl=hfyl+""
   End if
Response.write bihao+bihaocont & "." & "" & converttowidebaiti(a) & "" & converttowidebaiti(yyy) & "" & converttowidebaiti(ljj) & "" & converttowidebaiti(bnt) & "" & converttowidebaiti(pics) & "" & converttowidebaiti(ruan) & "" & converttowidebaiti(tou) & "" & converttowidebaiti(li) & "" & converttowidebaiti(mai) & "" & converttowidebaiti(sd) & "" & converttowidebaiti(zd) & "" & converttowidebaiti(jh) & "" & converttowidebaiti(tj) & "" & converttowidebaiti(hd) & "" & converttowidebaiti(bntj) & ""
Response.write"<a href='/BBS/Forum_content/BBS_receipt_ByContent.Asp?ForumID=" & ForumID & "&amp;sort=" & sort & "&amp;id=" & objgbrs("id") & "&amp;page=" & page & "&amp;SessionID=" & SessionID & "'>" & converttowidebaiti(hfyl) & " </a>"
if objgbrs("hfcont")>=1 then
Response.write " " & converttowidebaiti(redtjname) & "(<a href='/BBS/Forum_content/receiptlist.asp?ForumID=" & ForumID & "&amp;sort=" & sort & "&amp;id=" & objgbrs("id") & "&amp;page=" & page & "&amp;SessionID=" & SessionID & "'>" & objgbrs("hfcont") & "</a>/" & objgbrs("rc") & ")<br/>"
else
Response.write " " & converttowidebaiti(redtjname) & "(" & objgbrs("rc") & ")<br/>"
end if
    objgbrs.Movenext
  if objgbrs.EOF then Exit for
    Next
end if
If Page<objgbrs.PageCount then
    Response.Write "<a href='/BBS/Forum_content/contentlist.asp?ForumID=" & ForumID & "&amp;Sort=" & Sort & "&amp;page=" & (page+1) & "&amp;SessionID=" & SessionID & "'>&#x4E0B;&#x9875;</a>"
End if
If page>1 then
    Response.Write "<a href='/BBS/Forum_content/contentlist.asp?ForumID=" & ForumID & "&amp;Sort=" & Sort & "&amp;page=" & (page-1) & "&amp;SessionID=" & SessionID & "'>&#x4E0A;&#x9875;</a>"
End if
if objgbrs.PageCount>1 then
response.write "(" &  Page & "&#47;" & objgbrs.PageCount & "&#47;" & objgbrs.RecordCount & ")<br/><input  name='page' value='2' size='2' format='*N'/><anchor>&#x8DF3;&#x9875;<go method='post' href='/BBS/Forum_content/contentlist.asp?SessionID=" & SessionID & "'><postfield name='SORt' value='" & SORt & "'/><postfield name='ForumID' value='" & ForumID & "'/><postfield name='page' value='$(page)'/></go></anchor><br/>"
End if
  if page=<1 or page>1 then
  End if
Response.Write "<a href='/BBS/Forum_content/forum_addcontent.asp?ForumID=" & ForumID & "&amp;sort=" & sort & "&amp;page=" & page & "&amp;SessionID=" & SessionID & "'>&#x53D1;&#x8D34;</a>|<a href='1.asp?ForumID=" & ForumID & "&amp;sort=" & sort & "&amp;page=" & page & "&amp;SessionID=" & SessionID & "'>&#x57FA;&#x91D1;</a>|<a href='zcwwbntj.asp?ForumID=" & ForumID & "&amp;sort=" & sort & "&amp;page=" & page & "&amp;SessionID=" & SessionID & "'>&#x540D;&#x4EBA;</a>|<a href='/bbs/reg/ckzxhyany.asp?ForumID=" & ForumID & "&amp;sort=" & sort & "&amp;lasttlss=" & lasttlss & "&amp;page=" & Request.ServerVariables("PATH_INFO") & "&amp;SessionID=" & SessionID & "'>&#x5728;&#x7EBF;</a>"
%><br/><select name="YXXENET" title="&#x6309;&#x65F6;&#x95F4;&#x6392;&#x5E8F;" value="&#x6309;&#x65F6;&#x95F4;&#x6392;&#x5E8F;"><option onpick='/BBS/Forum_content/contentlist.asp?ForumID=<%=ForumID%>&amp;sort=6&amp;SessionID=<%=SessionID%>'>&#x6309;&#x65F6;&#x95F4;&#x6392;&#x5E8F;</option><option onpick='/BBS/Forum_content/contentlist.asp?ForumID=<%=ForumID%>&amp;sort=2&amp;SessionID=<%=SessionID%>'>&#x6309;&#x70B9;&#x51FB;&#x6392;&#x5E8F;</option><option onpick='/BBS/Forum_content/contentlist.asp?ForumID=<%=ForumID%>&amp;sort=4&amp;SessionID=<%=SessionID%>'>&#x6309;&#x56DE;&#x590D;&#x6392;&#x5E8F;</option><option onpick='/BBS/Forum_content/contentlist.asp?ForumID=<%=ForumID%>&amp;sort=1&amp;SessionID=<%=SessionID%>'>&#x6309;&#x7CBE;&#x5E16;&#x6392;&#x5E8F;</option><option onpick='/BBS/Forum_content/contentlist.asp?ForumID=<%=ForumID%>&amp;sort=3&amp;SessionID=<%=SessionID%>'>&#x6309;&#x63A8;&#x8350;&#x6392;&#x5E8F;</option></select><% 
    Response.Write "<br/>-------------<br/>"
if formid<>0 then
response.write "<a href='/BBS/Forum_Content/ContentlisT.asp?ForumID="&formid&"&amp;SessionID=" & SessionID & "'>"&converttowidebaiti("返回上级版块")&"</a><br/>"
End if
response.write "<a href='/BBS/index.asp?SessionID=" & SessionID & "'>&#x8FD4;&#x56DE;&#x793E;&#x533A;&#x9996;&#x9875;</a><br/><a href='/index.asp?SessionID=" & SessionID & "'>&#x8FD4;&#x56DE;&#x7F51;&#x7AD9;&#x9996;&#x9875;</a><br/>"%><small><% 
dim kkwap,distime
kkwap=""
KYAA=right(""&WeekDayName(DatePart("w",Now)),1)
if Month(date)<10 then kkwap=kkwap&"0"
kkwap=kkwap&Month(date)&"&#x6708;"
if Day(date)<10 then kkwap=kkwap&"0"
kkwap=kkwap&Day(date)
response.write kkwap
Response.write"&#x65E5;("
Response.write converttowidebaiti(KYAA)
Response.write")"
distime=""
if hour(now())<10 then distime=distime&"0"
distime=distime&hour(now())&":"
if minute(now())<10 then distime=distime&"0"
distime=distime&minute(now())
response.write distime
%></small></p></card></wml>
<% 
objgbrs.close
Set objgbrs= Nothing
conn.close
set conn=nothing
%>