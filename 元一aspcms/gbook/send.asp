<!--#include file="../inc/AspCms_SettingClass.asp" -->
<%
function checkmobile(str)
	dim f_return : f_return=0 'false
	if len(str)>0 then
	dim re : set re=New RegExp '����������ʽ
	re.Pattern="^(13[0-9]{9})|(18[0-9]{9})|(14[0-9]{9})|(17[0-9]{9})|(15[0-9]{9})$" '����ģʽ������������ʽ����
	re.Global=False '����ȫ�ֿ�����
	re.Ignorecase=False '�����Ƿ������ַ���Сд
	re.MultiLine=False '���ö��б�ǿ�����
	'if re.test(str)=false then 'ִ����������
	'if typ=0 then 
		'call alert(msg,url)
	'else
		'if typ<>0 then 
			'f_return=1
		'end if
	'end if
	'if typ<>0 then checkmobile=f_return
	end if
	checkmobile = re.test(str)
end function
%>
<%
'dim Name',Sex,E-mail,Phone,pt,bwb,city,money,Address
'Name=Request.Form("name")
dim CLStr,msg,mailserver,username,password,receive
dim yname,ysex,sjhm,yprovinces,ycity,yQQ
dim gsname,provinces,city,sex,QQ



yname = Request.Form("yname")
ysex = Request.Form("ysex")
sjhm = Request.Form("sjhm")
yprovinces = Request.Form("yprovinces")
ycity = Request.Form("ycity")
yQQ = Request.Form("yQQ")

if isnul(yname) then alertMsgAndGo "��������Ϊ��","-1"
if isnul(sjhm) then alertMsgAndGo "�ֻ����벻��Ϊ��","-1"
if isnul(yprovinces) then alertMsgAndGo "ʡ�ݲ���Ϊ��","-1"
if isnul(ycity) then alertMsgAndGo "���в���Ϊ��","-1"
		

if not checkmobile(sjhm) then alertMsgAndGo "�ֻ������ʽ����ȷ","-1"

CLStr=Chr(13) & Chr(10)
'���ڴ��޸������Ϣ
 mailserver="mail.768800.com" '�ʾַ�������ַ��smtp��������ַ��
 username="service@768800.com" 'smtp��������֤��½����������Ϊ�����ʼ��ĵ�ַ��
 'username="3083279010@qq.com" 'smtp��������֤��½����������Ϊ�����ʼ��ĵ�ַ��
 password="tlkj101025" 'smtp��������֤���� ���������룩
 'password="tlkj101025" 'smtp��������֤���� ���������룩
 receive="133080401@qq.com" '���ܷ�����Ϣ��email��ַ�����������ʼ������䣩
'�޸Ľ���
Set msg = Server.CreateObject("JMail.Message")
msg.Charset = "gb2312"
msg.logging = true '�����ʼ���־
msg.silent=True'����������󣬷���False��True
'msg.ContentType = "text/html"'�ʼ��ĸ�ʽΪHTML��ʽ
msg.Priority = 1 '�ʼ��ȼ���1Ϊ�Ӽ���3Ϊ��ͨ��5Ϊ�ͼ�
msg.MailServerUserName = username
msg.MailServerPassword = password 
msg.From = username 
msg.FromName = username
msg.AddRecipient (receive)
'msg.ReplyTo = receive

msg.Subject = "��վ������ѯ"
msg.HTMLBody = CLStr&CLStr
msg.HTMLBody = msg.HTMLBody&"<div>"
msg.HTMLBody = msg.HTMLBody&"<br><h1>�ͻ�����</h1>"&CLStr
msg.HTMLBody = msg.HTMLBody&"<br>�Է�����:"&yname&CLStr
msg.HTMLBody = msg.HTMLBody&"<br>�Է��Ա�:"&ysex&CLStr

msg.HTMLBody = msg.HTMLBody&"<br>�Է��绰:"&sjhm&CLStr
msg.HTMLBody = msg.HTMLBody&"<br>ʡ��:"&yprovinces&CLStr
msg.HTMLBody = msg.HTMLBody&"<br>����:"&ycity&CLStr
msg.HTMLBody = msg.HTMLBody&"<br>QQ:"&yQQ&CLStr
msg.HTMLBody = msg.HTMLBody&"</div>"


If msg.Send (mailserver) Then 
Response.Write(" <script language=javascript>alert('���ͳɹ�');location='http://www.768800.com/'</script>")
'Response.Write(" <script language=javascript>console.log(location.href)</script>")
else
Response.Write(" <script language=javascript>alert('����ʧ�ܣ�����ϸ����ʼ��������������Ƿ���ȷ��') </script>")
'response.write msg.errormessage
End If 
msg.close
set msg = nothing
%>