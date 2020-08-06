<%

set rs9=Server.CreateObject("ADODB.Recordset")
strSQL="select * from sx where cstr(ids)="&ids
rs9.open strsQL,Conn,1,1
if rs9("jy")>=50 and rs9("dj")<1 then
dengjiname="等级+1,上升至1级,攻击力+5,防御力+5<br/>"
sql="update sx set dj=dj+1,tl=jy,gj=gj+5,fs=fs+5 where cstr(ids)="&ids
  conn.Execute(sql)
elseif rs9("jy")>=100 and rs9("dj")<2 then
dengjiname="等级+1,上升至2级,攻击力+5,防御力+5<br/>"
sql="update sx set dj=dj+1,tl=jy,gj=gj+5,fs=fs+5 where cstr(ids)="&ids
  conn.Execute(sql)
elseif rs9("jy")>=200 and rs9("dj")<3 then
dengjiname="等级+1,上升至3级,攻击力+5,防御力+5<br/>"
sql="update sx set dj=dj+1,tl=jy,gj=gj+5,fs=fs+5 where cstr(ids)="&ids
  conn.Execute(sql)
elseif rs9("jy")>=300 and rs9("dj")<4 then
dengjiname="等级+1,上升至4级,攻击力+5,防御力+5<br/>"
sql="update sx set dj=dj+1,tl=jy,gj=gj+5,fs=fs+5 where cstr(ids)="&ids
  conn.Execute(sql)
elseif rs9("jy")>=400 and rs9("dj")<5 then
dengjiname="等级+1,上升至5级,攻击力+5,防御力+5<br/>"
sql="update sx set dj=dj+1,tl=jy,gj=gj+5,fs=fs+5 where cstr(ids)="&ids
  conn.Execute(sql)
elseif rs9("jy")>=600 and rs9("dj")<6 then
dengjiname="等级+1,上升至6级,攻击力+10,防御力+10<br/>"
sql="update sx set dj=dj+1,tl=jy,gj=gj+10,fs=fs+10 where cstr(ids)="&ids
  conn.Execute(sql)
elseif rs9("jy")>=900 and rs9("dj")<7 then
dengjiname="等级+1,上升至7级,攻击力+10,防御力+10<br/>"
sql="update sx set dj=dj+1,tl=jy,gj=gj+10,fs=fs+10 where cstr(ids)="&ids
  conn.Execute(sql)
elseif rs9("jy")>=1200 and rs9("dj")<8 then
dengjiname="等级+1,上升至8级,攻击力+15,防御力+15<br/>"
sql="update sx set dj=dj+1,tl=jy,gj=gj+15,fs=fs+15 where cstr(ids)="&ids
  conn.Execute(sql)
elseif rs9("jy")>=1700 and rs9("dj")<9 then
dengjiname="等级+1,上升至9级,攻击力+15,防御力+15<br/>"
sql="update sx set dj=dj+1,tl=jy,gj=gj+15,fs=fs+15 where cstr(ids)="&ids
  conn.Execute(sql)
elseif rs9("jy")>=2500 and rs9("dj")<10 then
dengjiname="等级+1,上升至10级,攻击力+20,防御力+20<br/>"
sql="update sx set dj=dj+1,tl=jy,gj=gj+20,fs=fs+20 where cstr(ids)="&ids
  conn.Execute(sql)
elseif rs9("jy")>=6000 and rs9("dj")<11 then
dengjiname="等级+1,上升至11级,攻击力+20,防御力+20<br/>"
sql="update sx set dj=dj+1,tl=jy,gj=gj+20,fs=fs+20 where cstr(ids)="&ids
  conn.Execute(sql)
elseif rs9("jy")>=8000 and rs9("dj")<12 then
dengjiname="等级+1,上升至12级,攻击力+25,防御力+25<br/>"
sql="update sx set dj=dj+1,tl=jy,gj=gj+25,fs=fs+25 where cstr(ids)="&ids
  conn.Execute(sql)
elseif rs9("jy")>=10000 and rs9("dj")<13 then
dengjiname="等级+1,上升至13级,攻击力+25,防御力+25<br/>"
sql="update sx set dj=dj+1,tl=jy,gj=gj+25,fs=fs+25 where cstr(ids)="&ids
  conn.Execute(sql)
elseif rs9("jy")>=15000 and rs9("dj")<14 then
dengjiname="等级+1,上升至14级,攻击力+30,防御力+30<br/>"
sql="update sx set dj=dj+1,tl=jy,gj=gj+30,fs=fs+30 where cstr(ids)="&ids
  conn.Execute(sql)
elseif rs9("jy")>=30000 and rs9("dj")<15 then
dengjiname="等级+1,上升至15级,攻击力+40,防御力+40<br/>"
sql="update sx set dj=dj+1,tl=jy,gj=gj+40,fs=fs+40 where cstr(ids)="&ids
  conn.Execute(sql)
