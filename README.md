# crtangle

CLI tool aimed to replace `org-babel-tangle` for org-mode in Emacs, without editor lock-in and using markdown instead of org.

## Installation

This tool can be installed through GNU Make by running `make` in the working directory.

## Usage

```console
$ ./bin/crtangle --help
crtangle [file] [--help] [--version]

Arguments:
    -v, --version                    Show version
    -h, --help                       Show help
```

Use YAML frontmatter to specify the target file. Each code block will be tangled to the specified file.

````markdown
---
tangle: example.txt
---

# Title

```txt
Code goes here.
```
````

Should the command work outside of the file's directory, a full path to the target file should be provided, so the file is not created in the current dir.

````markdown
---
tangle: /Users/rishab/Documents/example.txt
---

# Example

```text
Hello, world!
```

```javascript
const hello = "world"
```

```cpp
string Hello = "World";
```
````

## Contributing

1. Fork it (<https://github.com/RisGar/crtangle/fork>)
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

## Contributors

- [Rishab Garg](https://github.com/RisGar) - creator and maintainer
- [Joakim Myrvoll](https://github.com/joakimmj) - idea ([joakimmj/md-tangle](https://github.com/joakimmj/md-tangle))
