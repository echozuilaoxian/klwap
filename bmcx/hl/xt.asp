
<%
dim sid
sid=request.querystring("sid")
On Error Resume Next
Server.ScriptTimeOut=9999999
Function getHTTPPage(Path)
t = GETBody(Path)
        
End function
'����ĳ��ú���'����.����С͵�����һЩ��ʼ������.���ϴ�������÷ֱ��Ǻ��Ե����з������Դ���.��С͵��������г�ʱʱ�����õúܳ�.��������������г�ʱ�Ĵ���.

'---------------------------------���Կ�ʼ����---------------------------------------------

'1�������Ǿ����С͵�˷���Դ��.����urlĿ����ҳ��ַ.����ֵgetHTTPPage��Ŀ����ҳ�Ĵ��� 
function getHTTPPage(url) 
dim Http 
set Http=server.createobject("Microsoft.XMLHTTP") 
Http.open "GET",url,false 
Http.send() 
if Http.readystate<>4 then 
exit function 
end if 
getHTTPPage=bytesToBSTR(Http.responseBody,"utf-8") 'ע��WAP��ҳ��utf-8,WEB��gb2312
set http=nothing 
if err.number<>0 then err.Clear 
end function 

'------------------------------------------------------------------------------------------

'2��ת������.ֱ����xmlhttp�����������ַ�����ҳ�õ��Ľ�������.����ͨ��adodb.stream�������ת�� 
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