elseif rs9("jy")>=40000 and rs9("dj")<16 then
dengjiname="等级+1,上升至16级,攻击力+10,防御力+10<br/>"
sql="update sx set dj=dj+1,tl=jy,gj=gj+10,fs=fs+10 where cstr(ids)="&ids
  conn.Execute(sql)
elseif rs9("jy")>=50000 and rs9("dj")<17 then
dengjiname="等级+1,上升至17级,攻击力+10,防御力+10<br/>"
sql="update sx set dj=dj+1,tl=jy,gj=gj+10,fs=fs+10 where cstr(ids)="&ids
  conn.Execute(sql)
elseif rs9("jy")>=70000 and rs9("dj")<18 then
dengjiname="等级+1,上升至18级,攻击力+10,防御力+10<br/>"
sql="update sx set dj=dj+1,tl=jy,gj=gj+10,fs=fs+10 where cstr(ids)="&ids
  conn.Execute(sql)
elseif rs9("jy")>=100000 and rs9("dj")<19 then
dengjiname="等级+1,上升至19级,攻击力+10,防御力+10<br/>"
sql="update sx set dj=dj+1,tl=jy,gj=gj+10,fs=fs+10 where cstr(ids)="&ids
  conn.Execute(sql)
elseif rs9("jy")>=120000 and rs9("dj")<20 then
dengjiname="等级+1,上升至20级,攻击力+10,防御力+10<br/>"
sql="update sx set dj=dj+1,tl=jy,gj=gj+10,fs=fs+10 where cstr(ids)="&ids
  conn.Execute(sql)
elseif rs9("jy")>=140000 and rs9("dj")<21 then
dengjiname="等级+1,上升至21级,攻击力+10,防御力+10<br/>"
sql="update sx set dj=dj+1,tl=jy,gj=gj+10,fs=fs+10 where cstr(ids)="&ids
  conn.Execute(sql)
elseif rs9("jy")>=250000 and rs9("dj")<22 then
dengjiname="等级+1,上升至22级,攻击力+10,防御力+10<br/>"
sql="update sx set dj=dj+1,tl=jy,gj=gj+10,fs=fs+10 where cstr(ids)="&ids
  conn.Execute(sql)
elseif rs9("jy")>=300000 and rs9("dj")<23 then
dengjiname="等级+1,上升至23级,攻击力+10,防御力+10<br/>"
sql="update sx set dj=dj+1,tl=jy,gj=gj+10,fs=fs+10 where cstr(ids)="&ids
  conn.Execute(sql)
elseif rs9("jy")>=350000 and rs9("dj")<24 then
dengjiname="等级+1,上升至24级,攻击力+10,防御力+10<br/>"
sql="update sx set dj=dj+1,tl=jy,gj=gj+10,fs=fs+10 where cstr(ids)="&ids
  conn.Execute(sql)
elseif rs9("jy")>=400000 and rs9("dj")<25 then
dengjiname="等级+1,上升至25级,攻击力+10,防御力+10<br/>"
sql="update sx set dj=dj+1,tl=jy,gj=gj+10,fs=fs+10 where cstr(ids)="&ids
  conn.Execute(sql)
elseif rs9("jy")>=500000 and rs9("dj")<26 then
dengjiname="等级+1,上升至26级,攻击力+10,防御力+10<br/>"
sql="update sx set dj=dj+1,tl=jy,gj=gj+10,fs=fs+10 where cstr(ids)="&ids
  conn.Execute(sql)
elseif rs9("jy")>=700000 and rs9("dj")<27 then
dengjiname="等级+1,上升至27级,攻击力+10,防御力+10<br/>"
sql="update sx set dj=dj+1,tl=jy,gj=gj+10,fs=fs+10 where cstr(ids)="&ids
  conn.Execute(sql)
elseif rs9("jy")>=1000000 and rs9("dj")<28 then
dengjiname="等级+1,上升至28级,攻击力+10,防御力+10<br/>"
sql="update sx set dj=dj+1,tl=jy,gj=gj+10,fs=fs+10 where cstr(ids)="&ids
  conn.Execute(sql)
elseif rs9("jy")>=1400000 and rs9("dj")<29 then
dengjiname="等级+1,上升至29级,攻击力+10,防御力+10<br/>"
sql="update sx set dj=dj+1,tl=jy,gj=gj+10,fs=fs+10 where cstr(ids)="&ids
  conn.Execute(sql)
elseif rs9("jy")>=1800000 and rs9("dj")<30 then
dengjiname="等级+1,上升至30级,攻击力+10,防御力+10<br/>"
sql="update sx set dj=dj+1,tl=jy,gj=gj+10,fs=fs+10 where cstr(ids)="&ids
  conn.Execute(sql)
elseif rs9("jy")>=2000000 and rs9("dj")<31 then
dengjiname="等级+1,上升至31级,攻击力+10,防御力+10<br/>"
sql="update sx set dj=dj+1,tl=jy,gj=gj+10,fs=fs+10 where cstr(ids)="&ids
  conn.Execute(sql)
