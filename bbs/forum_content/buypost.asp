<% @LANGUAGE="VBSCRIPT" CODEPAGE="65001" %><% Response.ContentType="text/vnd.wap.wml; charset=utf-8" %><?xml version="1.0" encoding="utf-8"?><!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<!--#INCLUDE VIRTUAL="/bbs/reg/useregs.asp"-->
<wml>
<head>
<meta http-equiv="Cache-Control" content="max-age=0"/>
<meta http-equiv="Cache-Control" content="no-cache"/>
<meta http-equiv="Expires" content="Mon, 1 Jan 1990 00:00:00 GMT"/>
</head>
<% 
if Session("zh")="wap" then
  page=request("page")
  sort=request("sort")
  id=Request("id")
  ids=Request("ids")
ForumID=request("ForumID")
       Session("returnuppath")=Request.ServerVariables("PATH_INFO") & "?id="&id&"&amp;page="&page&"&amp;ForumID="&ForumID&"&amp;ids="&ids&""
        response.redirect "/BBS/UseLogiN.Asp?SessionID=" & SessionID & ""
  	response.end
      else
        Session("ltlybz")=""
    End if
SessionID=request.querystring("SessionID")
Server.ScriptTimeout=999
iduse=Session("useid")
dim id,ids,buyzf,ForumID,page
  ids=request("ids")
  id=request("id")
  page=request("page")
  ForumID=request("ForumID")
if conn.execute("select * from fgr_5fd_ffg where id='"& id &"' and useid='" & Session("useid") & "'").eof then
    if conn.execute("select * from wuza where Cstr(id)='"& id &"' and tjhm='" & ids & "' and itid='" & ForumID & "'").eof then
         response.write "<card id='card1' title='购买文章'><p align='center'>数据非法</p></card></wml>"
         conn.close
         set conn=nothing
         response.end
    end if
    set objgbr=Server.CreateObject("ADODB.Recordset")
    ssql="select * from wuza where Cstr(id)='"& id &"' and tjhm='" & ids & "'"
    objgbr.open ssql,conn
    memo=objgbr("naiyo")
  	Set re=new RegExp
	re.IgnoreCase =true
	re.Global=True
    re.Pattern="(^.*)(\(my=*([0-9]*)\))(.+?)(\(\/s\))(.*)"
    buyzf=re.Replace(memo,"$3")
	set re=Nothing
    set objgbr=nothing
    buyzf=untowide(buyzf)
    buyzf=Clng(buyzf)
    Set objgbrs=Server.CreateObject("ADODB.Recordset")
    sql="select * from usereg where CStr(id)='" & iduse & "'"
    objgbrs.open sql,conn
 if objgbrs("usejf")<buyzf then
            msg="你的金币不够购买此帖！"
       else
            sql="update usereg set usejf=usejf-" & buyzf & " Where CStr(id)='" & iduse & "'"
            Application.Lock
            conn.execute(sql)
            sql="update usereg set usejf=usejf+" & buyzf & " Where CStr(id)='" & ids & "'"
            conn.execute(sql)
            Application.Unlock
            msg="购买成功，正在返回..."
            buyzl
 end if
response.write "<card id='card1' title='购买文章' ontimer='/BBS/forum_content/BBs_receipt_ByContent.Asp?ForumID=" & ForumID & "&amp;ID=" & id & "&amp;Page=" & Page & "&amp;SessionID=" & SessionID & "'><timer value='1'/><p align='left'>"
response.write msg & "<br/><a href='/BBS/forum_content/BBs_receipt_ByContent.Asp?ForumID=" & ForumID & "&amp;ID=" & id & "&amp;Page=" & Page & "&amp;SessionID=" & SessionID & "'>回看文章</a>"

else
response.write "<card id='card1' title='购买文章'><p align='left'>这篇文章你已购买!"
response.write msg & "<br/><a href='/BBS/forum_content/BBs_receipt_ByContent.Asp?ForumID=" & ForumID & "&amp;ID=" & id & "&amp;Page=" & Page & "&amp;SessionID=" & SessionID & "'>回看文章</a>"
end if
Set objgbrs= Nothing
conn.close
set conn=nothing

function buyzl()
  sql="insert into fgr_5fd_ffg(id,useid) values ("
  sql=sql & sqlstr(id) & ","
  sql=sql & sqlstr(iduse) & ")"
  Application.Lock
  conn.execute(sql)
  sql="update wuza set clink=clink+1 Where CStr(id)='" & id & "'"
  conn.execute(sql)
  Application.Unlock
end function

function sqlstr(data)
   sqlstr="'" & Replace(data,"'","'") & "'"
  End function
Function untowide(str)
	str=replace(str,"+","")
	str=replace(str,"-","")
untoWide=str
end function
%>
</p></card></wml>
