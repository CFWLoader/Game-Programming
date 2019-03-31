# WebGL源码使用说明

因为直接在js中嵌入大段的GLSL语言不雅观，因此采取不同源码类型分离的原则，GLSL的代码使用`*.vert`以及`*.frag`文件存储。

因为Chrome不支持XMLHTTPRequest直接使用`file://`协议，因此采用http协议读取GLSL源代码。

python的SimpleHTTPServer没有开启`Access-Control-Allow-Origin`参数，因此找了网上大佬的解决方案，文件存在`simple-cors-http-server.py`。

当需要启动http服务时，进入需要成为根目录的文件夹，使用：

``` bash
python simple-cors-http-server.py
```

启动，服务器地址宏定义于`./helpers/constants.js`中，变量名为`ServerRoot`，请自行配置。