elseif rs9("jy")>=2400000 and rs9("dj")<32 then
dengjiname="等级+1,上升至32级,攻击力+10,防御力+10<br/>"
sql="update sx set dj=dj+1,tl=jy,gj=gj+10,fs=fs+10 where cstr(ids)="&ids
  conn.Execute(sql)
elseif rs9("jy")>=2800000 and rs9("dj")<33 then
dengjiname="等级+1,上升至33级,攻击力+10,防御力+10<br/>"
sql="update sx set dj=dj+1,tl=jy,gj=gj+10,fs=fs+10 where cstr(ids)="&ids
  conn.Execute(sql)
elseif rs9("jy")>=3200000 and rs9("dj")<34 then
dengjiname="等级+1,上升至34级,攻击力+10,防御力+10<br/>"
sql="update sx set dj=dj+1,tl=jy,gj=gj+10,fs=fs+10 where cstr(ids)="&ids
  conn.Execute(sql)
elseif rs9("jy")>=3600000 and rs9("dj")<35 then
dengjiname="等级+1,上升至35级,攻击力+10,防御力+10<br/>"
sql="update sx set dj=dj+1,tl=jy,gj=gj+10,fs=fs+10 where cstr(ids)="&ids
  conn.Execute(sql)
elseif rs9("jy")>=4000000 and rs9("dj")<36 then
dengjiname="等级+1,上升至36级,攻击力+10,防御力+10<br/>"
sql="update sx set dj=dj+1,tl=jy,gj=gj+10,fs=fs+10 where cstr(ids)="&ids
  conn.Execute(sql)
elseif rs9("jy")>=4800000 and rs9("dj")<37 then
dengjiname="等级+1,上升至37级,攻击力+10,防御力+10<br/>"
sql="update sx set dj=dj+1,tl=jy,gj=gj+10,fs=fs+10 where cstr(ids)="&ids
  conn.Execute(sql)
elseif rs9("jy")>=5600000 and rs9("dj")<38 then
dengjiname="等级+1,上升至38级,攻击力+10,防御力+10<br/>"
sql="update sx set dj=dj+1,tl=jy,gj=gj+10,fs=fs+10 where cstr(ids)="&ids
  conn.Execute(sql)
elseif rs9("jy")>=8200000 and rs9("dj")<39 then
dengjiname="等级+1,上升至39级,攻击力+10,防御力+10<br/>"
sql="update sx set dj=dj+1,tl=jy,gj=gj+10,fs=fs+10 where cstr(ids)="&ids
  conn.Execute(sql)
elseif rs9("jy")>=9000000 and rs9("dj")<40 then
dengjiname="等级+1,上升至40级,攻击力+10,防御力+10<br/>"
sql="update sx set dj=dj+1,tl=jy,gj=gj+10,fs=fs+10 where cstr(ids)="&ids
  conn.Execute(sql)
elseif rs9("jy")>=11000000 and rs9("dj")<41 then
dengjiname="等级+1,上升至41级,攻击力+10,防御力+10<br/>"
sql="update sx set dj=dj+1,tl=jy,gj=gj+10,fs=fs+10 where cstr(ids)="&ids
  conn.Execute(sql)
elseif rs9("jy")>=14000000 and rs9("dj")<42 then
dengjiname="等级+1,上升至42级,攻击力+10,防御力+10<br/>"
sql="update sx set dj=dj+1,tl=jy,gj=gj+10,fs=fs+10 where cstr(ids)="&ids
  conn.Execute(sql)
elseif rs9("jy")>=25000000 and rs9("dj")<43 then
dengjiname="等级+1,上升至43级,攻击力+10,防御力+10<br/>"
sql="update sx set dj=dj+1,tl=jy,gj=gj+10,fs=fs+10 where cstr(ids)="&ids
  conn.Execute(sql)
elseif rs9("jy")>=45000000 and rs9("dj")<44 then
dengjiname="等级+1,上升至44级,攻击力+10,防御力+10<br/>"
sql="update sx set dj=dj+1,tl=jy,gj=gj+10,fs=fs+10 where cstr(ids)="&ids
  conn.Execute(sql)
elseif rs9("jy")>=70000000 and rs9("dj")<45 then
dengjiname="等级+1,上升至40级,攻击力+10,防御力+10<br/>"
sql="update sx set dj=dj+1,tl=jy,gj=gj+10,fs=fs+10 where cstr(ids)="&ids
  conn.Execute(sql)
elseif rs9("jy")>=90000000 and rs9("dj")<46 then
dengjiname="等级+1,上升至46级,攻击力+10,防御力+10<br/>"
sql="update sx set dj=dj+1,tl=jy,gj=gj+10,fs=fs+10 where cstr(ids)="&ids
  conn.Execute(sql)
elseif rs9("jy")>=110000000 and rs9("dj")<47 then
dengjiname="等级+1,上升至47级,攻击力+10,防御力+10<br/>"
sql="update sx set dj=dj+1,tl=jy,gj=gj+10,fs=fs+10 where cstr(ids)="&ids
  conn.Execute(sql)

else
dengjiname=""
end if
   rs9.close
set rs9=Nothing
%>
