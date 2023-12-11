#include <stdio.h>

void insertionSort(int array[], int size) {
    for(int i=1;i<size;i++) {
        int j=i-1;

        while(j>=0 && array[j] > array[j+1]) {
            int temp = array[j];
            array[j] = array[j+1];
            array[j+1] = temp;
            j--;
        }
    }

    for(int i=0;i<size;i++) {
        printf("%d\t", array[i]);
    }
}

int main() {
    int array[] = {4, -34, 6, 3, 6, 5, 6, 3};
    int size = sizeof(array) / sizeof(array[0]);

    insertionSort(array, size);

    return 0;
}