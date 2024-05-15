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

