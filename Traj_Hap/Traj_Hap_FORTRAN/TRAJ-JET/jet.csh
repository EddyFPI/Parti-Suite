#!/bin/tcsh

# directory with the executables
source /uufs/chpc.utah.edu/sys/pkg/mpich2/std_pgi/etc/mpich2.csh
setenv BINDIR "/uufs/chpc.utah.edu/common/home/u0638620/king1/bin"
setenv MPIDIR "/uufs/chpc.utah.edu/sys/pkg/mpich2/1.4.1p1p/bin"

#setenv MPIDIR "/uufs/arches/sys/pkg/mpich/std"
# number of particles
set NPART = $1
# number of processors to run on
set NPROC = $2
#@ NPROC1 = `expr $NPROC + 1` 

#echo NPROC1 $NPROC1

set NNODE = `cat $PBS_NODEFILE | uniq | wc -l`
#set NODEFILE=mm_nodes
set NODEFILE=$PBS_NODEFILE

# Don't change anything from here on
#---------------------------------------------------------------
set PROGRAM=$BINDIR/hetjet.o
set OUTPUTDIR=`pwd`

# prepare job list file
echo $NPART > job.list
@ IPART = 1
while ($IPART <= $NPART)
  echo $PROGRAM $NPART $IPART >> job.list
  @ IPART = $IPART + 1
end

echo Running and writing output to $OUTPUTDIR

#mpdboot -n $NNODE -r /usr/bin/rsh -f $NODEFILE
#sleep 10
# run in parallel
#$MPIDIR/bin/mpirun -np $NPROC -machinefile $NODEFILE $BINDIR/submit $OUTPUTDIR
#mpiexec -n $NPROC $BINDIR/submit $OUTPUTDIR

$MPIDIR/mpirun -launcher rsh -np $NPROC -machinefile $NODEFILE $BINDIR/submit $OUTPUTDIR
#mpdallexit

# File names to concatenate and length of headers (in line) to cut out
#set FILENAMES=(P3DDCTRAJATT P3DDCTRAJREM P3DDCTRAJEX P3DDCFLUXATT P3DDCFLUXREM P3DDCFLUXEX)
#set HEADLN=(2 2 2 5 5 5)
set FILENAMES=(HETJETFLUXATT HETJETFLUXREM HETJETFLUXEX HETJETFLUXTIME)
set HEADLN=(6 6 6 6 )

@ FILEID = 1
# stick headers to the final output files
foreach FILENAME ($FILENAMES)
#  echo $FILENAME
#  head -n $HEADLN[$FILEID] $FILENAME.1.OUT 
  head -n $HEADLN[$FILEID] $FILENAME.1.OUT > $FILENAME.OUT
  @ FILEID = $FILEID + 1
end

#exit

# concatenate output files and remove the intermediate ones
@ IPART = 1
while ($IPART <= $NPART)
  @ FILEID = 1
  foreach FILENAME ($FILENAMES)
    set NUMLNS=`wc -l $FILENAME.$IPART.OUT | cut -f 1 -d " "`
    @ NMLNS = $NUMLNS - $HEADLN[$FILEID]
#    echo nmlns $NMLNS $NUMLNS $HEADLN[$FILEID] $FILEID
    tail -n $NMLNS $FILENAME.$IPART.OUT > $FILENAME.$IPART.OUT.TMP
    cat $FILENAME.$IPART.OUT.TMP >> $FILENAME.OUT
    rm $FILENAME.$IPART.OUT $FILENAME.$IPART.OUT.TMP
    @ FILEID = $FILEID + 1
  end
  @ IPART = $IPART + 1
end
