# OMK.jl
OMK.jl is a preprocessor that provides contexts for [OM.jl](https://github.com/JKRT/OM.jl)


## Basic usage
```julia
# Parsing the file and creating the AST
res = OMKParser.parseFile("./examples/simple.mo");

# Generating the modelica code from the AST
modelica = MKAbsynCodeGen.generateCodeFromMKAbsyn(res)

# Printing the modelica code
println(modelica)
```

## Requirements
- Java
- Julia
- Linux or Linux Subsystem/WSL (only for building the parser)

## Cloning the repository


```bash
# Cloning the root repository
git clone https://github.com/dev-manuel/OMK.jl
cd OMK.jl

# Fetch all submodules
git submodule update --init --recursive

# Make sure that all submodules are on master
git submodule foreach "git checkout master && git pull"
```




## Setup
1. Build the parser (using Linux)
```bash
cd ./OMKParser.jl/lib/parser
autoconf
./configure
make
```

2. Navigate back to OMK.jl root directory, open Julia console and run the following command
```julia
include("setup.jl")
```


## Development
### Remove generated files (Execute in respective (sub)module)
```bash
git clean -Xdf
```