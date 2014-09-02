# Homeowork 01 - Benchmarking

1. __Benchmark a compute node on Janus using triad__

	1. Use the triad makefile to build to code on a compile node

			once you have build `triad.exe`, you can run a single experiment by passing the value of `N` as an input.  You can run this on the command line by typing:
			
			```
			echo 10 | ./triad.exe
			```

			You will see the following output.

			```
			Length:           10    MFLOP/s:    1728.43411262444 
			```

	2. Create a job script
	
			- Requests 1 node and 12 cores
			- Executes  `triad.exe` for the following N values:
			```
			10, 50, 100, 500, 1e3, 5e3, 1e4, 5e4, 1e5, 5e5, 1e6, 5e6, 1e7, 5e7, 1e8, 5e8, 1e9
			```

	3. Test2
   
2. __Reduction - write your own benchmark__ 
3. __Dependency - write your own benchmark__
