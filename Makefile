default: build

build:
	@$(CC) $(C_FLAGS) $(C_FILES) -o $(TARGET) && echo -e "Caso tenha erro com a interface, adicione a flag --no-unicode"

run: build
	@./$(TARGET)

clean:
	@[ -f $(TARGET) ] && rm $(TARGET) || exit

build_objects: main.o music.o interface.o handle.o game.o controles.o
	@$(CC) $(C_FLAGS) $(OBJECTS) -o $(TARGET)

clean_objects: build_objects
	@rm $(OBJECTS) $(TARGET) || exit

main.o:
	@$(CC) -c src/main.c $(C_FLAGS)

music.o:
	@$(CC) -c src/music.c $(C_FLAGS) 

interface.o:
	@$(CC) -c src/interface.c $(C_FLAGS)

handle.o:
	@$(CC) -c src/handle.c $(C_FLAGS)

game.o:
	@$(CC) -c src/game.c $(C_FLAGS)

controles.o:
	@$(CC) -c src/controles.c $(C_FLAGS)

TARGET=2048

CC=gcc

C_FILES=src/main.c      \
		src/game.c      \
		src/interface.c \
		src/controles.c	\
		src/handle.c \
		src/music.c

C_FLAGS=-lncurses  \
		-O2		   \
        -W         \
        -Wall      \
        -ansi      \
        -pedantic

OBJECTS=main.o 		\
		music.o		\
		interface.o \
		handle.o	\
		game.o		\
		controles.o
