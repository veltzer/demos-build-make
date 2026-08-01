<%!
    import pydmt.helpers.git
%>${"##"} Number of examples

Currently there are ${pydmt.helpers.git.count_files("examples/*.mk")} examples in this repository.
