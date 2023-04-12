# crtangle

Markdown tangler based on [joakimmj/md-tangle](https://github.com/joakimmj/md-tangle/tree/main). Works similarly to org-babel-tangle in that target files are defined in the metadata of the original file.

## Installation

### \*NIX

Execute the `install.sh` script to build to `build/crtangle`.

## Usage

````md
---
tangle: example.txt
---

# Title

```txt
Code goes here.
```
````

Please note that a language has to be provided in the code block, e.g. `txt`.

```console
$ crtangle --help
crtangle [file] [--help] [--version]

Arguments:
    -v, --version                    Show version
    -h, --help                       Show help

```

## Contributing

1. Fork it (<https://github.com/your-github-user/crtangle/fork>)
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

## Contributors

- [Rishab Garg](https://github.com/your-github-user) - creator and maintainer
