<% @LANGUAGE="VBSCRIPT" CODEPAGE="65001" %>
<%dim sid
sid=request.querystring("sid")
%>

<%
'============================================================
' 更新: 2007/09/10
' 主页: qq.dxssb.cn 
' Q Q : 345123198
' 版权:  All Rights Reserved.
'============================================================
Private Const BITS_TO_A_BYTE = 8
Private Const BYTES_TO_A_WORD = 4
Private Const BITS_TO_A_WORD = 32

Private m_lOnBits(30)
Private m_l2Power(30)
 
Private Function LShift(lValue, iShiftBits)
    If iShiftBits = 0 Then
        LShift = lValue
        Exit Function
    ElseIf iShiftBits = 31 Then
        If lValue And 1 Then
            LShift = &H80000000
        Else
            LShift = 0
        End If
        Exit Function
    ElseIf iShiftBits < 0 Or iShiftBits > 31 Then
        Err.Raise 6
    End If

    If (lValue And m_l2Power(31 - iShiftBits)) Then
        LShift = ((lValue And m_lOnBits(31 - (iShiftBits + 1))) * m_l2Power(iShiftBits)) Or &H80000000
    Else
        LShift = ((lValue And m_lOnBits(31 - iShiftBits)) * m_l2Power(iShiftBits))
    End If
End Function

Private Function RShift(lValue, iShiftBits)
    If iShiftBits = 0 Then
        RShift = lValue
        Exit Function
    ElseIf iShiftBits = 31 Then
        If lValue And &H80000000 Then
            RShift = 1
        Else
            RShift = 0
        End If
        Exit Function
    ElseIf iShiftBits < 0 Or iShiftBits > 31 Then
        Err.Raise 6
    End If
    
    RShift = (lValue And &H7FFFFFFE) \ m_l2Power(iShiftBits)

    If (lValue And &H80000000) Then
        RShift = (RShift Or (&H40000000 \ m_l2Power(iShiftBits - 1)))
    End If
End Function

Private Function RotateLeft(lValue, iShiftBits)
    RotateLeft = LShift(lValue, iShiftBits) Or RShift(lValue, (32 - iShiftBits))
End Function

Private Function AddUnsigned(lX, lY)
    Dim lX4
    Dim lY4
    Dim lX8
    Dim lY8
    Dim lResult
 
    lX8 = lX And &H80000000
    lY8 = lY And &H80000000
    lX4 = lX And &H40000000
    lY4 = lY And &H40000000
 
    lResult = (lX And &H3FFFFFFF) + (lY And &H3FFFFFFF)
 
    If lX4 And lY4 Then
        lResult = lResult Xor &H80000000 Xor lX8 Xor lY8
    ElseIf lX4 Or lY4 Then
        If lResult And &H40000000 Then
            lResult = lResult Xor &HC0000000 Xor lX8 Xor lY8
        Else
            lResult = lResult Xor &H40000000 Xor lX8 Xor lY8
        End If
    Else
        lResult = lResult Xor lX8 Xor lY8
    End If
 
    AddUnsigned = lResult
End Function

Private Function md5_F(x, y, z)
    md5_F = (x And y) Or ((Not x) And z)
End Function

Private Function md5_G(x, y, z)
    md5_G = (x And z) Or (y And (Not z))
End Function

Private Function md5_H(x, y, z)
    md5_H = (x Xor y Xor z)
End Function

Private Function md5_I(x, y, z)
    md5_I = (y Xor (x Or (Not z)))
End Function

Private Sub md5_FF(a, b, c, d, x, s, ac)
    a = AddUnsigned(a, AddUnsigned(AddUnsigned(md5_F(b, c, d), x), ac))
    a = RotateLeft(a, s)
    a = AddUnsigned(a, b)
End Sub

Private Sub md5_GG(a, b, c, d, x, s, ac)
    a = AddUnsigned(a, AddUnsigned(AddUnsigned(md5_G(b, c, d), x), ac))
    a = RotateLeft(a, s)
    a = AddUnsigned(a, b)
End Sub

