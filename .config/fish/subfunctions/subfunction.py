"""
subfunction is a code generator for the fish shell that generates a fish function
that takes subcommands.

    foo <subcommand>

As input it takes a script.fish file that contain functions. The functions that you want
included in the generated function should have a name that starts with the @ character.

    function @logs
        echo Display logs
    end

    function @up
        docker run -it ubuntu bash
    end

The above script will be transformed into a single fish function. For each @ prefixed
function in the script.fish file a subcommand of the same name (without the @ character)
will be generated for the function.

The following will generate a function called foo from the foo.fish script file.

    python3 subfunction.py foo foo.fish

To source the command into your shell use the following command.

    python3 subfunction.py foo foo.fish | source
"""
import sys


def print_usage():
    """
    Print usage information for the fish subfunction function.
    """
    print("Usage: subfunction subfunction-name <filename>")
    print()
    print("To generate a fish function called foo for the fish.foo")
    print("script file use the following command.")
    print()
    print("    > subfunction foo foo.fish")
    print()
    print("To source the generated file use the following command.")
    print("    > subfunction foo foo.fish | source")


def parse_args():
    """
    The two required positional arguments are function name and filename.
    The function name is the name of the generated fish function.
    The filename is the name of the fish script file that should be used
    as input for generating the fish function.
    """
    if len(sys.argv) != 3:
        print_usage()
        exit(1 if len(sys.argv) > 1 else 0)

    return (sys.argv[1], sys.argv[2])


def remove_comment(line):
    """
    Removes comments from the given line. A comment starts with a hash #.
    """
    return line.split("#")[0]


def parse_function_name(line):
    """
    Parse out the filename from a line containing a filename
    """
    return line.strip().split()[1]


def parse_file(filename):
    """
    Parse a file collecting lines and function names.
    """
    lines = []
    functions = []
    with open(filename, "r") as f:
        for line in f:
            line = remove_comment(line)
            line = line.rstrip()
            lines.append(line)
            if line.startswith("function"):
                function_name = parse_function_name(line)
                if function_name.startswith("@"):
                    functions.append(function_name[1:])

    # Make sure that shorter function names are handled after longer
    # function names. That way there will be no issues with the substitution
    # getting messed up for a function name containing a shorter function name
    # as a prefix.
    functions = sorted(functions, key=len, reverse=True)

    return {"functions": functions, "lines": lines, "completion_names": []}


def replace_function(line, old_name, new_name):
    """
    Replaces the old function name with the new function name in a line.
    """
    return line.replace("@" + old_name, new_name)


def prefixed_function_name(prefix, function):
    """
    Creates a new function name in the form _prefix_function. Makes sure that
    we do not add double underscores __ in the created function name.
    """
    if not prefix.startswith("_"):
        prefix = f"_{prefix}"
    if not function.startswith("_"):
        function = f"_{function}"
    return prefix + function


def replace_function_names(source, prefix):
    """
    Takes the source code and replaces the old function file names with
    the new function filenames.
    """
    updated_lines = []
    lines = source["lines"]
    for function in source["functions"]:
        updated_lines = []
        prefixed_function = prefixed_function_name(prefix, function)
        for line in lines:
            updated_line = replace_function(line, function, prefixed_function)
            updated_lines.append(updated_line)
        lines = updated_lines

    return {"functions": list(source["functions"]), "lines": updated_lines}


def print_source(source):
    """
    Print the source code contained in source.
    """
    for line in source["lines"]:
        print(line)


def generate_function(source, prefix):
    """
    Generate the source code for the new fish function. The generated function
    will take all functions in the source code as subcommands.
    """
    print(f"function {prefix}")
    print("")

    print("  if [ (count $argv) -eq 0 ]")
    if "default" in source["functions"]:
        print("    " + prefixed_function_name(prefix, "default"))
    else:
        print(f"    echo Usage: {prefix} <subcommand>")
    print("    return 0")
    print("  end")
    print("")

    print("  switch $argv[1]")
    for function in source["functions"]:
        if function == "default":
            continue
        prefixed_function = prefixed_function_name(prefix, function)
        print(f'    case "{function}"')
        print(f"      echo Calling {function}")
        print(f"      {prefixed_function} $argv[2..-1]")
    print("    case '*'")
    print(f"      echo Unknown subcommand $argv[1]")
    print("  end")
    print("end")


def transpile_source(prefix, filename):
    """
    Transpiles the source code in the file with the given filename generating
    a new fish function. The generated fish function has a subcommand for each
    @ prefixed function in the input source code.
    """
    source = parse_file(filename)
    source = replace_function_names(source, prefix)
    generate_function(source, prefix)
    print_source(source)


if __name__ == "__main__":
    prefix, filename = parse_args()
    transpile_source(prefix, filename)
