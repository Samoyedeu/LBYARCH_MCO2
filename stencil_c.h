// Implement the C version
void stencil_c(int n, double* X, double* Y) {
    int i;
    for (i = 3; i < n - 3; i++) {
        Y[i] = X[i - 3] + X[i - 2] + X[i - 1] + X[i] + X[i + 1] + X[i + 2] + X[i + 3];
    }
}