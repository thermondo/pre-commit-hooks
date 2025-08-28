# thermondo pre-commit plugins

A collection of pre-commit plugins we often use at thermondo.

Example usage:

```yaml
# .pre-commit-config.yaml in your repository
repos:
  - repo: https://github.com/thermondo/pre-commit-hooks
    rev: v1.0.2
    hooks:
      - id: check-terraform-lock
      - id: terraform-fmt
      - id: ruff-lint
      - id: ruff-format

  # other handy hooks worth considering:
  - repo: https://github.com/rhysd/actionlint
    rev: v1.7.7
    hooks:
      - id: actionlint
  - repo: https://github.com/koalaman/shellcheck-precommit
    rev: v0.11.0
    hooks:
      - id: shellcheck
  - repo: https://github.com/pre-commit/pre-commit-hooks
    rev: v6.0.0
    hooks:
      # https://github.com/pre-commit/pre-commit-hooks?tab=readme-ov-file#hooks-available
      - id: check-executables-have-shebangs
      - id: check-merge-conflict
      - id: check-shebang-scripts-are-executable
      - id: check-symlinks
      - id: check-yaml
      - id: end-of-file-fixer
      - id: trailing-whitespace
```
