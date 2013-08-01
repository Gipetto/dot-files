# Dot Files

THIS README IS HOPELESSLY OUT OF DATE RIGHT NOW. Just browse the repo if you're interested.

## Configuration

Installer TBD

### RC files

For most files you'll just symlink a copy in to your home directory

	$ ln -s /path/to/dot-files/vimrc ~/.vimrc 

For the profile simply add one line to your `~/.profile` to source the provided profile:

    . /path/to/dot-files/profile

### Git

As of Git 1.7.10 the `.gitconfig` file has an `[include]` directive, so you can augment your local config with some shared config.

Simply add this to your global `~/.gitconfig`:

	[include]
		path = /path/to/dot-files/git/gitconfig
		
#### Aliases

- alias: list the currently know aliases
- branchlog: not functional
- co: checkout
- child: create a new branch off of the current branch and track its remote
- ci: commit
- cia: ammend last commit
- changes: show changed files
- cm: open compare link in GitHub for master...current-branch
- diffc: diff and include cached items
- diffm: open diff in TextMate
- gh: open GitHub at head of current branch
- last: show last commit
- lg: pretty log output
- pb: push current branch
- pick: cherry-pick
- pr: open a pull request for the current branch against master
- prc: open a pull request for the current branch against its tracking branch
- subup: init submodules
- st: status
- unstage: remove all files staged for commit, do not revert any changes
- undo: reset the current branch to last local HEAD
- up: pull current branch from remote

### PHP Helpers

The PHP Helpers file includes a few helper functions and some environment setup
that I've found to be helpful. The core of the helpers is to provide consistent
appearance to variable inspection in the browser and via the command line.

- `pp()` - a nicely formatted `print_r` wrapper.
- `dp()` - a nicely formatted `var_dump` wrapper.
- `ep()` - a nicely formatted `print_r` to the error log that outputs each line
	of objects and array to its own line in the log.

The file also sets a couple of environment helpers:

- it disables `xdebug` when being used on the command line.
- it sets `error_logging` to `E_ALL` when running PHPUnit.

The included php-helpers are best enabled by auto-prepending the file to your PHP 
environment. This can be done in two ways:

1.	Modify your `php.ini` file and add the path to the php-helpers file to the 
	`auto_prepend_file` property.
1.	Copy the included `php_helpers.ini` file to your PHP install's `conf.d` 
	directory and update the `auto_prepend_file` property in the file to reflect 
	the path to the `php_helpers.php` file.


## Caveats

- Only guaranteed on OS X 10.8, and not fully guaranteed at that.
- SVN support for prompt customization is weak.
- RVM support currently requires that the default ruby version be set to the 
	system version.
	- `rvm --default use system`
