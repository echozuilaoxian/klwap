<%
db1="#roomsrom.mdb"
Set myc = Server.CreateObject("ADODB.Connection")  
Strconn="Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & Server.MapPath(db1)
myc.Open Strconn 


dim idroom,id,wap
idroom=888

id=clng(request.QueryString("id"))
SessionID=request.querystring("SessionID")

function sqlstr(data)
   sqlstr="'" & Replace(data,"'","'") & "'"
end function

dim objgbrs,sqqlls
set objgbrs=Server.CreateObject("ADODB.Recordset")
sqlls="select * from admin where id=1"
objgbrs.open sqlls,myc,1,1
  if not objgbrs.eof then
dim pag,bl,overtime,title,url,dj,jf,ad
pag=objgbrs("pag")
bl=objgbrs("bl")
overtime=objgbrs("overtime")
title=objgbrs("title")
urll=objgbrs("url")
dj=objgbrs("dj")
jf=objgbrs("jf")
ad=objgbrs("ad")
  end if
objgbrs.close
set objgbrs=nothing

dim objgbs
set objgbs=Server.CreateObject("ADODB.Recordset")
dim sqs
sqs="select * from ooo where wap='" & SessionID & "' order by id desc"
objgbs.open sqs,myc,1,1
dim idlt
idlt=objgbs("idlt")
nam=objgbs("name")
objgbs.close
set objgbs=nothing

%>

<!--#include file="conn.asp"-->