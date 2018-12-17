<!--#include file="../inc/AspCms_SettingClass.asp" -->
<%
function checkmobile(str)
	dim f_return : f_return=0 'false
	if len(str)>0 then
	dim re : set re=New RegExp '建立正则表达式
	re.Pattern="^(13[0-9]{9})|(18[0-9]{9})|(14[0-9]{9})|(17[0-9]{9})|(15[0-9]{9})$" '设置模式，即建立正则式规则
	re.Global=False '设置全局可用性
	re.Ignorecase=False '设置是否区分字符大小写
	re.MultiLine=False '设置多行标记可用性
	'if re.test(str)=false then '执行搜索测试
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

if isnul(yname) then alertMsgAndGo "姓名不能为空","-1"
if isnul(sjhm) then alertMsgAndGo "手机号码不能为空","-1"
if isnul(yprovinces) then alertMsgAndGo "省份不能为空","-1"
if isnul(ycity) then alertMsgAndGo "城市不能为空","-1"
		

if not checkmobile(sjhm) then alertMsgAndGo "手机号码格式不正确","-1"

CLStr=Chr(13) & Chr(10)
'请在此修改相关信息
 mailserver="mail.768800.com" '邮局服务器地址（smtp服务器地址）
 username="service@768800.com" 'smtp服务器验证登陆名（用来做为代发邮件的地址）
 'username="3083279010@qq.com" 'smtp服务器验证登陆名（用来做为代发邮件的地址）
 password="tlkj101025" 'smtp服务器验证密码 （信箱密码）
 'password="tlkj101025" 'smtp服务器验证密码 （信箱密码）
 receive="133080401@qq.com" '接受反馈信息的email地址（用来接收邮件的信箱）
'修改结束
Set msg = Server.CreateObject("JMail.Message")
msg.Charset = "gb2312"
msg.logging = true '启用邮件日志
msg.silent=True'屏蔽例外错误，返回False或True
'msg.ContentType = "text/html"'邮件的格式为HTML格式
msg.Priority = 1 '邮件等级，1为加急，3为普通，5为低级
msg.MailServerUserName = username
msg.MailServerPassword = password 
msg.From = username 
msg.FromName = username
msg.AddRecipient (receive)
'msg.ReplyTo = receive

msg.Subject = "网站建设咨询"
msg.HTMLBody = CLStr&CLStr
msg.HTMLBody = msg.HTMLBody&"<div>"
msg.HTMLBody = msg.HTMLBody&"<br><h1>客户留言</h1>"&CLStr
msg.HTMLBody = msg.HTMLBody&"<br>对方姓名:"&yname&CLStr
msg.HTMLBody = msg.HTMLBody&"<br>对方性别:"&ysex&CLStr

msg.HTMLBody = msg.HTMLBody&"<br>对方电话:"&sjhm&CLStr
msg.HTMLBody = msg.HTMLBody&"<br>省份:"&yprovinces&CLStr
msg.HTMLBody = msg.HTMLBody&"<br>城市:"&ycity&CLStr
msg.HTMLBody = msg.HTMLBody&"<br>QQ:"&yQQ&CLStr
msg.HTMLBody = msg.HTMLBody&"</div>"


If msg.Send (mailserver) Then 
Response.Write(" <script language=javascript>alert('发送成功');location='http://www.768800.com/'</script>")
'Response.Write(" <script language=javascript>console.log(location.href)</script>")
else
Response.Write(" <script language=javascript>alert('发送失败，请仔细检查邮件服务器的设置是否正确！') </script>")
'response.write msg.errormessage
End If 
msg.close
set msg = nothing
%>