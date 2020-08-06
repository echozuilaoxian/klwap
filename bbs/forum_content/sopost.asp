<% @LANGUAGE="VBSCRIPT" CODEPAGE="65001" %><% Response.ContentType="text/vnd.wap.wml; charset=utf-8" %><?xml version="1.0" encoding="utf-8"?><!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<!--#INCLUDE VIRTUAL="/bbs/reg/useregs.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/public/codeun.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/reg/ltonline.asp"-->
<wml>
<head>
<meta http-equiv="Cache-Control" content="max-age=0"/>
<meta http-equiv="Cache-Control" content="no-cache"/>
<meta http-equiv="Expires" content="Mon, 1 Jan 1990 00:00:00 GMT"/>
</head>
<% SessionID=request.querystring("SessionID") 
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
Server.ScriptTimeout=999
iduse=Session("useid")
dim id,ids,buyzf,ForumID,page
  ids=request("ids")
  id=request("id")
  page=request("page")
  ForumID=request("ForumID")
if conn.execute("select * from fgr_5fd_ffg where id='"& id &"' and useid='" & Session("useid") & "'").eof then
    if conn.execute("select * from wuza where Cstr(id)='"& id &"' and tjhm='" & ids & "' and itid='" & ForumID & "'").eof then
         response.write "<card id='card1' title='领取礼金'><p align='center'>数据非法</p></card></wml>"
         conn.close
         set conn=nothing
         response.end
    end if
    set objgbr=Server.CreateObject("ADODB.Recordset")
    ssql="select * from wuza where Cstr(id)='"& id &"' and tjhm='" & ids & "'"
    objgbr.open ssql,conn
    lj=objgbr("lj")
	slj=objgbr("slj")
	
	ylj=lj-slj
    set objgbr=nothing
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
   
Set objgbrs=Server.CreateObject("ADODB.Recordset")
    sql="select * from usereg where CStr(id)='" & ids & "'"
    objgbrs.open sql,conn
if ylj<buyzf then
            msg="币已经派完哦,看来你运气不佳"
       else
            sql="update usereg set usejf=usejf+" & buyzf & " Where CStr(id)='" & iduse & "'"
            Application.Lock
            conn.execute(sql)
            sql="update wuza set slj=slj+" & buyzf & " Where CStr(id)='" & id & "'"
            conn.execute(sql)
            Application.Unlock
            msg="成功领取礼金，正在返回..."
            buyzl
 end if
response.write "<card id='card1' title='领取礼金' ontimer='/BBS/forum_content/BBs_receipt_ByContent.Asp?ForumID=" & ForumID & "&amp;ID=" & id & "&amp;Page=" & Page & "&amp;SessionID=" & SessionID & "'><timer value='1'/><p align='left'>"
response.write msg & "<br/><a href='/BBS/forum_content/BBs_receipt_ByContent.Asp?ForumID=" & ForumID & "&amp;ID=" & id & "&amp;Page=" & Page & "&amp;SessionID=" & SessionID & "'>回看文章</a>"

else
response.write "<card id='card1' title='领取礼金'><p align='left'>你已经领过了,就别贪心了,留点给别人嘛."
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



