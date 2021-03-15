# 自述文件

## dwm

---
```
    需要安装 xorg xorg-server xorg-init
    配合st、dmenu更搭哦

```

## 目录说明

---
```

    ./
    |-- patches                                            补丁源文件夹
    |    |-- dwm-alpha-20180613-b69c870.diff               透明补丁
    |    |-- dwm-autostart-20161205-bb3bd6f.diff           启动后自动执行脚本补丁
    |    |-- dwm-hide_vacant_tags-6.2.diff                 自动隐藏状态栏9个桌面中未工作的标签
    |    |-- dwm-awesomebar-20191003-80e2a76.diff          状态栏显示多个应用标签，鼠标点击可隐藏和显示
    |    |-- dwm-hide-and-restore.diff                     隐藏和显示窗口类似最小化再恢复的键盘操作补丁
    |    |-- dwm-noborder-6.2.diff                         当窗口只剩一个时去除掉外框补丁
    |    |-- dwm-rotatestack-20161021-ab9571b.diff         顺时针和逆时针交换显示的窗口位置补丁
    |    |-- dwm-fullscreen-6.2.diff                       快捷最大化窗口快捷按键补丁
    |    |-- dwm-scratchpad-6.2.diff                       生成或恢复浮动终端窗口
    |    |-- dwm-attachbottom-6.1.diff                     新建的窗口在右下角出现补丁
    |    |-- dwm-pertag-20170513-ceac8c9.diff              保持每个工作区窗口自己的布局格式
    |    |-- dwm-r1522-viewontag.diff                      切换窗口到别的工作区时也跟随
    |    \...
    |-- scripts                                            脚本文件夹
    |    |-- autostart.sh                                  dwm自动执行脚本补丁的两个脚本之一，放在～/.dwm文件夹下，或者建立软链接
    |    |-- dwm-status-bar.sh                             dwm状态栏设置（放在～/.scripts文件夹下） 
    |    |-- wallpaper-autochange.sh                       设置壁纸脚本（放在～/.scripts文件夹下,要设置的壁纸图片放在～/Pictures/wallpapers文件夹下，需要安装feh） 
    |    \...
    |-- README.md     自述文件（本文件）
    \-- README        原本自述文件 里面有编译安装方法

```

## 补丁说明

### alpha 透明补丁

---
```

    需要渲染器支持（如：安装compton）
    st终端透明需要st的透明插件

```

### autostart 启动时执行一些脚本

### scratchpad 生成或恢复浮动终端窗口

## 按键说明

---
```

    comma       逗号                     ，
    period      句号                     。
    semicolon   分号                     ;
    grave       制表符上esc下的那个按键  ~`

```

### 当前最新版本私人定制按键用法

+ 前缀键盘 MODKEY 为Mod4Mask（即 窗口键[Win]）
+ Mod1Mask（即 改变键[Alt]）
+ Mod4Mask（即 窗口键[Win]）

|           快捷键组合          |                                      作用                                      |                     备注                     |
|:-----------------------------:|:------------------------------------------------------------------------------:|:--------------------------------------------:|
|     MODKEY + 数字（1～9）     |                                 切换 1～9的窗口                                |                                              |
|           MODKEY + p          |                            打开dmen面板（应用菜单）                            |                                              |
|      MODKEY+Shift+ Enter      |                     新建一个窗格，（开一个终端应用（st））                     |                                              |
|           MODKEY + j          |                           将光标焦点移动到下一个窗格                           |                                              |
|           MODKEY + k          |                           将光标焦点移动到上一个窗格                           |                                              |
|           MODKEY + h          |                        将当前的窗格宽度减向左扩展或缩小                        |                                              |
|           MODKEY + l          |                        将当前的窗格宽度向右边扩展或缩小                        |                                              |
|         MODKEY + Enter        | 将当前窗口与主窗口互换、若是当前是主窗口则将其与上一个窗格互换，并聚焦在主窗格 |                                              |
|       MODKEY + Shift + u      |                          将当前窗口与排在上一窗格互换                          |                                              |
|       MODKEY + Shift + d      |                             将窗口与下一个窗格互换                             |                                              |
|       MODKEY + Shift + j      |                        顺时针循环滚动当前窗口的窗格位置                        |                                              |
|       MODKEY + Shift + k      |                        逆时针循环滚动当前窗口的窗格位置                        |                                              |
|           MODKEY + m          |                            改变当前窗口的模式为浮动                            |        主副窗格全部放大，前后层层排列        |
|           MODKEY + t          |                            将当前窗口的模式改为排版                            |     主格居左,副窗格居右,新增窗格水平分割     |
|           MODKEY + o          |               将当前窗口的副窗格堆布局模式改为底部水平排列局方式               |     主窗堆在上,副窗堆在下，副窗格水平分割    |
|           MODKEY + u          |                  将当前窗口的副窗格堆模式改为垂直排列布局方式                  |     主窗堆在上,副窗堆在下，副窗格垂直分割    |
|       MODKEY + Ctrl + o       |                    将当前窗口的窗格模式改为中心排列布局方式                    | 主窗格在中心占大位，副窗口分列在左右水平分割 |
|       MODKEY + Ctrl + u       |                  将当前窗口的窗格模式改为悬浮中心排列布局方式                  | 主窗格在后中心悬浮，副窗口格一行多列垂直分割 |
|           MODKEY + g          |                        将当前窗口的窗格模式改为网格模式                        |        一列两行、两行两列、三行三列..        |
|     MODKEY + Mod4Mask + d     |                            增加当前窗格应用的透明度                            |                                              |
|     MODKEY + Mod4Mask + s     |                            减少当前窗格应用的透明度                            |                                              |
|     MODKEY + Mod4Mask + f     |                       恢复当前窗格应用的初始默认的透明度                       |                                              |
|           MODKEY + i          |                                插入主窗格的堆栈                                |                                              |
|           MODKEY + d          |                               减少主窗格的堆栈数                               |                                              |
|       MODKEY + Shift + l      |                            调用 slimlockcmd 进行锁屏                           |                                              |
|           MODKEY + b          |                                显示与隐藏状态栏                                |                                              |
|         MODKEY + grave        |                          打开一个命令行终端小窗格窗口                          |    grave 为Esc键下 Tab键上的那个键（～`）    |
|       MODKEY + Shift + h      |                             最小化/隐藏藏 当前窗格                             |                                              |
|       MODKEY + Shift + r      |                            恢复当前窗口下隐藏的窗格                            |             非全部，一次一个恢复             |
|       MODKEY + Shift + f      |                         将当前窗口铺满全屏幕（最大化）                         |                                              |
|     MODKEY + Ctrl + Space     |                                    打开dmenu                                   |                                              |
| MODKEY + Shift + 数字（1～9） |                      将当前窗格移动到指定数字代表的窗口中                      |                                              |
|       MODKEY + Shift + q      |                                     退出dwm                                    |                                              |
