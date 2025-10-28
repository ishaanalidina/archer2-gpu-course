
<img src="./images/archer2_logo.png" align="left" width="284" height="80" />
<img src="./images/epcc_logo.png" align="right" width="248" height="66" />

<br /><br /><br /><br />

# Introduction to GPU programming with kernels

[![CC BY-NC-SA 4.0][cc-by-nc-sa-shield]][cc-by-nc-sa]

This short course will provide an introduction to GPU computing with kernels
aimed at scientific application programmers wishing to develop their own
software. The course will give a background on the difference between CPU
and GPU architectures as a prelude to introductory exercises in HIP
programming. The course will discuss the execution of kernels, memory
management, and shared memory operations. Common performance issues are
discussed and their solution addressed.

The course will go on to consider execution of independent streams, and
the execution of work composed as a collection of dependent tasks expressed
as a graph. Device management and details of device to device data transfer
will be covered for situations where more than one GPU device is available.

The course will not discuss programming with compiler directives, but does
provide a concrete basis of understanding of the underlying principles of
the HIP model which is useful for programmers ultimately wishing to make
use of OpenMP or OpenACC (or indeed other models). The course will not
consider graphics programming, nor will it consider machine learning
packages.

Note that the course is also appropriate for those wishing to use NVIDIA GPUs
via the CUDA API, although we will not specifically use CUDA.

Attendees must be able to program in C or C++ (course examples and
exercises will limit themselves to C++). A familiarity with threaded
programming models would be useful, but no previous knowledge of GPU
programming is required.

## Installation

For details of how to log into an ARCHER2 account, see the
[ARCHER2 quickstart for users.](https://docs.archer2.ac.uk/quick-start/quickstart-users/)

Check out the Git repository to your ARCHER2 account.
```bash
cd ${HOME/home/work}
git clone https://github.com/EPCCed/archer2-gpu-course.git
cd archer2-gpu-course
```

For the examples and exercises in the course, we will use the
AMD compiler driver. To access this
```bash
module load PrgEnv-amd
module load rocm
module load craype-accel-amd-gfx90a
module load craype-x86-milan
```

Check you can compile and run a very simple program
and submit the associated script to the queue system.
```bash
cd section-2.01
hipcc -x hip -std=c++11 -D__HIP_ROCclr__ --rocm-path=${ROCM_PATH}  -D__HIP_PLATFORM_AMD__ --offload-arch=gfx90a exercise_dscal.hip.cpp
sbatch submit.sh
```

The result should appear in a file `slurm-123456.out` in the working
directory.

Each section of the course is associated with a different directory, each
of which contains a number of example programs and exercise templates.
Answers to exercises generally re-appear as templates to later exercises.
Miscellaneous solutions also appear in the solutions directory.


## Timetable

The timetable may shift slightly in terms of content, but we will stick to
the advertised start and finish times, and the break times.


### Session 1: Foundations of GPU Programming
Goal: Understand the GPU architecture and programming model.

| Time  | Content                                  | Lesson                       |
|-------|------------------------------------------|------------------------------|
| 09:30 | Logistics, login, modules, local details | See above                    |
| 09:45 | Introduction                             |                              |
|       | Performance model; Graphics processors   | [Lesson 1.1](section-1.01)   |
| 10:30 | Morning break                            |                              |
| 11:00 | The CUDA/HIP programming model           |                              |
|       | Abstraction; host code and device code   | [Lesson 1.2](section-1.02)   |
| 12:00 | Close                                    |                              |

### Session 2: Core Programming Concepts
Goal: Learn how to write and execute basic GPU kernels.

| Time  | Content                                  | Lesson                       |
|-------|------------------------------------------|------------------------------|
| 09:30 | CUDA/HIP programming: memory management  |                              |
|       | `hipMalloc(), hipMemcpy()`               | [Lesson 2.1](section-2.01)   |
| 10:30 | Morning break                            |                              |
| 11:00 | Executing a kernel                       |                              |
|       | `__global__` functions `<<<...>>>`       | [Lesson 2.2](section-2.02)   |
| 12:00 | Close                                    |                              |

### Session 3: Memory Hierarchy Deep Dive
Goal: Explore different types of memory and their performance implications.

| Time  | Content                                  | Lesson                       |
|-------|------------------------------------------|------------------------------|
| 09:30 | Review previous exercises                |                              |
| 10:00 | Managed memory                           |                              |
|       | Exercise on managed memory               | [Lesson 3.1](section-2.04)   |
| 10:30 | Morning break                            |                              |
| 11:00 | Shared memory                            |                              |
|       | Exercise on vector product               | [Lesson 3.2](section-2.05)   |
| 11:30 | Constant memory                          |                              |
|       | All together: matrix-vector product      | [Lesson 3.3](section-2.06)   |
| 12:00 | Close                                    |                              |

### Session 4: Performance and Concurrency
Goal: Optimise performance and manage concurrent execution.

| Time  | Content                                  | Lesson                       |
|-------|------------------------------------------|------------------------------|
| 09:30 | Review previous exercises                |                              |
| 10:00 | Some performance considerations          |                              |
|       | Exercise on matrix operation             | [Lesson 4.1](section-2.03)   |
| 10:30 | Morning break                            |                              |
| 11:00 | Streams                                  |                              |
|       | Using `hipMempcyAsync()` etc             | [Lesson 4.2](section-4.01)   |
| 12:00 | Close                                    |                              |

### Session 5: Advanced Topics and Multi-GPU
Goal: Learn advanced APIs and multi-GPU management.

| Time  | Content                                  | Lesson                       |
|-------|------------------------------------------|------------------------------|
| 09:30 | Review previous exercises                |                              |
| 10:00 | Graph API                                |                              |
|       | Using `hipGraphLaunch()` etc             | [Lesson 5.1](section-4.02)   |
| 10:30 | Morning break                            |                              |
| 11:00 | Device management: more then one GPU     |                              |
|       | `hipMemcpy()` again                      | [Lesson 5.2](section-5.01)   |
| 11:30 | Putting it all together	               |                              |
|       | Conjugate gradient exercise              | [Homework](section-6.01)     |
| 12:00 | Close                                    |                              |


---
This work is licensed under a
[Creative Commons Attribution-NonCommercial-ShareAlike 4.0 International License][cc-by-nc-sa].

[cc-by-nc-sa]: http://creativecommons.org/licenses/by-nc-sa/4.0/
[cc-by-nc-sa-image]: https://licensebuttons.net/l/by-nc-sa/4.0/88x31.png
[cc-by-nc-sa-shield]: https://img.shields.io/badge/License-CC%20BY--NC--SA%204.0-lightgrey.svg

[![CC BY-NC-SA 4.0][cc-by-nc-sa-image]][cc-by-nc-sa]
