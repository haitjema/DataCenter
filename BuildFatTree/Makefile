VPATH = src:../src/model/common
TARGET  := BuildFatTree
SRCS    := connection.cc ethernet_node.cc ethernet_switch.cc fat_tree.cc main.cc node_id.cc server.cc
OBJS    := ${SRCS:.cc=.o} 
DEPS    := ${SRCS:.cc=.dep} 
XDEPS   := $(wildcard ${DEPS}) 

CC      = g++
CCFLAGS = -g -Wall -Werror 
LDFLAGS = 
LIBS    = 

.PHONY: all clean distclean 
all:: ${TARGET} 

ifneq (${XDEPS},) 
include ${XDEPS} 
endif 

${TARGET}: ${OBJS} 
	${CC} ${LDFLAGS} -o $@ $^ ${LIBS} 

${OBJS}: %.o: %.cc %.dep 
	${CC} ${CCFLAGS} -o $@ -c $< 

${DEPS}: %.dep: %.cc Makefile 
	${CC} ${CCFLAGS} -MM $< > $@ 

clean:: 
	-rm -f *~ *.o *.dep ${TARGET} 

distclean:: clean
