# mise parallel review PoC

This is a minimal, reproducible prototype for using `mise run` as a deterministic workflow engine around parallel Codex CLI reviewers. It is intentionally **read-only**: reviewers do not modify code, and the output files remain local and git-ignored.

## Workflow

```text
mise run review
  ├── review:security     (Codex exec)
  ├── review:correctness  (Codex exec)   # all 3 in parallel
  └── review:tests        (Codex exec)
                 ↓ after all succeed
     scripts/merge-reviews.sh
                 ↓
     .review-output/summary.md
```

The first step in `mise.toml` is a `tasks` parallel group; the second step merges results **only after** all reviews have succeeded. Review failures propagate as task failures rather than producing a misleading complete report.

## Local run with ChatGPT subscription

1. Install `mise` and `codex` CLI; authenticate interactively once with `codex login`.
2. From this repository, run `mise run --jobs 3 review`.
3. Read `.review-output/summary.md`.

By default all reviewers use model `gpt-5.6`; override it with `REVIEW_MODEL=...` or set `REVIEW_MODEL_SECURITY`, `REVIEW_MODEL_CORRECTNESS`, or `REVIEW_MODEL_TESTS` independently. The model must be available to your Codex account. For example:

```bash
REVIEW_MODEL_SECURITY=gpt-5.6 REVIEW_MODEL_TESTS=gpt-5.6 mise run --jobs 3 review
```

Each invocation passes `--model` explicitly and uses `--sandbox read-only` for the review. Parallel runs share the same checkout but write to different output files; this PoC does not require Git worktrees.

## CI smoke test (no AI credentials)

The GitHub Actions workflow runs `REVIEW_MOCK=1 mise run --jobs 3 review`, which writes deterministic sample output for each reviewer. This validates that mise can launch the workflow and aggregate the artifacts without needing a ChatGPT login or an API key. **It is not evidence that AI models successfully ran on GitHub-hosted runners.**

For real unattended GitHub Actions, investigate supported automated credentials first. Do not commit Codex credentials to the repository.
