<% @LANGUAGE="VBSCRIPT" CODEPAGE="65001" %><% Response.ContentType="text/vnd.wap.wml; charset=utf-8" %><?xml version="1.0" encoding="utf-8"?><!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<!--#INCLUDE VIRTUAL="/bbs/reg/useregs.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/public/codeun.asp"-->
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
wap=request.querystring("wap")
  dim name,memo
  itid=Cstr(request("itid"))
   if Clng(itid)<1 then
       response.end
   End if

set objgbrsy=Server.CreateObject("ADODB.Recordset")
rspl="select * from sclt where id="&itid
objgbrsy.open rspl,conn,1,2
if objgbrsy.eof then
dlname="无此论坛"
Else
dlname=objgbrsy("name")
end if
objgbrsy.close
Set objgbrsy= Nothing

tjhm=Session("useid")
  name=request("name")
  memo=request("memo")
  name=left(name,30)
  name=trim(name)
  memo=trim(memo)
  btzz=Session("ltname")
  pic=request("pic")
  maimai=request("maimai")
  lijin=request("lijin")
  bntjyy2=request("bntjyy2")
  lzdname=request("lzdname")
  name=untowide(name)
  memo=untowide(memo)
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

     if itid=80 and Session("yxxezb")="" and Session("yxxexc")="" and Session("bzbz")="" and Session("gly")="" and Session("Counter")<>"pass_numbers_55556666" then
     response.write "<card id='card1' title='发表帖子不成功'><p>你非版主身份！请不要在版主区发表帖子"
     response.write "<br/><a href='tjwz.asp?itid=" & itid & "&amp;wap=" & wap & "'>返回继续操作</a><br/><a href='zcww.asp?itid=" & itid & "&amp;wap=" & wap & "'>返回" & dlname & "</a><br/><a href='/bbs/index.asp?wap=" & wap & "'>返回社区首页</a></p></card></wml>"
     response.end
    End if

     if Session("ltftzl")=memo then
     response.write "<card id='card1' title='发表帖子不成功'><p>不能短时间发同样的文章！"
     response.write "<br/><a href='tjwz.asp?itid=" & itid & "&amp;wap=" & wap & "'>返回继续操作</a><br/><a href='zcww.asp?itid=" & itid & "&amp;wap=" & wap & "'>返回" & dlname & "</a><br/><a href='/bbs/index.asp?wap=" & wap & "'>返回社区首页</a></p></card></wml>"
     response.end
    End if
        Session("ltftzl")=memo
		Session.Timeout=10
  if name="" or memo="" then
     response.write "<card id='card1' title='发表帖子不成功'><p><br/>主题或内容不能为空！"
     response.write "<br/><a href='tjwz.asp?itid=" & itid & "&amp;wap=" & wap & "'>返回继续操作</a><br/><a href='zcww.asp?itid=" & itid & "&amp;wap=" & wap & "'>返回" & dlname & "</a><br/><a href='/bbs/index.asp?wap=" & wap & "'>返回社区首页</a></p></card></wml>"
     response.end
  End if
If len(name)<4 and itid<>12 Then
     response.write "<card id='card1' title='发表帖子不成功'><p>帖子标题字符少于4个字！"
     response.write "<br/><a href='tjwz.asp?itid=" & itid & "&amp;wap=" & wap & "'>返回继续操作</a><br/><a href='zcww.asp?itid=" & itid & "&amp;wap=" & wap & "'>返回" & dlname & "</a><br/><a href='/bbs/index.asp?wap=" & wap & "'>返回社区首页</a></p></card></wml>"
     response.end
  End if

'---开始增加----
set rs=Server.CreateObject("ADODB.Recordset")
rspl="select * from [wuza] order by id desc"
rs.open rspl,conn,1,2
  sql="update usereg set usejf=usejf+50,ticont=ticont+1,ml=ml+5,tili=tili+5 where CStr(id)='" & tjhm & "'"
  conn.Execute(sql)
rs.addnew
if itid<>"" then rs("itid")=itid
if tjhm<>"" then rs("tjhm")=tjhm
if name<>"" then rs("biaoti")=name
if btzz<>"" then rs("btzz")=btzz
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
rs.close
set rs=nothing

  conn.close
  set conn=nothing

  response.write "<card id='card1' title='发表文章' ontimer='zcww.asp?itid=" & itid & "&amp;wap=" & wap & "'><timer value='10'/><p align='left'>"
  response.write "成功发表文章.<br/>恭喜您获得KY金币+50 积分+5 魅力+5 体力+5<br/><a href='zcww.asp?itid=" & itid & "&amp;wap=" & wap & "'>按这里继续完成发表</a><br/>返回" & dlname & "...."
  response.write "<br/><br/><a href='/bbs/index.asp?wap=" & wap & "'>返回社区首页</a></p></card></wml>"
 %>
