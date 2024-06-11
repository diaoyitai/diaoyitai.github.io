### 密码学

###### 古典密码特征：

替代和置换或两者相结合

###### 基础密码：

brainfuck / Ook



### Web安全

##### 信息泄露：

###### 1.目录遍历

```python
['./server-status/ ']
```



###### 2.备份文件下载

​	2.1网站源码：

​		常见后缀

```python
['.tar','.tar.gz','.zip','.rar','.7z','.bak','.txt','.phps','.swp']
```

​		常见源码备份文件名

```Python
['web','website','backup','back','www','wwwroot','temp','index']
```

​	2.2bak文件：

​		如果网站存在备份文件，在地址栏最末加上/index.php~或/index.php.bak，即可得到备份文件

```python
['index.php~','index.php.bak']
```

​	2.3vim缓存

​		vim在编辑文档的过程中如果异常退出，会产生缓存文件，第一次产生的缓存文件后缀为.swp，后面会产生swo等.

​	index.php.swp、.index.php.swp、index.php.swo

```python
['index.php.swp','.index.php.swp','.index.php.swo']
```

​		在 UNIX-like 系统中，以点`.`开头的文件通常被视为隐藏文件，这意味着它们在默认情况下不会显示在文件列表中。因此，`.index.php.swp` 是一个隐藏文件，而 `index.php.swp` 不是隐藏文件。

​	第一次使用vim打开文件后，**就会产生一个以swp为后缀的隐藏文件(**这时候使用另一个会话端口会查看到)；
​    假如这个时候有第二个窗口同时打开同一个文件，这个时候会产生第二个临时文件swo为后缀的隐藏文件；
​    依次类推，第三个临时隐藏文件为swn；
​    即文件名的规律为:swp为首，以字母逆时针依次出现，即：swp,swo,swn,swm......
​    一开始有点好奇，那这个临时隐藏文件有没有限制多少个呢？
​    然后测试了一下，一开始以为出现完所有字母后不会再出现，然而并不是这样，
​    当出现到swq后，下一次还会出现以swp为后缀的文件(当然一般不会在这么多窗口打开同一个文件)。

​	2.4.DS_Store 

​		DS_Store 是 Mac OS 保存文件夹的自定义属性的隐藏文件。通过.DS_Store可以知道这个目录里面所有文件的清单。

```python
['.DS_Store']
```

​		http://challenge-55bbe851b0639434.sandbox.ctfhub.com:10800/.DS_Store

​		.DS_Store用Linux机打开cat xxx.DS_Store

​		726885c3d10f048a33687fc639612634.txt

###### 3.Git泄漏

```python
['.git']
```

​	当前大量开发人员使用git进行版本控制，对站点自动部署。如果配置不当，可能会将.git文件夹直接部署到线上环境。这就引起了git泄露漏洞。

 GitHack是一个.git泄露利用测试脚本，通过泄露的文件，还原重建工程源代码。

​	python2 GitHack.py http://challenge-4f460bd0cf7e70c5.sandbox.ctfhub.com:10800/.git/

git  log 		看日志

git  stash 	Git 会将当前工作目录的变更保存到一个堆栈中，并清除工作目录的修改，使其恢复到与最近的提交状态相同

`git diff` 是一个用于比较文件差异的 Git 命令。它可以显示工作目录中未暂存（未添加到暂存区）的更改，也可以显示已暂存的更改与最后一次提交的差异。

###### 4.SVN泄漏

SVN是subversion的缩写，是一个开放源代码的版本控制系统是源代码管理软工具。使用[SVN](https://so.csdn.net/so/search?q=SVN&spm=1001.2101.3001.7020)管理本地代码过程中，将生成名为.svn的隐藏文件夹，包含非常重要的源码信息。当网站管理员在发布代码时，没有使用导出功能，直接进行复制粘贴，导致出现SVN信息泄露漏洞 常见漏洞变现为 ：域名/.svn/entries。

针对SVN泄露的工具--**dvcs-ripper**(万能，也可以扫git和hg)

./rip-svn.pl -u http://challenge-6233ebfc7c789468.sandbox.ctfhub.com:10800/.svn

###### 5.hg泄漏(Mercurial)

rip-hg.pl -v -u http://challenge-4f3b5346243d0bfa.sandbox.ctfhub.com:10800/.hg/

-v 参数是详细模式，输出结果更详细

###### 6.其他源码管理工具泄漏

rip-bzr.pl -v -u http://www.example.com/.bzr/

rip-cvs.pl -v -u http://www.example.com/CVS/
