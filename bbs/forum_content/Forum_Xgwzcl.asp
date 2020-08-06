<% @LANGUAGE="VBSCRIPT" CODEPAGE="65001" %><% Response.ContentType="text/vnd.wap.wml; charset=utf-8" %><?xml version="1.0" encoding="utf-8"?><!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<!--#INCLUDE VIRTUAL="/bbs/reg/useregs.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/public/codeun.asp"-->
<wml>
<head>
<meta http-equiv="Cache-Control" content="max-age=0"/>
<meta http-equiv="Cache-Control" content="no-cache"/>
<meta http-equiv="Expires" content="Mon, 1 Jan 1990 00:00:00 GMT"/>
</head>
<% SessionID=request.querystring("SessionID") %>
<%
dim memo,page,ForumID,id,name,Spage,Contentf,Contentup,con
   Spage=request("Spage")
   ForumID=request("ForumID")
   page=request("page")
   id=request("id")
   name=request("name")
   memo=request("memo")
   name=untowide(name)
   memo=untowide(memo)
    if memo="" or name="" then
    response.write "<card id='card1' title='&#x7F16;&#x8F91;&#x5E16;&#x5B50;'><p>"
    response.write "&#x5B57;&#x6BB5;&#x4E0D;&#x80FD;&#x4E3A;&#x7A7A;&#x767D;&#xFF01;&#xFF01;<br/><a href='/BBS/Forum_content/Forum_Xgwz.asp?ForumID=" & ForumID & "&amp;id=" & id & "&amp;page=" & page & "&amp;SessionID=" & SessionID & "'>&#x8FD4;&#x56DE;&#x7EE7;&#x7EED;&#x64CD;&#x4F5C;</a>"
    response.write "<br/><a href='/BBS/Forum_Content/Contentlist.Asp?ForumID=" & ForumID & "&amp;page=" & page & "&amp;SessionID=" & SessionID & "'>&#x8FD4;&#x56DE;&#x5F53;&#x524D;&#x7248;&#x5757;</a><br/><a href='/BBS/index.asp?SessionID=" & SessionID & "'>&#x8FD4;&#x56DE;&#x793E;&#x533A;&#x9996;&#x9875;</a></p></card></wml>"
    response.end
  End if
  iduse=Session("useid")
  set objgbrs=Server.CreateObject("ADODB.Recordset")
  ssql="select * from wuza Where CStr(id)='" & id &"' and tjhm='" & iduse & "'"
  objgbrs.open ssql,conn,1,3
  if objgbrs.eof then
      response.write "<card id='card1' title='&#x7F16;&#x8F91;&#x5E16;&#x5B50;'><p>ID&#x9519;&#x8BEF;</p></card></wml>"
      conn.close
      set objgbrs=nothing
      set conn=nothing
      response.end
  end if


Dim fso
Dim f
    set fso=server.CreateObject("Scripting.FileSystemObject")
    Set f = fso.OpenTextFile(Server.MapPath("File/File/"&id&".txt"),1)  
    Do  While  Not  f.AtEndOfStream    
    aaacc=f.ReadAll
    loop
    f.close
    set f=nothing
    set fso=nothing

showwz=CLng(Session("showwz"))
moy=request("moy")
Content=aaacc
if moy="123" then
pageWordNum=10000
else
pageWordNum=showwz
End IF

StartWord = 1
Length=len(Content)
PageAll=(Length+PageWordNum-1)\PageWordNum

Spage=request("Spage")
if isnull(Spage) or Spage="" then
Spage=0
end if
Contentup = left(Content,StartWord+Spage*PageWordNum-1)
con=Length-(StartWord+Spage*PageWordNum+PageWordNum-1)
if con>0 then
    Contentf = right(Content,con)
  else
    Contentf = ""
end if
memo=Contentup & memo & Contentf
Dim FaTie2_FSO
Dim FaTie2_FS
		Set FaTie2_FSO=Server.CreateObject("Scripting.FileSystemObject")
		Set FaTie2_FS=FaTie2_FSO.OpenTextFile(Server.Mappath("File/File/"&id&".txt"),2,True)
		FaTie2_FS.Write(memo)
                FaTie2_FS.Close
		Set FaTie2_FSO=Nothing
		Set FaTie2_FS=Nothing

  sql="update wuza set xiugaitime='" & now() & "',biaoti='" & name & "' Where CStr(id)='" & id & "' and tjhm='" & iduse & "'"
  Application.Lock
  conn.Execute(sql)
  Application.Unlock
  conn.close
  set objgbrs=nothing
  set conn=nothing
  response.write "<card id='card1' title='&#x7F16;&#x8F91;&#x5E16;&#x5B50;' ontimer='/BBS/Forum_ContenT/BBs_receipt_ByContent.Asp?ForumID=" & ForumID & "&amp;id=" & id & "&amp;page=" & page & "&amp;SessionID=" & SessionID & "'>"
  response.write "<timer value='5'/><p align='left'>&#x4FEE;&#x6539;&#x6210;&#x529F;&#xFF0C;&#x6B63;&#x5728;&#x8FD4;&#x56DE;...<br/>"
  response.write "<a href='/BBS/Forum_ContenT/BBs_receipt_ByContent.Asp?ForumID=" & ForumID & "&amp;id=" & id & "&amp;page=" & page & "&amp;SessionID=" & SessionID & "'>查看文章</a>"
    response.write "<br/><a href='/BBS/Forum_Content/Contentlist.Asp?ForumID=" & ForumID & "&amp;page=" & page & "&amp;SessionID=" & SessionID & "'>&#x8FD4;&#x56DE;&#x5F53;&#x524D;&#x7248;&#x5757;</a><br/><a href='/BBS/index.asp?SessionID=" & SessionID & "'>&#x8FD4;&#x56DE;&#x793E;&#x533A;&#x9996;&#x9875;</a></p></card></wml>"
    %>