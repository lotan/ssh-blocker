
SRC ?= ssh-blocker-pcre.c iplist.c ipset.c regex.c
OBJ ?= ssh-blocker
LIBS ?= -lpcre -lipset -lcap
CFLAGS ?= -O2 -g -D_FORTIFY_SOURCE=2 -pie -fPIE -Wl,-z,relro,-z,now
VERSION ?= $(shell git describe --tags)

$(OBJ): $(SRC)
		$(CC) $(CFLAGS) -Wall -Wextra -Wlogical-op -Wunused-macros \
		-Wstack-protector -fstack-protector -Wformat-security \
		-DVERSION=\"$(VERSION)\" \
		$(SRC) -o $@ $(LIBS)
