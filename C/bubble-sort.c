#include <stdio.h>

void bubbleSort(int array[], int size) {
    for(int i=0;i<size;i++) {
        for(int j=i+1;j<size;j++) {
            if(array[i] > array[j]) {
                int temp = array[i];
                array[i] = array[j];
                array[j] = temp;
            }
        }
    }

    for(int i=0;i<size;i++) {
        printf("%d\t", array[i]);
    }
}

int main() {
    int array[] = {2, 1, 3, 54, -3, 6, 9};
    int size = sizeof(array) / sizeof(array[0]);

    bubbleSort(array, size);

    return 0;
}