
abstract type NiftiConstant{S} end

struct NiftiIntent{S} <: NiftiConstant{S} end
prefix(::Type{NiftiIntent}) = "NIFTI_INTENT_"
validate(::Type{NiftiIntent{S}}) where S = S in keys(intent_code_map)

struct CiftiStructure{S} <: NiftiConstant{S} end
prefix(::Type{CiftiStructure}) = "CIFTI_STRUCTURE_"
validate(::Type{CiftiStructure{S}}) where S = S in brain_structures

struct NiftiType{S} <: NiftiConstant{S} end
prefix(::Type{NiftiType}) = "NIFTI_TYPE_"
validate(::Type{NiftiType{S}}) where S = S in keys(datatype_julia_map)

struct AnatomicalStructurePrimary{S} <: NiftiConstant{S} end
prefix(::Type{AnatomicalStructurePrimary}) = "ANATOMICAL_STRUCTURE_PRIMARY_"
validate(::Type{AnatomicalStructurePrimary{S}}) where S = S in structures_primary

struct AnatomicalStructureSecondary{S} <: NiftiConstant{S} end
prefix(::Type{AnatomicalStructureSecondary}) = "ANATOMICAL_STRUCTURE_SECONDARY_"
validate(::Type{AnatomicalStructureSecondary{S}}) where S = S in structures_secondary

struct TopologicalType{S} <: NiftiConstant{S} end
prefix(::Type{TopologicalType}) = ""
validate(::Type{TopologicalType{S}}) where S = S in topological_types

struct EncodingType{S} <: NiftiConstant{S} end
prefix(::Type{EncodingType}) = ""
validate(::Type{EncodingType{S}}) where S = S in encoding_types

struct Endianness{S} <: NiftiConstant{S} end
prefix(::Type{Endianness}) = ""
validate(::Type{Endianness{S}}) where S = S in endian_types

struct IndexingOrder{S} <: NiftiConstant{S} end
prefix(::Type{IndexingOrder}) = ""
validate(::Type{IndexingOrder{S}}) where S = S in indexing_orders

struct CoordinateSystem{S} <: NiftiConstant{S} end
prefix(::Type{CoordinateSystem}) = ""
validate(::Type{CoordinateSystem{S}}) where S = S in coordinate_systems

struct GeometricType{S} <: NiftiConstant{S} end
prefix(::Type{GeometricType}) = ""
validate(::Type{GeometricType{S}}) where S = S in geometric_types

# generic constructor for all NiftiConstant subtypes
@generated function (::Type{T})(s::AbstractString) where T <: NiftiConstant
	quote
		s_clean = replace(s, Regex("^$(prefix(T))") => "")
		sym = Symbol(uppercase(s_clean))
		validate($T{sym}) || error("Unknown value for $($T): $s")
		return $(T){sym}()
	end
end

@memoize function NiftiIntent(code::Integer)
	sym = get(inverse(intent_code_map), Int32(code), :UNKNOWN)
	return NiftiIntent{sym}()
end

@memoize function NiftiType(code::Integer)
	sym = get(inverse(datatype_code_map), Int16(code), :UNKNOWN)
	return NiftiType{sym}()
end



