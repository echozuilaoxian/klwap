
<%
dim sid
sid=request.querystring("sid")
On Error Resume Next
Server.ScriptTimeOut=9999999
Function getHTTPPage(Path)
t = GETBody(Path)
        
End function
'上面的常用函数'首先.进行小偷程序的一些初始化设置.以上代码的作用分别是忽略掉所有非致命性错误.把小偷程序的运行超时时间设置得很长.这样不会出现运行超时的错误.

'---------------------------------盗窃开始设置---------------------------------------------

'1、下面是经典的小偷核发心源码.输入url目标网页地址.返回值getHTTPPage是目标网页的代码 
function getHTTPPage(url) 
dim Http 
set Http=server.createobject("Microsoft.XMLHTTP") 
Http.open "GET",url,false 
Http.send() 
if Http.readystate<>4 then 
exit function 
end if 
getHTTPPage=bytesToBSTR(Http.responseBody,"utf-8") '注意WAP网页用utf-8,WEB用gb2312
set http=nothing 
if err.number<>0 then err.Clear 
end function 

'------------------------------------------------------------------------------------------

'2、转换乱玛.直接用xmlhttp调用有中文字符的网页得到的将是乱玛.可以通过adodb.stream组件进行转换 
Function BytesToBstr(body,Cset) 
dim objstream 
set objstream = Server.CreateObject("adodb.stream") 
objstream.Type = 1 
objstream.Mode =3 
objstream.Open 
objstream.Write body 
objstream.Position = 0 
objstream.Type = 2 
objstream.Charset = Cset 
BytesToBstr = objstream.ReadText 
objstream.Close 
set objstream = nothing 
End Function 
%>
