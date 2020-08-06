<!--#INCLUDE VIRTUAL="/md5/inc.asp"-->
<%
Dim d01(9)
d01(0)=""
d01(1)=""
d01(2)=""
d01(3)=""
d01(4)=""
d01(5)=""
d01(6)=""
d01(7)=""
d01(8)=""
Randomize
I=Int(Rnd()*9)
adgg=d01(i)

SessionID=request.querystring("SessionID")
if SessionID="" then SessionID=Session("SessionID")
Server.ScriptTimeout=999
iduse=Session("useid")
forumID=request("forumID")
page=request("page")
id=Request("id")
   if Clng(forumID)<1 then
       response.end
   End if
%>
<!--#include file="contensxx.asp"-->

<%
  dim ky
  ky=request.querystring("ky")
  select case ky
'================================
  case 1
  tip="精华"
'================================
  case 2
  tip="热点"
'================================
  case 3
  tip="推荐"
'================================
  case 4
  tip="热评"
'================================
  case 6
  tip="全部"
'================================
  case 5
  tip="最新"
  end select

Session("returnuppath")=""
  dim id,page,sort
  page=request("page")
  sort=request("sort")
  showwz=CLng(Session("showwz"))
  id=Request("id")
lasttlls=id
lasttls
  sql="update wuza set rc=rc+1 Where CStr(id)='" & id & "'"
  conn.Execute(sql)
  set objgbrs=Server.CreateObject("ADODB.Recordset")
  ssql="select * from wuza Where CStr(id)='" & id &"' and CStr(itid)='"&ForumID&"'"
  objgbrs.open ssql,conn,1,1
  if objgbrs.eof then
      response.write "<card id='card1' title='&#x67E5;&#x770B;&#x8D34;&#x5B50;'><p>&#x6587;&#x7AE0;ID&#x9519;&#x8BEF;&#xFF0C;&#x4F60;&#x6240;&#x67E5;&#x770B;&#x7684;&#x6587;&#x7AE0;&#x53EF;&#x80FD;&#x5DF2;&#x7ECF;&#x88AB;&#x5220;&#x9664;&#x3002;<br/><a href='/bbs/forum_content/contentlist.asp?ForumID=" & ForumID & "&amp;page=" & page & "&amp;SessionID=" & SessionID & "'>&#x8FD4;&#x56DE;" &converttowidebaiti(dlname)& "</a></p></card></wml>"
      conn.close
      set objgbrs=nothing
      set conn=nothing
      response.end
  end if
	iduse=Session("useid")
	ltname=converttowidebaiti(Session("ltname"))
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
     ggg=""
   End if
    	tjhm=objgbrs("tjhm")
    	hfyl=left(objgbrs("biaoti"),80)
   	if len(objgbrs("biaoti"))>80 then
    		hfyl=hfyl+"..."
   	End if
Response.Write"<card id='card1' title='" & converttowidebaiti(hfyl) & "'><p>"
if lycount>0 then
      Response.write "<img src='/bbs/tz/chatroom/notice.gif' alt=''/><a href='/bbs/public/ckly.asp?SessionID=" & SessionID & "'>&#x60A8;&#x6709;(" & lycount & ")&#x6761;&#x65B0;&#x7559;&#x8A00;</a><br/>"
	Session("returnuppath")=Request.ServerVariables("PATH_INFO") & "?forumID=" & forumID & "&amp;id=" & objgbrs("id") & "&amp;page=" & page & "&amp;Sort=" & Sort & ""
End if
Response.Write"&#x4E3B;&#x9898;:<b><u>" & ggg & zd & yyy & jh & tj & hd & bnt & pics & ljj & ruan & tou & lis & mai & bntj
Response.Write converttowidebaiti(objgbrs("biaoti")) & "</u></b><br/>"
%>

<%
                Response.write "&#x697C;&#x4E3B;:<a href='/bbs/reg/useinfo.asp?id=" & objgbrs("tjhm") & "&amp;SessionID=" & SessionID & "'>" & converttowidebaiti(redtjname) & "ID:" & objgbrs("tjhm") & frionline &"</a>"
       set objgbrs2=Server.CreateObject("ADODB.Recordset")
       ssql="select * from usereg where CStr(id)='" & objgbrs("tjhm") & "'"
       objgbrs2.open ssql,conn

if objgbrs2.eof then
Response.write "没有该用户<br/>"
else
if objgbrs2("skin")="'0.gif'" then 
    sky="0.gif"
  else
    sky=objgbrs2("skin")
