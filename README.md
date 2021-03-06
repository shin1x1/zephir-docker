# Zephir Docker container

[Docker Hub - shin1x1/zephir](https://registry.hub.docker.com/u/shin1x1/zephir/)

## boot2docker

I tested on [boot2docker](https://github.com/boot2docker/boot2docker).

```
$ boot2docker up
```

## Usage

### Install

```
$ docker pull shin1x1/zephir
$ docker run shin1x1/zephir

 _____              __    _
/__  /  ___  ____  / /_  (_)____
  / /  / _ \/ __ \/ __ \/ / ___/
 / /__/  __/ /_/ / / / / / /
/____/\___/ .___/_/ /_/_/_/
         /_/

Zephir version 0.5.9a

Usage:
        command [options]

(snip)
```

### Init

```
$ docker run -v `pwd`:/work shin1x1/zephir zephir init hoge
$ tree -L 1 hoge
hoge
├── config.json
├── ext
└── hoge
```

### Sample Code

```
$ vim hoge/hoge/foo.zep
namespace Hoge;

class Foo
{
    public static function hello()
    {
        echo "Hello\n";
    }
}

$ tree -L 1 hoge/hoge
hoge/hoge
└── foo.zep
```

### Build

```
$ cd hoge
$ docker run -v `pwd`:/work shin1x1/zephir zephir build
Preparing for PHP compilation...
Preparing configuration file...
Compiling...
Installing...
Extension installed!
Add extension=hoge.so to your php.ini
Don't forget to restart your web server

$ ls ext/modules
hoge.so
```

### enable hoge.so

```
$ docker run -v `pwd`:/work shin1x1/zephir php -d extension=/work/ext/modules/hoge.so -m hoge | grep hoge
hoge
```

### execute with hoge.so

```
$ docker run -v `pwd`:/work shin1x1/zephir php -d extension=/work/ext/modules/hoge.so -r 'Hoge\Foo::hello();'
Hello
```
