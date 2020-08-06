<% @LANGUAGE="VBSCRIPT" CODEPAGE="65001" %><% Response.ContentType="text/vnd.wap.wml; charset=utf-8" %><?xml version="1.0" encoding="utf-8"?><!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<!--#INCLUDE VIRTUAL="/bbs/reg/useregs.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/public/codeun.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/reg/ltonline.asp"-->
<wml>
<head>
<meta http-equiv="Cache-Control" content="max-age=0"/>
<meta http-equiv="Cache-Control" content="no-cache"/>
<meta http-equiv="Expires" content="Mon, 1 Jan 1990 00:00:00 GMT"/>
</head>  
<%
SessionID=request.querystring("SessionID")
iduse=Session("useid")
lasttlls="325"
lasttls
  set objgbrs=Server.CreateObject("ADODB.Recordset")
  ssql="select * from usereg where CStr(id)='" & iduse & "'"
  objgbrs.open ssql,conn
%>
<card id="card1" title="修改生日">  
<p>
各项必填
<br/>--------<br/>
年:<select  name="n" value="">
<option value="1990">年份→</option> 
<option value="2008">2008</option> 
<option value="2007">2007</option> 
<option value="2006">2006</option> 
<option value="2005">2005</option> 
<option value="2004">2004</option> 
<option value="2003">2003</option> 
<option value="2002">2002</option> 
<option value="2001">2001</option> 
<option value="2000">2000</option> 
<option value="1990">1990</option> 
<option value="1999">1999</option> 
<option value="1998">1998</option> 
<option value="1997">1997</option> 
<option value="1996">1996</option> 
<option value="1995">1995</option> 
<option value="1994">1994</option> 
<option value="1993">1993</option> 
<option value="1992">1992</option> 
<option value="1991">1991</option> 
<option value="1990">1990</option> 
<option value="1989">1989</option> 
<option value="1988">1988</option> 
<option value="1987">1987</option> 
<option value="1986">1986</option> 
<option value="1985">1985</option> 
<option value="1984">1984</option> 
<option value="1983">1983</option> 
<option value="1982">1982</option> 
<option value="1981">1981</option> 
<option value="1980">1980</option> 
<option value="1979">1979</option> 
<option value="1978">1978</option> 
<option value="1977">1977</option> 
<option value="1976">1976</option> 
<option value="1975">1975</option> 
<option value="1974">1974</option> 
<option value="1973">1973</option> 
<option value="1972">1972</option> 
<option value="1971">1971</option> 
<option value="1970">1970</option> 
<option value="1969">1969</option> 
<option value="1968">1968</option> 
<option value="1967">1967</option> 
<option value="1966">1966</option> 
<option value="1965">1965</option> 
</select> 
<br/>
月:<select  name="y" value="">
<option value="1">月份→</option> 
<option value="1">01</option> 
<option value="2">02</option> 
<option value="3">03</option> 
<option value="4">04</option> 
<option value="5">05</option> 
<option value="6">06</option> 
<option value="7">07</option> 
<option value="8">08</option> 
<option value="9">09</option> 
<option value="10">10</option> 
<option value="11">11</option> 
<option value="12">12</option> 
</select> 
<br/>
日:<select name="r" value="">
<option value="28">日期→</option> 
<option value="1">01</option> 
<option value="2">02</option> 
<option value="3">03</option> 
<option value="4">04</option> 
<option value="5">05</option> 
<option value="6">06</option> 
<option value="7">07</option> 
<option value="8">08</option> 
<option value="9">09</option> 
<option value="10">10</option> 
<option value="11">11</option> 
<option value="12">12</option> 
<option value="13">13</option> 
<option value="14">14</option> 
<option value="15">15</option> 
<option value="16">16</option> 
<option value="17">17</option> 
<option value="18">18</option> 
<option value="19">19</option> 
<option value="20">20</option> 
<option value="21">21</option> 
<option value="22">22</option> 
<option value="23">23</option> 
<option value="24">24</option> 
<option value="25">25</option> 
<option value="26">26</option> 
<option value="27">27</option> 
<option value="28">28</option> 
<option value="29">29</option> 
<option value="30">30</option> 
<option value="31">31</option> 
</select> 
<br/><anchor>提 交
<go method="post" href='/bbs/reg/reedsrcl.asp?SessionID=<%=SessionID%>'>
<postfield name="n" value="$(n)"/>
<postfield name="y" value="$(y)"/>
<postfield name="r" value="$(r)"/>
</go>
</anchor>
<br/><a href='/bbs/index.asp?SessionID=<%=SessionID%>'>返回社区首页</a>
</p>
</card>
</wml>
<%
conn.close
set objgbrs=nothing
set conn=nothing
%>



