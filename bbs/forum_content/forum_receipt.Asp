<!--#INCLUDE VIRTUAL="/md5/inc.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/hfip.inc"-->
<%
SessionID=request.querystring("SessionID")
if SessionID="" then SessionID=Session("SessionID")

if Session("zh")="wap" then
  id=request("id")
  forumID=request("forumID")
  page=request("page")
  name=trim(name)
       Session("returnuppath")=Request.ServerVariables("PATH_INFO") & "?id="&id&"&amp;page="&page&"&amp;ForumID="&ForumID&"&amp;name="&name&""
        response.redirect "/BBS/UseLogiN.Asp?SessionID=" & SessionID & ""
  	response.end
      else
        Session("ltlybz")=""
    End if

dim id,tjhm,page,forumID
  forumID=request("forumID")

set objgbrssy=Server.CreateObject("ADODB.Recordset")
rspls="select * from sclt where id="&forumID
objgbrssy.open rspls,conn,1,2
if objgbrssy.eof then
dlnamse="无此论坛"
Else
dlnamse=converttowidebaiti(objgbrssy("name"))
end if
objgbrssy.close
Set objgbrssy= Nothing

tjhm=Session("useid")
  page=request("page")
  id=request("id")
fazz=request("fazz")
  face=request.form("face")
  name=request.form("name")
  name=trim(name)
  name=untowide(name)
 btzz=untowide(Session("ltname"))
if Session("ltftzl")=name  then
     response.write "<card id='card1' title='回复帖子'><p>不能在短时间回复大部分相同内容的回复！"
response.write "<br/><a href='/bbs/forum_content/BBs_receipt_ByContent.Asp?ForumID=" & forumID & "&amp;id=" & id & "&amp;page=" & page & "&amp;SessionID=" & SessionID & "'>返回查看帖子</a>"
     response.write "<br/><a href='/bbs/forum_content/contentlist.asp?ForumID=" & forumID & "&amp;page=" & page & "&amp;SessionID=" & SessionID & "'>返回" & dlnamse & "</a>"
     response.write "<br/><a href='/bbs/index.asp?SessionID=" & SessionID & "'>返回社区首页</a></p></card></wml>"
     response.end
   conn.close
  set conn=nothing
 End if
      
set rshf=Server.CreateObject("ADODB.Recordset")
ssql="select * from lthf Where CStr(id)='" & id &"' and CStr(tjhm)='"&myid&"' and datediff('s',times,now())<120"
 rshf.open ssql,conn,1,3
if rshf.recordcount>4 then
   response.write "<card id='card1' title='回复帖子'><p>两分钟内不能在同一贴子回复5条回复！"
response.write "<br/><a href='/bbs/forum_content/BBs_receipt_ByContent.Asp?ForumID=" & forumID & "&amp;id=" & id & "&amp;page=" & page & "&amp;SessionID=" & SessionID & "'>返回查看帖子</a>"
     response.write "<br/><a href='/bbs/forum_content/contentlist.asp?ForumID=" & forumID & "&amp;page=" & page & "&amp;SessionID=" & SessionID & "'>返回" & dlnamse & "</a>"
     response.write "<br/><a href='/bbs/index.asp?SessionID=" & SessionID & "'>返回社区首页</a></p></card></wml>"
    response.end
    End if
        Session("ltftzl")=name
		Session.Timeout=10
if name="" then
     response.write "<card id='card1' title='回复帖子'><p>回复内容不能为空白！"
     response.write "<br/><a href='lthf.asp?itid=" & itid & "&amp;page=" & page & "&amp;id=" & id & "&amp;wap=" & wap & "'>返回重写</a>"
response.write "<br/><a href='/bbs/forum_content/BBs_receipt_ByContent.Asp?ForumID=" & forumID & "&amp;id=" & id & "&amp;page=" & page & "&amp;SessionID=" & SessionID & "'>返回查看帖子</a>"
     response.write "<br/><a href='/bbs/forum_content/contentlist.asp?ForumID=" & forumID & "&amp;page=" & page & "&amp;SessionID=" & SessionID & "'>返回" & dlnamse & "</a>"
     response.write "<br/><a href='/bbs/index.asp?SessionID=" & SessionID & "'>返回社区首页</a></p></card></wml>"
     response.end
  End if
if Session("ltfsbz")="sdfghdfg_dfg45fg45_6554" then
response.write "<card id='card1' title='回复帖子'><p>"
  Response.write "对不起，您的发表权已被锁，请与管理员联系!</p></card></wml>"
    response.end
End if
set objgbrs=Server.CreateObject("ADODB.Recordset")
conn.CommandTimeOut = 999
ssql="select * from wuza where Cstr(id)='" & id & "'"
objgbrs.open ssql,conn
tjhms=objgbrs("tjhm")
if objgbrs("bntjyy1")="t" then
 response.write "<card id='card1' title='回复帖子'><p>该文章锁定中,不能回复"
response.write "<br/><a href='/bbs/forum_content/BBs_receipt_ByContent.Asp?ForumID=" & forumID & "&amp;id=" & id & "&amp;page=" & page & "&amp;SessionID=" & SessionID & "'>返回查看帖子</a>"
     response.write "<br/><a href='/bbs/forum_content/contentlist.asp?ForumID=" & forumID & "&amp;page=" & page & "&amp;SessionID=" & SessionID & "'>返回" & dlnamse & "</a>"
     response.write "<br/><a href='/bbs/index.asp?SessionID=" & SessionID & "'>返回社区首页</a></p></card></wml>"
 response.end
    End if
