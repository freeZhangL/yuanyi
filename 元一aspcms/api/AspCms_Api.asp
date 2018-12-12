<!--#include file="../inc/AspCms_SettingClass.asp" -->
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<%
	Function VbsUnEscape(str)
		Dim x
		x=InStr(str,"%") 
		Do While x>0
			VbsUnEscape=VbsUnEscape&Mid(str,1,x-1)
			If LCase(Mid(str,x+1,1))="u" Then
				VbsUnEscape=VbsUnEscape&ChrW(CLng("&H"&Mid(str,x+2,4)))
				str=Mid(str,x+6)
			Else
				VbsUnEscape=VbsUnEscape&Chr(CLng("&H"&Mid(str,x+1,2)))
				str=Mid(str,x+3)
			End If
			x=InStr(str,"%")
		Loop
		VbsUnEscape=VbsUnEscape&str
	End Function
%>
<%
	dim desginer,res
	desginer = VbsUnEscape(Request.Form("des"))
	'这里要加个判断是否拿到值
	Function makeList(desginer)
		dim rs
		set rs =conn.exec("select * from {prefix}Content where ContentStatus=1 and IsRecommend=1 and P_author='"&desginer&"'","r1")
		res = "["
		do While not rs.eof
			res = res & "{" 
			res = res & """ContentID"":" & rs("ContentID")&","
			res = res & """title"":""" & rs("title")&""","
			res = res & """IndexImage"":""" & rs("IndexImage")
			rs.MoveNext
			if not rs.eof then
				res = res & """},"
			else
				res = res & """}"
			end if
		loop
		res = res & "]"
		rs.close : set rs=nothing
		makeList = res
	End Function
%>
<%
	response.Write makeList(desginer)
%>