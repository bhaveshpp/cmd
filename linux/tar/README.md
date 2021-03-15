## Extrect tar file

To extract a `.tgz` file with tar you need to use,

    tar -xvzf /path/to/yourfile.tgz

where,

 - `x` for extract
 - `v` for verbose
 - `z` for gnuzip
 - `f` for file, should come at last just before file name.


You can use the following command in a terminal to unzip the file in your case,

    tar -xvzf /media/towhid/Amra/Software/Developing\ Soft/mongodb-linux-x86_64-2.6.3.tgz

****

### Extract a `.tgz` file in different directory:

One can use `-C` option to extract archive contents to a different directory as following,

    tar -xvzf /path/to/yourfile.tgz -C /path/where/to/extract/
