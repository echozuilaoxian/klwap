<%
dim ydzqconn
set ydzqconn=Createobject("ADODB.connection")
ydzqconn.connectionString="DBQ="& server.mappath("#klwlldsq.mdb")& ";DRIVER={Microsoft Access Driver (*.mdb)};"
ydzqconn.open
dim paylulu,payjdcent
paylulu=0.9

  Function addlist(userid)
  dim rs2
  set rs2=Server.CreateObject("ADODB.Recordset")
  rs2.open"select * from YD_plist where userid="&userid,ydzqconn,1,2
if not rs2.eof then
rs2("jdnum")=rs2("jdnum")+1
rs2("jbnum")=rs2("jbnum")+payjdcent
else
rs2.addnew
rs2("userid")=userid
rs2("jdnum")=1
rs2("jbnum")=payjdcent
end if
rs2.update
rs2.close
set rs2=nothing
End function
  Function addlist2(userid2)
  dim rs3
  set rs3=Server.CreateObject("ADODB.Recordset")
  rs3.open"select * from YD_plist where userid="&userid2,ydzqconn,1,2
if not rs3.eof then
rs3("jdnum")=rs3("jdnum")-1
rs3("jbnum")=rs3("jbnum")-objgbrss("num")
else
rs3.addnew
rs3("userid")=userid2
rs3("jdnum")=rs3("jdnum")-1
rs3("jbnum")=rs3("jbnum")-objgbrss("num")
end if
rs3.update
rs3.close
set rs3=nothing
End function
function gametalk(num)
        dim rs11,ga
        set rs11 = server.createobject("adodb.recordset")
          rs11.open"select id,talk,times from talk order by times desc",ydzqconn,1,1
          If rs11.eof Then 
            response.write("还没有任何动作记录！<br/>")
                  else
            rs11.Move(0)
                  ga=1
            do while ((not rs11.EOF) and ga <=num)
               response.write date_gametalk(rs11("times"))&"前"&rs11("talk")&"<br/>"
                  rs11.MoveNext
                      ga=ga+1
                            loop
                   end if
                rs11.close
        set rs11=nothing
end function
Function date_gametalk(gamedatenum)
Dim aa,bb,cc,dd,ee,ff,gg 
aa=DateDiff("s",gamedatenum,now()) 
bb=Int(aa/86400) 
cc=aa-bb*86400 
dd=Int(cc/3600)
ee=cc-dd*3600 
ff=Int(ee/60)
gg=ee-ff*60 
if gg="" or gg<=0 then gg=1
if bb>0 then Response.write bb&"天" 
if clng(bb)<1 then
if bb>0 or dd>0 then Response.write dd&"小时" 
end if
if clng(dd)<1 and clng(bb)<1 then
if bb>0 or dd>0 or ff>0 then Response.write ff&"分钟" 
end if
if clng(ff)<1 then
Response.write gg&"秒" 
end if
end Function
myid=Session("useid")
getcent="金币"
SessionID=request.querystring("SessionID")
if SessionID="" then SessionID=Session("SessionID")
 set rs1=Server.CreateObject("ADODB.Recordset")
  ssql1="select usejf from [usereg] where [id]=" &myid & " "
  rs1.open ssql1,conn
myjb=rs1("usejf")
 rs1.close
set  rs1=nothing
myni=Session("ltname")
iduse=Session("useid")
listnum=10
if Session("zh")="wap" then
        response.redirect "/bbs/yksm.asp"
    End if
%>
