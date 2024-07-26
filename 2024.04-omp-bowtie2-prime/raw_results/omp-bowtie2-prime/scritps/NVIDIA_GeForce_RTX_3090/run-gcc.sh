#!/bin/bash
echo "=============="
cd /home/isfiligoi/github
source setup_conda.sh
conda activate bowtie2-dev
export "CFLAGS=-isystem /panfs/isfiligoi/t8/ana3/envs/bowtie2-dev/include"
export "CXXFLAGS=-isystem /panfs/isfiligoi/t8/ana3/envs/bowtie2-dev/include"
export "CPPFLAGS=-isystem /panfs/isfiligoi/t8/ana3/envs/bowtie2-dev/include"
echo "=============="

cd /home/isfiligoi/github/bowtie2-new-wtiming/bowtie2
echo "#./bowtie2-new -p 16 --no-exact-upfront --no-1mm-upfront -x ${DBPATH} -q ${INPATH} --seed 42 --very-sensitive -k 16 --np 1 --mp "1,1" --rdg "0,1" --rfg "0,1" --score-min  "L,0,-0.05" --no-head --no-unal |wc"
echo "==== CPU 1 =========="
rm -f a.saml
time taskset -c 0-15 ./bowtie2 -p 16 --no-exact-upfront --no-1mm-upfront -x ${DBPATH} -q ${INPATH} --seed 42 --very-sensitive -k 16 --np 1 --mp "1,1" --rdg "0,1" --rfg "0,1" --score-min  "L,0,-0.05" --no-head --no-unal |wc
echo "==== CPU 2 =========="
rm -f a.saml
time taskset -c 16-31 ./bowtie2 -p 16 --no-exact-upfront --no-1mm-upfront -x ${DBPATH} -q ${INPATH} --seed 42 --very-sensitive -k 16 --np 1 --mp "1,1" --rdg "0,1" --rfg "0,1" --score-min  "L,0,-0.05" --no-head --no-unal |wc
echo "=============="

cd /home/isfiligoi/github/omp-bowtie2-prime-gcc/omp-bowtie2-prime
echo "#./bowtie2-omp-gcc -p 1024 --no-exact-upfront --no-1mm-upfront -x ${DBPATH} -q ${INPATH} --seed 42 --very-sensitive -k 16 --np 1 --mp "1,1" --rdg "0,1" --rfg "0,1" --score-min  "L,0,-0.05" --no-head --no-unal |wc"
echo "==== CPU 1 =========="
rm -f a.saml
time taskset -c 0-15 ./bowtie2 -p 1024 --no-exact-upfront --no-1mm-upfront -x ${DBPATH} -q ${INPATH} --seed 42 --very-sensitive -k 16 --np 1 --mp "1,1" --rdg "0,1" --rfg "0,1" --score-min  "L,0,-0.05" --no-head --no-unal |wc
echo "==== CPU 2 =========="
rm -f a.saml
time taskset -c 16-31 ./bowtie2 -p 1024 --no-exact-upfront --no-1mm-upfront -x ${DBPATH} -q ${INPATH} --seed 42 --very-sensitive -k 16 --np 1 --mp "1,1" --rdg "0,1" --rfg "0,1" --score-min  "L,0,-0.05" --no-head --no-unal |wc
echo "=============="

cd /home/isfiligoi/github/omp-bowtie2-prime-gcc/omp-bowtie2-prime-no2
echo "#./bowtie2-omp-gcc-no2 -p 1024 --no-exact-upfront --no-1mm-upfront -x ${DBPATH} -q ${INPATH} --seed 42 --very-sensitive -k 16 --np 1 --mp "1,1" --rdg "0,1" --rfg "0,1" --score-min  "L,0,-0.05" --no-head --no-unal |wc"
echo "==== CPU 1 =========="
rm -f a.saml
time taskset -c 0-15 ./bowtie2 -p 1024 --no-exact-upfront --no-1mm-upfront -x ${DBPATH} -q ${INPATH} --seed 42 --very-sensitive -k 16 --np 1 --mp "1,1" --rdg "0,1" --rfg "0,1" --score-min  "L,0,-0.05" --no-head --no-unal |wc
echo "==== CPU 2 =========="
rm -f a.saml
time taskset -c 16-31 ./bowtie2 -p 1024 --no-exact-upfront --no-1mm-upfront -x ${DBPATH} -q ${INPATH} --seed 42 --very-sensitive -k 16 --np 1 --mp "1,1" --rdg "0,1" --rfg "0,1" --score-min  "L,0,-0.05" --no-head --no-unal |wc
echo "=============="

