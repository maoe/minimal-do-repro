# Repro for the directory nonexistent issue in minimal do

The following command reproduces the directory nonexistent issue with minimal do:

```console
% git clone --recursive https://github.com/maoe/minimal-do-repro.git
% cd minimal-do-repro
% ./redo/minimal/do tests/python/all
do: Incremental mode. Use -c for clean rebuild.
do  tests/python/all
+ redo-ifchange list
+ xargs redo-ifchange
do    tests/python/python/foo/bar.py
+ redo-ifchange list
+ cd ../..
+ xargs redo-ifchange
+ echo python -m unittest python/foo/bar.py
python -m unittest python/foo/bar.py
/home/maoe/src/github.com/maoe/minimal-do-repro/.do_built.dir/redo-ifchange: 385: /home/maoe/src/github.com/maoe/minimal-do-repro/.do_built.dir/redo-ifchange: cannot create python/foo/bar.py.redo.tmp: Directory nonexistent
/home/maoe/src/github.com/maoe/minimal-do-repro/.do_built.dir/redo-ifchange: 398: /home/maoe/src/github.com/maoe/minimal-do-repro/.do_built.dir/redo-ifchange: cannot create python/foo/bar.py.did: Directory nonexistent
do: all: got exit code 123
```

If you use `redo` in place of `./redo/minimal/do` it just works:

```console
% redo tests/python/all
redo  tests/python/all
+ redo-ifchange list
+ xargs redo-ifchange
redo    tests/python/python/foo/bar.py
+ redo-ifchange list
+ cd ../..
+ xargs redo-ifchange
+ echo python -m unittest python/foo/bar.py
python -m unittest python/foo/bar.py
```

With the patch I proposed the minimal do works:

```console
% ./redo-fixed/minimal/do tests/python/all                                                                              ✭
do: Incremental mode. Use -c for clean rebuild.
do  tests/python/all
+ redo-ifchange list
+ xargs redo-ifchange
do    tests/python/python/foo/bar.py
+ redo-ifchange list
+ cd ../..
+ xargs redo-ifchange
+ echo python -m unittest python/foo/bar.py
python -m unittest python/foo/bar.py
```
