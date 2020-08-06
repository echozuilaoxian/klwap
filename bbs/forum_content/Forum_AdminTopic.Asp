<% @LANGUAGE="VBSCRIPT" CODEPAGE="65001" %><% Response.ContentType="text/vnd.wap.wml; charset=utf-8" %><?xml version="1.0" encoding="utf-8"?><!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml"><!--#INCLUDE VIRTUAL="/bbs/reg/useregs.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/public/codeun.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/reg/ltonline.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/reg/redtjname.asp"--><wml><head><meta http-equiv="Cache-Control" content="max-age=0"/><meta http-equiv="Cache-Control" content="no-cache"/><meta http-equiv="Expires" content="Mon, 1 Jan 1990 00:00:00 GMT"/></head><%
if Session("zh")="wap" then
        response.redirect "/bbs/yksm.asp"
      else
        Session("ltlybz")=""
    End if
SessionID=request.querystring("SessionID")
if SessionID="" then SessionID=Session("SessionID")
Server.ScriptTimeout=999
iduse=Session("useid")
lasttlls="319"
lasttls
  dim id,page,ForumID
  page=request("page")
  id=Request("id")
ForumID=request("ForumID")
  set objgbrs=Server.CreateObject("ADODB.Recordset")
  ssql="select * from wuza Where CStr(id)='" & id &"' and CStr(itid)='"&ForumID&"'"
  objgbrs.open ssql,conn,1,1
  if objgbrs.eof then
      response.write "<card id='card1' title='管理主贴'><p>文章ID错误，你所查看的文章可能已经被删除。</p></card></wml>"
      conn.close
      set objgbrs=nothing
      set conn=nothing
      response.end
  end if
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
      a="[强]"
    else
     a=""
   End if
    tjhm=objgbrs("tjhm")
    hfyl=left(objgbrs("biaoti"),10)
   if len(objgbrs("biaoti"))>10 then
    hfyl=hfyl+"..."
   End if%><card id="card1" title="<%=converttowidebaiti("管理帖子-")%><%=converttowidebaiti(hfyl)%>"><p><%
iduse=Session("useid")
if lycount>0 then
      Response.write "<a href='/bbs/public/ckly.asp?SessionID=" & SessionID & "'>" &converttowidebaiti("您有")& "(" & lycount & ")" &converttowidebaiti("条新信息")& "</a><br/>"
       Session("returnuppath")=Request.ServerVariables("PATH_INFO") & "?ForumID=" & ForumID & "&amp;ID=" & id & "&amp;page=" & page & ""
End if
Response.write "" &converttowidebaiti("帖子:")& "" & converttowidebaiti(a) & "" & converttowidebaiti(yyy) & "" & converttowidebaiti(ljj) & "" & converttowidebaiti(bnt) & "" & converttowidebaiti(pics) & "" & converttowidebaiti(ruan) & "" & converttowidebaiti(tou) & "" & converttowidebaiti(li) & "" & converttowidebaiti(mai) & "" & converttowidebaiti(sd) & "" & converttowidebaiti(zd) & "" & converttowidebaiti(jh) & "" & converttowidebaiti(tj) & "" & converttowidebaiti(hd) & "" & converttowidebaiti(bntj) & ""
Response.Write converttowidebaiti(hfyl)
tjhm=objgbrs("tjhm")
      Response.write "<br/>" &converttowidebaiti("楼主:")& "<a href='/bbs/reg/useinfo.asp?id=" & objgbrs("tjhm") & "&amp;SessionID=" & SessionID & "'>" & converttowidebaiti(redtjname) & "ID:" & objgbrs("tjhm") & converttowidebaiti(frionline) &"</a>"
      Response.write "<br/>-----------<br/><a href='/BBS/Forum_content/Forum_FZwz.asp?ForumID=" & ForumID & "&amp;id=" & objgbrs("id") & "&amp;page=" & page & "&amp;i=" & i & "&amp;SessionID=" & SessionID & "'>" & converttowidebaiti("复制主贴") & "</a>"
