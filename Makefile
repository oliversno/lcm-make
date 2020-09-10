# Find the  java LCM library
lcm_jar := $(shell dirname $(shell which lcm-gen))/../share/java/lcm.jar

# Where the .lcm files are located, also where $OBJ will be made
OBJ_DIR := lcmtypes

# The .jar with all the custom .lcm types
OBJ := $(OBJ_DIR)/lcmtypes.jar

build: $(OBJ)

# Instructions to make the lcmtypes.jar file from a set of .lcm files
$(OBJ): $(OBJ_DIR)/*.lcm
	cd $(OBJ_DIR) && lcm-gen -j *.lcm && \
	cd exlcm && javac -cp $(lcm_jar) *.java && \
	cd .. && jar cf lcmtypes.jar exlcm/*.class 

# Running the tool lcm-spy requires $OBJ to exist and be up to date
lcm-spy: $(OBJ)
	export CLASSPATH=$(shell find "." -name '*.jar' | xargs echo | tr ' ' ':') && \
	lcm-spy

# make clean
clean:
	rm $(OBJ) $(OBJ_DIR)/exlcm/*.java $(OBJ_DIR)/exlcm/*.class