Private Sub md5_HH(a, b, c, d, x, s, ac)
    a = AddUnsigned(a, AddUnsigned(AddUnsigned(md5_H(b, c, d), x), ac))
    a = RotateLeft(a, s)
    a = AddUnsigned(a, b)
End Sub

Private Sub md5_II(a, b, c, d, x, s, ac)
    a = AddUnsigned(a, AddUnsigned(AddUnsigned(md5_I(b, c, d), x), ac))
    a = RotateLeft(a, s)
    a = AddUnsigned(a, b)
End Sub

Private Function ConvertToWordArray(sMessage)
    Dim lMessageLength
    Dim lNumberOfWords
    Dim lWordArray()
    Dim lBytePosition
    Dim lByteCount
    Dim lWordCount
    
    Const MODULUS_BITS = 512
    Const CONGRUENT_BITS = 448
    
    lMessageLength = Len(sMessage)
    
    lNumberOfWords = (((lMessageLength + ((MODULUS_BITS - CONGRUENT_BITS) \ BITS_TO_A_BYTE)) \ (MODULUS_BITS \ BITS_TO_A_BYTE)) + 1) * (MODULUS_BITS \ BITS_TO_A_WORD)
    ReDim lWordArray(lNumberOfWords - 1)
    
    lBytePosition = 0
    lByteCount = 0
    Do Until lByteCount >= lMessageLength
        lWordCount = lByteCount \ BYTES_TO_A_WORD
        lBytePosition = (lByteCount Mod BYTES_TO_A_WORD) * BITS_TO_A_BYTE
        lWordArray(lWordCount) = lWordArray(lWordCount) Or LShift(Asc(Mid(sMessage, lByteCount + 1, 1)), lBytePosition)
        lByteCount = lByteCount + 1
    Loop

    lWordCount = lByteCount \ BYTES_TO_A_WORD
    lBytePosition = (lByteCount Mod BYTES_TO_A_WORD) * BITS_TO_A_BYTE

    lWordArray(lWordCount) = lWordArray(lWordCount) Or LShift(&H80, lBytePosition)

    lWordArray(lNumberOfWords - 2) = LShift(lMessageLength, 3)
    lWordArray(lNumberOfWords - 1) = RShift(lMessageLength, 29)
    
    ConvertToWordArray = lWordArray
End Function

Private Function WordToHex(lValue)
    Dim lByte
    Dim lCount
    
    For lCount = 0 To 3
        lByte = RShift(lValue, lCount * BITS_TO_A_BYTE) And m_lOnBits(BITS_TO_A_BYTE - 1)
        WordToHex = WordToHex & Right("0" & Hex(lByte), 2)
    Next
End Function

