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
**Note: NBC++ is developed for both computing cluster and local computer but it will run much faster on computer cluster with parallelization. **
**In our case, we used [UNIVERSITY RESEARCH COMPUTING FACILITY](https://drexel.edu/research/urcf/) available at Drexel University. But all the job scripts can be adopted and run on other similar computing clusters**

1. We used our own database to train the NBC++ for CAMI II Challenge, the assembly_summary file and taxonomic tree is available in database_download directory. You can use `pipeline_1_download.sh` to download the data.

