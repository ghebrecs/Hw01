!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
! triad.f90 benchmark demo code
! G. Hager, 2010
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
PROGRAM triad
  IMPLICIT NONE

  DOUBLE PRECISION, DIMENSION(:),ALLOCATABLE :: A,B,C,D
! Intel-specific: 16-byte alignment of allocatables
!DEC$ ATTRIBUTES ALIGN: 16 :: A
!DEC$ ATTRIBUTES ALIGN: 16 :: B
!DEC$ ATTRIBUTES ALIGN: 16 :: C
!DEC$ ATTRIBUTES ALIGN: 16 :: D
  DOUBLE PRECISION :: MFLOPS,WT
  INTEGER :: N,i
  INTEGER(kind=8) :: R

  READ *,N

  ALLOCATE(A(1:N),B(1:N),C(1:N),D(1:N))

  DO i=1,N
     A(i) = 0.d0; B(i) = 1.d0
     C(i) = 2.d0; D(i) = 3.d0
  ENDDO

  R = 1

  ! warm up
  CALL do_triad(A,B,C,D,N,R,WT)

  DO
     CALL do_triad(A,B,C,D,N,R,WT)
     ! exit if duration was above some limit
     IF(WT.GE.0.2d0) EXIT
     ! else do it again with doubled repeat count
     R = R*2
  ENDDO

  MFLOPS = R*N*2.d0/(WT*1.d6) ! compute MFlop/sec rate
  PRINT *, "Length: ",N,"   MFLOP/s: ",MFLOPS
  DEALLOCATE(A,B,C,D)
END PROGRAM triad

SUBROUTINE do_triad(A,B,C,D,N,R,WT)
  IMPLICIT NONE
  INTEGER, INTENT(in) :: N
  INTEGER(kind=8), INTENT(in) :: R
  DOUBLE PRECISION, DIMENSION(N), INTENT(out) :: A
  DOUBLE PRECISION, DIMENSION(N), INTENT(in) :: B,C,D
  DOUBLE PRECISION, INTENT(out) :: WT
  DOUBLE PRECISION :: S,E
  INTEGER :: N2
  ! assume 4MB outer level cache
  INTEGER, PARAMETER :: CACHE_LIMIT=131072
  INTEGER :: i
  INTEGER(kind=8) :: j

  N2 = N/2

  CALL get_walltime(S)
  
  IF(N.LE.CACHE_LIMIT) THEN
     DO j=1,R
! Intel-specific: Assume aligned moves
!DEC$ vector aligned
!DEC$ vector temporal
        DO i=1,N
           A(i) = B(i) + C(i) * D(i)
        ENDDO
        ! prevent loop interchange
        IF(A(N2).LT.0) CALL dummy(A,B,C,D)
     ENDDO
  ELSE
     DO j=1,R
! Intel-specific: Assume aligned moves
!DEC$ vector aligned
!DEC$ vector nontemporal
        DO i=1,N
           A(i) = B(i) + C(i) * D(i)
        ENDDO
        ! prevent loop interchange
        IF(A(N2).LT.0) CALL dummy(A,B,C,D)
     ENDDO
  ENDIF
  
  CALL get_walltime(E)
  
  WT = E-S

END SUBROUTINE do_triad

