<% Response.ContentType="text/vnd.wap.wml; charset=utf-8" %><?xml version="1.0" encoding="utf-8"?><!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<!--#INCLUDE VIRTUAL="/bbs/reg/useregs.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/reg/ltonline.asp"-->
<wml>
<head>
<meta http-equiv="Cache-Control" content="max-age=0"/>
<meta http-equiv="Cache-Control" content="no-cache"/>
<meta http-equiv="Expires" content="Mon, 1 Jan 1990 00:00:00 GMT"/>
</head>
<card id="card1" title="&#22823;&#23567;&#28216;&#25103;"><p>
<% 
SessionID=request.querystring("SessionID")
if SessionID="" then SessionID=Session("SessionID")
if Session("zh")="wap" then
        response.redirect "/BBS/UseLogin.asp"
      else
        Session("ltlybz")=""
    End if
Server.ScriptTimeout=999
iduse=Session("useid")
dim num,msg
num=request("num")
  set objgbrs=Server.CreateObject("ADODB.Recordset")
  conn.CommandTimeOut =999
  ssql="select * from usereg where Cstr(id)='" & iduse & "'"
  objgbrs.open ssql,conn
if num<>"" then
   num=Clng(num)
   if num>objgbrs("usejf") or objgbrs("usejf") < 5 then
      msg="&#21621;&#21621;&#44;&#31215;&#20998;&#19981;&#22815;&#23601;&#35201;&#37027;&#20040;&#35946;&#36172;&#22043;&#33;"
      response.write msg & "<br/><a href='daxiao.asp?SessionID=" & SessionID & "'>&#20877;&#26469;&#19968;&#27425;</a><br/>--------<br/><a href='/bbs/index.asp?SessionID=" & SessionID & "'>&#31038;&#21306;&#39318;&#39029;</a></p></card></wml>"
	conn.close
	set objgbrs=nothing
	Set conn = Nothing
	response.end
   end if
   if num<5 then
      msg="&#26368;&#20302;&#25237;&#27880;&#39069;&#20026;&#53;&#20998;&#33;"
      response.write msg & "<br/><a href='daxiao.asp?SessionID=" & SessionID & "'>&#20877;&#26469;&#19968;&#27425;</a><br/>--------<br/><a href='/bbs/inde.asp?SessionID=" & SessionID & "'>&#31038;&#21306;&#39318;&#39029;</a></p></card></wml>"
	conn.close
	set objgbrs=nothing
	Set conn = Nothing
	response.end
   end if
   if num>10000000000000000000 then
      msg="&#36172;&#21338;&#26080;&#30410;&#65292;&#23569;&#19979;&#28857;&#21543;&#65281;"
      response.write msg & "<br/><a href='daxiao.asp?SessionID=" & SessionID & "'>&#20877;&#26469;&#19968;&#27425;</a><br/>--------<br/><a href='/bbs/index.asp?SessionID=" & SessionID & "'>&#31038;&#21306;&#39318;&#39029;</a></p></card></wml>"
	conn.close
	set objgbrs=nothing
	Set conn = Nothing
	response.end
   end if
  else
    msg="&#20054;&#20054;&#44;&#21738;&#26377;&#26080;&#26412;&#29983;&#21033;&#30340;&#22909;&#20107;&#33;"
      response.write msg & "<br/><a href='daxiao.asp?SessionID=" & SessionID & "'>&#20877;&#26469;&#19968;&#27425;</a><br/>--------<br/><a href='/bbs/index.asp?SessionID=" & SessionID & "'>&#31038;&#21306;&#39318;&#39029;</a></p></card></wml>"
	conn.close
	set objgbrs=nothing
	Set conn = Nothing
	response.end
  end if
  if Clng(request("select"))>1 or Clng(request("select"))<0 then
      sql="update usereg set usejf=usejf-100000 where Cstr(id)='"& iduse &"'"
      conn.Execute(sql)
      msg="&#25968;&#25454;&#38750;&#27861;&#44;&#25187;&#38500;100000"
      response.write msg & "<br/><a href='daxiao.asp?SessionID=" & SessionID & "'>&#20877;&#26469;&#19968;&#27425;</a><br/>--------<br/><a href='/bbs/index.asp?SessionID=" & SessionID & "'>&#31038;&#21306;&#39318;&#39029;</a></p></card></wml>"
	conn.close
	set objgbrs=nothing
	Set conn = Nothing
	response.end
  end if
