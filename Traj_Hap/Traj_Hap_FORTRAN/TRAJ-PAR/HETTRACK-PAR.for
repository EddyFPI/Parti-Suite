C     PROGRAM TO GENERATE UNIFORM LOCATION OF HETERODOMAINS IN A RECTANGLE (PARALLEL PLATE). 
C     RECTANGLE HAS DIMENSIONS Y BY R WHERE Y IS ORTHOGONAL TO FLOW AND R IS IN DIRECTION OF FLOW 
C     THE HETDOMAINS ARE LOCATED AT UNIFORM SPACING IN EACH DIMENSION
C
      PROGRAM PARHETLOCATIONS
C     
      IMPLICIT NONE
C
      DOUBLE PRECISION XHET(10000000),YHET(10000000)
      DOUBLE PRECISION RHET(10000)
C
      DOUBLE PRECISION PI,XPAR,YPAR,RPAR,RHET0,RHET1,RHET2,AHET
      DOUBLE PRECISION R,R2,R3,R4,HM1,HM2,SCOV,SCOV0,SCOV2
      DOUBLE PRECISION X,Y,Z,X1,Y1,Z1,X2,Y2,Z2,X3,Y3,Z3,X4,Y4,Z4
      DOUBLE PRECISION THETA,THETA1,THETA2,THETA3,THETA4
      DOUBLE PRECISION PHI,PHI1,PHI2,PHI3,PHI4,DTHETA,DPHI
      DOUBLE PRECISION PHIOFF,A,B,C,DET,ARCL,NHETREAL,NHET2
      DOUBLE PRECISION Xm0,Ym0,ODD,ODD2,ODD3,D,COEFF,RNX,RNY
      DOUBLE PRECISION XP,YP,DX,DY,DX1,DY1,PAIR,DX2,DY2
C
      INTEGER I,J,K,L,M,N,NHET0,NHET1,NX,NY,HETCOUNT,HETMODE
      INTEGER NHETTILE,NTHETA,NPHI
C
      CHARACTER DUMMY*20       
C
      DATA PI/3.14159265359/
C
C     SET ORIGIN AT YPAR = 0 AND RPAR = 0
      Xm0 = 0.0
      Ym0 = 0.0
      
C     INPUT COLLECTOR SIZE (YPAR IS ORTHOGONAL TO FLOW, RPAR IS PARALLEL TO FLOW)
	YPAR = 2.0E-4
      RPAR = 2.0E-4
      
C     INPUT SURFACE COVERAGE 
      PRINT *,'BIMODAL DIST. HETERODOMAINS, INPUT SURFACE COVERAGE % AND
     & HETMODE'
      READ *, SCOV
      READ *, HETMODE
C     INPUT HETERODOMAIN SIZE
      PRINT *,'INPUT LARGE, MEDIUM AND SMALL HETERODOMAIN RADII'
      READ *, RHET0
      READ *, RHET1
      READ *, RHET2

C     TRANSFORM TO FRACTIONAL COVERAGE
      SCOV = SCOV/100.0  
      HETMODE = HETMODE
      
C     EQUIVALENT SURFACE COVERAGE CORRESPONDING TO UNIFORM HETERODOMAINS IS USED IN CALCULATION, EQUALS HALF OF BIMODAL SURFACE COVERAGE
      IF (HETMODE.EQ.1) THEN
          HM1 = 0.0
          HM2 = 0.0
      ELSEIF (HETMODE.EQ.5) THEN
          HM1 = 4.0
          HM2 = 0.0
      ELSEIF (HETMODE.EQ.9) THEN
          HM1 = 8.0
          HM2 = 0.0
      ELSEIF (HETMODE.EQ.73) THEN
          HM1 = 8.0
          HM2 = 64.0
      END IF
      SCOV0 = SCOV*(RHET0**2)/(RHET0**2+HM1*RHET1**2+HM2*RHET2**2)
      XPAR = RPAR
C     CALULATE NUMBER OF HETERODOMAINS REQUIRED
      NHET0 = NINT(SCOV0*(XPAR*YPAR)/(PI*RHET0**2.0))
      NHET1 = HM1*NHET0
      NHET2 = HM2*NHET0
      NHETREAL = NHET0

C     CALCULATE NUMBER OF EVENLY SPACED LINES IN EACH DIMENSION, THE INTERSECTIONS OF WHICH ARE HETERODOMAINS
C     NX = # LINES IN RPAR DIMENSION
      NX = NINT((NHETREAL*(XPAR/YPAR))**0.5)
