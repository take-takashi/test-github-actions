#!/usr/bin/env bash
set -euo pipefail

role="${1:?usage: run-review.sh security|correctness|tests}"
root="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$root"

case "$role" in
  security) model="${REVIEW_MODEL_SECURITY:-${REVIEW_MODEL:-gpt-5.6}}" ;;
  correctness) model="${REVIEW_MODEL_CORRECTNESS:-${REVIEW_MODEL:-gpt-5.6}}" ;;
  tests) model="${REVIEW_MODEL_TESTS:-${REVIEW_MODEL:-gpt-5.6}}" ;;
  *) echo "unknown review role: $role" >&2; exit 2 ;;
esac

output_dir="${REVIEW_OUTPUT_DIR:-$root/.review-output}"
mkdir -p "$output_dir"
output="$output_dir/$role.md"
partial="$output.partial"
rm -f "$output" "$partial"
trap 'rm -f "$partial"' EXIT

if [[ "${REVIEW_MOCK:-0}" == "1" ]]; then
  # Validate mise task ordering without AI credentials.
  printf '# %s review (mock)\n\n- [INFO] Review task completed.\n' "$role" > "$partial"
else
  command -v codex >/dev/null 2>&1 || {
    echo 'codex CLI not found; install it and run codex login' >&2
    exit 127
  }
  echo "Running $role review with $model (read-only)" >&2
  codex exec --model "$model" --sandbox read-only --output-last-message "$partial" - \
    < "prompts/$role.md"
fi

[[ -s "$partial" ]] || { echo "empty review: $role" >&2; exit 1; }
mv "$partial" "$output"
echo "Wrote $output" >&2
