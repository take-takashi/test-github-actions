#!/usr/bin/env bash
set -euo pipefail
root="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
output_dir="${REVIEW_OUTPUT_DIR:-$root/.review-output}"
for role in security correctness tests; do
  test -s "$output_dir/$role.md"
done
test -s "$output_dir/summary.md"
for role in security correctness tests; do
  grep -q "# $role review" "$output_dir/summary.md"
done
echo 'Review outputs are complete.'
