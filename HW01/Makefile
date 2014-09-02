CC = icc
FC = ifort
LD = ifort

OPT = -Ofast -vec_report6 -simd -xhost

triad.exe: timing.o dummy.o triad.o
	$(LD) -o triad.exe timing.o dummy.o triad.o

triad.o: triad.f90
	$(FC) $(OPT) -c triad.f90

timing.o: timing.c
	$(CC) $(OPT) -c timing.c

dummy.o: dummy.c
	$(CC) $(OPT) -c dummy.c

clean:
	rm -f *.o triad.exe
