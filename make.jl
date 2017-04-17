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
    run(`jupyter-nbconvert --to markdown --output-dir=$markdowndir --template=markdown_template.tpl --execute $sourcepath `)
end

for name in names
    # Convert notebook to julia file
    convert2source(name)

    # Execute notebook and convert to rst
    convert2markdown(name)
end

cp(markdowndir, targetpath; remove_destination=true)