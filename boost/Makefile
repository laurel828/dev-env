
.PHONY: clean

TARGET = dateGMT

all : $(TARGET)

SRCS   = dateGMT.cpp
OBJS   = $(SRCS:.cpp=.o)

dateGMT : dateGMT.o
	g++ -o $@ $< -lpthread

%.o : %.cpp
	g++ -g -O0 -c $<

clean :
	rm -f $(TARGET) $(OBJS)
