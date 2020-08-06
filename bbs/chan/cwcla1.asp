<% @LANGUAGE="VBSCRIPT" CODEPAGE="65001" %><% Response.ContentType="text/vnd.wap.wml; charset=utf-8" %><?xml version="1.0" encoding="utf-8"?><!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<!--#INCLUDE VIRTUAL="/bbs/reg/useregs.asp"-->
<wml>
<%
if Session("zh")="wap" then
        response.redirect "/bbs/yksm.asp"
      else
        Session("ltlybz")=""
    End if
dim id,guanb,idss
wap=request.querystring("wap")
idss=Session("useid")
id=request("ids")
cw=request.form("cw")
 Set objgbrs=Server.CreateObject("ADODB.Recordset")
    sql="select * from usereg where CStr(id)='" & Session("useid") & "'"
    objgbrs.open sql,conn		   
if objgbrs("usejf")<10000 and cw=1 then
                  Response.write "购买宠物不成功!金币不够!"
 		conn.close
		set conn=nothing
		response.end
            
end if
               sql="update usereg set usejf=usejf-10000  where CStr(id)='" & idss & "'" 
                conn.execute sql
                sql="update usereg set cw=" & sqlstr(cw) &" where CStr(id)='" & id & "'"
                conn.execute sql
			conn.execute sql                     
if objgbrs("usejf")<30000 and cw=2 then 
                  Response.write "购买宠物不成功!金币不够!"
 		conn.close
		set conn=nothing
                  response.end
end if
                sql="update usereg set usejf=usejf-30000  where CStr(id)='" & idss & "'" 
                conn.execute sql
                sql="update usereg set cw=" & sqlstr(cw) &" where CStr(id)='" & id & "'"
                conn.execute sql
			conn.execute sql               
if objgbrs("usejf")<50000 and cw=3 then
 Response.write "购买宠物不成功!金币不够!"
 		conn.close
		set conn=nothing
                  response.end
end if
               sql="update usereg set usejf=usejf-50000  where CStr(id)='" & idss & "'" 
                conn.execute sql
                sql="update usereg set cw=" & sqlstr(cw) &" where CStr(id)='" & id & "'"
                conn.execute sql
			conn.execute sql
if objgbrs("usejf")<200000 and cw=4 then 
Response.write "购买宠物不成功!金币不够!"
 		conn.close
		set conn=nothing
                  response.end
end if 
               sql="update usereg set usejf=usejf-200000  where CStr(id)='" & idss & "'" 
                conn.execute sql
                sql="update usereg set cw=" & sqlstr(cw) &" where CStr(id)='" & id & "'"
                conn.execute sql
                      conn.execute sql
if objgbrs("usejf")<500000 and cw=5 then
Response.write "购买宠物不成功!金币不够!"
 		conn.close
		set conn=nothing
                  response.end
end if
                sql="update usereg set usejf=usejf-500000  where CStr(id)='" & idss & "'" 				
                conn.execute sql
                sql="update usereg set cw=" & sqlstr(cw) &" where CStr(id)='" & id & "'"
                conn.execute sql
                      conn.execute sql
if objgbrs("usejf")<1000 and cw=6 then
                  Response.write "购买宠物不成功!金币不够!"
 		conn.close
		set conn=nothing
		response.end
            
end if
               sql="update usereg set usejf=usejf-1000  where CStr(id)='" & idss & "'" 
                conn.execute sql
                sql="update usereg set cw=" & sqlstr(cw) &" where CStr(id)='" & id & "'"
                conn.execute sql
			conn.execute sql  

if objgbrs("usejf")<3000 and cw=7 then
                  Response.write "购买宠物不成功!金币不够!"
 		conn.close
		set conn=nothing
		response.end
            
end if
               sql="update usereg set usejf=usejf-3000  where CStr(id)='" & idss & "'" 
                conn.execute sql
                sql="update usereg set cw=" & sqlstr(cw) &" where CStr(id)='" & id & "'"
                conn.execute sql
			conn.execute sql  
if objgbrs("usejf")<5000 and cw=8 then
                  Response.write "购买宠物不成功!金币不够!"
 		conn.close
		set conn=nothing
		response.end
            
end if
               sql="update usereg set usejf=usejf-5000  where CStr(id)='" & idss & "'" 
                conn.execute sql
                sql="update usereg set cw=" & sqlstr(cw) &" where CStr(id)='" & id & "'"
                conn.execute sql


set objgbrs=nothing
set conn=nothing
Response.write "<card id='card1' title='购买宠物成功' ontimer='/bbs/public/gygl.asp?wap=" & wap & "'><timer value='10'/>"
Response.write "<p>购买宠物成功!正在返回..."
Response.write "<br/><a href='/bbs/public/gygl.asp?wap=" & wap & "'>我的地盘</a></p></card></wml>"
function sqlstr(data)
   sqlstr="'" & Replace(data,"'","'") & "'"
  End function
%>



