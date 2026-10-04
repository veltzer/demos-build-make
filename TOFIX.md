# TOFIX

Findings from a code scan on 2026-10-04.

## Medium

- `rsconstruct.toml:21` - the comment says the make_lint processor lints "every standalone example makefile", but `src_dirs = ["src.mk"]` with `src_extensions = [".mk"]` means the 20 `standalone/*/Makefile*` files are never checked; extend `scripts/check_mk.py` to dry-run with `make -n -C <dir> -f <file>` and add those makefiles to the processor (or fix the comment to say only `src.mk/` is linted).
- `CLAUDE.md:29` - says the `script.make_lint` processor lives in `rsconstruct.local.toml`, which does not exist; it is in `rsconstruct.toml:24`. Same stale reference at `doc/linting_makefiles.md:108` and `doc/TODO.txt:19`.
- `README.md:7` - the "website" link https://veltzer.github.io/demos-build-make returns 404 (the repo has no `[pages]` section and no docs build); remove the link or add a pages build.

## Low

- `README.md:9` - empty `## Build` section; describe `rsconstruct build` and how to run an example (`make -f src.mk/<example>.mk` from the repo root, per `CLAUDE.md:15`).
- `README.md:17` - the "74 examples" count and the copyright years (ending 2025) are hand-maintained and will drift; either generate the README from a tera template that counts `src.mk/*.mk` or drop the count.
- `doc/TODO.txt:3` - the open questions are already answered by GNU make (`$^` is all prerequisites, `$@` is the current target of a multi-target rule) and the `=` vs `:=` example already exists as `src.mk/variable_types.mk`; turn the first two into examples and delete the third. "proejct" typo at line 16.
