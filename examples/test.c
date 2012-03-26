#include <stdlib.h>
#include <stdio.h>

int main(int argc, char **argv) {
	int x = 10;
	void print_nested() {
		int y = 20;
		void print_nested2() {
			printf("%d %d", x, y);
		}
		print_nested2();
	}
	print_nested();
}

