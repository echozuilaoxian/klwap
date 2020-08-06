<% @LANGUAGE="VBSCRIPT" CODEPAGE="65001" %><% Response.ContentType="text/vnd.wap.wml; charset=utf-8" %><?xml version="1.0" encoding="utf-8"?><!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<!--#INCLUDE VIRTUAL="/bbs/reg/useregs.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/public/codeun.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/reg/redtjname.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/reg/ltonline.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/ftip.inc"-->

<wml>
<head>
<meta http-equiv="Cache-Control" content="max-age=0"/>
<meta http-equiv="Cache-Control" content="no-cache"/>
<meta http-equiv="Expires" content="Mon, 1 Jan 1990 00:00:00 GMT"/>
</head>
<%
if Session("zh")="wap" then
        response.redirect "/bbs/yksm.asp"
      else
        Session("ltlybz")=""
    End if
SessionID=request.querystring("SessionID")
if SessionID="" then SessionID=Session("SessionID")
  dim name,memo,lzdname,ForumID,FaTie2_FSO,FaTie2_FS
  ForumID=request("ForumID")
   if ForumID<1 then
       response.end
   End if
set objgbrsy=Server.CreateObject("ADODB.Recordset")
rspl="select * from sclt where id="&ForumID
objgbrsy.open rspl,conn,1,2
if objgbrsy.eof then
dlname="无此论坛"
Else
dlname=converttowidebaiti(objgbrsy("name"))
LX_yxxe=objgbrsy("qx")
end if
objgbrsy.close
Set objgbrsy= Nothing
tjhm=Session("useid")
lzdname=request("lzdname")
pic=request("pic")
maimai=request("maimai")
lijin=request("lijin")
bntjyy2=request("bntjyy2")
name=request("name")
memo=request("memo")
vote=request("vote")
btzz=Session("ltname")

name=trim(name)
memo=trim(memo)
vote=trim(vote)
btzz=trim(btzz)

btzz=untowide(btzz)
name=untowide(name)
memo=untowide(memo)
vote=untowide(vote)
memo=CLng(memo)
if pic="" and Instr(memo,"(img)")>0 and Instr(memo,"(/img)")>0 then
pic="k"
end if
if Instr(memo,"(url=http://")>0 and Instr(memo,"(/url)")>0 then
pic="l"
end if
if pic="" then
pic="f"
end if
if lijin="" then
lijin="f"
end if
if maimai="" then
maimai="f"
end if
if bntjyy2="" then
bntjyy2="f"
end if
if LX_yxxe=2 and Session("yxxezb")="" and Session("yxxexc")="" and Session("cw1")="" and Session("cg")="" and Session("bzbz")="" and Session("gly")="" and Session("Counter")<>"pass_numbers_55556666" then
     response.write "<card id='card1' title='发表帖子不成功'><p>你非版主身份！请不要在版主区发表帖子"
     response.write "<br/><a href='/BBS/forum_content/Forum_Addcontent.Asp?ForumID=" & ForumID & "&amp;SessionID=" & SessionID & "'>返回继续操作</a><br/><a href='/BBS/forum_content/contentlist.asp?ForumID=" & ForumID & "&amp;SessionID=" & SessionID & "'>返回" & dlname & "</a><br/><a href='/BBS/index.asp?SessionID=" & SessionID & "'>返回社区首页</a></p></card></wml>"
     response.end
    End if
  if name="" or memo="" then
     response.write "<card id='card1' title='发表帖子不成功'><p>主题或内容不能为空！"
     response.write "<br/><a href='/BBS/forum_content/Forum_Addcontent.Asp?ForumID=" & ForumID & "&amp;SessionID=" & SessionID & "'>返回继续操作</a><br/><a href='/BBS/forum_content/contentlist.asp?ForumID=" & ForumID & "&amp;SessionID=" & SessionID & "'>返回" & dlname & "</a><br/><a href='/BBS/index.asp?SessionID=" & SessionID & "'>返回社区首页</a></p></card></wml>"
     response.end
  End if
If (len(name)<4 or len(memo)<8) and ForumID<>13 Then
     response.write "<card id='card1' title='发表帖子不成功'><p>帖子标题字符少于4个字符或者内容少于8个字符！"
     response.write "<br/><a href='/BBS/forum_content/Forum_Addcontent.Asp?ForumID=" & ForumID & "&amp;SessionID=" & SessionID & "'>返回继续操作</a><br/><a href='/BBS/forum_content/contentlist.asp?ForumID=" & ForumID & "&amp;SessionID=" & SessionID & "'>返回" & dlname & "</a><br/><a href='/BBS/index.asp?SessionID=" & SessionID & "'>返回社区首页</a></p></card></wml>"
     response.end
  End if

'---开始增加----
set rs=Server.CreateObject("ADODB.Recordset")
rspl="select * from [wuza] order by id desc"
rs.open rspl,conn,1,2
  sql="update usereg set usejf=usejf+50,ticont=ticont+5,ml=ml+5,tili=tili+5 where CStr(id)='" & tjhm & "'"
  conn.Execute(sql)
rs.addnew
if ForumID<>"" then rs("itid")=ForumID
if tjhm<>"" then rs("tjhm")=tjhm
if name<>"" then rs("biaoti")=name
if memo<>"" then rs("naiyo")=memo
if lzdname<>"" then rs("lzdname")=lzdname
if pic<>"" then rs("pic")=pic
if lijin<>"" then rs("lijin")=lijin
if maimai<>"" then rs("maimai")=maimai
if bntjyy2<>"" then rs("bntjyy2")=bntjyy2
if vote<>"" then rs("vote")=vote
if vote<>"" then
votes=split(untowide(vote),"\")
voteid=""
for i=0 to ubound(votes)
if votes(i)<>"" then
voteid=voteid&"0\"
end if
next
rs("addvote")=voteid
end if
rs.update
iddd=rs("id")
set rs=nothing

		Set FaTie2_FSO=Server.CreateObject("Scripting.FileSystemObject")
		Set FaTie2_FS=FaTie2_FSO.OpenTextFile(Server.Mappath("File/File/"&iddd&".txt"),2,True)
		FaTie2_FS.Write(memo)
                FaTie2_FS.Close
		Set FaTie2_FSO=Nothing
		Set FaTie2_FS=Nothing
  conn.close
  set conn=nothing
  response.write "<card id='card1' title='发表文章' ontimer='/BBS/forum_content/contentlist.asp?ForumID=" & ForumID & "&amp;SessionID=" & SessionID & "'><timer value='10'/><p align='left'>"
  response.write "成功发表文章.<br/>恭喜您获得<br/>金币+50 <br/>积分+5 <br/>魅力+5 <br/>体力+5<br/><a href='/BBS/forum_content/contentlist.asp?ForumID=" & ForumID & "&amp;SessionID=" & SessionID & "'>按这里</a>返回" & dlname & "...."
  response.write "<br/><br/><a href='/BBS/index.asp?SessionID=" & SessionID & "'>返回社区首页</a></p></card></wml>"
 %>
