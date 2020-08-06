<%

On Error Resume Next
Server.ScriptTimeOut=9999999

dim yourip,sss,ips
yourip=Request.ServerVariables("HTTP_X_UP_CALLING_LINE_ID")
if yourip="" then yourip=Request.ServerVariables("HTTP_X_FORWARDED_FOR") 
if yourip="" then yourip=Request.ServerVariables("REMOTE_ADDR")
sss=30			'防刷时间,单位秒(S)
ips=500			'缓存独立IP个数

Dim cache_ip,one_ip,all_s,k_ip,i_ip,ip_time,del_time
cache_ip=Application("cache_ip")
if cache_ip="" then cache_ip="|"
one_ip=split(cache_ip,"|")
all_s=ubound(one_ip)
	for k_ip=0 to all_s
		if yourip=one_ip(k_ip) then
		i_ip=k_ip:ip_time=one_ip(k_ip+1):Exit for
		else
		i_ip=0:ip_time="2000-10-10 10:10:10"
		end if
	next
del_time=DATEDIFF("s",ip_time,now())

if i_ip<all_s and sss>del_time then	'缓存有用户IP时且点击太快时转到/bbs/fh.asp页面
	response.redirect "/bbs/fh.asp?SessionID="&SessionID&""
	response.end
end if

if all_s>ips*2 Then
Application.Lock
Application("cache_ip")="|"
Application.UnLock
else
dim temp_s
	if i_ip=0 then		'缓存无用户IP时
	temp_s=cache_ip&yourip&"|"&now()&"|"
	else			'有,超时后更新时间
	dim num_1,num_2,num_3,num_4,text_1,text_2,text_3,text_4
	text_1="|"&yourip&"|"&ip_time&"|"
	num_1=len(cache_ip)
	num_2=len(text_1)
	num_3=instr(cache_ip,text_1)
	num_4=num_1-num_2-num_3+1
	text_2=left(cache_ip,num_3)
	text_3=right(cache_ip,num_4)
	text_4=yourip&"|"&now()&"|"
	temp_s=text_2&text_4&text_3
	end if
Application.Lock
Application("cache_ip")=temp_s
Application.UnLock
end if
%>