C     NY = # LINES IN YPAR DIMENSION
	NY = NINT(NX*(YPAR/XPAR))
      
C     OPEN HETDOMAIN OUTPUT FILE
      OPEN (UNIT=1,FILE='PARHETDOMAINS.DAT',STATUS='REPLACE')
C     WRITE HEADER AND LABELS
      WRITE (1,1000) RPAR,SCOV,RHET0,RHET1,RHET2,NX,NY
      WRITE (1,1001) 
1000  FORMAT('RPAR= ',E14.8,2X,'SCOV= ',E14.8,2X,'RHET0= ',E14.8,2X,
     &'RHET1= ',E14.8,2X,'RHET2= ',E14.8,2X,'NX= ',I10,'NY= ',I10)
1001  FORMAT (' ID X(m) Y(m) RHET(m)')
1002  FORMAT (2X,I10,2X,E15.8,2X,E15.8,2X,E15.8)   
C
      OPEN (UNIT=2,FILE='NY.DAT',STATUS='REPLACE')
      WRITE (2,2001) 
2001  FORMAT (' NY')
2002  FORMAT (2X,I10,2X,I10)

C     CALCULATE LONGITUDINAL STEP IN RPAR 
	RNX=NX
      DX =  XPAR/RNX
C     CALCULATE ORTHOGONAL STEP IN YPAR 
	RNY=NY
      DY =  YPAR/RNY

C     RECALCULATE SCOV
      SCOV = (NHET0*RHET0**2.0+HM1*NHET0*RHET1**2.0
     &        +HM2*NHET0*RHET2**2)/(RPAR*YPAR) 
      PRINT *,'Number  XPAR (RPAR) DIMENSION: ',NX 
      PRINT *,'Number  YPAR DIMENSION: ',NY
      PRINT *,'Number of large hetdomains: ',NHET0
      PRINT *,'Number of medium hetdomains: ',NHET1
      PRINT *,'Number of small hetdomains: ',NHET2
      PRINT *,'Surface coverage: ',SCOV   
      PRINT *, 'TYPE IN YOUR FAVORITE CHARACTER TO CONTINUE'
      READ *,DUMMY
      
C     INITIALIZE HETDOMAIN COUNTER
      HETCOUNT = 0
C     SET INTEGRATOR OF HETERODOMAIN AREA TO ZERO
      AHET = 0.0
      XP = 0.0
      YP = 0.0 
C     GENERATE HETERODOMAINS
      DO I=1,NX+1           
C       CALCULATE OFFSET FOR Y COMPONENT BASED ON X LINE 
        L=2
        ODD = MOD(I,L)
        COEFF=0.0
        IF(ODD.GT.0) COEFF=0.5 !ONE LINE IF STATEMENT
C       CALCULATE X (R) COMPONENT
        XP = DX*(I-1)
