# lcm-make
A tool to generate java files from LCM messages and make them decodable to lcm-spy

# Installation
Put ```Makefile``` in any directory that contains an ```lcmtypes/``` folder. Put ```.lcm``` files into the ```lcmtypes/``` folder.

# Usage
Run ```make lcm-spy``` to generate the ```.jar``` file (if it is not already up-to-date), set all ```.jar``` files in the java class path, and run lcm-spy.

Run ```make``` to generate the ```.jar``` file without running lcm-spy.

Run ```make clean``` to remove any files created by this makefile.

# Acknowledgement
Much of this file is taken from UMich EECS 599  https://robotics.umich.edu/academic-program/courses/rob599-f19/homework6/.
