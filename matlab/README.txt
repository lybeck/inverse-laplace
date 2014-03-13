
This document contains brief instructions for the use of the MATLAB files.


There are a total of 8 files related to this project work. Four of these are ment as runnable files, and four are helper functions. The documentation in the helper files contains all there is to know of them. The function of the four runnable files will be explained.

laplace_data.m
The file will create simulated measurement data for the inverse problem. The data is stored in a folder called 'data', which is created if it doesn't exist. THIS FILE MUST BE RUN BEFORE THE OTHER RUNNABLES, AS THE DATA CREATED HERE IS USED IN THEM!

myinvlaplace.m
The file creates the reconstruction of the simulated measurement data with different values of the regularization parameter alpha. The results are displayed, and the reconstruction with the least relative error is plotted.

laplace_plot.m
The file displays the plot of the fourier transform of the given function. It also displays an example of the simulated measurement data.

laplace_cond.m
The file plots information about the condition of the coefficient matrix used in the inverse Laplace transform.

