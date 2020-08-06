<%
dim admin,adminsql
set admin=server.createobject("ADODB.Recordset")
adminsql="select * from admin where idd=" & idlt & " order by id desc"
admin.open adminsql,myc,1,1

  if not admin.eof then
dim idgl
idgl=admin("idd")
  end if
admin.close
set admin=nothing

if idlt=idgl and idgl<>"" then 

%>