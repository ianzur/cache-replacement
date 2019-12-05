#!/bin/bash

# Todo: make this relative to the parent dir of the repo
# add benchmarck in the style "name,<path_to_binary>,input arguments"
bm[1]="sha512sum,/usr/bin/sha512sum,/home/irz0002/Projects/compass/cache-replacement/benchmarks/benchmarks/inputs/example-sha-input.txt"
bm[2]="10queens,/home/irz0002/Projects/compass/cache-replacement/benchmarks/benchmarks/queens,-c 10"
bm[3]="BFS,/home/irz0002/Projects/compass/cache-replacement/benchmarks/benchmarks/BFS,-o test.txt -r 12 /home/irz0002/Projects/compass/cache-replacement/benchmarks/benchmarks/inputs/Power1000.graph"
bm[4]="84x84matrixmult,/home/irz0002/Projects/compass/cache-replacement/benchmarks/benchmarks/blocked-matmul,"

rps=("FIFO" "LRU" "MRU" "RRIP" "Random" "SecondChance")

# for each benchmark
for index in 1 2 3 4
do 
    IFS=","
    set -- ${bm[$index]}

    # for each replacement policy
    for replacement_policy in ${rps[*]}
    do
        printf "benchmarking with ${1} for ${replacement_policy} replacement policy \n"

        # this caveman strat seems to do the job, cheers
        # create a temp file with the replacement policy hard coded.
        # everytthing else i tried didn't seem to work... this does  ¯\_(ツ)_/¯, check : `m5out/config.ini`
        sed "s/Replace-this-from-bash-script-lol/${replacement_policy}/g" gem5/configs/cache_replacement_project/caches.py > gem5/configs/cache_replacement_project/caches_tmp.py

        # two_level.py imports caches_tmp 
        # !! so you MUST do the previous step !! 

        # log redirected to a filename like so
        gem5/build/X86/gem5.opt -r --stdout-file="log_${replacement_policy}_${1}.txt"\
            gem5/configs/cache_replacement_project/two_level.py \
            $2 --o "${3}"

        # rename config file (setup from from each run) so each run can be verified
        cp ./m5out/config.ini ./m5out/config/${replacement_policy}_${1}_config.ini
        cp ./m5out/config.json ./m5out/config/${replacement_policy}_${1}_config.json

        cp ./m5out/stats.txt ./m5out/stats/${replacement_policy}_${1}_stats.txt


    done

done
