# xautolock — build desde fuente

`xautolock` no está empaquetado en Debian. Se compila desde fuente.

## Build deps

```bash
sudo apt install -y libxss-dev libx11-dev libxext-dev build-essential
```

## Compilar e instalar

```bash
git clone --depth 1 https://github.com/l0b0/xautolock.git /tmp/xautolock
cd /tmp/xautolock

# xautolock usa Imake (obsoleto). Se compila con Makefile manual:
cat > Makefile << 'EOF'
CC = gcc
CFLAGS = -Iinclude -DHasScreenSaver -DHasVFork -DSYSV -O2
LDFLAGS = -lXss -lX11 -lXext
SRCDIR = src

OBJS = $(SRCDIR)/xautolock.o $(SRCDIR)/engine.o $(SRCDIR)/diy.o \
       $(SRCDIR)/message.o $(SRCDIR)/options.o $(SRCDIR)/state.o

all: xautolock

xautolock: $(OBJS)
	$(CC) -o $@ $(OBJS) $(LDFLAGS)

$(SRCDIR)/xautolock.o: $(SRCDIR)/xautolock.c
	$(CC) $(CFLAGS) -c $< -o $@

$(SRCDIR)/engine.o: $(SRCDIR)/engine.c
	$(CC) $(CFLAGS) -c $< -o $@

$(SRCDIR)/diy.o: $(SRCDIR)/diy.c
	$(CC) $(CFLAGS) -c $< -o $@

$(SRCDIR)/message.o: $(SRCDIR)/message.c
	$(CC) $(CFLAGS) -c $< -o $@

$(SRCDIR)/options.o: $(SRCDIR)/options.c
	$(CC) $(CFLAGS) -c $< -o $@

$(SRCDIR)/state.o: $(SRCDIR)/state.c
	$(CC) $(CFLAGS) -c $< -o $@

clean:
	rm -f $(OBJS) xautolock

install: xautolock
	install -m 755 xautolock /usr/local/bin/
EOF

make && sudo make install
rm -rf /tmp/xautolock
```

## Verificar

```bash
which xautolock && xautolock -version
# Debe mostrar: /usr/local/bin/xautolock y version 2.2
```

## Flag `-DSYSV`

Es necesario porque el código usa `union wait` (obsoleto en Linux moderno). `-DSYSV` hace que use `int status` y `waitpid()` en lugar de `wait3()`.

## Notas

- Versión actual: **2.2** (commit único del repo, no hay tags)
- El binario se instala en `/usr/local/bin/xautolock`
- `xautolock` no se daemoniza solo — se lanza con `&` en background
- Se inicia desde i3 config con: `exec --no-startup-id xautolock -time 10 -locker "i3lock -i ..." -detectsleep &`