end if
if objgbrs2("vip")<>0 then Response.write "<img src='/bbs/vip.gif' alt='vip'/>"
Response.Write"<br/>勋章："& converttowide(UBBCodes(objgbrs2("zamw")))&""
if objgbrs2("xz1")<>0 then Response.write "<img src='/bbs/xz/1.gif' alt=''/>"
if objgbrs2("xz2")<>0 then Response.write "<img src='/bbs/xz/2.gif' alt=''/>"
if objgbrs2("xz3")<>0 then Response.write "<img src='/bbs/xz/3.gif' alt=''/>"
if objgbrs2("xz4")<>0 then Response.write "<img src='/bbs/xz/4.gif' alt=''/>"
if objgbrs2("xz5")<>0 then Response.write "<img src='/bbs/xz/5.gif' alt=''/>"
if objgbrs2("xz6")<>0 then Response.write "<img src='/bbs/xz/6.gif' alt=''/>"
if objgbrs2("xz7")<>0 then Response.write "<img src='/bbs/xz/7.gif' alt=''/>"
if objgbrs2("xz8")<>0 then Response.write "<img src='/bbs/xz/8.gif' alt=''/>"
if objgbrs2("xz9")<>0 then Response.write "<img src='/bbs/xz/9.gif' alt=''/>"
if objgbrs2("xz10")<>0 then Response.write "<img src='/bbs/xz/10.gif' alt=''/>"
if objgbrs2("yxxegg")<>0 then Response.write "<br/>职务:站长<img src='/bbs/reg/gg.gif' alt='站长'/>"
if objgbrs2("yxxezb")<>0 then Response.write "<br/>职务:社区总管<img src='/bbs/reg/zbb.gif' alt='总管'/>"
if objgbrs2("cw1")<>0 then Response.write "<br/>职务:社区法官<img src='/bbs/reg/fg.gif' alt='法官'/>"
if objgbrs2("cg")<>0 then Response.write "<br/>职务:论坛彩管<img src='/bbs/reg/cp.gif' alt='彩管'/>"
if objgbrs2("yxxexc")<>0 then Response.write "<br/>职务:论坛巡查<img src='/bbs/reg/xc.gif' alt='巡查'/>"

if objgbrs2("gly")<>"0" then

set rse=Server.CreateObject("ADODB.Recordset")
rspple="select * from sclt where id="&objgbrs2("gly")
rse.open rspple,conn,1,2
if rse.eof then
bkmc="无此版块"
else
bkmc=rse("name")
end if
Response.write "<br/>职务:<a href='/bbs/forum_content/contentlist.asp?ForumID="&objgbrs2("gly")&"&amp;SessionID=" & SessionID & "'>"&converttowidebaiti(bkmc)&"</a>"&converttowidebaiti(bbzz)&""
if objgbrs2("bzbz")<>0 then Response.write"版主<img src='/bbs/reg/bz.gif' alt='版主'/>"
if objgbrs2("bzbz")=0 then Response.write"副版<img src='/bbs/reg/fb.gif' alt='副版'/>"
else
Response.write ""
end if
end if
Response.write "<br/><br/><a href='/BBS/forum_content/bbstdzt.asp?id=" & objgbrs("tjhm") & "&amp;wap=" & wap & "'>其更多帖子>></a>"
Response.write "<br/><a href='TopicActionFlower.Asp?ForumID=" & ForumID & "&amp;ID=" & id & "&amp;Page=" & page & "&amp;SessionID=" & SessionID & "'><img src='/bbs/forum_content/xh.gif'  alt='&#x82B1;'/>(" & objgbrs("rcx") & ")</a><a href='TopicActionEgg.Asp?ForumID=" & ForumID & "&amp;ID=" & id & "&amp;Page=" & page & "&amp;SessionID=" & SessionID & "'><img src='/bbs/forum_content/rd.gif'  alt='&#x86CB;'/>(" & objgbrs("hfcontd") & ")</a><br/>"
Response.write "人气：" & objgbrs("rc")
   		Response.write "<br/>时间:" & objgbrs("retimes")
 Response.write "<br/>"
if objgbrs("jsy")="t" then
    Response.write "<img src='ysy.gif' alt='隐身衣'/><br/><b>此贴正在使用隐身衣</b><br/>"
end if
if objgbrs("jsy")="a" then
    Response.write "<img src='tkj.gif' alt='偷窥镜'/><br/><b>此贴正在使用偷窥镜</b><br/>"
end if                        
Response.write "<br/>-------------<br/>"
if objgbrs("lijin")="k" then
lj=objgbrs("lj")
slj=objgbrs("slj")
ylj=lj-slj
Response.write "<b>派币额:" & objgbrs("lj") & "(余:" & ylj & ")</b><br/>"
end if 
dim spage,PageCount,moy
moy=request("moy")
if moy="123" then
pagesize=100000
else
pagesize=showwz
End IF
    set fso=server.CreateObject("Scripting.FileSystemObject")
    Set f = fso.OpenTextFile(Server.MapPath("File/File/"&id&".txt"),1)  
    Do  While  Not  f.AtEndOfStream    
    aaacc=f.ReadAll
    loop
    f.close
    set f=nothing
    set fso=nothing

	Spage = Request("Spage")

	IF Not IsEmpty(Spage) Then
		IF Not IsNumeric(Spage) Then		
			Spage=1
		Else
			Spage=Cint(Spage)
		End IF
	Else
		Spage = 1
	End IF

i=request("i")
if isnull(i) or i="" then i=0
Contents=aaacc
	StartWords = 1
Lengths=len(Contents)
tjhm=objgbrs("tjhm")

