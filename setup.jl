using Pkg;
Pkg.activate("OMKParserEnv"; shared=true)
Pkg.develop(Pkg.PackageSpec(; path="./ImmutableList.jl"))
Pkg.develop(Pkg.PackageSpec(; path="./MetaModelica.jl"))
Pkg.develop(Pkg.PackageSpec(; path="./ArrayUtil.jl"))
Pkg.develop(Pkg.PackageSpec(; path="./ListUtil.jl"))
Pkg.develop(Pkg.PackageSpec(; path="./MKAbsyn.jl"))
Pkg.develop(Pkg.PackageSpec(; path="./OMKParser.jl"))
Pkg.develop(Pkg.PackageSpec(; path="./MKAbsynCodeGen.jl"))

import OMKParser
using MKAbsynCodeGen