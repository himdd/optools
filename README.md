## 安装
```bash
git@github.com:himdd/optools.git
sh ./optools/script/install.sh
source ~/.bashrc
```
## 使用

在app文件夹下，放以app名为名的文件，文件内为该app内的模块名，一行一个。

在module文件夹下，放以模块名为名的文件，文件内为机器列表，一行一个。

所有machine都要和中转机建立信任关系

## 命令
### 查看所有app
```bash
optools -a
```
### 查看某app下的module
```bash
optools -m [app]
```
### 查看某module下的machine
```bash
optools -l [module]
```
### 在某module下的machine上远程执行命令
optools -i [module] -c [cmd]

### 在某module下的machine上远程执行本地文件
optools -i [module] -s [path]

### 例子
```bash
[miaodongdong@com optools]$ optools -a
********************all app*************************
ad
[miaodongdong@com optools]$ optools -m ad
******************** module about ad *************************
ad_monitor
[miaodongdong@com optools]$ optools -l ad_monitor
******************** machine about ad_monitor*************************
10.100.5.85
10.100.5.92
10.100.5.93
[miaodongdong@com optools]$ optools -i ad_monitor -c "ps"
********************10.100.5.85*************************
  PID TTY          TIME CMD
25400 ?        00:00:00 sshd
29655 ?        00:00:00 sshd
29656 ?        00:00:00 ps
********************10.100.5.92*************************
  PID TTY          TIME CMD
 6817 ?        00:01:21 sshd
 6818 ?        00:00:09 cat
 6968 ?        00:00:00 sshd
 6969 ?        00:00:00 ps
********************10.100.5.93*************************
  PID TTY          TIME CMD
 7590 ?        00:00:00 sshd
 7591 ?        00:00:00 ps

[miaodongdong@com optools]$ echo ps >test.sh
[miaodongdong@com optools]$ optools -i ad_monitor -s "./test.sh"
********************10.100.5.85*************************
  PID TTY          TIME CMD
25400 ?        00:00:00 sshd
29681 ?        00:00:00 sshd
29682 ?        00:00:00 bash
29693 ?        00:00:00 ps
********************10.100.5.92*************************
  PID TTY          TIME CMD
 6817 ?        00:01:38 sshd
 6818 ?        00:00:11 cat
 6992 ?        00:00:00 sshd
 6993 ?        00:00:00 bash
 7000 ?        00:00:00 ps
********************10.100.5.93*************************
  PID TTY          TIME CMD
 7613 ?        00:00:00 sshd
 7614 ?        00:00:00 bash
 7621 ?        00:00:00 ps
```
