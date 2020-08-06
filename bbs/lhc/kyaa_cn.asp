<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<%response.buffer=true%>
<%Response.ContentType = "text/vnd.wap.wml; charset=utf-8"%>
<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<!--#include file="conn.inc"-->
<!--#include file="cnscucsb.asp"-->
<wml>
<head>
<meta http-equiv="Cache-Control" content="no-Cache"/>
<meta http-equiv="Cache-Control" content="max-age=0"/>
<meta http-equiv="Expires" content="Mon, 1 Jan 1990 00:00:00 GMT"/>
</head>
<card id="main" title="查看号码属性" >
<p>
<%
dim kyzc,iduse,hm

hm=request("hm")
kyzc=request("kyzc")

set rs=Server.CreateObject("ADODB.Recordset")
rsQL="select * from cpjf where cstr(ids)='"&iduse& "'"
rs.open rsQL,myc,1,2
if rs.recordcount<1 then
rs.addnew
rs("ids")=iduse
rs.update
end if
        rs.Close
	Set rs=Nothing

if hm<>"" and kyzc<>"" then
if clng(hm)="1" then kyaa="01(红/火/小/牛/单)"
if clng(hm)="2" then kyaa="02(红/土/小/鼠/双)"
if clng(hm)="3" then kyaa="03(蓝/土/小/猪/单)"
if clng(hm)="4" then kyaa="04(蓝/水/小/狗/双)"
if clng(hm)="5" then kyaa="05(绿/水/小/鸡/单)"
if clng(hm)="6" then kyaa="06(绿/木/小/猴/双)"
if clng(hm)="7" then kyaa="07(红/木/小/羊/单)"
if clng(hm)="8" then kyaa="08(红/金/小/马/双)"
if clng(hm)="9" then kyaa="09(蓝/金/小/蛇/单)"
if clng(hm)="10" then kyaa="10(蓝/土/小/龙/双)"
if clng(hm)="11" then kyaa="11(绿/土/小/兔/单)"
if clng(hm)="12" then kyaa="12(红/水/小/虎/双)"
if clng(hm)="13" then kyaa="13(红/水/小/牛/单)"
if clng(hm)="14" then kyaa="14(蓝/火/小/鼠/双)"
if clng(hm)="15" then kyaa="15(蓝/火/小/猪/单)"
if clng(hm)="16" then kyaa="16(绿/金/小/狗/双)"
if clng(hm)="17" then kyaa="17(绿/金/小/鸡/单)"
if clng(hm)="18" then kyaa="18(红/土/小/猴/双)"
if clng(hm)="19" then kyaa="19(红/土/小/羊/单)"
if clng(hm)="20" then kyaa="20(蓝/木/小/马/双)"
if clng(hm)="21" then kyaa="21(绿/木/小/蛇/单)"
if clng(hm)="22" then kyaa="22(绿/火/小/龙/双)"
if clng(hm)="23" then kyaa="23(红/火/小/兔/单)"
if clng(hm)="24" then kyaa="24(红/金/小/虎/双)"
if clng(hm)="25" then kyaa="25(蓝/金/小/牛/单)"
if clng(hm)="26" then kyaa="26(蓝/水/大/鼠/双)"
if clng(hm)="27" then kyaa="27(绿/水/大/猪/单)"
if clng(hm)="28" then kyaa="28(绿/木/大/狗/双)"
if clng(hm)="29" then kyaa="29(红/木/大/鸡/单)"
if clng(hm)="30" then kyaa="30(红/火/大/猴/双)"
if clng(hm)="31" then kyaa="31(蓝/火/大/羊/单)"
if clng(hm)="32" then kyaa="32(绿/土/大/马/双)"
if clng(hm)="33" then kyaa="33(绿/土/大/蛇/单)"
if clng(hm)="34" then kyaa="34(红/水/大/龙/双)"
if clng(hm)="35" then kyaa="35(红/水/大/兔/单)"
if clng(hm)="36" then kyaa="36(蓝/木/大/虎/双)"
if clng(hm)="37" then kyaa="37(蓝/木/大/牛/单)"
if clng(hm)="38" then kyaa="38(绿/金/大/鼠/双)"
if clng(hm)="39" then kyaa="39(绿/金/大/猪/单)"
if clng(hm)="40" then kyaa="40(红/土/大/狗/双)"
if clng(hm)="41" then kyaa="41(蓝/土/大/鸡/单)"
if clng(hm)="42" then kyaa="42(蓝/水/大/猴/双)"
if clng(hm)="43" then kyaa="43(绿/水/大/羊/单)"
if clng(hm)="44" then kyaa="44(绿/火/大/马/双)"
if clng(hm)="45" then kyaa="45(红/火/大/蛇/单)"
if clng(hm)="46" then kyaa="46(红/金/大/龙/双)"
if clng(hm)="47" then kyaa="47(蓝/金/大/兔/单)"
if clng(hm)="48" then kyaa="48(蓝/土/大/虎/双)"
if clng(hm)="49" then kyaa="49(绿/土/大/牛/单)"

if clng(hm)>0 and clng(hm)<50 then
Response.write ""&kyaa&"<br/>"
else
Response.write "请输入正确的彩票号码<br/>"
end if
else
Response.write "输入对应的号码<br/>"
end if
%>
输入号码:<input name="name" title="号码" type="text" format="*N" emptyok="true" maxlength="500" size="10" value=""/><br/>
<anchor>[-确定-]<go href="kyaa_cn.asp" method="post" accept-charset='utf-8'>
<postfield name="hm" value="$(name)"/>
<postfield name="SessionID" value="<%=SessionID%>"/>
<postfield name="kyzc" value="yxxe_net"/>
</go>
</anchor><br/>----------<br/>
<a href="/BBS/LHC/Index.Asp?SessionID=<%=SessionID%>">返回虚拟博彩</a><br/>
<a href="/BBS/index.asp?SessionID=<%=SessionID%>">返回社区首页</a><br/>
报时:<%=time%>
</p></card></wml>
<%myc.close
set myc=nothing
%>