#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <windows.h>
#include "stencil_c.h"

#define N 10

// Implement the assembly version
extern double stencil_asm(int n, double* X, double* Y);

double get_execution_time(clock_t start, clock_t end) {
    return ((double)(end - start)) / CLOCKS_PER_SEC;
}

int main() {
    int i;
    clock_t start_time, end_time;

    // Length of vectors
    int lengths[] = { 1 << 20, 1 << 24, 1 << 29 }; // {2^20, 2^24, 2^29}
    int num_lengths = sizeof(lengths) / sizeof(lengths[0]);

    int j;
    srand((unsigned int)time(NULL)); // Seed the random number generator

    for (j = 0; j < num_lengths; j++) {
        int n = lengths[j];

        double* X = malloc(n * sizeof(double));
        double* Y = malloc(n * sizeof(double));

        // Initialize vector X with random values
        for (i = 0; i < n; i++) {
            X[i] = (double)(rand() % 100); // Random value between 0 and 99
        }

        printf("\nFirst ten values of X (Vector length %d):\n", n);
        for (i = 0; i < N; i++) {
            printf("%.2lf ", X[i]);
        }

        // Start timing for C implementation
        start_time = clock();

        // Call stencil function (C version)
        stencil_c(n, X, Y);

        // End timing for C implementation
        end_time = clock();


        printf("\n\nC Implementation");
        printf("\nTime taken for vector length %d: %lf seconds\n", n, ((double)(end_time - start_time)) / CLOCKS_PER_SEC);

        // Print the first ten values of vector Y (C implementation)
        printf("\nFirst ten values of vector Y:\n");
        for (i = 3; i < N + 3 && i < n; i++) {
            printf("%.2lf ", Y[i]);
        }
        // printf("\n\n - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -\n");

        // Reset vector Y to 0.0
        for (i = 0; i < n; i++) {
            Y[i] = 0.0;
        }

        // Start timing for assembly implementation
        start_time = clock();

        // Call stencil function (assembly version)
        stencil_asm(n, X, Y);

        // End timing for assembly implementation
        end_time = clock();

        printf("\n\nAssembly Implementation");
        printf("\nTime taken for vector length %d: %lf seconds\n", n, ((double)(end_time - start_time)) / CLOCKS_PER_SEC);

        // Print the first ten values of vector Y (assembly implementation)
        printf("\nFirst ten values of vector Y:\n");
        for (i = 3; i < N + 3 && i < n; i++) {
            printf("%.2lf ", Y[i]);
        }
        printf("\n\n - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -\n");

        // Free allocated memory
        free(X);
        free(Y);
    }

    return 0;
}