#!/usr/bin/env make -f

sources := $(wildcard com/vmonaco/bio/*.java) $(wildcard com/vmonaco/bio/events/*.java)
tmp_classes := $(wildcard com/vmonaco/bio/*.class) $(wildcard com/vmonaco/bio/events/*.class)
classes := $(subst $$,\$$,$(tmp_classes))

classpath := .:lib/jnativehook-2.1.0.jar:lib/commons-cli-1.4.jar

build : $(sources)
	javac -cp $(classpath) $(sources) -Xlint:deprecation

run : $(classes)
	java -cp $(classpath) com.vmonaco.bio.BioLogger

jar : build
	jar cvfm biologger.jar MANIFEST.MF com lib

runjar :
	java -jar biologger.jar

clean :
	rm -f $(classes)