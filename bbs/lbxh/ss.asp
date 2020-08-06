<% @LANGUAGE="VBSCRIPT" CODEPAGE="65001" %>
<% Response.ContentType="text/vnd.wap.wml" %><?xml version="1.0" encoding="UTF-8"?><!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<!--#INCLUDE VIRTUAL="/bbs/reg/useregs.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/reg/ltonline.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/public/codeun.asp"-->
<wml>
<head>
<meta http-equiv="Cache-Control" content="max-age=0"/>
<meta http-equiv="Cache-Control" content="no-cache"/>
</head>
<% 
Server.ScriptTimeout=999
SessionID=request.querystring("SessionID")
if SessionID="" then SessionID=Session("SessionID")
iduse=Session("useid")

jjid=CLng(Request("jjid"))
  dim objgbrs
  set objgbrs=Server.CreateObject("ADODB.Recordset")
  sql="select jj_jg,jj_times,jj_jg_y,jj_id,shengd,jj_names from jj_hk WHERE cstr(jj_id)='" & jjid & "'"
  objgbrs.open sql,conn,1,3
if objgbrs.eof then
Response.write "<card id='afund' title='社区龙宝' ontimer='afund.asp?t=" & time() & "&amp;SessionID=" & SessionID & "'><timer value='1'/><p>错误,没有该龙宝"
else
if int(datediff("s",objgbrs("jj_times"),now())/1800)>0 then
Response.write "<card id='afund' title='社区龙宝' ontimer='ss.asp?t=" & time() & "&amp;jjid=" & jjid & "&amp;SessionID=" & SessionID & "'><timer value='2'/><p>正在获取数据,还有"&int(datediff("s",objgbrs("jj_times"),now())/1800)&"毫秒...<br/><a href='ss.asp?t=" & time() & "&amp;jjid=" & jjid & "&amp;SessionID=" & SessionID & "'>我要手动刷新</a>"
dim cc,codes,ids,ii
randomize 
cc="1,2,3,4,5,6,7,8,9,0" 
ids=split(cc,",") 
for ii=1 to 2
codes=ids(int(rnd()*10))&codes 
next 
if right(codes,1)=2 or right(codes,1)=4 or right(codes,1)=6 or right(codes,1)=8 then
sql="update jj_hk set jj_times='"&(objgbrs("jj_times")+cdate("00:30:00"))&"',jj_jg_y='" & objgbrs("jj_jg") & "',jj_jg=jj_jg+0." & codes & ",shengd='升↑' where cstr(jj_id)='"&jjid&"'"
  Application.Lock
	conn.execute sql
else
if right(codes,1)=0 or right(codes,1)=9  then
sql="update jj_hk set jj_times='"&(objgbrs("jj_times")+cdate("00:30:00"))&"',jj_jg_y='" & objgbrs("jj_jg") & "',shengd='平→' where cstr(jj_id)='" & jjid & "'"
	conn.execute(sql)
else
sql="update jj_hk set jj_times='"&(objgbrs("jj_times")+cdate("00:30:00"))&"',jj_jg_y='" & objgbrs("jj_jg") & "',jj_jg=jj_jg-0." & codes & ",shengd='降↓' where cstr(jj_id)='" & jjid & "'"
	conn.execute(sql)
end if
end if
sql="insert into jj_hk_news(jj_names,jj_jg,shengd,jj_id,shengjd)values("
  sql=sql & sqlstr(objgbrs("jj_names")) & ","
  sql=sql & sqlstr(objgbrs("jj_jg")) & ","
sql=sql & sqlstr(objgbrs("shengd")) & ","
sql=sql & sqlstr(objgbrs("jj_id")) & ","
sql=sql & sqlstr((objgbrs("jj_jg")-objgbrs("jj_jg_y"))) & ")"
  conn.execute sql

end if
if int(datediff("s",objgbrs("jj_times"),now())/1800)=0 then
response.redirect "afund_buys.asp?t=" & time() & "&jjid=" & jjid & "&SessionID=" & SessionID & ""
end if
end if
objgbrs.close
	set objgbrs=nothing
conn.close
	set conn=nothing
%>

</p></card></wml>




