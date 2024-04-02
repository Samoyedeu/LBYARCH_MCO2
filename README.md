This readme provides insights into the execution time of kernels in both C and Assembly kernels under different modes and vector sizes. Additionally, it includes analysis and screenshots for further reference.

---

# LBYARCH S12 MACHINE PROJECT #2
### 1-D Stencil of Vector X into Vector Y

Submitted by:
- Caasi, Samantha Nicole
- Jardenil, Aaron Randall

# Kernel Execution Time Analysis

- The following are the results of the execution time for kernels C and Assembly with the respective vector sizes of 2^20, 2^24, and 2^29. 2^30 is not supported on the machine used for the time test runs.

## Machine Specifications

- **Processor**: AMD Ryzen 7 3750H
- **RAM**: 12GB

## Debug Mode

| Vector Size (2^n) | C Execution Time (seconds) | Assembly x86-64 Execution Time (seconds) |
|----------------------|-----------------------------|------------------------------------|
| 2^20                 | 0.00733                     | 0.00460                            |
| 2^24                 | 0.10153                     | 0.05703                            |
| 2^29                 | 14.06253                    | 11.08720                           |

## Release Mode

| Vector Size (2^n) | C Execution Time (seconds) | Assembly x86-64 Execution Time (seconds) |
|----------------------|-----------------------------|------------------------------------|
| 2^20                 | 0.00390                     | 0.00447                            |
| 2^24                 | 0.05567                     | 0.05853                            |
| 2^29                 | 6.79227                     | 16.83447                           |

## Performance Analysis

- In debug mode, the assembly version consistently outperforms the C version across all vector sizes.
- However, in release mode, while the assembly version generally performs well, it shows significant degradation in performance for vector size 2^29 compared to the C version.
- The discrepancy in performance between debug and release modes suggests the importance of optimizing code for release builds.

## Program Output with Correctness Check

### C
![C Program Output](https://github.com/Samoyedeu/LBYARCH_MCO2/blob/master/c%20program%20output.png?raw=true)

### Assembly x86-64
![Assembly Program Output](https://github.com/Samoyedeu/LBYARCH_MCO2/blob/master/assembly%20program%20output.png?raw=true)

## Appendix

### Screenshot of Sheet 1 (Average Time for Release Mode)
![Average Time for Release Mode](https://github.com/Samoyedeu/LBYARCH_MCO2/blob/master/appendix1.png?raw=true)

### Screenshot of Sheet 2 (Average Time for Debug Mode)
![Average Time for Debug Mode](https://github.com/Samoyedeu/LBYARCH_MCO2/blob/master/appendix2.png?raw=true)

---