response.write "<br/><a href='/bbs/xhdj/djysy.asp?ForumID=" & ForumID & "&amp;id=" & objgbrs("id") & "&amp;page=" & page & "&amp;SessionID=" & SessionID & "'>使用隐身衣</a>"
response.write "<br/><a href='/bbs/xhdj/djzyj.asp?ForumID=" & ForumID & "&amp;id=" & objgbrs("id") & "&amp;page=" & page & "&amp;SessionID=" & SessionID & "'>使用还原丹</a>"
response.write "<br/><a href='/bbs/xhdj/djtsj.asp?ForumID=" & ForumID & "&amp;id=" & objgbrs("id") & "&amp;page=" & page & "&amp;SessionID=" & SessionID & "'>使用偷窥镜</a>"
if CStr(objgbrs("tjhm"))=CStr(Session("useid")) then
       response.write "<br/><a href='/BBS/Forum_content/Forum_wzjs.asp?ForumID=" & ForumID & "&amp;id=" & objgbrs("id") & "&amp;page=" & page & "&amp;SessionID=" & SessionID & "'>" &converttowidebaiti("续写主贴")& "</a><br/><a href='/BBS/Forum_content/Forum_Xgwz.asp?ForumID=" & ForumID & "&amp;id=" & objgbrs("id") & "&amp;page=" & page & "&amp;SessionID=" & SessionID & "'>" & converttowidebaiti("修改主贴")& "</a>"
       response.write "<br/><a href='/BBS/Wapcs/Tjwzimgjz.Asp?ForumID=" & ForumID & "&amp;id=" & objgbrs("id") & "&amp;page=" & page & "&amp;SessionID=" & SessionID & "'>" & converttowidebaiti("续传附件")&"</a>"
 if objgbrs("hfcont")>50 or objgbrs("jh")="t" then
       response.write "<br/>" & converttowidebaiti("自己删除")&""
  else
       response.write "<br/><a href='/BBS/Forum_ContenT/Forum_DelWw.asp?ForumID=" & ForumID & "&amp;id=" & objgbrs("id") & "&amp;ids=" & objgbrs("tjhm") & "&amp;page=" & page & "&amp;debz=t" & "&amp;SessionID=" & SessionID & "'>" & converttowidebaiti("自己删除")&"</a>"
 End if
end if
if Cstr(Session("yxxezb"))<>"" or Session("yxxexc")<>"" or Session("cw1")<>"" or Session("cg")<>"" or Session("bzbz")=ForumID or Session("gly")=ForumID or Session("Counter")="pass_numbers_55556666" then
    if objgbrs("jh")="f" then
       response.write "<br/><a href='/BBS/Forum_ContenT/Forum_wzjz.asp?ForumID=" & ForumID & "&amp;id=" & objgbrs("id") & "&amp;ids=" & objgbrs("tjhm") & "&amp;page=" & page & "&amp;jh=t" & "&amp;SessionID=" & SessionID & "'>" & converttowidebaiti("文章入精")&"</a>"
    End if

    if objgbrs("jh")="t" then
       response.write "<br/><a href='/BBS/Forum_ContenT/Forum_wzjz.asp?ForumID=" & ForumID & "&amp;id=" & objgbrs("id") & "&amp;ids=" & objgbrs("tjhm") & "&amp;page=" & page & "&amp;jh=f" & "&amp;SessionID=" & SessionID & "'>" & converttowidebaiti("文章撤精")&"</a>"
    End if

 if objgbrs("tj")="f" then
       response.write "<br/><a href='/BBS/Forum_ContenT/Forum_wztj.asp?ForumID=" & ForumID & "&amp;id=" & objgbrs("id") & "&amp;ids=" & objgbrs("tjhm") & "&amp;page=" & page & "&amp;tj=t" & "&amp;SessionID=" & SessionID & "'>" & converttowidebaiti("推荐帖子")&"</a>"
    End if

    if objgbrs("tj")="t" then
       response.write "<br/><a href='/BBS/Forum_ContenT/Forum_wztj.asp?ForumID=" & ForumID & "&amp;id=" & objgbrs("id") & "&amp;ids=" & objgbrs("tjhm") & "&amp;page=" & page & "&amp;tj=f" & "&amp;SessionID=" & SessionID & "'>" & converttowidebaiti("撤消推荐")&"</a>"
    End if

    if objgbrs("times")="2100-10-10 12:12:12" then
       response.write "<br/><a href='/BBS/Forum_ContenT/Forum_wzzd.asp?ForumID=" & ForumID & "&amp;id=" & objgbrs("id") & "&amp;page=" & page & "&amp;zd=f" & "&amp;SessionID=" & SessionID & "'>" & converttowidebaiti("取消置顶")&"</a>"
      else
       response.write "<br/><a href='/BBS/Forum_ContenT/Forum_wzzd.asp?ForumID=" & ForumID & "&amp;id=" & objgbrs("id") & "&amp;page=" & page & "&amp;zd=t" & "&amp;SessionID=" & SessionID & "'>" & converttowidebaiti("文章置顶")&"</a>"
    End if
    End if
