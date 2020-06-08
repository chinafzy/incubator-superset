## 版权和荣誉都归结于原作者
原版本有一点的使用不方便，尤其对于某墙国的人来说。

不过也请了在美国的小伙伴做了验证，也会遇到其它的一点问题，这个证明了原来的程序有一点的小问题。

因此，做了一点修订：
+ 墙国用户优化
+ docker的一点逻辑修订
+ 其它些许的代码优化
+ 加入了大数据的impyla和hive俩个驱动支持，参考`bin2/app-init.sh`

## 使用方式

### 启动
在目录下使用`docker-compose up`启动应用，或者更好的方式如下：
```bash
$ docker-compose up -d 

$ docker-compose logs -f
```
第一次启动会有五分钟以上的初始化，然后打开`http://localhost:8088`就可以访问，默认用户名/密码是**admin/amin**

### 停止服务
`docker-compose stop`

### 删除服务
`docker-compose down`会删除当前应用下的容器等等，但是不会删除volume，当前应用的数据都存放在volume里面。

### 删除服务的数据(volume)
```bash
$ docker volume ls
DRIVER              VOLUME NAME
local               incubator-superset_db_home
local               incubator-superset_node_modules
local               incubator-superset_redis
local               incubator-superset_superset_home

$ docker volume rm incubator-superset_db_home 
```

## 常见问题
### 页面登录后报错无权限
这个在第一次初始化时候容易发生，可以观察init组件是否成功完成。一般五分钟左右可以。

如果还不行，删除init服务，重新创建
```bash
$ docker rm -f superset_init

$ docker-compose up -d
```

### 缺少驱动
通过`pip`来安装插件来满足，
```bash
$ docker exec -it superset_app bash

$ pip install pyimpala
```

驱动插件的地址在这里可查询：https://superset.incubator.apache.org/installation.html#database-dependencies

安装插件过程里面需要注意俩点：
+ 部分的插件需要操作系统安装软件支持（这些可以去插件的github主业上查看，大部分的都是https://github.com/cloudera）
+ 部分的插件安装后需要重启