randomize
m=int(6*rnd+1)
if m>3 then
if Clng(request("select"))=1 then
   Randomize
     m1 = Int(6 * Rnd + 1)
   Randomize
     m3 = Int(6 * Rnd + 1)
   Randomize
     m2 = Int(5 * Rnd + 1)
else
   Randomize
     m1 = Int(6 * Rnd + 1)
   Randomize
     m3 = Int(6 * Rnd + 1)
   Randomize
     m2 = Int(7 * Rnd + 1)
if m2>6 then m3=6 end if
end if
else
   Randomize
     m1 = Int(6 * Rnd + 1)
   Randomize
     m3 = Int(6 * Rnd + 1)
   Randomize
     m2 = Int(6 * Rnd + 1)
end if

if Clng(request("select"))=1 then
 if m1+m2+m3>9 then
	mm=int(6*rnd+1)
	if mm=1 or mm=2 or mm=3 or mm=4 then
       do while m1+m2+m3>=10
          m1 = Int(6 * Rnd + 1)
         m3 = Int(6 * Rnd + 1)
          m2 = Int(6 * Rnd + 1)
       loop
	end if
  end if
else
 if m1+m2+m3<9 then
	mm=int(6*rnd+1)
	if mm=1 or mm=2 or mm=3 or mm=4 then
       do while m1+m2+m3<9
          m1 = Int(6 * Rnd + 1)
         m3 = Int(6 * Rnd + 1)
          m2 = Int(6 * Rnd + 1)
       loop
	end if
  end if
end if
if (m1+m2+m3)>9 then
    response.write "&#32467;&#26524;&#58;" & (m1+m2+m3) & "&#28857;&#65292;&#22823;"
  if Clng(request("select"))=0 then
    response.write "<br/>&#30495;&#20498;&#38665;&#65292;&#36755;&#20102;&#65306;" & num & "&#28857;&#31215;&#20998;"
     sql="update usereg set usejf=usejf-" & num & " where Cstr(id)='"& iduse &"'"
    conn.Execute(sql)
   else
    response.write "<br/>&#24685;&#21916;&#24685;&#21916;&#65281;&#24744;&#36194;&#20102;&#65306;" & num & "&#28857;&#31215;&#20998;" 
     sql="update usereg set usejf=usejf+" & num & " where Cstr(id)='"& iduse &"'"
    conn.Execute(sql)
   end if
 else
    response.write "&#32467;&#26524;&#58;" & (m1+m2+m3) & "&#28857;&#65292;&#23567;"
  if Clng(request("select"))=1 then
      response.write "<br/>&#30495;&#20498;&#38665;&#65292;&#36755;&#20102;&#65306;" & num & "&#28857;&#31215;&#20998;"
     sql="update usereg set usejf=usejf-" & num & " where Cstr(id)='"& iduse &"'"
    conn.Execute(sql)
   else
    response.write "<br/>&#24685;&#21916;&#24685;&#21916;&#65281;&#24744;&#36194;&#20102;&#65306;" & num & "&#28857;&#31215;&#20998;" 
     sql="update usereg set usejf=usejf+" & num & " where Cstr(id)='"& iduse &"'"
    conn.Execute(sql)
   end if
end if

	conn.close
	set objgbrs=nothing
	Set conn = Nothing
%>
<br/><a href='/bbs/game/daxiao.asp?SessionID=<%=SessionID%>'>&#20877;&#26469;&#19968;&#27425;</a><br/>--------<br/>
<a href='/bbs/scyl.asp?SessionID=<%=SessionID%>'>&#x8FD4;&#x56DE;&#x793E;&#x533A;&#x5A31;&#x4E50;</a><br/>
<a href='/bbs/index.asp?SessionID=<%=SessionID%>'>&#x8FD4;&#x56DE;&#x793E;&#x533A;&#x9996;&#x9875;</a>
</p></card></wml>