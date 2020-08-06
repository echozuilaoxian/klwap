<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<% 
'============================================================
' 更新: 2007-12-10
' 主页: http://wap.twapp.cn
' 电邮: xivn@163.com
' Q Q : QQ:531233814
' 版权: 燃点真情All Rights Reserved.
'============================================================ 
%>
<%Response.ContentType = "text/vnd.wap.wml; charset=utf-8"%><?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.2//EN" "http://www.wapforum.org/DTD/wml12.dtd">
<wml>
<!--#include file="conn.asp"-->
<!--#include file="admin.asp"-->
<head>
<meta http-equiv="Cache-Control" content="must-revalidate" forua="true"/>
<meta http-equiv="Cache-Control" content="no-cache" forua="true"/>
<meta http-equiv="Cache-Control" content="max-age=0" forua="true"/>
<meta http-equiv="Expires" content="0" forua="true"/>
<meta http-equiv="Pragma" content="no-cache" forua="true"/>
</head>
<%If Request("SubmitFlag") <> "" Then
	title=Request.Form("title")
	copyright=Request.Form("copyright")
	zcsz=Request.Form("zcsz")
	zcyy=Request.Form("zcyy")
	logo=Request.Form("logo")
        op=Request.Form("op")
        wap20=Request.Form("wap20")
	classID=Request.Form("classID")
        links=Request.Form("links")
        linknum=clng(Request.Form("linknum"))
         zxwz=Request.Form("zxwz")      
         zrwz=Request.Form("zrwz")      
         sjwz=Request.Form("sjwz") 
         zxwj=Request.Form("zxwj")  
         zrwj=Request.Form("zrwj")   

 
         sjwj=Request.Form("sjwj")  
         zxtz=Request.Form("zxtz")  
         zrtz=Request.Form("zrtz")    
         sjtz=Request.Form("sjtz")  
         wznum=Request.Form("wznum")   
         wjnum=Request.Form("wjnum")  
         wjop=Request.Form("wjop") 

         biaoshi=Request.Form("biaoshi")  
         biaotime=Request.Form("biaotime")   
         zuobi=Request.Form("zuobi")   
         zuoshu=Request.Form("zuoshu")   
         yelian=Request.Form("yelian")   
         yeshu=Request.Form("yeshu")              
        if title="" or logo=""  then 
Response.Write "<card id='card2' title='设置出错' ontimer='Config.asp?sid="&sid&"'><timer value='5'/><p>"
        Response.Write "网站名称和LOGO地址不能为空!<br/>"
        Response.Write "<a href=""config.asp?sid="&sid&""">[基本设置]</a><br/>"
        Response.Write "<a href=""index.asp?sid="&sid&""">[后台管理]</a>"		
 Response.Write "</p></card></wml>"
 response.end

        else
				set rs2=server.CreateObject("adodb.recordset")
				sql2="select * from admin"
				rs2.open sql2,conn,1,3
				if not (rs2.bof and rs2.eof) then
					rs2("title")=title
					rs2("copyright")=copyright
					rs2("zcsz")=zcsz
					rs2("zcyy")=zcyy
					rs2("const")=classID
					rs2("logo")=logo
                                        rs2("op")=op
                                        rs2("wap20")=wap20
                                        rs2("biaoshi")=biaoshi
                                        rs2("biaotime")=biaotime
                                        rs2("zuobi")=zuobi
                                        rs2("zuoshu")=zuoshu
                                        rs2("yelian")=yelian

                                        rs2("yeshu")=yeshu
                                        rs2("links")=links
                                        rs2("linknum")=linknum
                                        
				rs2.update()
                        rs2.close
                        set rs2=nothing
                        end if			
                        end if	
                               set rs3=server.CreateObject("adodb.recordset")
				sql3="select * from twapp"
				rs3.open sql3,conn,1,3
				if not (rs3.bof and rs3.eof) then
                                  rs3("zxwz")=zxwz
                                  rs3("zrwz")=zrwz
                                  rs3("sjwz")=sjwz
                                  rs3("zxwj")=zxwj
                                  rs3("zrwj")=zrwj
                                  rs3("sjwj")=sjwj
                                  rs3("zxtz")=zxtz
                                  rs3("zrtz")=zrtz
                                  rs3("sjtz")=sjtz
                                  rs3("wznum")=wznum
                                  rs3("wjnum")=wjnum
                                  rs3("wjop")=wjop

                                  rs3.update()
                        end if
                        rs3.close
                        set rs3=nothing
                             Response.Write "<card id='card2' title='正在返回' ontimer='index.asp?sid="&sid&"'><timer value='5'/><p>"
			Response.Write "成功设置！正在返回..."

else%>
<card id="index" title="网站设置">
<p align="left"><img src="/IMG/2.gif" alt='基本设置'/><br/>
<% set rs=server.CreateObject("adodb.recordset")
				sql="select * from admin"
				rs.open sql,conn,1,1 
set rs1=server.CreateObject("adodb.recordset")
				sql1="select * from twapp"
				rs1.open sql1,conn,1,1 %>