Public Function UHMD(sMessage)
    m_lOnBits(0) = CLng(1)
    m_lOnBits(1) = CLng(3)
    m_lOnBits(2) = CLng(7)
    m_lOnBits(3) = CLng(15)
    m_lOnBits(4) = CLng(31)
    m_lOnBits(5) = CLng(63)
    m_lOnBits(6) = CLng(127)
    m_lOnBits(7) = CLng(255)
    m_lOnBits(8) = CLng(511)
    m_lOnBits(9) = CLng(1023)
    m_lOnBits(10) = CLng(2047)
    m_lOnBits(11) = CLng(4095)
    m_lOnBits(12) = CLng(8191)
    m_lOnBits(13) = CLng(16383)
    m_lOnBits(14) = CLng(32767)
    m_lOnBits(15) = CLng(65535)
    m_lOnBits(16) = CLng(131071)
    m_lOnBits(17) = CLng(262143)
    m_lOnBits(18) = CLng(524287)
    m_lOnBits(19) = CLng(1048575)
    m_lOnBits(20) = CLng(2097151)
    m_lOnBits(21) = CLng(4194303)
    m_lOnBits(22) = CLng(8388607)
    m_lOnBits(23) = CLng(16777215)
    m_lOnBits(24) = CLng(33554431)
    m_lOnBits(25) = CLng(67108863)
    m_lOnBits(26) = CLng(134217727)
    m_lOnBits(27) = CLng(268435455)
    m_lOnBits(28) = CLng(536870911)
    m_lOnBits(29) = CLng(1073741823)
    m_lOnBits(30) = CLng(2147483647)
    
    m_l2Power(0) = CLng(1)
    m_l2Power(1) = CLng(2)
    m_l2Power(2) = CLng(4)
    m_l2Power(3) = CLng(8)
    m_l2Power(4) = CLng(16)
    m_l2Power(5) = CLng(32)
    m_l2Power(6) = CLng(64)
    m_l2Power(7) = CLng(128)
    m_l2Power(8) = CLng(256)
    m_l2Power(9) = CLng(512)
    m_l2Power(10) = CLng(1024)
    m_l2Power(11) = CLng(2048)
    m_l2Power(12) = CLng(4096)
    m_l2Power(13) = CLng(8192)
    m_l2Power(14) = CLng(16384)
    m_l2Power(15) = CLng(32768)
    m_l2Power(16) = CLng(65536)
    m_l2Power(17) = CLng(131072)
    m_l2Power(18) = CLng(262144)
    m_l2Power(19) = CLng(524288)
    m_l2Power(20) = CLng(1048576)
    m_l2Power(21) = CLng(2097152)
    m_l2Power(22) = CLng(4194304)
    m_l2Power(23) = CLng(8388608)
    m_l2Power(24) = CLng(16777216)
    m_l2Power(25) = CLng(33554432)
    m_l2Power(26) = CLng(67108864)
    m_l2Power(27) = CLng(134217728)
    m_l2Power(28) = CLng(268435456)
    m_l2Power(29) = CLng(536870912)
    m_l2Power(30) = CLng(1073741824)


    Dim x
    Dim k
    Dim AA
    Dim BB
    Dim CC
    Dim DD
    Dim a
    Dim b
    Dim c
    Dim d
    
    Const S11 = 7
    Const S12 = 12
    Const S13 = 17
    Const S14 = 22
    Const S21 = 5
    Const S22 = 9
    Const S23 = 14
    Const S24 = 20
    Const S31 = 4
    Const S32 = 11
    Const S33 = 16
    Const S34 = 23
    Const S41 = 6
    Const S42 = 10
    Const S43 = 15
    Const S44 = 21

    x = ConvertToWordArray(sMessage)
    
    a = &H67452301
    b = &HEFCDAB89
    c = &H98BADCFE
    d = &H10325476

    For k = 0 To UBound(x) Step 16
        AA = a
        BB = b
        CC = c
        DD = d
    
        md5_FF a, b, c, d, x(k + 0), S11, &HD76AA478
        md5_FF d, a, b, c, x(k + 1), S12, &HE8C7B756
        md5_FF c, d, a, b, x(k + 2), S13, &H242070DB
        md5_FF b, c, d, a, x(k + 3), S14, &HC1BDCEEE
        md5_FF a, b, c, d, x(k + 4), S11, &HF57C0FAF
        md5_FF d, a, b, c, x(k + 5), S12, &H4787C62A
        md5_FF c, d, a, b, x(k + 6), S13, &HA8304613
        md5_FF b, c, d, a, x(k + 7), S14, &HFD469501
        md5_FF a, b, c, d, x(k + 8), S11, &H698098D8
        md5_FF d, a, b, c, x(k + 9), S12, &H8B44F7AF
        md5_FF c, d, a, b, x(k + 10), S13, &HFFFF5BB1
        md5_FF b, c, d, a, x(k + 11), S14, &H895CD7BE
        md5_FF a, b, c, d, x(k + 12), S11, &H6B901122
        md5_FF d, a, b, c, x(k + 13), S12, &HFD987193
        md5_FF c, d, a, b, x(k + 14), S13, &HA679438E
        md5_FF b, c, d, a, x(k + 15), S14, &H49B40821
    
        md5_GG a, b, c, d, x(k + 1), S21, &HF61E2562
        md5_GG d, a, b, c, x(k + 6), S22, &HC040B340
        md5_GG c, d, a, b, x(k + 11), S23, &H265E5A51
        md5_GG b, c, d, a, x(k + 0), S24, &HE9B6C7AA
        md5_GG a, b, c, d, x(k + 5), S21, &HD62F105D
        md5_GG d, a, b, c, x(k + 10), S22, &H2441453
        md5_GG c, d, a, b, x(k + 15), S23, &HD8A1E681
        md5_GG b, c, d, a, x(k + 4), S24, &HE7D3FBC8
        md5_GG a, b, c, d, x(k + 9), S21, &H21E1CDE6
        md5_GG d, a, b, c, x(k + 14), S22, &HC33707D6
        md5_GG c, d, a, b, x(k + 3), S23, &HF4D50D87
        md5_GG b, c, d, a, x(k + 8), S24, &H455A14ED
        md5_GG a, b, c, d, x(k + 13), S21, &HA9E3E905
        md5_GG d, a, b, c, x(k + 2), S22, &HFCEFA3F8
        md5_GG c, d, a, b, x(k + 7), S23, &H676F02D9
        md5_GG b, c, d, a, x(k + 12), S24, &H8D2A4C8A
            
        md5_HH a, b, c, d, x(k + 5), S31, &HFFFA3942
        md5_HH d, a, b, c, x(k + 8), S32, &H8771F681
        md5_HH c, d, a, b, x(k + 11), S33, &H6D9D6122
        md5_HH b, c, d, a, x(k + 14), S34, &HFDE5380C
        md5_HH a, b, c, d, x(k + 1), S31, &HA4BEEA44
        md5_HH d, a, b, c, x(k + 4), S32, &H4BDECFA9
        md5_HH c, d, a, b, x(k + 7), S33, &HF6BB4B60
        md5_HH b, c, d, a, x(k + 10), S34, &HBEBFBC70
        md5_HH a, b, c, d, x(k + 13), S31, &H289B7EC6
        md5_HH d, a, b, c, x(k + 0), S32, &HEAA127FA
        md5_HH c, d, a, b, x(k + 3), S33, &HD4EF3085
        md5_HH b, c, d, a, x(k + 6), S34, &H4881D05
        md5_HH a, b, c, d, x(k + 9), S31, &HD9D4D039
        md5_HH d, a, b, c, x(k + 12), S32, &HE6DB99E5
        md5_HH c, d, a, b, x(k + 15), S33, &H1FA27CF8
        md5_HH b, c, d, a, x(k + 2), S34, &HC4AC5665
        md5_II a, b, c, d, x(k + 0), S41, &HF4292244
        md5_II d, a, b, c, x(k + 7), S42, &H432AFF97
        md5_II c, d, a, b, x(k + 14), S43, &HAB9423A7
        md5_II b, c, d, a, x(k + 5), S44, &HFC93A039
        md5_II a, b, c, d, x(k + 12), S41, &H655B59C3
        md5_II d, a, b, c, x(k + 3), S42, &H8F0CCC92
        md5_II c, d, a, b, x(k + 10), S43, &HFFEFF47D
        md5_II b, c, d, a, x(k + 1), S44, &H85845DD1
        md5_II a, b, c, d, x(k + 8), S41, &H6FA87E4F
        md5_II d, a, b, c, x(k + 15), S42, &HFE2CE6E0
        md5_II c, d, a, b, x(k + 6), S43, &HA3014314
        md5_II b, c, d, a, x(k + 13), S44, &H4E0811A1
        md5_II a, b, c, d, x(k + 4), S41, &HF7537E82
        md5_II d, a, b, c, x(k + 11), S42, &HBD3AF235
        md5_II c, d, a, b, x(k + 2), S43, &H2AD7D2BB
        md5_II b, c, d, a, x(k + 9), S44, &HEB86D391
    
        a = AddUnsigned(a, AA)
        b = AddUnsigned(b, BB)
        c = AddUnsigned(c, CC)
        d = AddUnsigned(d, DD)
    Next
    UHMD=LCase(WordToHex(b) & WordToHex(c)) 
