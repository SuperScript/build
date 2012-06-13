
default: it

cctest: \
default.build \
cctest=x \
load \
cctest.o
	sh makefile.build default.build cctest cctest

cctest.o: \
default.o.build \
compile \
cctest.c \
cctest.h \
cctest1.h
	sh makefile.build default.o.build cctest.o cctest

cctest1.h: \
cctest1.h.build
	sh makefile.build cctest1.h.build cctest1.h 

compile: \
default.build \
conf-cc \
print-compile.sh \
systype \
warn-auto.sh
	sh makefile.build default.build compile compile

home: \
home.build
	sh makefile.build home.build home 

it: \
default.build \
it=d \
cctest \
shtest \
sysdeps
	sh makefile.build default.build it it

load: \
default.build \
conf-ld \
print-load.sh \
warn-auto.sh
	sh makefile.build default.build load load

makeinclude: \
default.build \
makeinclude.sh \
warn-auto.sh
	sh makefile.build default.build makeinclude makeinclude

makescrip: \
default.build \
warn-auto.sh \
print-makescrip.sh \
conf-scrip \
home
	sh makefile.build default.build makescrip makescrip

shtest: \
default.build \
shtest=s \
makeinclude \
makescrip \
warn-auto.sh \
shtest.sh \
shout.sh
	sh makefile.build default.build shtest shtest

sysdeps: \
default.build \
systype \
compile \
load
	sh makefile.build default.build sysdeps sysdeps

systype: \
default.build \
find-systype.sh \
trycpp.c \
x86cpuid.c
	sh makefile.build default.build systype systype

clean:
	rm -f \
	cctest \
	cctest.o \
	cctest1.h \
	compile \
	home \
	it \
	load \
	makeinclude \
	makescrip \
	shtest \
	sysdeps \
	systype
