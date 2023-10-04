# Set the compiler to Intel Fortran Compiler
FC = ifort
# Or if you're using MPI with ifort: 
# FC = mpiifort

# Set optimization flags for Intel
FFLAGS = -O3 -xHost -ip -parallel

# Remaining parts of the makefile stay unchanged
LMPI = #-lmpichf90
IDIR = #-I/coral/local/mpich64/include
LDIR = #-L/coral/local/mpich64/lib64
BIN = 3dmhd.exe
SRC = 3dmhd.f 3dmhdset.f 3dmhdsub.f
OBJ = 3dmhd.o 3dmhdset.o 3dmhdsub.o
$(BIN): $(OBJ)
	$(FC) $(FFLAGS) $(OBJ) $(LDIR) $(LMPI) -o $(BIN)
3dmhd.o: 3dmhdparam.f
3dmhdset.o: 3dmhdparam.f
3dmhdsub.o: 3dmhdparam.f
clean:
	rm -rf *.o $(BIN)
.f.o:
	$(FC) $(FFLAGS) -c $(IDIR) $*.f
