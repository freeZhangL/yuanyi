<!--#include file="AspCms_MainClass.asp" -->
<%
if siteMode=0 then die siteHelp
dim LanguageAlias : LanguageAlias=""
dim pagemode: pagemode=""
dim setting : set setting=new SettingClass
%>
<!--#include file="AspCms_Language.asp" -->