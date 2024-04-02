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
![C Program Output](https://github.com/Samoyedeu/LBYARCH_MCO2/blob/master/assembly%20program%20output.png?raw=true)

### Assembly x86-64
![Assembly Program Output](https://github.com/Samoyedeu/LBYARCH_MCO2/blob/master/assembly%20program%20output.png?raw=true)

## Appendix

### Screenshot of Sheet 1 (Average Time for Release Mode)
![Average Time for Release Mode](https://github.com/Samoyedeu/LBYARCH_MCO2/blob/master/appendix1.png?raw=true)

### Screenshot of Sheet 2 (Average Time for Debug Mode)
![Average Time for Debug Mode](https://github.com/Samoyedeu/LBYARCH_MCO2/blob/master/appendix2.png?raw=true)




---

This readme provides insights into the execution time of kernels in both C and Assembly kernels under different modes and vector sizes. Additionally, it includes analysis and screenshots for further reference.

Note:
1.) Write a C main program to call the kernels of the C version and x86-64 assembly language.
2.) Time the kernel portion only.  Both for debug mode and release mode.
3.) For each kernel version, time the process for vector size n = {220, 224, and  230}.  If 230 is impossible, you may reduce it to the point your machine can support (i.e.,  228 or 229).
4.) You must run at least 30 times for each version to get the average execution time. 
5.) For the data, you may initialize each vector with the same or different random value. 
6.) You will need to check the correctness of your output.  Thus, if the C version is your "sanity check answer key," then the output of the x86-64 version has to be checked with the C version and output correspondingly (i.e., the x86-64 kernel output is correct, etc.).
7.) Output in GitHub (make sure that I can access your Github):
a.) Github readme containing the following (debug and release mode; C and x86-64):
    	i.) comparative execution time and short analysis of the performance of the kernels
   	ii.) Take a screenshot of the program output with the correctness check (C).
   	iii.) Take a screenshot of the program output, including the correctness check (x86-64).
b.) Visual Studio project folder containing complete files (source code: C, x86-64, and all other required files) for others to load and execute your program.

