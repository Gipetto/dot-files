# Dot Files

My commonly used bash setup.

## Configuration

For most files you'll just symlink a copy in to your home directory

    $ cd ~/
	$ ln -s /path/to/dot-files/vimrc .vimrc 

For the profile simply add one line to your `.profile` to source the provided profile:

    . /path/to/dot-files/profile
	
## Caveats

- Only guaranteed on OS X 10.8, and not fully guaranteed at that.
- SVN support for prompt customization is weak.