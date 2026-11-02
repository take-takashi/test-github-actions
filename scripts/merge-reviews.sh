#!/usr/bin/env bash
set -euo pipefail
root="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
output_dir="${REVIEW_OUTPUT_DIR:-$root/.review-output}"
report="$output_dir/summary.md"
tmp="$report.partial"
trap 'rm -f "$tmp"' EXIT

for role in security correctness tests; do
  [[ -s "$output_dir/$role.md" ]] || {
    echo "Missing or empty output: $output_dir/$role.md" >&2
    exit 1
  }
done

{
  printf '# Parallel Review Summary\n\n'
  for role in security correctness tests; do
    printf '\n---\n\n'
    cat "$output_dir/$role.md"
    printf '\n'
  done
} > "$tmp"
mv "$tmp" "$report"
echo "Wrote $report" >&2