End Function
dim   Eurl,Wurl,listID,page
Eurl=request("Eurl")
Wurl=request("Wurl")
listID=request("listID")
page=request("page")
On Error Resume Next
Server.ScriptTimeOut=9999999
Function getHTTPPage(Path)
 t = GetBody(Path)
End function

function getHTTPPage(url) 
dim Http 
set Http=server.createobject("Microsoft.XMLHTTP") 
Http.open "GET",url,false 
Http.send() 
if Http.readystate<>4 then 
exit function 
end if 
getHTTPPage=bytesToBSTR(Http.responseBody,"gb2312") 
set http=nothing 
if err.number<>0 then err.Clear 
end function 
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
Dim Url,Html,body,body2,page2
Url="http://bible.younet.com/list.php?KindID="&request("listID")&"&page="&request("page")&""
body=getHTTPPage(url) 
body=untow(body)
body2=Autolink2(body)
body2=Autolink(body2)
body2 = replace(body2,"首页 | 上页 | 下页 | 末页 | ","")
body2 = replace(body2,"关于我们","")
body2 = replace(body2,"|","")
body2 = replace(body2,"服务条款","")
body2 = replace(body2,"广告服务","")
body2 = replace(body2,"意见与建议","")
body2 = replace(body2,"业务联系","")
body2 = replace(body2,"英才加盟","")
body2 = replace(body2,"1998-2008年版权所有","")
body2 = replace(body2,"网站报障专用短信号：13667166897(仅限短信)","")
body2 = replace(body2,"Time","")
body2 = replace(body2,"elapsed:","")
body2 = replace(body2,"seconds.","")
body2 = replace(body2,"友人网","")
body2 = replace(body2,"function","")
body2 = replace(body2,"pagejump(){if","")
body2 = replace(body2,"(document.all.pagejmp.value","")
body2 = replace(body2,"document.all.pagejmp.value","")
body2 = replace(body2,"转到第","")
body2 = replace(body2,"==","")
body2 = replace(body2,"网站声明","")
body2 = replace(body2,"友人手机网","易友3gey.com")

