sourcedir = "notebooks"
markdowndir = "markdown"
juliadir = "julia"
codesnippetsdir = "codesnippets"
targetpath_examples = "../QuantumOptics.jl-documentation/src/examples"
targetpath_codesnippets = "../QuantumOptics.jl-website/src/_codesnippets/src"

# if !isdir(markdowndir)
#     println("Creating markdown output directory at \"", markdowndir, "\"")
#     mkdir(markdowndir)
# end
# if !isdir(juliadir)
#     println("Creating julia source output directory at \"", juliadir, "\"")
#     mkdir(juliadir)
# end

# names = filter(name->endswith(name, ".ipynb"), readdir(sourcedir))


# function convert2source(name)
#     sourcepath = joinpath(sourcedir, name)
#     run(`jupyter-nbconvert --to=script --output-dir=$juliadir $sourcepath`)
# end

# function convert2markdown(name)
#     sourcepath = joinpath(sourcedir, name)
#     run(`jupyter-nbconvert --to markdown --output-dir=$markdowndir --template=markdown_template.tpl --execute $sourcepath `)
# end

# for name in names
#     # Convert notebook to julia file
#     convert2source(name)

#     # Execute notebook and convert to rst
#     convert2markdown(name)
# end

# cp(markdowndir, targetpath_examples; remove_destination=true)
cp(codesnippetsdir, targetpath_codesnippets; remove_destination=true)
