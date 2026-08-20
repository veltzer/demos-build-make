# Project guidance

## Record knowledge in the repo, not in assistant memory

Do not save project conventions, decisions, or context to the assistant's
persistent memory system. Record them in documentation files inside this
repo (this file for guidance to the assistant, `doc/` for documentation
aimed at people), so they survive machine changes and are visible to
everyone.

## Repo conventions

Documented in detail in `doc/linting_makefiles.md`:

- Every example in `src.mk/` is run from the root of the repo
  (`make -f src.mk/<example>.mk`), never from inside `src.mk/`. Relative
  paths inside examples (includes, files read or written) are
  root-relative.
- Examples must not leave files at the repo root. Anything an example
  creates goes into the gitignored `out/` folder; create it first with
  `mkdir -p out`, since git does not track the empty folder. Writing to
  `/tmp` is also acceptable. Beware `$(shell ...)` in variable
  assignments: it runs at parse time, so it creates files even under
  `make -n` (i.e. on every lint run).

## Build and lint

`rsconstruct build` is the build/lint gate. The `script.make_lint`
processor in `rsconstruct.local.toml` runs `scripts/check_mk.py` on every
`.mk` file in `src.mk/`, which dry-runs each with `make -n -f <file>`.
An example whose whole point is to fail (e.g. via `$(error)`) must carry
the marker comment `# ERROR MAKEFILE`; the script then expects its dry
run to fail.

Every example passes the lint; there is no exclude list, and none may be
introduced. When an example fails the lint, fix the example to follow
the conventions above, or extend `scripts/check_mk.py` if the lint
itself needs to learn something new.
