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

This ensures Homebrew has access to all the formulae and aliases in the git repository.


### Versioned build

Homebrew recommends using the release tarball to create build the formula automatically. 

Unfortunately, this will not set the proper cmake flags and dependencies, hence it is recommended to copy an existing formula and modify it accordingly.

#### From the Homebrew docs
You can use the below command to create a formula skeleton.

The tar file is the release `.tar.gz` file which homebrew will use to build the library.

```
brew create --cmake --tap borglab/core <link to tar file>
```

### Verification

Run audit checks on the newly created formula.

Here we assume we created a formula file called `gtsam4.2.rb`.

```
brew audit --new-formula gtsam4.2
```

Run in verbose mode to verify

```
brew install -v --HEAD borglab/core/gtsam4.2
```

### Create Alias

An `Alias` is simply a symbolic link, but care must be taken that the link is relative to the `Aliases` directory.

To create an alias, do the following:

```sh
# Go into the Aliases directory
cd Aliases

# Create the symlink
# NOTE homebrew uses @ for versioning
ln -s ../Formula/gtsam4.2.rb gtsam@4.2

# Go back to repo root
cd ../
```

Now you can commit the symlink file to the repo and enjoy using the alias.
