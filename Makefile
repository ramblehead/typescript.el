EMACS=$(shell which emacs) -Q -batch -L .
ELS = \
  typescript-mode.el \
  typescript-mode-tests.el \
  typescript-mode-test-utilities.el
ELCS = $(ELS:.el=.elc)

clean:
	rm -f $(ELCS)

cask: clean
	cask build

test: cask
	+ $(EMACS) -l typescript-mode-tests.el -f ert-run-tests-batch-and-exit

# end
