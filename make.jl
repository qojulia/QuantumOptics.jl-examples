sourcedir = "notebooks"
markdowndir = "markdown"
juliadir = "julia"
targetpath = "../QuantumOptics.jl-documentation/src/examples"

names = filter(name->endswith(name, ".ipynb"), readdir(sourcedir))
# println(names)

function convert2source(name)
    sourcepath = joinpath(sourcedir, name)
    run(`jupyter-nbconvert --to=script --output-dir=$juliadir $sourcepath`)
end

function convert2markdown(name)
    sourcepath = joinpath(sourcedir, name)
    println(sourcepath)
    # run(`jupyter-nbconvert --to markdown --output-dir=$markdowndir --template=markdown_template.tpl --execute $sourcepath `)
    run(`jupyter-nbconvert --to markdown --output-dir=$markdowndir --template=markdown_template.tpl --execute $sourcepath `)
    error()
    # basename, extension = splitext(name)
    # targetpath = joinpath(markdowndir, basename * ".md")
    # text = readstring(targetpath)
    # text = replace(text, "```julia", "```@example $basename")
    # text = replace(text, "\nshow()", "")
    # text = replace(text, ";\n```", "\nnothing # hide\n```")
    # write(targetpath, text)
end

for name in names
    # barename, extension = os.path.splitext(name)
    # sourcepath = os.path.join(sourcedir, name)
    # targetpath = os.path.join(builddir, barename + ".rst")

    # Convert notebook to julia file
    # convert2source(name)

    # Execute notebook and convert to rst
    convert2markdown(name)
    # try:
        # convert2markdown(name)

        # Set restructered text link label
        # f = open(targetpath)
        # text = f.read()
        # f.close()
        # pos = text.find("\n==")
        # pos = text.rfind("\n", 0, pos)
        # text = text[:pos] + "\n.. _example-{}:\n".format(barename) + text[pos:]
        # f = open(targetpath, "w")
        # f.write(text)
        # f.close()
    # except:
    #     print("Could not convert ", name)
end

cp(markdowndir, targetpath; remove_destination=true)