站点名称:<br/><input name="title<%=minute(now)%><%=second(now)%>" type="text" value="<%=ubb1(rs("title"))%>"/><br/>
		站点LOGO:<br/><input name="logo<%=minute(now)%><%=second(now)%>" type="text" value="<%=ubb1(rs("logo"))%>"/><br/>
		版权信息:(可留空)<br/><input name="Copyright<%=minute(now)%><%=second(now)%>" type="text" value="<%=ubb1(rs("copyright"))%>"/><br/>
                        



                        首页排版:
			<select name="classID<%=minute(now)%><%=second(now)%>" value="left">
			<option value="left">居左</option>
			<option value="center">居中</option>
			<option value="right" >居右</option>
			</select><br/>
                        首页禁模拟器:
			<select name="op<%=minute(now)%><%=second(now)%>" value="<%=rs("op")%>">
			<option value="1">禁止</option>
			<option value="2">开放</option>
			</select><br/>

                       
                        模拟器下载:
			<select name="wjop<%=minute(now)%><%=second(now)%>" value="<%=rs1("wjop")%>">
			<option value="2">开放</option>
			<option value="1">禁止</option>
			</select><br/>
                        首页动态友链设置:<br/>
			<select name="links<%=minute(now)%><%=second(now)%>" value="<%=rs("links")%>">
			<option value="1">显示友链</option>
			<option value="2">关闭显示</option>
			</select><input name="linknum<%=minute(now)%><%=second(now)%>" type="text" value="<%=rs("linknum")%>"  size="2"/>个数<br/>


                         次页页面友链设置:<br/>
			<select name="yelian<%=minute(now)%><%=second(now)%>" value="<%=rs("yelian")%>">
			<option value="1">显示页链</option>
			<option value="0">关闭显示</option>
			</select><input name="yeshu<%=minute(now)%><%=second(now)%>" type="text" value="<%=rs("yeshu")%>"  size="2"/>个数<br/>

                         页面友链作弊设置:<br/>
			<select name="zuobi<%=minute(now)%><%=second(now)%>" value="<%=rs("zuobi")%>">
			<option value="1">开启作弊</option>
			<option value="0">关闭作弊</option>
			</select><input name="zuoshu<%=minute(now)%><%=second(now)%>" type="text" value="<%=rs("zuoshu")%>"  size="2"/>个数<br/>


缩略组图设置<br/>
图片高度<input name="zxwz<%=minute(now)%><%=second(now)%>" type="text" value="<%=rs1("zxwz")%>"  size="2"/><br/>
图片宽度<input name="zrwz<%=minute(now)%><%=second(now)%>" type="text" value="<%=rs1("zrwz")%>"  size="2"/><br/>
随机文章显示<input name="sjwz<%=minute(now)%><%=second(now)%>" type="text" value="<%=rs1("sjwz")%>"  size="2"/>条<br/>
最新文件显示<input name="zxwj<%=minute(now)%><%=second(now)%>" type="text" value="<%=rs1("zxwj")%>"  size="2"/>条<br/>
最热文件显示<input name="zrwj<%=minute(now)%><%=second(now)%>" type="text" value="<%=rs1("zrwj")%>"  size="2"/>条<br/>
随机文件显示<input name="sjwj<%=minute(now)%><%=second(now)%>" type="text" value="<%=rs1("sjwj")%>"  size="2"/>条<br/>


文章每页字数<input name="wznum<%=minute(now)%><%=second(now)%>" type="text" value="<%=rs1("wznum")%>"  size="2"/>字<br/>
文件每页字数<input name="wjnum<%=minute(now)%><%=second(now)%>" type="text" value="<%=rs1("wjnum")%>"  size="2"/>字<br/>
			<anchor>保存修改
			<go href="config.asp?SubmitFlag=true&amp;sid=<%=sid%>" method="post">
			<postfield name="logo" value="$(logo<%=minute(now)%><%=second(now)%>)"/>
			<postfield name="classID" value="$(classID<%=minute(now)%><%=second(now)%>)"/>
		     <postfield name="Copyright" value="$(Copyright<%=minute(now)%><%=second(now)%>)"/>
		     <postfield name="op"
value="$(op<%=minute(now)%><%=second(now)%>)"/>
			<postfield name="title" value="$(title<%=minute(now)%><%=second(now)%>)"/>
                         <postfield name="links" value="$(links<%=minute(now)%><%=second(now)%>)" /> 
                         <postfield name="linknum" value="$(linknum<%=minute(now)%><%=second(now)%>)"/>

                        <postfield name="yelian" value="$(yelian<%=minute(now)%><%=second(now)%>)"/>
                        <postfield name="yeshu" value="$(yeshu<%=minute(now)%><%=second(now)%>)"/>

                        <postfield name="zuobi" value="$(zuobi<%=minute(now)%><%=second(now)%>)"/>
                        <postfield name="zuoshu" value="$(zuoshu<%=minute(now)%><%=second(now)%>)"/>

                        






                         <postfield name="zxwz" value="$(zxwz<%=minute(now)%><%=second(now)%>)"/>
                         <postfield name="zrwz" value="$(zrwz<%=minute(now)%><%=second(now)%>)"/>
                         <postfield name="sjwz" value="$(sjwz<%=minute(now)%><%=second(now)%>)"/>
                         <postfield name="zxwj" value="$(zxwj<%=minute(now)%><%=second(now)%>)"/> 
                         <postfield name="zrwj" value="$(zrwj<%=minute(now)%><%=second(now)%>)"/>
                         <postfield name="sjwj" value="$(sjwj<%=minute(now)%><%=second(now)%>)"/>
                         

                         <postfield name="wznum" value="$(wznum<%=minute(now)%><%=second(now)%>)"/>
                         <postfield name="wjnum" value="$(wjnum<%=minute(now)%><%=second(now)%>)"/>
                         <postfield name="wjop" value="$(wjop<%=minute(now)%><%=second(now)%>)"/>
			</go>
			</anchor>
<%end if%>
		
<br/>----------<br/>
<a href="class.asp?sid=<%=sid%>">[设计中心]</a><br/>
<a href="index.asp?sid=<%=sid%>">[后台管理]</a>		
</p>
</card>
</wml>