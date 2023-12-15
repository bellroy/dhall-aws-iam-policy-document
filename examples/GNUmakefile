DHALLS := $(wildcard *.dhall)
JSONS := $(DHALLS:.dhall=.json)

all: $(JSONS)

%.json: %.dhall
	dhall-to-json < $< > $@

.PHONY: all
