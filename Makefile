buildP = build
includeP = include
srcP = src

executable = $(buildP)/final

source = $(shell find ./$(srcP) -path ./src/steps/utils/dontcompile -prune -o -name '*.s' -print)

#objects = $(addprefix $(buildP), $(basename $(addprefix  $(dir $(source)), $(addsuffix .o , $(basename $(notdir $(source)))))))
objects = $(subst $(srcP),$(buildP),$(addsuffix .o ,$(basename $(source))))


flagsF = -I./$(includeP)

flagsI = -I./$(includeP) -g 

CC = as

%.o :
	$(CC) $(flagsI) $(subst $(buildP),$(srcP),$(addsuffix .s ,$(basename $@))) -c -o $@ 

$(executable):	$(objects) 
	ld $(flagsF) $^ -o $@

clean:
	rm $(shell find ./$(buildP) -name '*.o') ./$(buildP)/final

all: $(executable)
	@echo buildado

create:
	$(shell mkdir -p $(dir $(objects)))
	$(shell mkdir -p $(dir $(subst $(srcP),$(includeP), $(source))))

