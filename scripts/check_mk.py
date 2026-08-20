#!/usr/bin/env python

"""Lint example makefiles with a 'make -n' dry run.

A makefile carrying the marker comment '# ERROR MAKEFILE' is a demo whose
whole point is to fail (e.g. via $(error)); for such a file the dry run is
expected to fail, and succeeding is reported as a lint error. All other
makefiles are expected to pass the dry run.

Usage: check_mk.py <makefile>...
Exits non-zero if any makefile does not behave as expected.
"""

import subprocess
import sys
from pathlib import Path

ERROR_MARKER = "# ERROR MAKEFILE"
TIMEOUT_SECONDS = 60


def check_makefile(filename: str) -> bool:
    """Dry-run one makefile; return True if it behaves as expected."""
    expect_failure = ERROR_MARKER in Path(filename).read_text(encoding="utf-8")
    try:
        result = subprocess.run(
            ["make", "-n", "-f", filename],
            capture_output=True,
            text=True,
            timeout=TIMEOUT_SECONDS,
            check=False,
        )
    except subprocess.TimeoutExpired:
        print(f"{filename}: 'make -n' did not finish within {TIMEOUT_SECONDS} seconds")
        return False
    failed = result.returncode != 0
    if failed == expect_failure:
        return True
    if expect_failure:
        print(f"{filename}: marked '{ERROR_MARKER}' but 'make -n' succeeded")
    else:
        print(f"{filename}: 'make -n' failed with exit code {result.returncode}")
    sys.stdout.write(result.stdout)
    sys.stderr.write(result.stderr)
    return False


def main() -> None:
    """Check every makefile passed on the command line."""
    results = [check_makefile(filename) for filename in sys.argv[1:]]
    if not all(results):
        sys.exit(1)


if __name__ == "__main__":
    main()
