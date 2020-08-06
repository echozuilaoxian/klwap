<% Response.ContentType="text/vnd.wap.wml" %><?xml version="1.0" encoding="utf-8"?><!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<!--#INCLUDE VIRTUAL="/bbs/reg/useregs.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/public/codeun.asp"-->
<wml>
<head>
<meta http-equiv="Cache-Control" content="max-age=0"/>
<meta http-equiv="Cache-Control" content="no-cache"/>
<meta http-equiv="Expires" content="Mon, 1 Jan 1990 00:00:00 GMT"/>
</head>
<card id="card1" title="转帐结果"><p>
<%
SessionID=request.querystring("SessionID")
if SessionID="" then SessionID=Session("SessionID")
Server.ScriptTimeout=999
iduse=Session("useid")
dim id,gfjd,ltlyuan
gfjf=trim(request("gfjf"))
id=request("id")

    Set objgbrx=Server.CreateObject("ADODB.Recordset")
    sqlx="select * from usereg where CStr(id)='" & id & "'"
    objgbrx.open sqlx,conn

if objgbrx.eof then
%>
对不起，操作无法完成，原因：城里找不到这个人啊<br/>------------<br/>

<a href='bank.asp?SessionID=<%=SessionID%>'>返回社区银行</a>
<br/><a href='/bbs/index.asp?SessionID=<%=SessionID%>'>返回社区首页</a>
</p></card></wml>
<%

response.end
end if
 if Len(objgbrx("banktime"))>5 then
'
       else
%>
对不起，操作无法完成，原因：对方还没在银行开户呢,怎么汇出去啊?<br/>------------<br/>
<a href='bank.asp?SessionID=<%=SessionID%>'>返回社区银行</a>
<br/><a href='/bbs/index.asp?SessionID=<%=SessionID%>'>返回社区首页</a>
</p></card></wml>
<%

response.end
end if

    Set objgbrs=Server.CreateObject("ADODB.Recordset")
    sql="select * from usereg where CStr(id)='" & iduse & "'"
    objgbrs.open sql,conn

 if gfjf<>"" and id<>"" then
     gfjf=Clng(gfjf)
     if gfjf<200 then
           gfjfs=1
         else
           gfjfs=int(gfjf*0.005)
     end if
     if gfjf+gfjfs<0 or gfjf+gfjfs>objgbrs("bank") then
            msg="您银行帐户余额不足扣除转帐手续费<br/>转帐手续费为你转帐金额的0.5%。"
       else
            sql="update usereg set bank=bank-" & (gfjf+gfjfs) & " Where CStr(id)='" & iduse & "'"
            Application.Lock
            conn.execute(sql)
            sql="update usereg set bank=bank+" & gfjf & " Where CStr(id)='" & id & "'"
            conn.execute(sql)
            dim talk
talk="" & Session("ltname") & "在(url=/bbs/public/zzjl.asp)社区银行(/url)转帐"& gfjf &"金币"
sql="insert into sjzk(ids,dong,lasttlls,bu)values('"&iduse&"','"&talk&"','525','0')"
  Application.Lock
  conn.execute sql
  Application.Unlock
            msg="转帐成功,扣除手续费" & gfjfs & "元,并发送过户通知书。"
            ltlyuan="会员:" & objgbrs("usename") & "ID:" & objgbrs("id") & "向你的银行账户汇入" & gfjf & "金币,这是系统信息,请勿回复以及转发!"
            gftz()
            naiyo=Cstr(gfjf)
            sql="insert into jfpost1(ids,reids,naiyo) values ("
            sql=sql & sqlstr(Session("useid")) & ","
            sql=sql & sqlstr(id) & ","
            sql=sql & sqlstr(naiyo) & ")"
            Application.Lock
            conn.execute(sql)
            Application.Unlock
      end if
    else
            msg="转帐金额或ID不能为空！"
 end if
 response.write msg
%>
<br/>-------------
<br/><a href='bank.asp?SessionID=<%=SessionID%>'>返回社区银行</a>
<br/><a href='/bbs/index.asp?SessionID=<%=SessionID%>'>返回社区首页</a>
</p></card>
<%
Set objgbrs= Nothing
conn.close
set conn=nothing
%>
</wml>