if objgbrs("lzdname")="y" then
	dim rs
	set rs=Server.CreateObject("ADODB.Recordset")
	sql="select tjhm from lthf where cstr(id)='" & id & "' and cstr(tjhm)='"&iduse&"'"
	rs.open sql,conn,1,1
	if rs.eof and rs.bof then
	
	Response.write  "&#x3010;&#x7CFB;&#x7EDF;&#x63D0;&#x793A;&#x3011;:<u>&#x4EE5;&#x4E0B;&#x5185;&#x5BB9;&#x9690;&#x85CF;,&#x9700;&#x8981;&#x4F60;&#x56DE;&#x590D;&#x540E;&#x624D;&#x80FD;&#x67E5;&#x770B;</u><br/>-------------<br/>"
	else
		rs.close
		Set rs=nothing%>
       		<%
                if Lengths>=pagesize and Spage=1 then
       		Response.Write "<a href='/BBS/forum_content/BBs_receipt_ByContent.Asp?ForumID=" & forumID & "&amp;id=" & id & "&amp;page=" & page & "&amp;sort=" & sort & "&amp;SessionID=" & SessionID & "&amp;moy=123'>(&#x5168;&#x6587;" &Lengths& "&#x5B57;)</a>_<a href='/bbs/public/shownum.asp?sspage=" & Request.ServerVariables("PATH_INFO") & "&amp;SessionID=" & SessionID & "&amp;ForumID=" & ForumID & "&amp;sort=" & sort & "&amp;id=" & id & "&amp;spage=" & spage & "&amp;page=" & page & "'>&#x8BBE;&#x7F6E;</a><br/>"
   		End if%>
       		<%=converttowide(outstr(Contents,Spage))%><br/>-------------<br/>

       		<%if objgbrs("retimes")<>objgbrs("xiugaitime") and Spage=pagecount then
       		Response.Write ""&converttowidebaiti("作者于")&""&objgbrs("xiugaitime")& ""&converttowidebaiti("编辑过帖子")&"<br/>-------------<br/>"
   		End if%>

       		<%
    		if Spage>=PageCount then
        	'Response.Write ("&#x4E0B;&#x9875;")        
   		 else
       		Response.Write "<a href='/BBS/forum_content/BBs_receipt_ByContent.Asp?ForumID=" & ForumID & "&amp;Spage=" & Spage+1 & "&amp;ID=" & objgbrs("id") & "&amp;Page=" & page & "&amp;SorT=" & sort & "&amp;SessionID=" & SessionID & "'>&#x4E0B;&#x9875;</a>"
   		end if

    		if Spage<=1 then
        	'Response.Write ("&#x4E0A;&#x9875;")
    		else        
       			Response.Write "<a href='/BBS/forum_content/BBs_receipt_ByContent.Asp?ForumID=" & ForumID & "&amp;Spage=" & Spage-1 & "&amp;ID=" & objgbrs("id") & "&amp;Page=" & page & "&amp;SorT=" & sort & "&amp;SessionID=" & SessionID & "'>&#x4E0A;&#x9875;</a>"
   		end if
		if PageCount<=1 then
		'Response.Write("-------------<br/>")
   		else%>
		(<%=Spage%>/<%=PageCount%>/<%=Lengths%>)<br/>

	         <%end if%>
		<%if PageCount>1 then%>
		<input name="p<%=minute(now)%><%=second(now)%>" title="&#x9875;&#x7801;" type="text" format="*N" emptyok="true" size="3" maxlength="4" value="<%if Spage>=PageCount then response.write(Spage-1) else response.write(Spage+1)%>"/>&#x9875;
		<anchor>&#x8DF3;&#x9875;
		      <go href="/bbs/forum_content/BBs_receipt_ByContent.Asp?ForumID=<%=ForumID%>&amp;ID=<%=objgbrs("id")%>&amp;page=<%=page%>&amp;SorT=<%=SorT%>&amp;SessionID=<%=SessionID%>" accept-charset='utf-8'>
		            <postfield name="Spage" value="$(p<%=minute(now)%><%=second(now)%>)"/>
		      </go>
		</anchor><br/>
                <%end if
       		end if

else
                if Lengths>=pagesize and Spage=1 then
       		Response.Write "<a href='/BBS/forum_content/BBs_receipt_ByContent.Asp?ForumID=" & forumID & "&amp;id=" & id & "&amp;page=" & page & "&amp;sort=" & sort & "&amp;SessionID=" & SessionID & "&amp;moy=123'>(&#x5168;&#x6587;" &Lengths& "&#x5B57;)</a>_<a href='/bbs/public/shownum.asp?sspage=" & Request.ServerVariables("PATH_INFO") & "&amp;SessionID=" & SessionID & "&amp;ForumID=" & ForumID & "&amp;sort=" & sort & "&amp;id=" & id & "&amp;spage=" & spage & "&amp;page=" & page & "'>&#x8BBE;&#x7F6E;</a><br/>"
   		End if%>

       		<%=converttowide(outstr(aaacc,Spage))%><br/>


