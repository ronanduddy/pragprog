# PragProg

This is a little bash script that prints out bits of Hugo Matilla's [summary](https://github.com/HugoMatilla/The-Pragmatic-Programmer) of the [The Pragmatic Programmer](https://pragprog.com/titles/tpp20/the-pragmatic-programmer-20th-anniversary-edition/) by Andrew Hunt and David Thomas.

## Motivation

Given everyday programming and the subsequent tunnel vision that one sometimes gets during their work, the goal of this project is to have a means to 'ask' for help, inspiration or guidance which can be found in The Pragmatic Programmer book.

## Usage

As the script uses a file located in a separate repo (i.e. as a git submodule), the first step is to sync with that repo:

```Shell
make sync
```

Next, test that you can run the following command:

```Shell
./pp help
```

The above command will print the following:

```Shell
Usage:
	help 	Help
	read 	Read The-Pragmatic-Programmer/readme.md
	toc 	Print the table of contents, used to find chapters and sections.
	x 	Print a chapter. E.g. chapter 1 'A Pragmatic Philosophy'; 1
	x.y 	Print a section of a chapter. E.g. chapter 1, section 2 'Software Entropy'; 1.2
	tips 	Print tips
	ls    	Print checklist
```

It is possible to print section 2 'Software Entropy' from chapter 1 'A Pragmatic Philosophy', for example, by using the following command:

```Shell
./pp 1.2
```

Which would print something like:

```Shell
## 2.-Software Entropy
One broken window ...

**Tip 4: Don't Live with Broken Windows**

Don't mess up the carpet when fixing the broken window.

```

## Installation

If you would like to access the CLI from anywhere on your machine, one simple approach is to add the following to your `~/.bashrc`:

```Shell
alias pp=~/location/to/pragprog/pp
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/ronanduddy/pragprog. Please read [CODE_OF_CONDUCT.md](CODE_OF_CONDUCT.md) for details on our code of conduct.

## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details

## Acknowledgments

* [Hugo Matilla](https://github.com/HugoMatilla)
* [Andrew Hunt & David Thomas](https://pragprog.com/titles/tpp20/the-pragmatic-programmer-20th-anniversary-edition/)
