#include <stdio.h>

int binarySearch(int array[], int size, int item) {
    int l = 0;
    int r = size - 1;

    while(l<=r) {
        int mid = l + (r-l) / 2;

        if(array[mid] == item) {
            return mid;
        }
        else if(array[mid] > item) {
            r = mid - 1;
        }
        else {
            l = mid + 1;
        }
    }
    return -1;
}


int main() {
    int array[] = {1, 2, 3, 4};
    int size = sizeof(array) / sizeof(array[0]);
    int item = 1;

    int result = binarySearch(array, size, item);

    
    printf("%d\n", result);
    return 0;
}