# paths
PREFIX = /usr/local
MANPREFIX = ${PREFIX}/share/man
DOCPREFIX = ${PREFIX}/share/doc/${NAME}

# use system flags.
TABBED_CFLAGS = -I/usr/X11R6/include -I/usr/include/freetype2 ${CPPFLAGS}
TABBED_LDFLAGS = -L/usr/X11R6/lib -lX11 /usr/X11R6/lib ${LDFLAGS}
TABBED_CPPFLAGS = -DVERSION=\"${VERSION}\" -D_DEFAULT_SOURCE

# OpenBSD (uncomment)
#TABBED_CFLAGS = -I/usr/X11R6/include -I/usr/X11R6/include/freetype2 ${CPPFLAGS}
