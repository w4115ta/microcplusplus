#include "foo.h"
#include <stdlib.h>
#include <stdio.h>

void initFoo(struct Foo *foo) {
	printf("Foo inited!\n");
	foo->f = 0;
}

void incFoo(struct Foo *foo) {
	printf("Foo incremented!\n");
	foo->f++;
}
