<% Response.ContentType="text/vnd.wap.wml; charset=utf-8" %><?xml version="1.0" encoding="utf-8"?><!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<!--#INCLUDE VIRTUAL="/bbs/reg/useregs.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/reg/ltonline.asp"-->
<wml>
<head>
<meta http-equiv="Cache-Control" content="max-age=0"/>
<meta http-equiv="Cache-Control" content="no-cache"/>
<meta http-equiv="Expires" content="Mon, 1 Jan 1990 00:00:00 GMT"/>
</head>
<card id="card1" title="&#21098;&#20992;&#30707;&#22836;&#24067;"><p>
<% 
if Session("zh")="wap" then
        response.redirect "/BBS/UseLogin.asp"
      else
        Session("ltlybz")=""
    End if
SessionID=request.querystring("SessionID")
if SessionID="" then SessionID=Session("SessionID")
Server.ScriptTimeout=999
iduse=Session("useid")
dim num,msg,playerChoice
num=request("num")
playerChoice= Cstr(request("playerSelect"))
  set objgbrs=Server.CreateObject("ADODB.Recordset")
  conn.CommandTimeOut =999
  ssql="select * from usereg where Cstr(id)='" & iduse & "'"
  objgbrs.open ssql,conn
if num<>"" then
   num=Clng(num)
   if num>Clng(objgbrs("usejf")) or Clng(objgbrs("usejf")) < 5 then
      msg="&#21621;&#21621;&#44;&#31215;&#20998;&#19981;&#22815;&#23601;&#35201;&#37027;&#20040;&#35946;&#36172;&#22043;&#33;"
      response.write msg & "<br/><a href='/bbs/game/jiandao.asp?SessionID=" & SessionID & "'>&#20877;&#26469;&#19968;&#27425;</a><br/>--------<br/><a href='/bbs/index.asp?SessionID=" & SessionID & "'>&#31038;&#21306;&#39318;&#39029;</a></p></card></wml>"
	conn.close
	set objgbrs=nothing
	Set conn = Nothing
	response.end
   end if
   if num<5 then
      msg="&#26368;&#20302;&#25237;&#27880;&#39069;&#20026;&#53;&#20998;&#33;"
      response.write msg & "<br/><a href='/bbs/game/jiandao.asp?SessionID=" & SessionID & "'>&#20877;&#26469;&#19968;&#27425;</a><br/>--------<br/><a href='/bbs/index.asp?SessionID=" & SessionID & "'>&#31038;&#21306;&#39318;&#39029;</a></p></card></wml>"
	conn.close
	set objgbrs=nothing
	Set conn = Nothing
	response.end
   end if
   if num>1000 then
      msg="&#36172;&#21338;&#26080;&#30410;&#65292;&#23569;&#19979;&#28857;&#21543;&#65281;"
      response.write msg & "<br/><a href='/bbs/game/jiandao.asp?SessionID=" & SessionID & "'>&#20877;&#26469;&#19968;&#27425;</a><br/>--------<br/><a href='/bbs/index.asp?SessionID=" & SessionID & "'>&#31038;&#21306;&#39318;&#39029;</a></p></card></wml>"
	conn.close
	set objgbrs=nothing
	Set conn = Nothing
	response.end
   end if
  else
    msg="&#20054;&#20054;&#44;&#21738;&#26377;&#26080;&#26412;&#29983;&#21033;&#30340;&#22909;&#20107;&#33;"
      response.write msg & "<br/><a href='/bbs/game/jiandao.asp?SessionID=" & SessionID & "'>&#20877;&#26469;&#19968;&#27425;</a><br/>--------<br/><a href='/bbs/index.asp?SessionID=" & SessionID & "'>&#31038;&#21306;&#39318;&#39029;</a></p></card></wml>"
	conn.close
	set objgbrs=nothing
	Set conn = Nothing
	response.end
  end if

    dim Rock
    dim Scissor
    dim Paper 
    Rock = "R"
    Scissor = "S"
    Paper = "P"
 computerChooses=computerChoosess
	If playerChoice = computerChooses Then
    msg="&#20320;&#20204;&#20457;&#30495;&#26159;&#24515;&#26377;&#28789;&#29312;&#65281;"
	End If

   If playerChoice=Rock and computerChooses = Scissor Then
 computerChooses=computerChoosess
   If playerChoice=Rock and computerChooses = Scissor Then
    sql="update usereg set usejf=usejf+" & num & " where Cstr(id)='"& iduse &"'"
    conn.Execute(sql)
    msg="&#20320;&#30340;&#30707;&#22836;&#25462;&#25153;&#20102;&#26426;&#22120;&#20154;&#30340;&#21098;&#23376;&#65281;&#24744;&#24471;&#21040;" & num & "&#x94BB;&#x5E01;"
      else
    sql="update usereg set usejf=usejf-" & num & " where Cstr(id)='"& iduse &"'"
    conn.Execute(sql)
    msg="&#26426;&#22120;&#20154;&#30340;&#24067;&#21253;&#20303;&#20102;&#20320;&#30340;&#30707;&#22836;&#65281;&#24744;&#25439;&#22833;" & num & "&#x94BB;&#x5E01;"
		End If
		End If

   If playerChoice=Rock and computerChooses = Paper Then
    sql="update usereg set usejf=usejf-" & num & " where Cstr(id)='"& iduse &"'"
    conn.Execute(sql)
    msg="&#26426;&#22120;&#20154;&#30340;&#24067;&#21253;&#20303;&#20102;&#20320;&#30340;&#30707;&#22836;&#65281;&#24744;&#25439;&#22833;" & num & "&#x94BB;&#x5E01;"
		End If

    If playerChoice = Scissor and computerChooses = Paper Then
 computerChooses=computerChoosess
    If playerChoice = Scissor and computerChooses = Paper Then
    sql="update usereg set usejf=usejf+" & num & " where Cstr(id)='"& iduse &"'"
    conn.Execute(sql)
    msg="&#20320;&#30340;&#21098;&#23376;&#21098;&#30772;&#20102;&#26426;&#22120;&#20154;&#30340;&#24067;&#65281;&#24744;&#24471;&#21040;" & num & "&#x94BB;&#x5E01;"
    bz="+"
      else
    sql="update usereg set usejf=usejf-" & num & " where Cstr(id)='"& iduse &"'"
    conn.Execute(sql)
    msg="&#26426;&#22120;&#20154;&#30340;&#30707;&#22836;&#25462;&#25153;&#20102;&#20320;&#30340;&#21098;&#23376;&#65281;&#24744;&#25439;&#22833;" & num & "&#x94BB;&#x5E01;"
		End If
		End If

    If playerChoice = Scissor and computerChooses = Rock Then
    sql="update usereg set usejf=usejf-" & num & " where Cstr(id)='"& iduse &"'"
    conn.Execute(sql)
    msg="&#26426;&#22120;&#20154;&#30340;&#30707;&#22836;&#25462;&#25153;&#20102;&#20320;&#30340;&#21098;&#23376;&#65281;&#24744;&#25439;&#22833;" & num & "&#x94BB;&#x5E01;"
		End If

	If playerChoice = Paper and computerChooses = Rock Then
 computerChooses=computerChoosess
	If playerChoice = Paper and computerChooses = Rock Then
    sql="update usereg set usejf=usejf+" & num & " where Cstr(id)='"& iduse &"'"
    conn.Execute(sql)
    msg="&#20320;&#30340;&#24067;&#21253;&#20303;&#20102;&#26426;&#22120;&#20154;&#30340;&#30707;&#22836;&#65281;&#24744;&#24471;&#21040;" & num & "&#x94BB;&#x5E01;"
    bz="+"
      else
    sql="update usereg set usejf=usejf-" & num & " where Cstr(id)='"& iduse &"'"
    conn.Execute(sql)
    msg="&#26426;&#22120;&#20154;&#30340;&#21098;&#23376;&#21098;&#30772;&#20102;&#20320;&#30340;&#24067;&#65281;&#24744;&#25439;&#22833;" & num & "&#x94BB;&#x5E01;"
		End If
		End If

	If playerChoice = Paper and computerChooses = Scissor Then
    sql="update usereg set usejf=usejf-" & num & " where Cstr(id)='"& iduse &"'"
    conn.Execute(sql)
    msg="&#26426;&#22120;&#20154;&#30340;&#21098;&#23376;&#21098;&#30772;&#20102;&#20320;&#30340;&#24067;&#65281;&#24744;&#25439;&#22833;" & num & "&#x94BB;&#x5E01;"
		End If

  response.write msg

	conn.close
	set objgbrs=nothing
	Set conn = Nothing
Function computerChoosess()
Dim randomNum
Dim choice
	randomize
	randomNum = int(rnd*15)+1
	If randomNum = 1 OR randomNum = 3 OR randomNum = 7 OR randomNum = 8 OR randomNum = 15 OR randomNum = 12 Then
		choice = "R"
	ElseIf randomNum = 2 OR randomNum = 6 OR randomNum = 11 OR randomNum = 13 Then
		choice = "S"
	Else 
		choice = "P"
	End If
computerChoosess = choice
End Function
%>
<br/><a href='/bbs/game/jiandao.asp?SessionID=<%=SessionID%>'>&#20877;&#26469;&#19968;&#27425;</a><br/>--------<br/><a href='/bbs/scyl.asp?SessionID=<%=SessionID%>'>&#x8FD4;&#x56DE;&#x8FD4;&#x56DE;&#x5A31;&#x4E50;</a><br/><a href='/bbs/index.asp?SessionID=<%=SessionID%>'>&#x8FD4;&#x56DE;&#x793E;&#x533A;&#x9996;&#x9875;</a></p></card></wml>


