# Linting makefiles

There is no single canonical linter for makefiles. This document lists the
practical options, from dedicated third-party linters to checks you can do
with `make` itself, and ends with a suggestion for how to lint the examples
in this repository.

## Dedicated linters

### checkmake

The most commonly used makefile linter. It checks for things like missing
`.PHONY` declarations, missing standard targets (`all`, `clean`, `test`),
and overly long lines.

Install (Go toolchain, or grab a release binary from the project page):

```bash
go install github.com/checkmake/checkmake/cmd/checkmake@latest
```

Run:

```bash
checkmake src.mk/*.mk
```

Rules can be tuned or disabled via a `checkmake.ini` file. For example, the
`minphony` rule (which insists on `all`/`clean`/`test` targets) makes little
sense for small standalone example makefiles and can be turned off.

Project page: https://github.com/checkmake/checkmake

### unmake

A stricter, portability-focused linter written in Rust. It flags GNU-isms,
tab problems, and style issues, with an emphasis on POSIX-portable
makefiles.

Install:

```bash
cargo install unmake
```

Run:

```bash
unmake src.mk/
```

It is quite opinionated: good if you want portable POSIX makefiles, but too
strict for a repository (like this one) that deliberately demonstrates GNU
make features.

Project page: https://github.com/mcandre/unmake

### mbake

A newer combined formatter and linter for makefiles, written in Python. It
can auto-fix formatting issues.

Install:

```bash
pip install mbake
```

Run:

```bash
bake validate src.mk/*.mk   # lint
bake format src.mk/*.mk     # auto-format
```

Project page: https://github.com/EbodShojaei/bake

## Using make itself

GNU make can catch real errors without installing anything extra.

### Syntax / parse check

A dry run parses the entire makefile and evaluates the default goal, so it
catches syntax errors, missing separators, and undefined-rule problems
without executing any recipe:

```bash
make -n -f src.mk/echo.mk >/dev/null
```

### Catching typo'd variables

References to undefined variables silently expand to the empty string in
make, which hides typos. This flag turns them into warnings:

```bash
make --warn-undefined-variables -n -f file.mk
```

Note that this also warns about legitimately undefined built-in variables
(such as `MAKEFLAGS` related ones), so expect some noise.

## What this repository does

The `src.mk/` folder holds standalone example makefiles, each of which is a
self-contained demo. The build lints them via the `script.make_lint`
processor configured in `rsconstruct.local.toml`, which runs

```bash
make -n -f <file>.mk
```

on every `.mk` file as part of `rsconstruct build`. `batch = false` is
required in that configuration because `-f` takes exactly one makefile per
invocation.

Convention: every example in this repository is run from the root of the
repo (`make -f src.mk/<example>.mk`), never from inside `src.mk/`. Any
relative path inside an example (includes, files it reads or writes) is
therefore relative to the repo root.

Convention: examples must not leave files at the root of the repo. Any
file an example creates goes into the gitignored `out/` folder (creating
it first with `mkdir -p out`, since git does not track the empty folder).
Beware of `$(shell ...)` in variable assignments: it runs at parse time,
so it creates its files even under `make -n` — that is, on every lint
run (see `shell_running.mk`).

Examples that fail under a dry run by design are listed in
`src_exclude_files` there: the `$(error)` demos, an example that needs a
`source` file to exist at run time, and an include fragment that has no
targets of its own.

Note that under `-n` recipes are printed rather than executed, so examples
whose *recipes* fail (such as `fail.mk` and `bad_return_code.mk`) still
pass the lint — only parse-time and planning errors are caught.

On top of that, `checkmake` with a relaxed configuration (disabling the
`minphony` rule) can be added as a second, stylistic layer.
