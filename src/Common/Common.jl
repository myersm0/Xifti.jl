module NiftiSpecs

using Bijections
using Memoize

include("maps.jl")

include("constants.jl")
export NiftiConstant, NiftiIntent, CiftiStructure, NiftiType
export AnatomicalStructurePrimary, AnatomicalStructureSecondary
export EncodingType, Endianness, IndexingOrder
export CoordinateSystem, GeometricType

include("conversion.jl")
include("accessors.jl")
include("headers.jl")
include("filetypes.jl")
export data, metadata, header

end