if Cstr(Session("yxxezb"))<>"" or Session("yxxexc")<>"" or Session("cw1")<>"" or Session("cg")<>"" or Session("bzbz")=ForumID or Session("Counter")="pass_numbers_55556666" then
  if objgbrs("jh")="f" then
       response.write "<br/><a href='/BBS/Forum_ContenT/Forum_DelWw.asp?ForumID=" & ForumID & "&amp;ids=" & objgbrs("tjhm") & "&amp;id=" & objgbrs("id") & "&amp;page=" & page & "&amp;debz=t" & "&amp;SessionID=" & SessionID & "'>" & converttowidebaiti("删除文章")&"</a>"
    End if
   if objgbrs("times")="2000-10-10 12:12:12" then
       response.write "<br/><a href='/BBS/Forum_ContenT/Forum_wzgd.asp?ForumID=" & ForumID & "&amp;id=" & objgbrs("id") & "&amp;page=" & page & "&amp;zd=f" & "&amp;SessionID=" & SessionID & "'>" & converttowidebaiti("解开固底")&"</a>"
      else
       response.write "<br/><a href='/BBS/Forum_ContenT/Forum_wzgd.asp?ForumID=" & ForumID & "&amp;id=" & objgbrs("id") & "&amp;page=" & page & "&amp;zd=o" & "&amp;SessionID=" & SessionID & "'>" & converttowidebaiti("文章固底")&"</a>"
       End if

       response.write "<br/><a href='/BBS/Forum_ContenT/Forum_move.asp?ForumID=" & ForumID & "&amp;id=" & objgbrs("id") & "&amp;page=" & page & "&amp;SessionID=" & SessionID & "'>" & converttowidebaiti("转移文章")&"</a>"
if objgbrs("bntjyy1")="f" then
       response.write "<br/><a href='/BBS/Forum_ContenT/Forum_wzsd.asp?ForumID=" & ForumID & "&amp;id=" & objgbrs("id") & "&amp;ids=" & objgbrs("tjhm") & "&amp;page=" & page & "&amp;bntjyy1=t" & "&amp;SessionID=" & SessionID & "'>" & converttowidebaiti("锁定文章")&"</a>"
    End if

    if objgbrs("bntjyy1")="t" then
       response.write "<br/><a href='/BBS/Forum_ContenT/Forum_wzsd.asp?ForumID=" & ForumID & "&amp;id=" & objgbrs("id") & "&amp;ids=" & objgbrs("tjhm") & "&amp;page=" & page & "&amp;bntjyy1=f" & "&amp;SessionID=" & SessionID & "'>" & converttowidebaiti("解开锁定")&"</a>"
    End if
if objgbrs("bntj")="f" then
       response.write "<br/><a href='/BBS/Forum_ContenT/Forum_wzmr.asp?ForumID=" & ForumID & "&amp;id=" & objgbrs("id") & "&amp;ids=" & objgbrs("tjhm") & "&amp;page=" & page & "&amp;bntj=t" & "&amp;SessionID=" & SessionID & "'>" & converttowidebaiti("设为名贴")&"</a>"
    End if

    if objgbrs("bntj")="t" then
       response.write "<br/><a href='/BBS/Forum_ContenT/Forum_wzmr.asp?ForumID=" & ForumID & "&amp;id=" & objgbrs("id") & "&amp;ids=" & objgbrs("tjhm") & "&amp;page=" & page & "&amp;bntj=f" & "&amp;SessionID=" & SessionID & "'>" & converttowidebaiti("撤销名贴")&"</a>"
    End if
       End if

