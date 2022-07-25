# One-Page

### 前言

《一页网》是基于PHP Yaf的MVC扩展框架搭建一页网页制作展示系统，支持微服务部署、可视化编辑、多模板，可快速生成一页网页。

### 描述

* 模版使用Bootsrap5制作，目前为固定的几个板块。
* 在管理模式中可以编辑 LOGO，菜单，板块，等相关信息。
* 图片需上传至COS后复制地址即可。
* 支持微信公众号访问分享
* 生成静态文件。通过微信云托管访问

### 技术

[![PHP Version](https://img.shields.io/badge/php-%3E%3D8.1-8892BF.svg)](http://www.php.net/)
[![Yaf Version](https://img.shields.io/badge/Yaf-2.3.2-blue)](https://www.php.net/manual/zh/book.yaf.php)
[![Mysql Version](https://img.shields.io/badge/mysql-8-red)](http://www.mysql.com/)
[![Bootstrap Version](https://img.shields.io/badge/Bootstrap-5-blueviolet)](https://getbootstrap.com/)

### 模块目录

* server，docker服务器配置文件
* conf，服务器配置
* asset，js/css 文件
* vendor，第三方插件
* application，项目主要目录，开发主要在这里
   * application/controllers/ 控制器
   * application/views/ 视图层
   * application/views/ 视图层
   * application/library/ 扩展库


### 安装

* 获取源码
```shell
git clone https://gitee.com/hobbysh/one-page.git .
```

* 部署Docker环境
   * 全新编译
```shell
docker build -t hobbysh/one-page .
```
   * 镜像部署
```shell
docker run --name one-page -itd  \
    -v `pwd`/:/var/www/html \
    -v `pwd`/server/php/fpm/php.ini:/etc/php/8.1/fpm/php.ini \
    -v `pwd`/server/nginx/nginx.conf:/etc/nginx/nginx.conf \
    -v `pwd`/server/nginx/sites-enabled/:/etc/nginx/sites-enabled \
    -p 80:80 \
    -p 3306:3306 \
    hobbysh/one-page
```

### 使用

* 访问： http://127.0.0.1
* 管理模式： http://127.0.0.1/?mode=admin
* 生成静态文件： http://127.0.0.1/?mode=export ，根目录会生成 index.html

* 复制3个文件到静态内容提供商，即可访问
   * index.html
   * asset/js/main.js
   * asset/css/style.css


### 前台演示

* https://www.ohcard.cn/

### 管理模式截图
<p align="center">
  <img src="https://onepage-1257029016.cos.ap-shanghai.myqcloud.com/screenshot/admin.png" width="45%" height="45%" alt="" />
  <img src="https://onepage-1257029016.cos.ap-shanghai.myqcloud.com/screenshot/admin-list.png" width="45%" height="45%" alt="" />
  <img src="https://onepage-1257029016.cos.ap-shanghai.myqcloud.com/screenshot/admin-data.png" width="45%" height="45%" alt="" />
  <img src="https://onepage-1257029016.cos.ap-shanghai.myqcloud.com/screenshot/admin-config.png" width="45%" height="45%" alt="" />
  <img src="https://onepage-1257029016.cos.ap-shanghai.myqcloud.com/screenshot/admin-wechat.png" width="45%" height="45%" alt="" />
</p>

### 微信云托管
<p align="center">
  <img src="https://onepage-1257029016.cos.ap-shanghai.myqcloud.com/screenshot/wxcloud-step1.png" width="45%" height="45%" alt="" />
  <img src="https://onepage-1257029016.cos.ap-shanghai.myqcloud.com/screenshot/wxcloud-step2.png" width="45%" height="45%" alt="" />
  <img src="https://onepage-1257029016.cos.ap-shanghai.myqcloud.com/screenshot/wxcloud-step3.png" width="45%" height="45%" alt="" />
</p>

### 官网

[一页网](https://gitee.com/hobbysh/one-page)
<https://gitee.com/hobbysh/one-page>

### 支持

Hobby 2021293@qq.com
