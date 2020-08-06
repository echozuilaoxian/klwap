<!--#include file="../../md5/Inc.asp"-->
<!--#include file="conn.asp"-->
<%
dim id,title,topprice,price,totime,paytype,payName,paycents,hs

dim jbbig,jbsmall
  set rs=Server.CreateObject("ADODB.Recordset")
  rs.open"select pay1,pay2 from diceadmin where id=1",ydzqconn,1,1
if not rs.eof then
jbsmall=rs("pay1")
jbbig=rs("pay2")
end if
rs.close
set rs=nothing

ID=request("ID")
paytype=request("paytype")
paycent=request("paycent")
hs=request("hs")
TP=request("TP")

if ID="" or Isnumeric(ID)=False then
  Call Error("<card title=""出错""><p>ID无效！")
  end if

if paytype="" or Isnumeric(paytype)=False then
  Call Error("<card title=""出错""><p>选择无效！")
  end if
  
paytype=abs(int(paytype))
  
if paytype<1 or paytype>5 then
  Call Error("<card title=""出错""><p>选择无效！")
  end if

dim typeName
if paytype=1 then
typeName="压小点"
elseif paytype=2 then
typeName="压大点"
elseif paytype=3 then
typeName="压单点"
elseif paytype=4 then
typeName="压双点"
elseif paytype=5 then
typeName="压合数点"
end if

set rs=Server.CreateObject("ADODB.Recordset")
rs.open"select comeover from dice where ID="&ID,ydzqconn,1,1
if rs.eof then
Call Error("<card title=""出错""><p>不存在的记录！")
end if
comeover=rs("comeover")
rs.close
set rs=nothing

if comeover= 1 then
  Call Error("<card title=""出错""><p>本次游戏已经结束！")
end if

if TP="ok" then
if paytype=5 then
if hs="" or IsNumeric(hs)=False then
  Call Error("<card title=""出错""><p>合数填写不正确！")
  end if
hs=abs(int(hs))
if hs<3 or hs>18 then
  Call Error("<card title=""出错""><p>合数填写不正确！合数应该是3至18的数字")
  end if
  end if
response.write "<card title=""我要下注""><p>"

if paycent="" or Isnumeric(paycent)=False then
  Call Error("压注"&getcent&"无效！")
  end if
paycent=abs(int(paycent))

 if paycent<jbsmall then
 Call Error("压注至少"&jbsmall&getcent&"！")
 end if
 
 if paycent>jbbig then
 Call Error("压注最大"&jbbig&getcent&"！")
 end if


 if myjb<paycent then
 Call Error("您的"&getcent&"不足！")
 end if
 

set rs=Server.CreateObject("ADODB.Recordset")
  rs.open"select  payname,payusid,paycent,paytime,diceid,paytype,hs from dicelist",ydzqconn,1,2
rs.addnew
rs("payname")=myni
rs("payusid")=myid
rs("paycent")=paycent
rs("paytype")=paytype
if paytype=5 then
rs("hs")=hs
end if 
rs("paytime")=now()
rs("diceid")=ID
rs.update
rs.close
set rs=nothing

if paytype=1 then
ydzqconn.execute("update dice Set dicesmall = dicesmall  + "&paycent&" where ID = " & ID)
elseif paytype=2 then
ydzqconn.execute("update dice Set dicebig = dicebig  + "&paycent&" where ID = " & ID)

elseif paytype=3 then
ydzqconn.execute("update dice Set diceds= diceds  + "&paycent&" where ID = " & ID)

elseif paytype=4 then
ydzqconn.execute("update dice Set dicess = dicess  + "&paycent&" where ID = " & ID)

elseif paytype=5 then
ydzqconn.execute("update dice Set dicebz = dicebz  + "&paycent&" where ID = " & ID)

end if

conn.execute("update usereg Set usejf = usejf  - "&paycent&" where ID = " & myID)

Response.write "恭喜，"&typeName&paycent&"成功！"

else
Response.write "<card title=""我要下注""><p>"


Response.write "您目前共有"&myjb&"金币<br/>"

Response.write "请输入"&typeName&"的"&getcent&"数量:<input name=""paycent"&tt&""" type=""text"" format=""*N"" value=""10""/>"

if paytype=5 then
response.write "合<input name=""hs"&tt&""" type=""text"" format=""*N"" size=""5""/>"
end if

response.write "<anchor>确定压注"
response.write "<go href=""dice.asp?ID="&ID&"&amp;SessionID=" & SessionID &""" method=""post"" accept-charset=""utf-8"">"
response.write "<postfield name=""paycent"" value=""$(paycent"&tt&")""/>"
if paytype=5 then
response.write "<postfield name=""hs"" value=""$(hs"&tt&")""/>"
end if 
response.write "<postfield name=""paytype"" value="""&paytype&"""/>"
response.write "<postfield name=""TP"" value=""ok""/>"
response.write "</go></anchor>"
Response.write"<br/>注：最小压注"&jbsmall&"，最大压注"&jbbig
end if
conn.close
set conn=nothing
ydzqconn.close
set ydzqconn=nothing
%>
<!--#include file="fanhui.asp"-->
</p></card></wml>