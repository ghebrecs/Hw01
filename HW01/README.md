# Homework 01 - Benchmarking

1. __Benchmark a compute node on Janus using triad__

	1. Use the triad makefile to build to code on a compile node:
       `make`. Remember to compile it on one of the compile nodes,
       e.g. `janus-compile[1-4]`.
	
	   Once you have build `triad.exe`, you can run a single experiment
       by passing the value of `N` as an input.  You can run this on the
       command line by typing: 

	    ```
		echo 10 | ./triad.exe
		```

	    You will see the following output.

	    ```
		Length:           10    MFLOP/s:    1728.43411262444 
	    ```

	2. Create a job script that
	
		- Requests 1 node and 12 cores
		- Executes  `triad.exe` for the following N values:

		   ```
		   10, 50, 100, 500, 1e3, 5e3, 1e4, 5e4, 1e5, 5e5, 1e6, 5e6, 1e7, 5e7, 1e8, 5e8, 1e9
		   ```
	3. Create a comma separated file (`.csv`) named
        `triad.csv`. Please do not put any spaces after the commas and
        include the header key,value. Your file should look similar
        to this:
	    ```
	    Problem Size (N),walltime (s)
	    1, 621.00
	    10, 1591.334
	    100,3516.3370
	    ...
	    ```
	4. Plot

        Use your favorite plotting language to make a `triad.png`. plot
        of your data. Please include correctly labeled x and y axis
        and a title that include a description of the JANUS
        architecture. Here is the one from lab, please feel free to
        copy it if you'd like.
		
		```
		Performance vs Array Size \nIntel Xeon CPU X5660 @ 2.80GHz
        12288 KB Cache
		```
   
2. __Reduction - write your own benchmark__

   Copy the triad.f90 or write you own c code to benchmark (`reduce.c`):

	```
	s = 0.0
	for i = 0:N-1:
		s = s + A[i]*A[i]
	```

	Follow the same procedure above to create the results. e.g. `reduce.csv` and `reduce.png`

3. __Dependency - write your own benchmark__

   Copy the triad.f90 or write you own c code to benchmark (`depend.c`):

	```
	for i = 1:N-1:
		A[i] = A[i-1] + A[i]*A[i]
	```

	Follow the same procedure above to create the
    results. e.g. `depend.csv` and `depend.png`. 

4. __Submission through git__

   You will have your own private github repository.
