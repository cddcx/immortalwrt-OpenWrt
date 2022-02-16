
# 说明
-1 利用[P3TERX](https://github.com/P3TERX/Actions-OpenWrt)的Actions编译[OpenWrt的分支-天灵](https://github.com/immortalwrt/immortalwrt)
---
- .github/workflows/Build.yml的env参数说明

|  属性   | 说明  |
|  ----  | ----  |
| REPO_URL  | 源码 |
| REPO_BRANCH  | 源码的分支 |
| CONFIG_FILE  | 固件配置:.config。 |
| DIY_P1_SH  | 第一个shell脚本，一般用于安装依赖和插件。比如openclash、ssrp+。注意脚本中引用的依赖，如果上游依赖有问题会导致编译不成功。 |
| DIY_P2_SH  | 第二个shell脚本，一般用于设置themen、ip之类的。这个脚本影响的是你的页面样式、访问ip等，编译完成后需要先看里面的配置再访问。 |
| TZ  | 时区，基本不用关注。默认采用中国上海的时区。 |

## 其他：
- 《[拉取插件命令和各种命令的简单介绍](https://github.com/cddcx/immortalwrt-OpenWrt/blob/main/%E8%AF%B4%E6%98%8E/ming.md)》
- 《[IPV4/IPV6选择](https://github.com/cddcx/immortalwrt-OpenWrt/blob/main/%E8%AF%B4%E6%98%8E/ip.md)》
- 《[X86编译时选固件格式和设置overlay空间容量](https://github.com/cddcx/immortalwrt-OpenWrt/blob/main/%E8%AF%B4%E6%98%8E/overlay.md)》

- # 鸣谢
> [`Tianling Shen`](https://github.com/immortalwrt/immortalwrt)
> [`P3TERX`](https://github.com/P3TERX/Actions-OpenWrt)
> [`感谢各位大佬！`](#/README.md)
