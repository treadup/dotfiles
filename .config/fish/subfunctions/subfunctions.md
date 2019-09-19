# Subfunctions in Fish Shell
This is a proposal for adding two new keywords to fish called
subfunction and subsubfunction.

## Subfunction
The subfunction command would have the following syntax.

    subfunction command-name source-filename

If the source-filename is absolute then that file is used. If
source-filename is relative then we create an absolute path starting
with the $HOME/.config/fish/subfunctions/ folder and appending the
relative path.

## Subsubfunction
Implementing subfunctions consists of two parts.

1. Having the commands to the subfunction themselves be subfunctions.
2. Going one step further when it comes to completion.

The subsubfunction command would have the following syntax.

    subsubfunction top-level-command-name \
        first-subfunction-name source-filename
        second-subfunction-name source-filename
        ...
        nth-subfunction-name source-filename

The source-filename resolution rules are the same as for subfunctions.

## Source file resolution
The following rules would be used for source-file loading and
resolution.

If the source-file points to a fish file then that script is sourced
with the caveat that

## Name mangling
For a subfunctions the loaded function names are prefixed with
_command_name_.

For a subsubfunction the loaded function names are prefixed with
_top_level_command_name_kth_subfunction_name_.

Only function names are mangled. Names of variables and other objects
are left unchanged.

## Completion
Completions are generated for all command-name function name
combinations.

Completions are generated for all top-level-command-name
kth-subfunction-name function name combinations.

## Project name
A fun name for the project would be submerged function.

## Implementation
It should be possible to implement this using a python script that
takes a source-filename and generates the appropriate source code that
can then be evaluated in the fish shell.