if objgbrs("times")="2000-10-10 12:12:12" then
 response.write "<card id='card1' title='回复帖子'><p>该文章固底中,不能回复.<br/>"

response.write "<a href='/bbs/forum_content/BBs_receipt_ByContent.Asp?ForumID=" & forumID & "&amp;id=" & id & "&amp;page=" & page & "&amp;SessionID=" & SessionID & "'>返回查看帖子</a>"
     response.write "<br/><a href='/bbs/forum_content/contentlist.asp?ForumID=" & forumID & "&amp;page=" & page & "&amp;SessionID=" & SessionID & "'>返回" & dlnamse & "</a>"
     response.write "<br/><a href='/bbs/index.asp?SessionID=" & SessionID & "'>返回社区首页</a></p></card></wml>"
response.end
    End if
 if not conn.execute("select * from wuza where Cstr(id)='"& id &"' and itid='" & ForumID & "'").eof then
if objgbrs("lijin")="k" then
if conn.execute("select * from lthf where id='"& id &"' and tjhm='" & Session("useid") & "'").eof then
lj=objgbrs("lj")
	slj=objgbrs("slj")
	
	ylj=lj-slj
objgbrs.close
set objgbrs=nothing
   set fso=server.CreateObject("Scripting.FileSystemObject")
    Set f = fso.OpenTextFile(Server.MapPath("File/File/"&id&".txt"),1)  
    Do  While  Not  f.AtEndOfStream    
  memo=f.ReadAll
    loop
    f.close	
  	Set re=new RegExp
	re.IgnoreCase =true
	re.Global=True
    re.Pattern="(^.*)(\(so=*([0-9]*)\))(.+?)(\(\/n\))(.*)"
    buyzf=re.Replace(memo,"$3")
	 set f=nothing
    set fso=nothing
    buyzf=untowide(buyzf)
    buyzf=Clng(buyzf)
if ylj<buyzf then
            msg3="<b>金币不够或为零,无法领取礼金，看来你来的太晚了哦</b><br/>"
       else
            sql="update usereg set usejf=usejf+" & buyzf & " Where CStr(id)='" & Session("useid")&"'"
            Application.Lock
            conn.execute(sql)
            sql="update wuza set slj=slj+" & buyzf & " Where CStr(id)='" & id & "'"
            conn.execute(sql)
            Application.Unlock
            msg3="<b>成功领取("&buyzf&")礼金</b><br/>"
            buyzl
 end if
else
msg3="<b>你的礼金已派发，本次回复没有礼金</b><br/>"
end if
end if
  sql="insert into lthf(id,tjhm,itid,name)values("
  sql=sql & sqlstr(id) & ","
  sql=sql & sqlstr(tjhm) & ","
  sql=sql & sqlstr(forumID) & ","
  sql=sql & sqlstr(face+name) & ")"

  Application.Lock
  conn.execute sql
  Application.Unlock
  nowtime()

  sql="update usereg set usejf=usejf+5,tili=tili+1,ml=ml+1 where CStr(id)=" & tjhms
  Application.Lock
  conn.execute sql
  Application.Unlock


 if fazz="k" and Session("zhon")="ok" then
 sql="update hua set yi=yi+1 where CStr(ids)=" & tjhms
  Application.Lock
  conn.execute sql
  Application.Unlock
Session("zhon")=""
  msg2="恭喜!你获得随机奖励的向日葵种子一颗!<br/>"
end if
if Len(name)>1 then
  sql="update usereg set usejf=usejf+10,ticont=ticont+2,tili=tili+2,ml=ml+2 where CStr(id)=" & Session("useid")
  Application.Lock
  conn.execute sql
  Application.Unlock
end if
  msg="回复成功, 正在返回...<br/>金币+10 经验+2 魅力+2 体力+2"
else
  msg="参数错误"
end if
  response.write "<card id='card1' title='回复帖子' ontimer='/bbs/forum_content/receiptlist.asp?ForumID=" & forumID & "&amp;id=" & id & "&amp;page=" & page & "&amp;SessionID=" & SessionID & "'><timer value='10'/><p align='left'>"
response.write ""&msg3 & ""  
response.write msg & "<br/>"&msg2 & "<a href='/bbs/forum_content/receiptlist.asp?ForumID=" & forumID & "&amp;id=" & id & "&amp;page=" & page & "&amp;SessionID=" & SessionID & "'>回复列表</a>"
response.write "<br/><a href='/bbs/forum_content/BBs_receipt_ByContent.Asp?ForumID=" & forumID & "&amp;id=" & id & "&amp;page=" & page & "&amp;SessionID=" & SessionID & "'>回查看帖子</a>"
     response.write "<br/><a href='/bbs/forum_content/contentlist.asp?ForumID=" & forumID & "&amp;page=" & page & "&amp;SessionID=" & SessionID & "'>回" & dlnamse & "</a>"
     response.write "</p></card></wml>"
  conn.close
  set conn=nothing
Function nowtime()
	sql="select * from wuza where CStr(id)='" & id & "'"
	set rs=conn.execute(sql)
if rs("times")="2100-10-10 12:12:12" then
  sql="update wuza set hfcont=hfcont+1 Where CStr(id)='" & id & "'"
  Application.Lock
  conn.execute sql
  Application.Unlock
else 
  sql="update wuza set times='" & now() & "',hfcont=hfcont+1 Where CStr(id)='" & id & "'"
  Application.Lock
  conn.execute sql
  Application.Unlock
 End if
 set rs=nothing
End Function
conn.close
  set conn=nothing
%>