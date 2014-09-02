CC = icc
FC = ifort
OPT = -Ofast -vec_report6 -simd

triad: timing.o dummy.o triad.f90
	$(FC) $(OPT) timing.o dummy.o triad.f90 -o triad  

timing.o: timing.c
	$(CC) $(OPT) -c timing.c

dummy.o: dummy.c
	$(CC) $(OPT) -c dummy.c

clean:
	rm -f *.o





