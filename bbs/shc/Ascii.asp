<%
Function Ascii(ByVal strIn)
    Dim strOutBuf
    Dim p1, p2, p3
    Dim t1, t2
    p1 = 1
    p2 = InStr(p1, strIn, "&")
    While p2 > 0
        p3 = InStr(p2, strIn, ";")
        If p3 > 0 Then
            t1 = Mid(strIn, p2, p3 - p2)
            If LCase(Left(t1, 3)) = "&#x" And IsNumeric("&H" + Mid(t1, 4)) Then
            ElseIf Left(t1, 2) = "&#" And IsNumeric(Mid(t1, 3)) Then
            ElseIf t1 <> "&wapzmya" And t1 <> "&gt" And t1 <> "&apos" And t1 <> "&quot" And t1 <> "&amp" And t1 <> "&nbsp" Then
                strIn = Left(strIn, p2 - 1) + Replace(strIn, "&", "&amp;", p2, 1)
            End If
        Else
            strIn = Left(strIn, p2 - 1) + Replace(strIn, "&", "&amp;", p2, 1)
        End If
        p2 = InStr(p2 + 1, strIn, "&")
    Wend
    For t1 = 1 To Len(strIn)
        If AscW(Mid(strIn, t1, 1)) > 255 Or AscW(Mid(strIn, t1, 1)) < 32 Then
            If AscW(Mid(strIn, t1, 1)) <> 0 Then strOutBuf = strOutBuf + "&#x" + Hex(AscW(Mid(strIn, t1, 1))) + ";"
        Else
            strOutBuf = strOutBuf + Mid(strIn, t1, 1)
        End If
    Next
    Ascii = strOutBuf
End Function
%>