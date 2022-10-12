# tabbed - tabbing interface
# See LICENSE file for copyright and license details.

include config.mk

SRC = tabbed.c xembed.c
OBJ = ${SRC:.c=.o}
BIN = ${OBJ:.o=}

all: options ${BIN}

options:
	@echo tabbed build options:
	@echo "CFLAGS   = ${CFLAGS}"
	@echo "LDFLAGS  = ${LDFLAGS}"
	@echo "CC       = ${CC}"

.c.o:
	${CC} -c ${CFLAGS} $<

${OBJ}: config.h config.mk

config.h:
	cp config.def.h $@

.o:
	${CC} -o $@ $< ${LDFLAGS}

clean:
	rm -f ${BIN} ${OBJ} tabbed-${VERSION}.tar.gz

dist: clean
	mkdir -p tabbed-${VERSION}
	cp -R LICENSE Makefile README config.def.h config.mk \
		tabbed.1 xembed.1 arg.h ${SRC} tabbed-${VERSION}
	tar -cf tabbed-${VERSION}.tar tabbed-${VERSION}
	gzip tabbed-${VERSION}.tar
	rm -rf tabbed-${VERSION}

install: all
	mkdir -p "${DESTDIR}${PREFIX}/bin"
	cp -f ${BIN} "${DESTDIR}${PREFIX}/bin"
	chmod 755 "${DESTDIR}${PREFIX}/bin/tabbed"
	mkdir -p "${DESTDIR}${MANPREFIX}/man1"
	sed "s/VERSION/${VERSION}/g" < tabbed.1 > "${DESTDIR}${MANPREFIX}/man1/tabbed.1"
	chmod 644 "${DESTDIR}${MANPREFIX}/man1/tabbed.1"
	sed "s/VERSION/${VERSION}/g" < xembed.1 > "${DESTDIR}${MANPREFIX}/man1/xembed.1"
	chmod 644 "${DESTDIR}${MANPREFIX}/man1/xembed.1"

uninstall:
	rm -f "${DESTDIR}${PREFIX}/bin/tabbed"\
		"${DESTDIR}${PREFIX}/bin/xembed"\
		"${DESTDIR}${MANPREFIX}/man1/tabbed.1"\
		"${DESTDIR}${MANPREFIX}/man1/xembed.1"

.PHONY: all options clean dist install uninstall
