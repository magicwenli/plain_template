LATON = ./laton			# laton position
COMPILER = xelatex
SOURCEFILE = main.tex
WEBSITE = t.ywl.ink:2700
TARGET = $(SOURCEFILE:.tex=.pdf)

DIR_IMG = ./figures
DIR_INCLUDE = ./includefile

DEP_IMG = $(wildcard $(DIR_IMG)/*)
DEP_INCLUDE = $(wildcard $(DIR_INCLUDE)/*)
DEP_STY = $(wildcard *.cls)
DEP_TEX = $(wildcard *.tex)
DEP_TEX := $(filter-out $(SOURCEFILE),$(DEP_TEX))

$(TARGET):
	~/laton -d $(WEBSITE) -c $(COMPILER) -o $(TARGET) $(SOURCEFILE) $(DEP_IMG) $(DEP_INCLUDE) $(DEP_STY) $(DEP_TEX)
#	@echo $(WEBSITE) $(COMPILER) $(SOURCEFILE) $(DEP_IMG) $(DEP_INCLUDE) $(DEP_STY) $(DEP_TEX)

.PHONY: clean
clean:
	rm $(TARGET)

.PHONY: all
all: clean $(TARGET)
