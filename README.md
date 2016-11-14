mbed-cli on the docker

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
