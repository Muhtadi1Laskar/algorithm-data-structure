#include <stdio.h>

void gnomeSort(int array[], int size) {
    int index = 0;
    
    while(index < size) {
        if(index == 0) {
            index += 1;
        }
        else if(array[index] >= array[index-1]) {
            index++;
        }
        else {
            int temp = array[index];
            array[index] = array[index-1];
            array[index-1] = temp;
            index--;
        }
    }
}

int main() {
    int array[] = {5, 4, 3, 2, 1};
    int size = sizeof(array) / sizeof(array[0]);

    gnomeSort(array, size);

    for(int i=0;i<size;i++) {
        printf("%d\t", array[i]);
    }

    return 0;
}