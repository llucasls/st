# st version
VERSION = 0.9.2

# paths
PREFIX = /usr/local
MANPREFIX = $(PREFIX)/share/man

X11INC = /usr/local/include
X11LIB = /usr/local/lib

PKG_CONFIG = pkg-config

# includes and libs
INCS = -I$(X11INC) \
       `$(PKG_CONFIG) --cflags fontconfig` \
       `$(PKG_CONFIG) --cflags freetype2`
LIBS = -lm -lX11 -lutil -lXft \
       `$(PKG_CONFIG) --libs fontconfig` \
       `$(PKG_CONFIG) --libs freetype2`

# flags
CFLAGS = -O3
CPPFLAGS = -DVERSION=\"$(VERSION)\" -D_XOPEN_SOURCE=600 -D_BSD_SOURCE
STCFLAGS = $(INCS) $(CFLAGS) $(CPPFLAGS)
LDFLAGS = -L$(X11LIB) -Wl,-R$(X11LIB)
STLDFLAGS = $(LDFLAGS) $(LIBS)

# compiler and linker
CC = cc
