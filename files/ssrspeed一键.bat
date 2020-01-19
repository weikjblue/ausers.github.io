@echo off&
echo.
echo ##### 请放在ssrspeed目录下运行 #####
:start
echo.
echo 1：开始测速（默认设置）
echo 2：开始测速（自定义设置）
echo 3：Web UI
echo 4：安装pip
echo 5：更多参数（原文英语）
echo 6：更多参数（谷歌翻译）
echo 7：当前SSRSpeed版本
echo 8：你很厉害，想全部自己输入
echo 请选择（1~8）：
choice /c 12345678
if %errorlevel%==8 (goto :write)
if %errorlevel%==7 (goto :ver)
if %errorlevel%==6 (goto :fy)
if %errorlevel%==5 (goto :yw)
if %errorlevel%==4 (goto :pip)
if %errorlevel%==3 (goto :web)
if %errorlevel%==2 (goto :test2)
if %errorlevel%==1 (goto :test1)

:pip
python -m pip install --upgrade pip
pip3 install -r requirements.txt
pip3 install pillow
pip3 install requests
pip3 install pysocks
pause
goto :start

:write
set /p a=开头内容“python main.py ”已给出，剩下的参数自己写:
python main.py %a%
pause
EXIT

:test1
set /p a=请输入您的订阅链接:
if "%a%"=="" (
goto :test1
) else (
python main.py -u "%a%"
)
pause
EXIT

:web
start python web.py
ping -n 5 127.0.0.1>nul && start http://127.0.0.1:10870/
pause
goto :start

:ver
python main.py --version
pause
goto :start

:yw

echo.
echo Usage: main.py [options] arg1 arg2...
echo.
echo Options:
echo.
echo  --version                              show program's version number and exit
echo  -h, --help                             show this help message and exit
echo  -c GUICONFIG, --config=GUICONFIG       Load config generated by shadowsocksr-csharp.
echo  -u URL, --url=URL                      Load ssr config from subscription url.
echo  -m TEST_METHOD, --method=TEST_METHOD   Select test method in Select test method in [speedtestnet, fast, socket, stasync].
echo  -M TEST_MODE, --mode=TEST_MODE         Select test mode in [all,pingonly,wps].
echo  --include                              Filter nodes by group and remarks using keyword.
echo  --include-remark                       Filter nodes by remarks using keyword.
echo  --include-group                        Filter nodes by group name using keyword.
echo  --exclude                              Exclude nodes by group and remarks using keyword.
echo  --exclude-group                        Exclude nodes by group using keyword.
echo  --exclude-remark                       Exclude nodes by remarks using keyword.
echo  --use-ssr-cs                           Replace the ShadowsocksR-libev with the ShadowsocksR-C# (Only Windows)
echo  -g GROUP                               Manually set group.
echo  -y, --yes                              Skip node list confirmation before test.
echo  -C RESULT_COLOR, --color=RESULT_COLOR  Set the colors when exporting images..
echo  -S SORT_METHOD, --sort=SORT_METHOD     Select sort method in [speed,rspeed,ping,rping],default not sorted.
echo  -i IMPORT_FILE, --import=IMPORT_FILE   Import test result from json file and export it.
echo  --skip-requirements-check              Skip requirements check.
echo  --debug                                Run program in debug mode.
echo.
echo  Test Modes
echo  Mode                 Remark
echo  TCP_PING             Only tcp ping, no speed test
echo  WEB_PAGE_SIMULATION  Web page simulation test
echo  ALL                  Full speed test (exclude web page simulation)
echo.
echo  Test Methods
echo  Methods         Remark
echo  ST_ASYNC        Asynchronous download with single thread
echo  SOCKET          Raw socket with multithreading
echo  SPEED_TEST_NET  Speed Test Net speed test
echo  FAST            Fast.com speed test
echo.
pause
goto :start

:fy