Function untow(strContent)
on error resume next
	strContent = HTMLEncode(strContent)
	strContent=replace(replace(strContent, vbCr,""),vbLf,"")
	untow=strContent
end function
Function Autolink2(strContent2)
	dim re
	set re = New RegExp	
	re.IgnoreCase =  True
	re.Global =  True
    strContent2 = re.Replace(strContent2,"")
	Re.Pattern = "<html>[\s\S]+?玩家奖</td>"
	strContent2 = Re.Replace(strContent2, "")
	Re.Pattern = "<center><form target=_blank action=add.php style=""padding:0px;margin:0px;"">[\s\S]+?</html>"
	strContent2 = Re.Replace(strContent2, "")
	Re.Pattern = "<script language='javascript'>function pagejump.+?转到第.+?页 <img src=http://user.younet.com/images.+?align=absmiddle onclick='pagejump\(\);' style='cursor:hand;'>"
	strContent2 = Re.Replace(strContent2, "")
		Re.Pattern = "</td>	<td align=center><a href=""list.php.+?class=black>.+?<td style="".+?"" align=""center"">.+?<img src=""http://bible.younet.com/pics/.+?align=absmiddle>"
	strContent2 = Re.Replace(strContent2, "")
	Re.Pattern = "<font color=red>\[图\]</font>"
	strContent2 = Re.Replace(strContent2, "")
	Re.Pattern = "BoardID=0&"
	strContent2 = Re.Replace(strContent2, "")
	Re.Pattern = "<td>　 <a href=""files(.+?)"" title=.+?class=gray2 target=_blank>(.+?)</a>　 <a href=""http://user.younet.com/detail.php\?id=.+?"" class=blue3 target=_blank>.+?</a> <font color=""#777777"">(.+?)</font>&nbsp;"
   strContent2 = re.Replace(strContent2,"(url=view.asp?listID="&request("listID")&"&amp;Eurl=files$1&amp;page="&request("page")&"&amp;sid="&sid&")$2(/url)($3)\")
	Re.Pattern = "首页</a>.+?末页</a> \|"
    strContent2=re.Replace(strContent2,"")
set re=Nothing	
Autolink2=strContent2
End Function
Function Autolink(strContent)
	dim re
	set re = New RegExp	
	re.IgnoreCase =  True
	re.Global =  True
	re.Pattern = "<[^>]+>|</[^>]+>"	
strContent = re.Replace(strContent,"")
set re=Nothing	
Autolink=strContent
End Function
function UBBCodex(strContent)
	on error resume next
	strContent = HTMLEncode(strContent)
   	strContent=replace(strContent,"$","")
	strContent=replace(strContent,"","")
	strContent=replace(strContent,"'","")
    strContent=replace(strContent,"&"" class=""page_linked","")
	dim objRegExp
	Set objRegExp=new RegExp
	objRegExp.IgnoreCase =true
	objRegExp.Global=True
	objRegExp.Pattern="(img=)(http://[A-Za-z0-9\./=\?%\-&_~`@':+!;*()#]+)"
	strContent= objRegExp.Replace(strContent,"<img src=""$2"" alt=""load...""/><br/>")
    objRegExp.Pattern="(\(img)\)(.{5,}?)\(/img\)"
	strContent= objRegExp.Replace(strContent,"<img src=""$2"" alt=""load...""/><br/>")
     objRegExp.Pattern="\(url=(.{5,}?)\)(.+?)\(/url\)"
	strContent= objRegExp.Replace(strContent,"<a href=""$1"" >$2</a>")
objRegExp.Pattern="(url=)(http://[A-Za-z0-9\./=\?%\-&_~`@':+!;*()#]+)"
	strContent= objRegExp.Replace(strContent,"<a href=""$2"">$2</a>")
    objRegExp.Pattern="(\\)"
	strContent= objRegExp.Replace(strContent,"<br/>")
	objRegExp.Pattern="-@"
	strContent= objRegExp.Replace(strContent,"<")
	objRegExp.Pattern="-#"
	strContent= objRegExp.Replace(strContent,">")
	set objRegExp=Nothing
	UBBCodex=strContent
end function
Call Head
response.write UBBCodex(body2) & "<br/>"
if page="" then page=1
Response.Write "<a href=""list.asp?page="&page+1&"&amp;listID="&listID&"&amp;sid="&sid&""">下一页</a>"
if page>1 then
Response.Write "<a href=""list.asp?page="&page-1&"&amp;listID="&listID&"&amp;sid="&sid&""">上一页</a>"
end if
response.write "<br/>跳到第:<input  name='i' value='0' format='*N' size='5'/><anchor>页，跳吧"
response.write "<go method='post' href='list.asp?EURL=" & EURL & "&amp;Wurl=" &Wurl&"&amp;sid="&sid&" '><postfield name='page' value='$(i)'/><postfield name='listID' value='" & listID & "'/><postfield name='offset' value='" & offset & "'/></go></anchor>"

Call Last
Sub Head 
    Response.ContentType = "text/vnd.wap.wml"
    Response.Write "<?xml version=""1.0"" encoding=""utf-8""?>"
    Response.Write "<!DOCTYPE wml PUBLIC ""-//WAPFORUM//DTD WML 1.1//EN"" ""http://www.wapforum.org/DTD/wml_1.1.xml"">"
    Response.Write "<wml>"
    Response.Write "<head>"
    Response.Write "<meta http-equiv=""Cache-Control"" content=""max-age=0""/>"
    Response.Write "<meta http-equiv=""Cache-Control"" content=""no-cache""/>"
    Response.Write "</head>"
    Response.Write "<card title=""手机玩家宝典"">"
    Response.Write "<p>"
End Sub
Sub Last
    Response.Write "<br/>-------------<br/>"
    Response.Write "<a href=""index.asp?sid="&sid&""">手机宝典</a><br/>"
    Response.Write "<a href=""/index.asp?sid="&sid&""">返回首页</a><br/>"
    Response.Write "</p>"
    Response.Write "</card>"
    Response.Write "</wml>"
    Response.End
End Sub
%>
	



