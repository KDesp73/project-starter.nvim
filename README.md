# project-starter.nvim

A neovim plugin for creating template project structures for various languages

## Requirements

- `neovim >= 0.7.0`

## Install

Install using your preffered package manager

### Packer

```lua
use "KDesp73/project-starter.nvim"
```

### Lazy

```lua
{
   "KDesp73/project-starter.nvim"
}
```

### Plug

```lua
Plug 'KDesp73/project-starter.nvim'
```

## Setup

```lua
require("project-starter").setup({
    default_paths = {
        cpp = "path/to/cpp/projects/",
        java = "path/to/java/projects/", -- this includes java swing projects
        nvim_plugins = "path/to/neovim/plugins",
        python = "path/to/python/projects",
    },
    cd = false, -- change project directory after creation (default is true)
})
```

## Help

Get additional help with `:help project-starter`

## Commands

- `:CreateProject <arg>`: Creates project starter for specific language

## Templates

Currently supporting:

- C++
- Java
- Java Swing
- Neovim Plugin with Lua
- Python

## License

[The Unlicense](https://github.com/KDesp73/project-starter.nvim/blob/main/LICENSE)

## Author

[KDesp73](https://github.com/KDesp73)
