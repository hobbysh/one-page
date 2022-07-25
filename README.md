# One-Page

### 前言

基于PHP Yaf的MVC扩展框架搭建一页网页制作展示系统，支持微服务部署、可视化编辑、多模板，可快速生成一页网页。

### 描述

基本yaf的一款PHP快速开发框架

### 技术

php yaf mysql
[![PHP Version](https://img.shields.io/badge/php-%3E%3D8.1-8892BF.svg)](http://www.php.net/)

### 模块目录

* server，docker服务器配置文件
* application，项目主要目录，开发主要在这里
* conf，服务器配置
* asset，js/css 文件
* vendor，第三方插件

* application/controllers/ 控制器
* application/views/ 视图层
* application/views/ 视图层
* application/library/ 扩展库


### 安装

```shell
docker build -t onepage .

docker run --name onepage -itd  \
    -v `pwd`/:/var/www/html \
    -v `pwd`/server/php/fpm/php.ini:/etc/php/8.1/fpm/php.ini \
    -v `pwd`/server/nginx/nginx.conf:/etc/nginx/nginx.conf \
    -v `pwd`/server/nginx/sites-enabled/:/etc/nginx/sites-enabled \
    -p 80:80 \
    -p 3306:3306 \
    onepage
```

### 使用

* 访问 http://127.0.0.1
* 管理模式 http://127.0.0.1/?mode=admin


### 官网

[一页网页](https://one-page.cc/)
<https://one-page.cc/>

### 支持

Hobby 2021293@qq.com
