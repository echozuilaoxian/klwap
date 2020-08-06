<% @LANGUAGE="VBSCRIPT" CODEPAGE="65001" %><% Response.ContentType="text/vnd.wap.wml; charset=utf-8" %><?xml version="1.0" encoding="utf-8"?><!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<!--#INCLUDE VIRTUAL="/bbs/reg/useregs.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/public/codeun.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/reg/ltonline.asp"-->
<wml>
<card id="card" title="成功退出娱乐圈">
<%
SessionID=request.querystring("SessionID")
if SessionID="" then SessionID=Session("SessionID")
if Session("zh")="wap" then
        response.redirect "/bbs/yksm.asp"
      else
        Session("ltlybz")=""
    End if
iduse=Session("useid")
  set objgbrs=Server.CreateObject("ADODB.Recordset")
  ssql="select gongzuo,zhiye,usejf,tianshu,tili,ml,caihua,zhili,xf,xl,id from usereg where Cstr(id)='" & iduse & "'"
  objgbrs.open ssql,conn
  if objgbrs("gongzuo")=0 or objgbrs("zhiye")=0 then
  Response.write "干什么啊~工作都没有,辞什么职啊?"
  Response.write "<br/><a href='/bbs/job.asp?id=" & iduse & "&amp;SessionID=" & SessionID & "'>工作单位</a>"
  end if
  if objgbrs("gongzuo")>0 or objgbrs("zhiye")>0 then
sql="Delete DATEDIFF FROM gao WHERE Cstr(useid)='" & iduse & "'"
conn.Execute sql
    sql="update usereg set gongzuo=0,zhiye=0,usejf=usejf-1000,tianshu=0,ml=ml/2,tili=tili/2,zhili=zhili/2,caihua=caihua/2 where CStr(id)='" & iduse & "'"
    conn.execute(sql)
Response.write "<p>成功退出娱乐圈！"

Response.write "<br/>-------------<br/><a href='/bbs/job/ent.asp?SessionID="&SessionID&"'>返回娱乐圈</a><br/>"
Response.write "<a href='/bbs/index.asp?SessionID="&SessionID&"'>返回社区首页</a><br/>报时:"&time&"</p></card></wml>"
  end if
conn.close
set conn=nothing
%>