echo.
echo 用法：main.py [options] arg1 arg2...
echo.
echo 选项：
echo.
echo  --version                               显示程序的版本号并退出
echo  -h，--help                              显示此帮助消息并退出
echo  -c GUICONFIG，--config = GUICONFIG      加载由shadowsocksr-csharp生成的配置。
echo  -u URL，--url = URL                     从订阅URL加载ssr配置。
echo  -m TEST_METHOD，--method = TEST_METHOD  在[speedtestnet,fast,socket,stasync]中选择测试方法。
echo  -M TEST_MODE，--mode = TEST_MODE        在[all,pingonly,wps]中选择测试模式。
echo  --include                               按组过滤节点，并使用关键字注释。
echo  --include-remark                        使用关键字通过注释过滤节点。
echo  --include-group                         使用关键字按组名过滤节点。
echo  --exclude                               按组排除节点，并使用关键字进行注释。
echo  --exclude-group                         使用关键字按组排除节点。
echo  --exclude-remark                        通过使用关键字的注释排除节点。
echo  --use-ssr-cs                            用ShadowsocksR-C＃替换ShadowsocksR-libev（仅Windows）
echo  -g GROUP                                手动设置组。
echo  -y，--yes                               测试前跳过节点列表确认。
echo  -C RESULT_COLOR，--color = RESULT_COLOR 导出图像时设置颜色。
echo  -S SORT_METHOD，--sort = SORT_METHOD    在[speed,rspeed,ping,rping]中选择排序方法，默??认不排序。
echo  -i IMPORT_FILE，--import = IMPORT_FILE  从json文件导入测试结果并导出。
echo  -skip-requirements-check                跳过要求检查。
echo  --debug                                 在调试模式下运行程序。
echo.
echo  测试模式
echo  模式                 备注
echo  TCP_PING             仅tcp ping，无速度测试
echo  WEB_PAGE_SIMULATION  网页模拟测试
echo  ALL                  全速测试（不包括网页模拟）
echo.
echo  测试方法
echo  方法            备注
echo  ST_ASYNC        单线程异步下载
echo  SOCKET          具有多线程的原始套接字
echo  SPEED_TEST_NET  SpeedTest.Net速度测试
echo  FAST            Fast.com速度测试
echo.
pause
goto :start

:test2
echo.
echo      以下选项较多，如有不懂或需要跳过，直接回车跳过即可
echo.
:test3
set /p a=请输入您的订阅链接:
if "%a%"=="" (
goto :test3
) else (
goto :jx1
)
:jx1
set /p b=1.在[speedtestnet,fast,socket,stasync]中选择测试方法:
set /p c=2.在[all,pingonly,wps]中选择测试模式:
set /p d=3.按组过滤节点，并使用关键字注释:
set /p e=4.使用关键字通过注释过滤节点:
set /p f=5.使用关键字按组名过滤节点:
set /p g=6.按组排除节点，并使用关键字进行注释:
set /p h=7.使用关键字按组排除节点:
set /p i=8.通过使用关键字的注释排除节点:
set /p j=9.用ShadowsocksR-C＃替换ShadowsocksR-libev(任意输入确定):
set /p k=10.手动设置组:
set /p l=11.测试前跳过节点列表确认(任意输入确定):
set /p m=12.导出图像时设置颜色:
set /p n=13.在[speed,rspeed,ping,rping]中选择排序方法，默认不排序，如默认请跳过:
set /p o=14.跳过要求检查(任意输入确定):
set /p p=15.在调试模式下运行程序(任意输入确定):
if "%b%"=="" (
set b= && goto :jx2
) else (
set b=-m %b% && goto :jx2
)
:jx2
if "%c%"=="" (
set c= && goto :jx3
) else (
set c=-M %c% && goto :jx3
)
:jx3
if "%d%"=="" (
set d= && goto :jx4
) else (
set d=--include %d% && goto :jx4
)
:jx4
if "%e%"=="" (
set e= && goto :jx5
) else (
set e=--include-remark %e% && goto :jx5
)
:jx5
if "%f%"=="" (
set f= && goto :jx6
) else (
set f=--include-group %f% && goto :jx6
)
:jx6
if "%g%"=="" (
set g= && goto :jx7
) else (
set g=--exclude %g% && goto :jx7
)
:jx7
if "%h%"=="" (
set h= && goto :jx8
) else (
set h=--exclude-group %h% && goto :jx8
)
:jx8
if "%i%"=="" (
set i= && goto :jx9
) else (
set i=--exclude-remark %i% && goto :jx9
)
:jx9
if "%j%"=="" (
set j= && goto :jx10
) else (
set j=--use-ssr-cs && goto :jx10
)
:jx10
if "%k%"=="" (
set k= && goto :jx11
) else (
set k=-g %k% && goto :jx11
)
:jx11
if "%l%"=="" (
set l= && goto :jx12
) else (
set l=-y && goto :jx12
)
:jx12
if "%m%"=="" (
set m= && goto :jx13
) else (
set m=-C %m% && goto :jx13
)
:jx13
if "%n%"=="" (
set n= && goto :jx14
) else (
set n=-S %n% && goto :jx14
)
:jx14
if "%o%"=="" (
set o= && goto :jx15
) else (
set o=-skip-requirements-check && goto :jx15
)
:jx15
if "%p%"=="" (
set p= && goto :jx16
) else (
set p=--debug && goto :jx16
)
:jx16
::echo %a% %b% %c% %d% %e% %f% %g% %h% %i% %j% %k% %l% %m% %n% %o% %p%
python main.py -u "%a%" %b% %c% %d% %e% %f% %g% %h% %i% %j% %k% %l% %m% %n% %o% %p%
goto :start
