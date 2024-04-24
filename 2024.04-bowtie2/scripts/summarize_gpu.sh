#!/bin/bash

echo "#FM Index, Reads to be aligned, Bowtie2 Version, GPU used, Seed search"
for d in "WoLr1 -w1" "WoLr2 -w2" "RS210 -rs"; do
  d1=`echo "$d" | awk '{print $1}'`
  d2=`echo "$d" | awk '{print $2}'`
  for i in "Song53_24613_host_filtered s1" "Mousseau88_FIN_373_host_filtered m1" "Girguis50_RightEG4_host_filtered g1"; do
    i1=`echo "$i" | awk '{print $1}'`
    i2=`echo "$i" | awk '{print $2}'`

    for b in `(cd ../raw_results && ls -d omp*)`; do
      for c in `(cd ../raw_results/$b/data && ls -d *)`; do
        for f in `ls ../raw_results/$b/data/$c/*${i2}${d2}*.out 2>/dev/null`; do
          ./summarize_one_gpu.sh "$f" "${d1}, ${i1}, $b, $c"
        done
      done
    done

  done
done
