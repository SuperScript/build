
default: \
it

rts: \
default.build \
rts=d \
atest.a \
cctest \
shtest
	sh makefile.build default.build rts rts

atest.a: \
default.a.build \
atest=l \
makelib \
cctest.o
	sh makefile.build default.a.build atest.a atest

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

it.rts: \
default.rts.build \
it.command
	sh makefile.build default.rts.build it.rts it

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

makelib: \
default.build \
print-ar.sh \
systype \
warn-auto.sh
	sh makefile.build default.build makelib makelib

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

systype: \
default.build \
find-systype.sh \
trycpp.c \
x86cpuid.c
	sh makefile.build default.build systype systype

it: \
default.build \
it=d \
build \
build-db
	sh makefile.build default.build it it

it.command: \
default.command.build \
it \
it=d
	sh makefile.build default.command.build it.command it

it.install: \
default.install.build \
it.command \
it=d
	sh makefile.build default.install.build it.install it

mkfile: \
mkfile.build \
mkfile=d \
it
	sh makefile.build mkfile.build mkfile 
