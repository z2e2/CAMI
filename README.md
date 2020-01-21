# CAMI NBC++
## Set up the environment
###### This release requires the following dependencies to be available on the host machine:
- Jellyfish (http://www.genome.umd.edu/jellyfish.html), tested on v. 2.1.3
1. prepare the directory
```bash
mkdir CAMI
cd CAMI
git clone https://github.com/z2e2/CAMI
```
2. First, download NBC++ by 
```bash
git clone https://github.com/EESI/Naive_Bayes
```
3. Second, if g++ and boost are not installed, install them by
```
sudo apt install make g++ libboost-all-dev
```
4. then, compile the software by
```bash
make
```

## Run CAMI II Challenge
**Note: NBC++ is developed for both computing cluster and local computer but it will run much faster on computer cluster with parallelization.**
**In our case, we used [UNIVERSITY RESEARCH COMPUTING FACILITY](https://drexel.edu/research/urcf/) available at Drexel University. But all the job scripts can be adopted and run on other similar computing clusters**

1. We used our own database to train the NBC++ for CAMI II Challenge, the assembly_summary file and taxonomic tree is available in database_download directory. You can use `pipeline_1_download.sh` to download the data.

2. Train the model by pipeline_3 and pipeline_4 (change the path accordingly).

3. There are two files need to be created before classifying any samples. The kmer.txt file should contain the k-mer size of NBC++. I suggest you to run ```echo 15 > kmer.txt``` command to create this file. The file_init.txt should contain the sample file you want to classify. For example, if you want to classify sample s4 in marine challenge. Then you can specify the filename (the tar file of shortreads sample 4 file in marine challenge) in file_init.txt. Let's say it's "/home/data/marine/s4.gz". Then you can run command "echo /home/data/marine/s4.gz > file_init.txt" to create the file_init.txt file. This file basically specify the filename of sample to classify (and assuming it's *.gz). 

4. Use pipeline_5_classify_run_all.sh to submit array jobs to classify a sample in parallel.

5. formatting can be taken care of by pipeline6-8.    
The raw output from pipeline 6:
```
readid1\ttaxid1
readid2\ttaxid2
...
```
