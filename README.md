# CAMI NBC++
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

