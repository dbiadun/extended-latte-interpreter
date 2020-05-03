all:
	ghc -i./Parser/ --make Main.hs -o Interpreter

clean:
	-rm -f *.log *.aux *.hi *.o *.dvi
	-rm -f ./Parser/*.log ./Parser/*.aux ./Parser/*.hi ./Parser/*.o ./Parser/*.dvi

distclean: clean
	-rm -f DocGrammar.* LexGrammar.* ParGrammar.* LayoutGrammar.* SkelGrammar.* PrintGrammar.* Main.* AbsGrammar.* Main ErrM.* SharedString.* ComposOp.* grammar.dtd XMLGrammar.* Makefile*
	