if Cstr(Session("yxxezb"))<>"" or Session("yxxexc")<>"" or Session("cw1")<>"" or Session("cg")<>"" or Session("Counter")="pass_numbers_55556666" then
 if objgbrs("hd")="f" then
       response.write "<br/><a href='/BBS/Forum_ContenT/Forum_wzhd.asp?ForumID=" & ForumID & "&amp;id=" & objgbrs("id") & "&amp;ids=" & objgbrs("tjhm") & "&amp;page=" & page & "&amp;hd=t" & "&amp;SessionID=" & SessionID & "'>" & converttowidebaiti("设为活动")&"</a>"
    End if

    if objgbrs("hd")="t" then
       response.write "<br/><a href='/BBS/Forum_ContenT/Forum_wzhd.asp?ForumID=" & ForumID & "&amp;id=" & objgbrs("id") & "&amp;ids=" & objgbrs("tjhm") & "&amp;page=" & page & "&amp;hd=f" & "&amp;SessionID=" & SessionID & "'>" & converttowidebaiti("撤消活动")&"</a>"
    End if
 if objgbrs("a")="f" then
       response.write "<br/><a href='/BBS/Forum_ContenT/Forum_wzjza.asp?ForumID=" & ForumID & "&amp;id=" & objgbrs("id") & "&amp;ids=" & objgbrs("tjhm") & "&amp;page=" & page & "&amp;a=t" & "&amp;SessionID=" & SessionID & "'>" & converttowidebaiti("设为强贴")&"</a>"
    End if

    if objgbrs("a")="t" then
       response.write "<br/><a href='/BBS/Forum_ContenT/Forum_wzjza.asp?ForumID=" & ForumID & "&amp;id=" & objgbrs("id") & "&amp;ids=" & objgbrs("tjhm") & "&amp;page=" & page & "&amp;a=f" & "&amp;SessionID=" & SessionID & "'>" & converttowidebaiti("撤消强贴")&"</a>"
    End if
    End if

if Cstr(Session("vip1"))<>"" or Session("vip")<>"" or Session("Counter")="pass_numbers_55556666" then
if objgbrs("times")="2000-10-10 12:12:12" then
       response.write "<br/>=vip特权=<br/><a href='/BBS/Forum_ContenT/vip_wzgd.asp?ForumID=" & ForumID & "&amp;id=" & objgbrs("id") & "&amp;page=" & page & "&amp;zd=f" & "&amp;SessionID=" & SessionID & "'>" & converttowidebaiti("解开固底")&"</a>"
      else
       response.write "<br/>=vip特权=<br/><a href='/BBS/Forum_ContenT/vip_wzgd.asp?ForumID=" & ForumID & "&amp;id=" & objgbrs("id") & "&amp;page=" & page & "&amp;zd=o" & "&amp;SessionID=" & SessionID & "'>" & converttowidebaiti("文章固底")&"</a>"
       End if
if objgbrs("bntjyy1")="f" then
       response.write "<br/><a href='/BBS/Forum_ContenT/vip_wzsd.asp?ForumID=" & ForumID & "&amp;id=" & objgbrs("id") & "&amp;ids=" & objgbrs("tjhm") & "&amp;page=" & page & "&amp;bntjyy1=t" & "&amp;SessionID=" & SessionID & "'>" & converttowidebaiti("锁定文章")&"</a>"
    End if

    if objgbrs("bntjyy1")="t" then
       response.write "<br/><a href='/BBS/Forum_ContenT/vip_wzsd.asp?ForumID=" & ForumID & "&amp;id=" & objgbrs("id") & "&amp;ids=" & objgbrs("tjhm") & "&amp;page=" & page & "&amp;bntjyy1=f" & "&amp;SessionID=" & SessionID & "'>" & converttowidebaiti("解开锁定")&"</a>"
    End if
    End if
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
Response.write "<br/>-----------<br/><a href='/BBS/Forum_ContenT/BBs_receipt_ByContent.Asp?ForumID=" & ForumID & "&amp;id=" & id & "&amp;page=" & page & "&amp;SessionID=" & SessionID & "'>" & converttowidebaiti("返回查看原文")&"</a><br/><a href='/bbs/forum_content/contentlist.asp?ForumID=" & ForumID & "&amp;page=" & page & "&amp;SessionID=" & SessionID & "'>" & converttowidebaiti("返回")&"" & converttowidebaiti(dlname) & "</a>"
Response.write "<br/><a href='/BBS/index.asp?SessionID=" & SessionID & "'>" & converttowidebaiti("返回社区首页")&"</a></p></card></wml>"
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
  frionline="(在线)"
  else
  frionline="(离线)"
  end if
  set objgbrr=nothing
End function
%>