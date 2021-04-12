# AMOS INSTALATION

The main page for the AMOS software infastructure is http://amos.sourceforge.net/wiki/index.php/AMOS_Getting_Started

**REMEMBER:** All AMOS dependencies should be vailaible in the $PATH. So, if you are installing AMOS locally, remember to install each dependency with the --prefix option when running the configure file

````
./configure --prefix $HOME
````

### AMOS dependencies

- Jellyfish
- Shel csh
- MUMmer
- Perl library Statistics::Descriptive 
- Qt4 (it is not mandatory, and it is not required by the kmer_cov_plot script


### Shell csh

Mummer is an AMOS dependency. Mummer depends on the csh shell. However csh was replaced by tcsh. So you should install tcsh shhell and do a symbolic link from tcsh to csh

````
ln -s tsch csh
`````

### Perl library Statistics::Descriptive 

If you have a super-user account you could install this library via cpan (most recommended)

Otherwise, if you have a local perl installation you could use the following command

````
curl -sL https://cpanmin.us | $LOCAL_PERL_PATH/bin/perl - --notest -l $LOCAL_PERL_PATH Statistics::Descriptive

`````

### AMOS

AMOS can be downloaded from: https://sourceforge.net/projects/amos/

If during the *make chech* execution you encounter the error *"find-tandem.cc:243:3: error: ‘optarg’ was not declared in this scope"*. Then:

- Open the file: amos-3.1.0/src/Align/find-tandem.cc
- Add to the beginning of the file the following line:

````
#include <getopt.h>
`````





