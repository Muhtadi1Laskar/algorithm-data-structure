#include <stdio.h>

void swap(int array[], int i, int j) {
    int temp = array[i];
    array[i] = array[j];
    array[j] = temp;
}

void oddEvenSort(int array[], int size) {
    int isSorted = 0;

    while(isSorted == 0) {
        isSorted = 1;

        for(int i=1;i<size-1;i+=2) {
            if(array[i] > array[i+1]) {
                swap(array, i, i+1);
                isSorted = 0;
            }
        }
        for(int i=0;i<size-1;i+=2) {
            if(array[i] > array[i+1]) {
                swap(array, i, i+1);
                isSorted = 0;
            }
        }
    }
    
    for(int i=0;i<size;i++) {
        printf("%d\t", array[i]);
    }
}

int main() {
    int array[] = {5, 4, 3, 2, 1};
    int size = sizeof(array) / sizeof(array[0]);

    oddEvenSort(array, size);

    return 0;
}