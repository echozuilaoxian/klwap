<% Response.ContentType="text/vnd.wap.wml" %><?xml version="1.0" encoding="utf-8"?><!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<!--#INCLUDE VIRTUAL="/bbs/conn.asp"-->
<wml>
<head>
<meta http-equiv="Cache-Control" content="max-age=0"/>
<meta http-equiv="Cache-Control" content="no-cache"/>
<meta http-equiv="Expires" content="Mon, 1 Jan 1990 00:00:00 GMT"/>
</head>
<card id="card1" title="宠物餐厅"><p>
<% 
dim lx,sl,msg
Server.ScriptTimeout=999
SessionID=request.querystring("SessionID")
if SessionID="" then SessionID=Session("SessionID")

if Session("zh")="wap" then
       Session("returnuppath")=Request.ServerVariables("PATH_INFO") & "?pid=pid"
        response.redirect "/BBS/UseLogin.asp?SessionID="&SessionID&""
    End if
lx=request.form("lx")
sl=request.form("sl")
bb=request.form("usejf")
Jname=Session("useid")
 Set objgbrs=Server.CreateObject("ADODB.Recordset")
    sql="select * from usereg where CStr(id)='" & Session("useid") & "'"
    objgbrs.open sql,conn
	select case lx
	     case "rou"	                        
            if objgbrs("usejf")< sl*20 then response.redirect"/bbs/chan/signal.asp"
                sql="update usereg set usejf=usejf-"& sl*20 &",cwsm=cwsm+"& sl*1 &"  where CStr(id)='" & Jname & "'" 
			conn.execute sql
			msg="您的宠物吃了"& sl &"个鸡蛋,生命增加了"& sl*1 &"<br/>宠物说:谢谢主人!"          
            case "gt"
            if objgbrs("usejf")< sl*30 then response.redirect"/bbs/chan/signal.asp"  
           	      sql="update usereg set usejf=usejf-"& sl*30 &",cwsm=cwsm+"& sl*2 &",cwrq=cwrq+"& sl*1 &"  where CStr(id)='" & Jname & "'"
			conn.execute sql
			msg="您的宠物吃了"& sl &"根排骨,生命增加了"& sl*2 &",热情增加了"& sl*1 &"<br/>宠物说:主人真好!"
		case "xnj"
            	 if objgbrs("usejf")< sl*35 then response.redirect"/bbs/chan/signal.asp"   
                      sql="update usereg set usejf=usejf-"& sl*35 &",cwsm=cwsm+"& sl*1 &",cwrq=cwrq+"& sl*3 &"  where CStr(id)='" & Jname & "'"
			conn.execute sql
			msg="您的宠物吃了"& sl &"条鱼,生命增加了"& sl*1 &",热情增加了"& sl*3 &"<br/>宠物说:主人,我爱四你拉."
		case "xz"               
               if objgbrs("usejf")< sl*45 then response.redirect"/bbs/chan/signal.asp"
			sql="update usereg set usejf=usejf-"& sl*45 &",cwsm=cwsm+"& sl*2 &",cwrq=cwrq+"& sl*3 &"  where CStr(id)='" & Jname & "'"
			conn.execute sql
			msg="您的宠物吃了"& sl &"个汉堡,生命增加了"& sl*2 &",热情增加了"& sl*3 &"<br/>宠物说:主人,这是你的手艺吗?真好吃."
		case "lhr"               
                  if objgbrs("usejf")< sl*20 then response.redirect"/bbs/chan/signal.asp"
			sql="update usereg set usejf=usejf-"& sl*20 &",cwsm=cwsm+"& sl*1 &"  where CStr(id)='" & Jname & "'"
			conn.execute sql
			msg="您的宠物吃了"& sl &"碗粥,生命增加了"& sl*1 &"<br/>宠物说:这粥还真是白到底了,贵吗?"
		case "hzj"
                 if objgbrs("usejf")< sl*60 then response.redirect"/bbs/chan/signal.asp"
               		sql="update usereg set usejf=usejf-"& sl*60 &",cwsm=cwsm+"& sl*4 &",cwrq=cwrq+"& sl*3 &"  where CStr(id)='" & Jname & "'"
			conn.execute sql
			msg="您的宠物吃了"& sl &"斤牛肉,生命增加了"& sl*4 &",热情增加了"& sl*3 &"<br/>宠物说:哇,好久没有吃上牛肉拉,主人你常带我来好不好?"
		case "bhp"                
                if objgbrs("usejf")< sl*70 then response.redirect"/bbs/chan/signal.asp"
			sql="update usereg set usejf=usejf-"& sl*70 &",cwsm=cwsm+"& sl*5 &",cwrq=cwrq+"& sl*3 &"  where CStr(id)='" & Jname & "'"
			conn.execute sql
			msg="您的宠物吃了"& sl &"斤羊肉,生命增加了"& sl*5 &",热情增加了"& sl*3 &"<br/>宠物说:我最爱的羊羔肉,好久没闻闻过了,想不到现在还能吃上,5555555"
		case "hss"              
                if objgbrs("usejf")< sl*100 then response.redirect"/bbs/chan/signal.asp"
			sql="update usereg set usejf=usejf-"& sl*100 &",cwsm=cwsm+"& sl*5 &",cwrq=cwrq+"& sl*5 &"  where CStr(id)='" & Jname & "'"
			conn.execute sql
			msg="您的宠物吃了"& sl &"条龙虾,生命增加了"& sl*5 &",热情增加了"& sl*5 &"<br/>宠物说:龙龙龙虾?主人你喂我龙虾?主人你好有钱哦,真气派."    

case "gao"	                        
            if objgbrs("usejf")< sl*200 then response.redirect"/bbs/chan/signal.asp"
                sql="update usereg set usejf=usejf-"& sl*200 &",cwsm=cwsm+"& sl*10 &",cwrq=cwrq+"& sl*10 &"  where CStr(id)='" & Jname & "'" 
			conn.execute sql
			msg="您的宠物吃了"& sl &"个神仙果,生命增加了"& sl*10 &",热情增加了"& sl*10 &"<br/>宠物说:我要成仙了，呼...."         

            
		end select
response.write msg
	conn.close
	set rs=nothing
	set conn=nothing
%>
<br/>------------
<br/><a href='indexcw.asp?SessionID=<%=SessionID%>'>返回宠物餐厅</a><br/>
<a href='/BBS/chan/xiaof.asp?SessionID=<%=SessionID%>'>返回消费中心</a><br/>
<a href='/bbs/index.asp?SessionID=<%=SessionID%>'>返回社区首页</a></p></card></wml>