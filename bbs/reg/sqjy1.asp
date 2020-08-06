<% Response.ContentType="text/vnd.wap.wml" %><?xml version="1.0" encoding="utf-8"?><!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<!--#INCLUDE VIRTUAL="/bbs/reg/useregs.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/public/codeun.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/reg/ltonline.asp"-->
<wml>
<head>
<meta http-equiv="Cache-Control" content="max-age=0"/>
<meta http-equiv="Cache-Control" content="no-cache"/>
<meta http-equiv="Expires" content="Mon, 1 Jan 1990 00:00:00 GMT"/>
</head>
<card id="card1" title="社区经验">

Server.ScriptTimeout=999
wap=request.querystring("wap")
iduse=Session("useid")
lasttlls="133"
lasttls
      c=left(objgbrs("usephone"),7)
      set objgbrs=nothing
           sql="select * from usereg where CStr(id)='" & (id) & "'"
        Application.Lock
        conn.Execute(ssql)
        Application.Unlock
       set objgbrs=Server.CreateObject("ADODB.Recordset")
       ssql="select * from usereg where CStr(id)='" & id & "'"
       objgbrs.open ssql,conn
   end if


response.write "<br/>" & "魅力： "& objgbrs("ml")
response.write "<br/>" & "体力： "& objgbrs("tili")
Response.write "<br/>经验：" & objgbrs("entcont")+objgbrs("ticont")*5

if objgbrs("entcont")+objgbrs("ticont")*5-1800>0 then 
Response.write "点<br/>级别：<img src='/bbs/logo/s3.gif' alt='无限'/>" 
Response.write "<br/>升级还差" & 1900-objgbrs("entcont")-objgbrs("ticont")*5

else if objgbrs("entcont")+objgbrs("ticont")*5-1600>0 then 
Response.write "点<br/>级别：<img src='/bbs/logo/s3.gif' alt='无限'/>"
Response.write "<br/>升级还差" & 1700-objgbrs("entcont")-objgbrs("ticont")*5

else if objgbrs("entcont")+objgbrs("ticont")*5-1500>0 then 
Response.write "点<br/>级别：<img src='/bbs/logo/s3.gif' alt='无限'/>"
Response.write "<br/>升级还差" & 1600-objgbrs("entcont")-objgbrs("ticont")*5

else if objgbrs("entcont")+objgbrs("ticont")*5-1400>0 then 
Response.write "点<br/>级别：<img src='/bbs/logo/s2.gif' alt='☆☆☆☆'/><img src='/bbs/logo/s2.gif' alt='☆☆☆☆'/><img src='/bbs/logo/s2.gif' alt='☆☆☆☆'/><img src='/bbs/logo/s2.gif' alt='☆☆☆☆'/><img src='/bbs/logo/s2.gif' alt='☆☆☆☆'/><img src='/bbs/logo/s2.gif' alt='☆☆☆☆'/>" 
Response.write "<br/>升级还差" & 1500-objgbrs("entcont")-objgbrs("ticont")*5

else if objgbrs("entcont")+objgbrs("ticont")*5-1300>0 then 
Response.write "点<br/>级别：<img src='/bbs/logo/s2.gif' alt='☆☆☆☆'/><img src='/bbs/logo/s2.gif' alt='☆☆☆☆'/><img src='/bbs/logo/s2.gif' alt='☆☆☆☆'/><img src='/bbs/logo/s1.gif' alt='☆'/><img src='/bbs/logo/s1.gif' alt='☆'/>" 
Response.write "<br/>升级还差" & 1400-objgbrs("entcont")-objgbrs("ticont")*5

else if objgbrs("entcont")+objgbrs("ticont")*5-1200>0 then 
Response.write "点<br/>级别：<img src='/bbs/logo/s2.gif' alt='☆☆☆☆'/><img src='/bbs/logo/s2.gif' alt='☆☆☆☆'/><img src='/bbs/logo/s2.gif' alt='☆☆☆☆'/><img src='/bbs/logo/s1.gif' alt='☆'/>" 
Response.write "<br/>升级还差" & 1300-objgbrs("entcont")-objgbrs("ticont")*5

else if objgbrs("entcont")+objgbrs("ticont")*5-1100>0 then 
Response.write "点<br/>级别：<img src='/bbs/logo/s2.gif' alt='☆☆☆☆'/><img src='/bbs/logo/s2.gif' alt='☆☆☆☆'/><img src='/bbs/logo/s2.gif' alt='☆☆☆☆'/>" 
Response.write "<br/>升级还差" & 1200-objgbrs("entcont")-objgbrs("ticont")*5


else if objgbrs("entcont")+objgbrs("ticont")*5-1000>0 then 
Response.write "点<br/>级别：<img src='/bbs/logo/s2.gif' alt='☆☆☆☆'/><img src='/bbs/logo/s2.gif' alt='☆☆☆☆'/><img src='/bbs/logo/s1.gif' alt='☆'/><img src='/bbs/logo/s1.gif' alt='☆'/><img src='/bbs/logo/s1.gif' alt='☆'/>" 
Response.write "<br/>升级还差" & 1100-objgbrs("entcont")-objgbrs("ticont")*5

