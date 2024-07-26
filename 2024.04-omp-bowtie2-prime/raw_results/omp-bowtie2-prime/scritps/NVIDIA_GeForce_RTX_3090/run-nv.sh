#!/bin/bash
echo "=============="
cd /home/isfiligoi/github/omp-bowtie2-prime-nvcc/
source setup_omp_nvc.sh
echo "=============="

cd /home/isfiligoi/github/omp-bowtie2-prime-cpu/omp-bowtie2-prime
echo "#./bowtie2-omp -p 1024 --no-exact-upfront --no-1mm-upfront -x ${DBPATH} -q ${INPATH} --seed 42 --very-sensitive -k 16 --np 1 --mp "1,1" --rdg "0,1" --rfg "0,1" --score-min  "L,0,-0.05" --no-head --no-unal |wc"
echo "==== CPU 1 =========="
rm -f a.saml
time taskset -c 0-15 ./bowtie2 -p 1024 --no-exact-upfront --no-1mm-upfront -x ${DBPATH} -q ${INPATH} --seed 42 --very-sensitive -k 16 --np 1 --mp "1,1" --rdg "0,1" --rfg "0,1" --score-min  "L,0,-0.05" --no-head --no-unal |wc
echo "==== CPU 2 =========="
rm -f a.saml
time taskset -c 16-31 ./bowtie2 -p 1024 --no-exact-upfront --no-1mm-upfront -x ${DBPATH} -q ${INPATH} --seed 42 --very-sensitive -k 16 --np 1 --mp "1,1" --rdg "0,1" --rfg "0,1" --score-min  "L,0,-0.05" --no-head --no-unal |wc
echo "=============="

cd /home/isfiligoi/github/omp-bowtie2-prime-cpu/omp-bowtie2-prime-no2
echo "#./bowtie2-omp-no2 -p 1024 --no-exact-upfront --no-1mm-upfront -x ${DBPATH} -q ${INPATH} --seed 42 --very-sensitive -k 16 --np 1 --mp "1,1" --rdg "0,1" --rfg "0,1" --score-min  "L,0,-0.05" --no-head --no-unal |wc"
echo "==== CPU 1 =========="
rm -f a.saml
time taskset -c 0-15 ./bowtie2 -p 1024 --no-exact-upfront --no-1mm-upfront -x ${DBPATH} -q ${INPATH} --seed 42 --very-sensitive -k 16 --np 1 --mp "1,1" --rdg "0,1" --rfg "0,1" --score-min  "L,0,-0.05" --no-head --no-unal |wc
echo "==== CPU 2 =========="
rm -f a.saml
time taskset -c 16-31 ./bowtie2 -p 1024 --no-exact-upfront --no-1mm-upfront -x ${DBPATH} -q ${INPATH} --seed 42 --very-sensitive -k 16 --np 1 --mp "1,1" --rdg "0,1" --rfg "0,1" --score-min  "L,0,-0.05" --no-head --no-unal |wc
echo "=============="

cd /home/isfiligoi/github/omp-bowtie2-prime-gpu/omp-bowtie2-prime-no2
echo "#./bowtie2-omp-gpu-no2 -p 4094 --no-exact-upfront --no-1mm-upfront -x ${DBPATH} -q ${INPATH} --seed 42 --very-sensitive -k 16 --np 1 --mp "1,1" --rdg "0,1" --rfg "0,1" --score-min  "L,0,-0.05" --no-head --no-unal |wc"
echo "==== CPU 1 GPU 1 =========="
rm -f a.saml
time taskset -c 0-15 ./bowtie2 -p 4096 --no-exact-upfront --no-1mm-upfront -x ${DBPATH} -q ${INPATH} --seed 42 --very-sensitive -k 16 --np 1 --mp "1,1" --rdg "0,1" --rfg "0,1" --score-min  "L,0,-0.05" --no-head --no-unal |wc
echo "==== CPU 2 GPU 1 =========="
rm -f a.saml
time taskset -c 16-31 ./bowtie2 -p 4096 --no-exact-upfront --no-1mm-upfront -x ${DBPATH} -q ${INPATH} --seed 42 --very-sensitive -k 16 --np 1 --mp "1,1" --rdg "0,1" --rfg "0,1" --score-min  "L,0,-0.05" --no-head --no-unal |wc
echo "=============="

