#include "foo.h"
#include <stdlib.h>

struct Foo *makeFoo(int f) {
	struct Foo *newFoo = malloc(sizeof(struct Foo));
	newFoo->f = 0;
	return newFoo;	
}

void incFoo(struct Foo *foo) {
	foo->f++;
}