else if objgbrs("entcont")+objgbrs("ticont")*5-900>0 then 
Response.write "点<br/>级别：<img src='/bbs/logo/s2.gif' alt='☆☆☆☆'/><img src='/bbs/logo/s2.gif' alt='☆☆☆☆'/><img src='/bbs/logo/s1.gif' alt='☆'/><img src='/bbs/logo/s1.gif' alt='☆'/>" 
Response.write "<br/>升级还差" & 1000-objgbrs("entcont")-objgbrs("ticont")*5

else if objgbrs("entcont")+objgbrs("ticont")*5-800>0 then 
Response.write "点<br/>级别：<img src='/bbs/logo/s2.gif' alt='☆☆☆☆'/><img src='/bbs/logo/s2.gif' alt='☆☆☆☆'/><img src='/bbs/logo/s1.gif' alt='☆'/>" 
Response.write "<br/>升级还差" & 900-objgbrs("entcont")-objgbrs("ticont")*5

else if objgbrs("entcont")+objgbrs("ticont")*5-700>0 then 
Response.write "点<br/>级别：<img src='/bbs/logo/s2.gif' alt='☆☆☆☆'/><img src='/bbs/logo/s2.gif' alt='☆☆☆☆'/>" 
Response.write "<br/>升级还差" & 800-objgbrs("entcont")-objgbrs("ticont")*5

else if objgbrs("entcont")+objgbrs("ticont")*5-600>0 then 
Response.write "点<br/>级别：<img src='/bbs/logo/s2.gif' alt='☆☆☆☆'/><img src='/bbs/logo/s1.gif' alt='☆'/><img src='/bbs/logo/s1.gif' alt='☆'/><img src='/bbs/logo/s1.gif' alt='☆'/>" 
Response.write "<br/>升职还差" & 700-objgbrs("entcont")-objgbrs("ticont")*5

else if objgbrs("entcont")+objgbrs("ticont")*5-500>0 then 
Response.write "点<br/>级别：<img src='/bbs/logo/s2.gif' alt='☆☆☆☆'/><img src='/bbs/logo/s1.gif' alt='☆'/><img src='/bbs/logo/s1.gif' alt='☆'/>" 
Response.write "<br/>升级还差" & 600-objgbrs("entcont")-objgbrs("ticont")*5

else if objgbrs("entcont")+objgbrs("ticont")*5-400>0 then 
Response.write "点<br/>级别：<img src='/bbs/logo/s2.gif' alt='☆☆☆☆'/><img src='/bbs/logo/s1.gif' alt='☆'/>" 
Response.write "<br/>升级还差" & 500-objgbrs("entcont")-objgbrs("ticont")*5

else if objgbrs("entcont")+objgbrs("ticont")*5-300>0 then 
Response.write "点<br/>级别：<img src='/bbs/logo/s2.gif' alt='☆☆☆☆'/>" 
Response.write "<br/>升职还差" & 400-objgbrs("entcont")-objgbrs("ticont")*5

else if objgbrs("entcont")+objgbrs("ticont")*5-200>0 then 
Response.write "点<br/>级别：<img src='/bbs/logo/s1.gif' alt='☆'/><img src='/bbs/logo/s1.gif' alt='☆'/><img src='/bbs/logo/s1.gif' alt='☆'/>" 
Response.write "<br/>升级还差" & 300-objgbrs("entcont")-objgbrs("ticont")*5

else if objgbrs("entcont")+objgbrs("ticont")*5-100>0 then 
Response.write "点<br/>级别：<img src='/bbs/logo/s1.gif' alt='☆'/><img src='/bbs/logo/s1.gif' alt='☆'/>" 
Response.write "<br/>升级还差" & 200-objgbrs("entcont")-objgbrs("ticont")*5

else 
Response.write "点<br/>级别：<img src='/bbs/logo/s1.gif' alt='☆'/>" 
Response.write "<br/>升级还差" & 100-objgbrs("entcont")-objgbrs("ticont")*5

END if
END if
END if
END if
END if
END if
END if
END if
END if
END if
END if
END if
END if
END if
END if
END if
END if
Response.write "<br/><a href='/bbs/xcbgs/tdzt.asp?id=" & objgbrs("id") & "&amp;wap=" & wap & "'>发帖数量</a>:" & objgbrs("ticont")



Response.write "<br/>--------------"

Response.write "<br/><br/><a href='/bbs/ztlb.asp?wap=" & wap & "'>回社区论坛</a>"
Response.write "<br/><a href='/bbs/index.asp?wap=" & wap & "'>返回社区首页</a></p></card></wml>"
objgbrs.close
Set objgbrs= Nothing
conn.close
set conn=nothing

%>