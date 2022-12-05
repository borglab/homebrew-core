# homebrew-core

Homebrew tap for BorgLab software

## Aliases

Homebrew `aliases` are alternate names for existing formulae.
For example, `gtsam@latest` is an alias for `gtsam_develop`, so running `brew install gtsam@latest` or `gtsam@develop` gives us the same result while being more elucidating.

## Creating Formulae

As a prerequisite, we add the `borglab` tap
```sh
brew tap borglab/core
```

### Nightly build

```
brew create --cmake --tap borglab/core --HEAD https://github.com/borglab/gtsam.git
```

#### Versioned build

```
brew create --cmake --tap borglab/core <link to tar file>
```

Run audit checks on the formula

```
brew audit --new-formula gtsam
```

Run in verbose mode to verify

```
brew install -v --HEAD borglab/core/gtsam
```
