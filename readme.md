# How-to
Install opam
Install ocaml 4.03.0
```
opam install js_of_ocaml js_of_ocaml-ppx xmlm
```

build using
```
ocamlfind ocamlc -package js_of_ocaml -package js_of_ocaml.ppx -package xmlm -linkpkg -o test.byte src/main_entry.ml
js_of_ocaml test.byte
```
This might be possible to build with Bucklescript, but it requires more testing.
