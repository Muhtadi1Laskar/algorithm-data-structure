#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>
#include <time.h>


bool is_sorted(int *a, int n) {
    while (--n >= 1)
    {
        if (a[n] < a[n - 1])
            return false;
    }
    return true;
}

void shuffle(int *a, int n) {
    int i, t, r;
    for (i = 0; i < n; i++)
    {
        t = a[i];
        r = rand() % n;
        a[i] = a[r];
        a[r] = t;
    }
}

void bogosort(int *a, int n) {
    while (!is_sorted(a, n))
    {
        shuffle(a, n);
    }
}

int main() {
    srand(time(NULL));

    int x[] = {1, 10, 9, 7, 3, 0};
    int i;
    int len = sizeof(x) / sizeof(x[0]);

    printf("Original Array:\n");
    for (i = 0; i < len; i++)
    {
        printf("%d ", x[i]);
    }
    printf("\n");

    printf("\nSorted Array:\n");
    bogosort(x, len);

    for (i = 0; i < len; i++)
    {
        printf("%d ", x[i]);
    }
    printf("\n");

    return 0;
}