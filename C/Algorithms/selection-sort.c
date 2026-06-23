#include <stdio.h>

void selectionSort(int array[], int size) {
    for(int i=0;i<size;i++) {
        int min = i;
        for(int j=i+1;j<size;j++) {
            if(array[j] < array[min]) {
                min = j;
            }
        }

        if(i != min) {
            int temp = array[i];
            array[i] = array[min];
            array[min] = temp;
        }
    }

    for(int i=0;i<size;i++) {
        printf("%d\t", array[i]);
    }
}

int main() {
    int array[] = {4, 2, 6, 2, 7, -45, 8};
    int size = sizeof(array) / sizeof(array[0]);

    selectionSort(array, size);

    return 0;
}