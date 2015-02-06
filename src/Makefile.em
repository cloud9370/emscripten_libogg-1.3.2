CC=emcc
CFLAGS=-DHAVE_CONFIG_H -I. -I.. -I../include -O2 -Wall -ffast-math -fsigned-char

CXX=em++
CXXFLAGS=$(CFLAGS)

OBJS=framing.o bitwise.o

OGGLIB=libogg.a

LDFLAGS=

.PHONY: all clean

all: $(OGGLIB)

%.o:%.c
	$(CC) $(CFLAGS) -c -o $@ $<

$(OGGLIB): $(OBJS)
	emar cru $@ $(OBJS) $(LDFLAGS)
	emranlib $@


clean:
	rm -f $(OGGLIB)
	rm -f $(OBJS)