<%if objgbrs("vote")<>"" then 
if objgbrs("vote")<>"" then vote=split(converttowide(objgbrs("vote")),"\")
if objgbrs("addvote")<>"" then addvote=split(converttowide(objgbrs("addvote")),"\")
if objgbrs("voteid")<>"" then voteid=split(converttowide(objgbrs("voteid")),"\")
Response.Write "-------------<br/>"
if objgbrs("voteid")<>"" then
for i=0 to ubound(voteid)
if voteid(i)<>"" then
if cint(voteid(i))=session("useid") then votesa="true"
end if
next
end if
for i=0 to ubound(addvote)
if addvote(i)<>"" then
votecoun=votecoun+cint(addvote(i))
end if
next
if votesa<>"true" then%>
<%
for i=0 to ubound(vote)
if vote(i)<>"" then %>
<%=i+1%>.<%=vote(i)%> <a href='/BBS/forum_content/forum_votesave.asp?voteid=<%=i%>&amp;id=<%=id%>&amp;forumID=<%=forumID%>&amp;Page=<%=page%>&amp;Sort=<%=sort%>&amp;SessionID=<%=SessionID%>&amp;Spage=<%=spage%>'><%=converttowidebaiti("投票")%></a><br/>
<%end if
next%>
<%end if
if votesa="true" then%>
<%=converttowidebaiti("投票结果:共")%><b><%=votecoun%></b><%=converttowidebaiti("票")%><br/>
<%for i=0 to ubound(vote)
if vote(i)<>"" then 
if votecoun<>0 then%>
<%=i+1%>.<%=vote(i)%>:<b><%=addvote(i)%></b><%=converttowidebaiti("票")%><b><%=round(cint(addvote(i))*100/votecoun,0)%>%</b><br/>
<%
end if
end if
next%>
					<%end if%>
					<%end if%>
-------------<br/>
       		<%if objgbrs("retimes")<>objgbrs("xiugaitime") and Spage=pagecount then
       		Response.Write ""&converttowidebaiti("作者于")&""&objgbrs("xiugaitime")& ""&converttowidebaiti("编辑过帖子")&"<br/>-------------<br/>"
   		End if%>
<%
    		if Spage>=PageCount then
        	'Response.Write ("&#x4E0B;&#x9875;")        
   		 else
       		Response.Write "<a href='/BBS/forum_content/BBs_receipt_ByContent.Asp?ForumID=" & ForumID & "&amp;Spage=" & Spage+1 & "&amp;ID=" & objgbrs("id") & "&amp;Page=" & page & "&amp;SorT=" & sort & "&amp;SessionID=" & SessionID & "'>&#x4E0B;&#x9875;</a>"
   		end if

    		if Spage<=1 then
        	'Response.Write ("&#x4E0A;&#x9875;")
    		else        
       			Response.Write "<a href='/BBS/forum_content/BBs_receipt_ByContent.Asp?ForumID=" & ForumID & "&amp;Spage=" & Spage-1 & "&amp;ID=" & objgbrs("id") & "&amp;Page=" & page & "&amp;SorT=" & sort & "&amp;SessionID=" & SessionID & "'>&#x4E0A;&#x9875;</a>"
   		end if
		if PageCount<=1 then
		'Response.Write("-------------<br/>")
   		else%>
		(<%=Spage%>/<%=PageCount%>/<%=Lengths%>)<br/>

		<%end if%>
		<%if PageCount>1 then%>
		<input name="p<%=minute(now)%><%=second(now)%>" title="&#x9875;&#x7801;" type="text" format="*N" emptyok="true" size="3" maxlength="4" value="<%if Spage>=PageCount then response.write(Spage-1) else response.write(Spage+1)%>"/>&#x9875;
		<anchor>&#x8DF3;&#x9875;
		      <go href="/bbs/forum_content/BBs_receipt_ByContent.Asp?ForumID=<%=ForumID%>&amp;ID=<%=objgbrs("id")%>&amp;page=<%=page%>&amp;SorT=<%=SorT%>&amp;SessionID=<%=SessionID%>" accept-charset='utf-8'>
		            <postfield name="Spage" value="$(p<%=minute(now)%><%=second(now)%>)"/>
		      </go>
		</anchor><br/>
              
                <%end if
if CStr(objgbrs("tjhm"))=CStr(Session("useid")) then
response.write "<a href='/BBS/forum_content/Forum_wzjs.asp?forumID=" & forumID & "&amp;id=" & objgbrs("id") & "&amp;page=" & page & "&amp;len=" & Lengths & "&amp;SessionID=" & SessionID & "'>" & converttowidebaiti("续贴") & "</a>|"
response.write "<a href='/BBS/Wapcs/Tjwzimgjz.Asp?forumID=" & forumID & "&amp;id=" & objgbrs("id") & "&amp;page=" & page & "&amp;SessionID=" & SessionID & "'>" & converttowidebaiti("续传") & "</a>|"
                if Lengths>=showwz then
response.write "<a href='/BBS/forum_content/Forum_Xgwz.asp?forumID=" & forumID & "&amp;id=" & objgbrs("id") & "&amp;Spage=" & Spage & "&amp;page=" & page & "&amp;SessionID=" & SessionID & "'>" & converttowidebaiti("编本页") & "</a>|"
response.write "<a href='/BBS/forum_content/Forum_Xgwz.asp?forumID=" & forumID & "&amp;id=" & objgbrs("id") & "&amp;page=" & page & "&amp;SessionID=" & SessionID & "&amp;moy=123'>" & converttowidebaiti("编全部") & "</a>|"
		Else
response.write "<a href='/BBS/forum_content/Forum_Xgwz.asp?forumID=" & forumID & "&amp;id=" & objgbrs("id") & "&amp;Spage=" & Spage & "&amp;page=" & page & "&amp;SessionID=" & SessionID & "'>" & converttowidebaiti("编辑") & "</a>|"
End if
 if objgbrs("hfcont")>50 or objgbrs("jh")="t" then
       response.write "" & converttowidebaiti("自删")&"<br/>"
  else
       response.write "<a href='/BBS/forum_content/Forum_DelWw.asp?ForumID=" & ForumID & "&amp;id=" & objgbrs("id") & "&amp;ids=" & objgbrs("tjhm") & "&amp;page=" & page & "&amp;debz=t" & "&amp;SessionID=" & SessionID & "'>" & converttowidebaiti("自删")&"</a><br/>"
End if
End if
tjhm=objgbrs("tjhm")
set objgbrss1=Server.CreateObject("ADODB.Recordset")
ssql="select * from usereg where Cstr(id)=" & tjhm
objgbrss1.open ssql,conn
Response.write "<b>签名：</b>" & converttowide(UBBCode(objgbrss1("usejj")))
 Response.write "<br/>-------------<br/>"

Response.write "会员等级:"
if objgbrss1("lasttime")-objgbrss1("regtimes")=0 then
Response.write "0级"
end if
if objgbrss1("lasttime")-objgbrss1("regtimes")>0 and  objgbrss1("lasttime")-objgbrss1("regtimes")<7 then
Response.write "<a href=""dj.asp?SessionID="&SessionID&""">无名小卒</a><img src='tp/t1.gif' alt='1级'/>"
end if
if objgbrss1("lasttime")-objgbrss1("regtimes")>7 and  objgbrss1("lasttime")-objgbrss1("regtimes")<15 then
Response.write "<a href=""dj.asp?SessionID="&SessionID&""">初出江湖</a><img src='tp/t2.gif' alt='2级'/>"
end if
if objgbrss1("lasttime")-objgbrss1("regtimes")>15 and  objgbrss1("lasttime")-objgbrss1("regtimes")<30 then
Response.write "<a href=""dj.asp?SessionID="&SessionID&""">江湖新秀</a><img src='tp/t3.gif' alt='3级'/>"
end if
if objgbrss1("lasttime")-objgbrss1("regtimes")>30 and  objgbrss1("lasttime")-objgbrss1("regtimes")<60 then
Response.write "<a href=""dj.asp?SessionID="&SessionID&""">崭露头角</a><img src='tp/t4.gif' alt='4级'/>"
end if
if objgbrss1("lasttime")-objgbrss1("regtimes")>60 and  objgbrss1("lasttime")-objgbrss1("regtimes")<90 then
Response.write "<a href=""dj.asp?SessionID="&SessionID&""">江湖小侠</a><img src='tp/t5.gif' alt='5级'/>"
end if
if objgbrss1("lasttime")-objgbrss1("regtimes")>90 and  objgbrss1("lasttime")-objgbrss1("regtimes")<120 then
Response.write "<a href=""dj.asp?SessionID="&SessionID&""">江湖大侠</a><img src='tp/t6.gif' alt='6级'/>"
end if
if objgbrss1("lasttime")-objgbrss1("regtimes")>120 and  objgbrss1("lasttime")-objgbrss1("regtimes")<150 then
Response.write "<a href=""dj.asp?SessionID="&SessionID&""">江湖豪侠</a><img src='tp/t7.gif' alt='7级'/>"
end if
if objgbrss1("lasttime")-objgbrss1("regtimes")>150 and  objgbrss1("lasttime")-objgbrss1("regtimes")<180 then
Response.write "<a href=""dj.asp?SessionID="&SessionID&""">江湖至尊</a><img src='tp/t8.gif' alt='8级'/>"
end if
if objgbrss1("lasttime")-objgbrss1("regtimes")>180 and  objgbrss1("lasttime")-objgbrss1("regtimes")<240 then
Response.write "<a href=""dj.asp?SessionID="&SessionID&""">武林侠客</a><img src='tp/t9.gif' alt='9级'/>"
end if
if objgbrss1("lasttime")-objgbrss1("regtimes")>240 and  objgbrss1("lasttime")-objgbrss1("regtimes")<300 then
Response.write "<a href=""dj.asp?SessionID="&SessionID&""">武林豪侠</a><img src='tp/t10.gif' alt='10级'/>"
end if
if objgbrss1("lasttime")-objgbrss1("regtimes")>300 and  objgbrss1("lasttime")-objgbrss1("regtimes")<360 then
Response.write "<a href=""dj.asp?SessionID="&SessionID&""">武林名宿</a><img src='tp/t11.gif' alt='11级'/>"
end if
if objgbrss1("lasttime")-objgbrss1("regtimes")>360 and  objgbrss1("lasttime")-objgbrss1("regtimes")<420 then
Response.write "<a href=""dj.asp?SessionID="&SessionID&""">武林仙人</a><img src='tp/t12.gif' alt='12级'/>"
end if
if objgbrss1("lasttime")-objgbrss1("regtimes")>420 and  objgbrss1("lasttime")-objgbrss1("regtimes")<510 then
Response.write "<a href=""dj.asp?SessionID="&SessionID&""">武林尊者</a><img src='tp/t13.gif' alt='13级'/>"
end if
if objgbrss1("lasttime")-objgbrss1("regtimes")>510 and  objgbrss1("lasttime")-objgbrss1("regtimes")<600 then
Response.write "<a href=""dj.asp?SessionID="&SessionID&""">武林盟主</a><img src='tp/t14.gif' alt='14级'/>"
end if
if objgbrss1("lasttime")-objgbrss1("regtimes")>600 and  objgbrss1("lasttime")-objgbrss1("regtimes")<690 then
Response.write "<a href=""dj.asp?SessionID="&SessionID&""">威振八方</a><img src='tp/t15.gif' alt='15级'/>"
end if
if objgbrss1("lasttime")-objgbrss1("regtimes")>690 and  objgbrss1("lasttime")-objgbrss1("regtimes")<780 then
Response.write "<a href=""dj.asp?SessionID="&SessionID&""">一代宗师</a><img src='tp/t16.gif' alt='16级'/>"
end if
if objgbrss1("lasttime")-objgbrss1("regtimes")>780 and  objgbrss1("lasttime")-objgbrss1("regtimes")<870 then
Response.write "<a href=""dj.asp?SessionID="&SessionID&""">一代侠圣</a><img src='tp/t17.gif' alt='17级'/>"
end if
if objgbrss1("lasttime")-objgbrss1("regtimes")>870 and  objgbrss1("lasttime")-objgbrss1("regtimes")<960 then
Response.write "<a href=""dj.asp?SessionID="&SessionID&""">万人景仰</a><img src='tp/t18.gif' alt='18级'/>"
end if
if objgbrss1("lasttime")-objgbrss1("regtimes")>960 and  objgbrss1("lasttime")-objgbrss1("regtimes")<1050 then
Response.write "<a href=""dj.asp?SessionID="&SessionID&""">独孤求败</a><img src='tp/t19.gif' alt='19级'/>"
end if
if objgbrss1("lasttime")-objgbrss1("regtimes")>1050 and  objgbrss1("lasttime")-objgbrss1("regtimes")<10000 then
Response.write "<a href=""dj.asp?SessionID="&SessionID&""">天界至尊</a><img src='tp/t20.gif' alt='20级'/>"
end if 
end if
response.write "<br/>-------------<br/>"
if Cstr(Session("yxxezb"))<>"" or Session("bzbz")=forumID or Session("gly")=forumID or Session("Counter")="pass_numbers_55556666" then
 if objgbrs("juanti")>0 then
 response.write "<a href='/BBS/forum_content/Forum_ltzt.asp?ForumID=" & ForumID & "&amp;id=" & objgbrs("id") &"&amp;ids=2&amp;page=" & page & "&amp;zd=f&amp;SessionID=" & SessionID & "'>" & converttowidebaiti("撤专")&"</a>"
   else
       response.write "<a href='/BBS/forum_content/Forum_ltzt.asp?ForumID=" & ForumID & "&amp;id=" & objgbrs("id") & "&amp;page=" & page & "&amp;zd=o&amp;SessionID=" & SessionID & "'>" & converttowidebaiti("专")&"</a>"
    End if

   
      
 if objgbrs("jh")="f" then
       response.write "|<a href='/BBS/forum_content/Forum_wzjz.asp?ForumID=" & ForumID & "&amp;id=" & objgbrs("id") & "&amp;ids=" & objgbrs("tjhm") & "&amp;page=" & page & "&amp;jh=t&amp;SessionID=" & SessionID & "'>" & converttowidebaiti("精")&"</a>"
    End if

    if objgbrs("jh")="t" then
       response.write "|<a href='/BBS/forum_content/Forum_wzjz.asp?ForumID=" & ForumID & "&amp;id=" & objgbrs("id") & "&amp;ids=" & objgbrs("tjhm") & "&amp;page=" & page & "&amp;jh=f&amp;SessionID=" & SessionID & "'>" & converttowidebaiti("撤精")&"</a>"
    End if

 if objgbrs("jh")="f" then
       response.write "|<a href='/BBS/forum_content/Forum_DelWw.asp?ForumID=" & ForumID & "&amp;ids=" & objgbrs("tjhm") & "&amp;id=" & objgbrs("id") & "&amp;page=" & page & "&amp;debz=t&amp;SessionID=" & SessionID & "'>" & converttowidebaiti("删")&"</a>"
    End if
   if objgbrs("times")="2000-10-10 12:12:12" then
       response.write "|<a href='/BBS/forum_content/Forum_wzgd.asp?ForumID=" & ForumID & "&amp;id=" & objgbrs("id") & "&amp;page=" & page & "&amp;zd=f&amp;SessionID=" & SessionID & "'>" & converttowidebaiti("解固")&"</a>"
      else
       response.write "|<a href='/BBS/forum_content/Forum_wzgd.asp?ForumID=" & ForumID & "&amp;id=" & objgbrs("id") & "&amp;page=" & page & "&amp;zd=o&amp;SessionID=" & SessionID & "'>" & converttowidebaiti("底")&"</a>"
       End if

if objgbrs("bntjyy1")="f" then
       response.write "|<a href='/BBS/forum_content/Forum_wzsd.asp?ForumID=" & ForumID & "&amp;id=" & objgbrs("id") & "&amp;ids=" & objgbrs("tjhm") & "&amp;page=" & page & "&amp;bntjyy1=t&amp;SessionID=" & SessionID & "'>" & converttowidebaiti("锁")&"</a>"
    End if

    if objgbrs("bntjyy1")="t" then
       response.write "|<a href='/BBS/forum_content/Forum_wzsd.asp?ForumID=" & ForumID & "&amp;id=" & objgbrs("id") & "&amp;ids=" & objgbrs("tjhm") & "&amp;page=" & page & "&amp;bntjyy1=f&amp;SessionID=" & SessionID & "'>" & converttowidebaiti("解锁")&"</a>"
 End if
 End if
set objgbrs=Server.CreateObject("ADODB.Recordset")
ssql="select * from lthf where id='" & id & "' order by times desc"
objgbrs.open ssql,conn,1,3
aaa=objgbrs.RecordCount
if objgbrs.eof then
Response.write "<br/>-------------<br/>&#x6682;&#x65E0;&#x56DE;&#x590D;"
else
Response.Write"<br/>-------------<br/><a href='/BBS/forum_content/Receiptlist.asp?ForumID=" & ForumID & "&amp;ID=" & id & "&amp;Page=" & page & "&amp;SessionID=" & SessionID & "'>&#x770B;&#x56DE;&#x590D;:" & aaa & "&#x6761;</a><br/>"
Response.write "&#x6700;&#x65B0;&#x56DE;&#x590D;:"

bihao=0
For k=1 to 3
bihaocont=bihaocont+1
ids=objgbrs("ids")
Content=left(objgbrs("name"),60)
if len(objgbrs("name"))>60 then
Content=Content+"(url=/BBS/forum_content/Rezcwwcl.asp?ForumID="&ForumID&"&ID="&id&"&ids="&ids&"&Page="&page&"&SessionID="&SessionID&")详...(/url)"
End if
tjhm=objgbrs("tjhm")
Response.Write "<br/>"
louid=objgbrs.RecordCount-CLng(bihao+bihaocont)+1
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
Response.write "<a href='/BBS/reg/useinfo.asp?id=" & objgbrs("tjhm") & "&amp;SessionID=" & SessionID & "'>" & converttowidebaiti(redtjname) & "(ID:" & objgbrs("tjhm") & ")</a>:"
end if
if objgbrsd("jsy")="a" then
Response.write "" &frionline& ""
Response.write "<a href='/BBS/reg/useinfo.asp?id=" & objgbrs("tjhm") & "&amp;SessionID=" & SessionID & "'>" & converttowidebaiti(redtjname) & "(ID:" & objgbrs("tjhm") & ")</a>:"
end if
objgbrsd.close
set objgbrsd=nothing
Response.write "" & converttowide(UBBCodes(Content)) & ""
Response.write"(" & String(2-Len(Month(objgbrs("times"))),"0") & Month(objgbrs("times")) & "-" & String(2-len(Day(objgbrs("times"))),"0") & Day(objgbrs("times")) & " &nbsp;" & String(2-Len(hour(objgbrs("times"))),"0") & hour(objgbrs("times"))  & ":" & String(2-Len(minute(objgbrs("times"))),"0") & minute(objgbrs("times")) & ")"
objgbrs.Movenext
if objgbrs.EOF then Exit for
 Next
end if
Application.Lock
conn.Execute(ssql)
Application.Unlock

set objgbrs=Server.CreateObject("ADODB.Recordset")
ssql="select * from wuza Where CStr(id)='" & id &"'"
  objgbrs.open ssql,conn,1,1
tjhm=objgbrs("tjhm")
 if objgbrs("times")="2000-10-10 12:12:12" then
Response.write "<br/>[&#x5E16;&#x5B50;&#x56FA;&#x5E95;]"
else
 if objgbrs("bntjyy1")="t" then
Response.write "<br/>-------------<br/>【帖子已锁定……】"
else
if Session("zh")="wap" then
       Session("returnuppath")=Request.ServerVariables("PATH_INFO") & "?id="&id&"&amp;page="&page&"&amp;ForumID="&ForumID&""
        Response.write "<br/>-------------<br/>&#x7ACB;&#x5373;<a href='/BBS/UseLogiN.Asp?SessionID=" & SessionID & "'>&#x767B;&#x9646;</a><br/>"
      else
kyaa1="我顶!"
kyaa2="支持!"
kyaa3="反对!"
%>
<br/>-------------<br/>
&#x5FEB;&#x901F;&#x56DE;&#x590D;
<br/><anchor>&#x6211;&#x9876;<go method="post" href='/bbs/forum_content/forum_receipt.Asp?SessionID=<%=SessionID%>'><postfield name="name" value="<%=converttowidebaiti(kyaa1)%>"/><%
 if objgbrs("times")="2000-10-10 12:12:12" then
       Response.write ""
  else
 if objgbrs("bntjyy1")="t" then
       Response.write ""
  else
       Response.write "<postfield name='id' value='" & id & "'/>"
       Response.write "<postfield name='page' value='" & page & "'/>"
       Response.write "<postfield name='ForumID' value='" & ForumID & "'/>"
 end if
 end if
%></go></anchor>&#x25C6;<anchor>&#x652F;&#x6301;<go method="post" href='/bbs/forum_content/forum_receipt.Asp?SessionID=<%=SessionID%>'><postfield name="name" value="<%=converttowidebaiti(kyaa2)%>"/><%
 if objgbrs("times")="2000-10-10 12:12:12" then
       Response.write ""
  else
 if objgbrs("bntjyy1")="t" then
       Response.write ""
  else
       Response.write "<postfield name='id' value='" & id & "'/>"
       Response.write "<postfield name='page' value='" & page & "'/>"
       Response.write "<postfield name='ForumID' value='" & ForumID & "'/>"
 end if
 end if
%></go></anchor>&#x25C6;<anchor>&#x53CD;&#x5BF9;<go method="post" href='/bbs/forum_content/forum_receipt.Asp?SessionID=<%=SessionID%>'><postfield name="name" value="<%=converttowidebaiti(kyaa3)%>"/><%
 if objgbrs("times")="2000-10-10 12:12:12" then
       Response.write ""
  else
 if objgbrs("bntjyy1")="t" then
       Response.write ""
  else
       Response.write "<postfield name='id' value='" & id & "'/>"
       Response.write "<postfield name='page' value='" & page & "'/>"
       Response.write "<postfield name='ForumID' value='" & ForumID & "'/>"
 end if
 end if
%></go></anchor>
<br/><select name="face" value="">
<option value="">表情</option><option value="(imgs)1(/imgs)">胜利</option><option value="(imgs)2(/imgs)">偷笑</option><option value="(imgs)3(/imgs)">送花</option><option value="(imgs)4(/imgs)">调皮</option><option value="(imgs)5(/imgs)">欢迎</option><option value="(imgs)6(/imgs)">微笑</option><option value="(imgs)7(/imgs)">暴汗</option><option value="(imgs)8(/imgs)">大笑</option><option value="(imgs)9(/imgs)">晕了</option><option value="(imgs)10(/imgs)">疑惑</option><option value="(imgs)11(/imgs)">别吵</option><option value="(imgs)12(/imgs)">流泪</option><option value="(imgs)13(/imgs)">脸红</option><option value="(imgs)14(/imgs)">色色</option><option value="(imgs)15(/imgs)">惊讶</option><option value="(imgs)16(/imgs)">上火</option><option value="(imgs)17(/imgs)">飞吻</option><option value="(imgs)18(/imgs)">摆酷</option><option value="(imgs)19(/imgs)">睡觉</option><option value="(imgs)20(/imgs)">闭嘴</option><option value="(imgs)21(/imgs)">再见</option><option value="(imgs)0(/imgs)">疑问</option></select><input type="text" name="name<%=minute(now)%><%=second(now)%>" maxlength="300" value="<%=converttowidebaiti(adgg)%>" size="8"/>
<anchor>&#x56DE;&#x590D;<go method="post" href='/bbs/forum_content/forum_receipt.Asp?SessionID=<%=SessionID%>'><postfield name="name" value="$(name<%=minute(now)%><%=second(now)%>)"/><postfield name="face" value="$(face)"/><%
 if objgbrs("times")="2000-10-10 12:12:12" then
       Response.write ""
  else
 if objgbrs("bntjyy1")="t" then
       Response.write ""
  else
       Response.write "<postfield name='id' value='" & id & "'/>"
       Response.write "<postfield name='page' value='" & page & "'/>"
       Response.write "<postfield name='ForumID' value='" & ForumID & "'/>"
 end if
 end if
%></go></anchor>

<%
Response.Write "<br/><a href='reselimg.asp?ForumID=" & ForumID & "&amp;ID=" & id & "&amp;Page=" & page & "&amp;SessionID=" & SessionID & "'>&#x8868;&#x60C5;&#x56DE;&#x590D;</a>"
Response.Write "<br/><a href='Forum_myimg.asp?ForumID=" & ForumID & "&amp;ID=" & id & "&amp;Page=" & page & "&amp;SessionID=" & SessionID & "'>&#x56FE;&#x6587;&#x56DE;&#x590D;</a>"
end if
end if
end if
if Session("zh")="wap" then
'response.write "&#x7BA1;&#x7406;&#x4E3B;&#x5E16;"
  else
response.write "<br/><a href='Forum_AdminTopic.Asp?ForumID=" & ForumID & "&amp;id=" & id & "&amp;page=" & page & "&amp;SessionID=" & SessionID & "'>&#x7BA1;&#x7406;&#x4E3B;&#x5E16;</a><br/>"
response.write "-------------<br/>"
end if


set objgbrsy=Server.CreateObject("ADODB.Recordset")
rspl="select * from sclt where id="&ForumID
objgbrsy.open rspl,conn,1,2
if objgbrsy.eof then
dlname="无此论坛"
Else
dlname=objgbrsy("name")
end if
objgbrsy.close
Set objgbrsy= Nothing
%>

<%
Response.write "<br/>-------------<br/>"
Response.write "<a href='/BBS/forum_content/ContentlisT.asp?ForumID=" & ForumID & "&amp;sort=" & sort & "&amp;page=" & page & "&amp;SessionID=" & SessionID & "'>&#x8FD4;&#x56DE;" & converttowidebaiti(dlname) & "</a>"
if ky<>"" then
Response.write "<br/><a href='Top.asp?ForumID=" & ForumID & "&amp;page=" & page & "&amp;Ky=" & ky & "&amp;SessionID=" & SessionID & "'>&#x8FD4;&#x56DE;" & converttowidebaiti(tip) & "&#x5E16;&#x5B50;</a>"
end if
Response.write "<br/><a href='/BBS/index.asp?SessionID=" & SessionID & "'>&#x8FD4;&#x56DE;&#x793E;&#x533A;&#x9996;&#x9875;</a><br/>"
%>
<small><% 
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
%></small>
</p></card></wml>
<%
objgbrs.close
Set objgbrs=nothing
conn.close
set conn=nothing
Function frionline()
  page=request("page")
  set objgbrr=Server.CreateObject("ADODB.Recordset")
  ssql="select * from SoftDown_online where Cstr(ids)='" & tjhm & "'"
  objgbrr.open ssql,conn
  if not objgbrr.eof then
  frionline="<img src='/bbs/forum_content/online_m.gif'  alt='&#x5728;&#x7EBF;'/>"
  else
  frionline="<img src='/bbs/forum_content/offline.gif'  alt='&#x79BB;&#x7EBF;'/>"
  end if
  set objgbrr=nothing
End function

%>
<%
Function outstr(str,spage)
	
	if len(str)>pagesize then
		PageCount=len(str)\pagesize+1
		str=mid(str,(spage-1)*pagesize+1,pagesize)
	else
		PageCount=1
	end if
	outstr=outhtm(str)
end Function
%>