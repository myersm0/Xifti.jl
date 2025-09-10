
Base.convert(::Type{Symbol}, ::NiftiIntent{S}) where S = 
	S

Base.convert(::Type{Int32}, ::NiftiIntent{S}) where S = 
	get(intent_code_map, S, Int32(-1))

Base.convert(::Type{T}, i::NiftiIntent) where T <: Integer =
	T(convert(Int32, i))

Base.convert(::Type{Symbol}, ::CiftiStructure{S}) where S = S

Base.convert(::Type{Symbol}, ::NiftiType{S}) where S = S

Base.convert(::Type{Type}, ::NiftiType{S}) where S = 
	get(datatype_julia_map, S, Nothing)

Base.convert(::Type{Int16}, ::NiftiType{S}) where S = 
	get(datatype_code_map, S, Int16(-1))

Base.convert(::Type{T}, d::NiftiType) where T <: Integer = 
	T(convert(Int16, d))