C       CALCULATE Y COMPONENT
        DO K=1,NY+1
            YP = DY*(K-1)+COEFF*DY 
			DO J=1,HETMODE
				IF (J.EQ.1) THEN !GENERATE LARGE HETERODOMAIN
					XHET(J) = XP+Xm0
					YHET(J) = YP+Ym0
					RHET(J) = RHET0
                  ELSE !GENERATE MEDIUM AND SMALL HETERODOMAINS
                      DX1 = 1.0/3.0*DX
                      DX2 = 1.0/9.0*DX
                      DY1 = 1.0/3.0*DY
                      DY2 = 1.0/9.0*DY
                      IF (HETMODE.EQ.5) THEN !1:4 
                          D = 1
                          DPHI = 2.0*PI/HM1
                          PHI = (J-2)*(DPHI) + PI/4                     
                          XHET(J) = DX1*D*DCOS(PHI) + XP + Xm0
					    YHET(J) = DY1*D*DSIN(PHI) + YP + Ym0
					    RHET(J) = RHET1
                      ELSEIF (HETMODE.EQ.9) THEN !1:8 
                          M=2
                          PAIR = MOD(J,M)
                          IF (PAIR.GT.0) THEN
                              D = 1 !CATHETE
                          ELSE
                              D = (2**0.5) !HYPOTENUSE                     
                          END IF
                          DPHI = 2.0*PI/HM1
                          PHI = (J-1)*DPHI 
                          XHET(J) = DX1*D*DCOS(PHI) + XP + Xm0
                          YHET(J) = DY1*D*DSIN(PHI) + YP + Ym0
                          RHET(J) = RHET1
                      ELSEIF (HETMODE.EQ.73) THEN !1:8:64
                          M=2
                          PAIR = MOD(J,M)
                          IF (PAIR.GT.0) THEN
                              D = 1
                          ELSE
                              D = (2**0.5)                      
                          END IF 
                          IF (J.GE.2.AND.J.LE.9) THEN 
                              DPHI = 2.0*PI/HM1
                              PHI = (J-1)*DPHI
                              XHET(J) = DX1*D*DCOS(PHI) + XP + Xm0
                              YHET(J) = DY1*D*DSIN(PHI) + YP + Ym0
                              RHET(J) = RHET1
                           ELSEIF (J.GE.10.AND.J.LE.17) THEN 
                              PHI = (J-9)*DPHI 
                              XHET(J) = DX2*D*DCOS(PHI) + XHET(2)
                              YHET(J) = DY2*D*DSIN(PHI) + YHET(2)
                              RHET(J) = RHET2  
                           ELSEIF (J.GE.18.AND.J.LE.25) THEN 
                              PHI = (J-17)*DPHI 
                              XHET(J) = DX2*D*DCOS(PHI) + XHET(3)
                              YHET(J) = DY2*D*DSIN(PHI) + YHET(3)
                              RHET(J) = RHET2 
                           ELSEIF (J.GE.26.AND.J.LE.33) THEN 
                              PHI = (J-25)*DPHI 
                              XHET(J) = DX2*D*DCOS(PHI) + XHET(4)
                              YHET(J) = DY2*D*DSIN(PHI) + YHET(4)
                              RHET(J) = RHET2 
                           ELSEIF (J.GE.34.AND.J.LE.41) THEN 
                              PHI = (J-33)*DPHI 
                              XHET(J) = DX2*D*DCOS(PHI) + XHET(5)
                              YHET(J) = DY2*D*DSIN(PHI) + YHET(5)
                              RHET(J) = RHET2 
                           ELSEIF (J.GE.42.AND.J.LE.49) THEN 
                              PHI = (J-41)*DPHI 
                              XHET(J) = DX2*D*DCOS(PHI) + XHET(6)
                              YHET(J) = DY2*D*DSIN(PHI) + YHET(6)
                              RHET(J) = RHET2 
                           ELSEIF (J.GE.50.AND.J.LE.57) THEN 
                              PHI = (J-49)*DPHI 
                              XHET(J) = DX2*D*DCOS(PHI) + XHET(7)
                              YHET(J) = DY2*D*DSIN(PHI) + YHET(7)
                              RHET(J) = RHET2 
                           ELSEIF (J.GE.58.AND.J.LE.65) THEN 
                              PHI = (J-33)*DPHI 
                              XHET(J) = DX2*D*DCOS(PHI) + XHET(8)
                              YHET(J) = DY2*D*DSIN(PHI) + YHET(8)
                              RHET(J) = RHET2 
                          ELSEIF (J.GE.66.AND.J.LE.73) THEN 
                              PHI = (J-65)*DPHI 
                              XHET(J) = DX2*D*DCOS(PHI) + XHET(9)
                              YHET(J) = DY2*D*DSIN(PHI) + YHET(9)
                              RHET(J) = RHET2 
                          END IF
                      END IF 
                   ENDIF                      
C       	WRITE TO OUTPUT FILE
			WRITE (1,1002) J,XHET(J),YHET(J),RHET(J) 
		    END DO
            HETCOUNT = HETCOUNT + HM1 + HM2 
            AHET = (PI*RHET0**2.0) + (PI*RHET1**2)*HM1 + 
     &             (PI*RHET2**2)*HM2 + AHET      
        END DO
        WRITE (2,2002) I,NY
        PRINT *, 'NX= ',I,' NY= ',NY
      ENDDO 
      CLOSE(1)
      SCOV2 = AHET/(XPAR*YPAR)
      PRINT *, ' SCOV = ', SCOV
      PRINT *, ' SCOV2 = ', SCOV2
      PRINT *, ' HETCOUNT = ', HETCOUNT
	PRINT *, 'TYPE IN ANY OLD CHARACTER TO CONTINUE'
      READ *, DUMMY 
C        
      END PROGRAM PARHETLOCATIONS