CAMLP4=
OCAMLC_OPTS=-package losic
OCAMLOPT_OPTS=$(OCAMLC_OPTS)

LIB_MODULES=
NON_LIB_MODULES=example.ml

BYTE_TARGETS=example.byte
NATIVE_TARGETS=example.native

.PHONY: all test

all: native-code byte-code

test:

# Dependencies
include ../Ocamlrules.mk.in
