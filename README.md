[mbed-cli](https://github.com/ARMmbed/mbed-cli) on the docker

installation
============
``` sh
$ docker pull macrat/docker-mbed-cli
```

usage
=====
## make mbed project
``` sh
$ docker run --rm -v `pwd`:/src docker-mbed-cli new project-name
$ cd project-name
$ ls
```

## develop
``` sh
$ cat main.cpp
#include <mbed.h>

int main() {
	DigitalOut led(LED_GREEN);

	while(true){
		led = !led;
		delay(100);
	}
}
```

## compile
``` sh
	$ docker run --rm -v `pwd`:/src docker-mbed-cli compile -m BOARD_NAME
```
Please replace BOARD\_NAME with your board model name.

Compiled file will create into `~/.build/BOARD_NAME/GCC_ARM/`.

helper command
==============
The helper command is command for use docker-mbed-cli like a local command.

## installation
``` sh
$ git clone github.com:macrat/docker-mbed-cli.git
$ cd docker-mbed-cli/bin/
$ cp * /usr/local/bin/
```

## usage
You can use all subcommand of [mbed-cli](https://github.com/ARMmbed/mbed-cli).

Make project.
``` sh
$ mkdir PROJECT_NAME
$ cd PROJECT_NAME
$ mbed new .
```

Write program, and compile.
``` sh
$ mbed compile -m TARGET_NAME
```

## manage container
The helper command will start container, and reuse it.
It won't stopping container without your command.
If you want stop container, can you it by mbed-container command.

Command will make container for each project directory.
Please be careful if you make multiple projects.

``` sh
$ mbed-container status
not found

$ mbed-container start
$ mbed-container status
running

$ mbed-container stop
$ mbed-container status
not found
```
