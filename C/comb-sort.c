#include <stdio.h>
#include <stdbool.h>

void combSort(int arr[], int n) {
    float shrinkFactor = 1.3;
    int gap = n;
    bool swapped = true;

    while (gap > 1 || swapped) {
        gap = (int)(gap / shrinkFactor);
        if (gap < 1) gap = 1;

        swapped = false;

        for (int i = 0; i + gap < n; i++) {
            if (arr[i] > arr[i + gap]) {
                // Swap elements
                int temp = arr[i];
                arr[i] = arr[i + gap];
                arr[i + gap] = temp;
                swapped = true;
            }
        }
    }
}

void printArray(int arr[], int n) {
    for (int i = 0; i < n; i++)
        printf("%d ", arr[i]);
    printf("\n");
}

// Example usage
int main() {
    int arr[] = {5, 4, 3, 2, 1};
    int n = sizeof(arr) / sizeof(arr[0]);

    combSort(arr, n);

    printf("Sorted array: ");
    printArray(arr, n);

    return 0;
}
