- 编译 IPV4 固件：
````
Global build settings ---> Enable IPv6 support in packages (NEW)（取消掉，不选择）

一般情况下，源码是默认选择了这个的，如果你不是要编译ipv6固件的话，就把这个去掉就好了

有个别插件，就算你不用ipv6，但是也要把 Global build settings --->  Enable IPv6 support in packages (NEW)（选上），才可以选择的
比如：
luci-app-dockerman 、 luci-app-docker 、 luci-app-turboacc

- 网络共享luci-app-samba默认是去不掉的，在：Extra packages ---> autosamba（不选），就可以不选luci-app-samba
````
#
````
- 支持ipv6：

1、Global build settings --->  Enable IPv6 support in packages (NEW)（选上）
2、Extra packages --->  ipv6helper（选上）
3、Base system  --->  [*] Build with DHCPv6 support.  （如果前面不带 * 就选上）
4、Network  --->  6in4 和 6rd 和 6to4  （三个都选上）
5、安装好固件后检查“禁止解析 IPv6 DNS 记录”是否去掉勾选，菜单的-网络-DHCP/DNS里的高级设置-把“禁止解析 IPv6 DNS 记录”的“√”去掉

以上的选项各源码可能个别默认勾选了，没的就选上，选了的就不用管，我说的这些按顺序去查看，没选的就选上就可以了

````
