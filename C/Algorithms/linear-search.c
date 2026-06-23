#include <stdio.h>

int linear_search(int array[], int size, int item) {
    for(int i=0;i<size;i++) {
        if(array[i] == item) {
            return i;
        }
    }
    return -1;
}

int main() {
    int array[] = {1, 2, 3, 4};
    int size = sizeof(array) / sizeof(array[0]);
    int item = 3;

    int result = linear_search(array, size, item);

    printf("%d\n", result);
    
    return 0;
}