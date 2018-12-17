all: bison-calc

bison-calc: bison-calc.tab.c # bison-calc.yy.c
	gcc -o $@ $< -ll

%.yy.c:%.l
	flex -o $@ --header-file=$*.h $<

%.tab.c:%.y
	bison -o $@ $<

clean:
	-git clean -fdx
