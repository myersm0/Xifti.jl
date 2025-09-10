
abstract type NiftiHeader end
struct Nifti1Header <: NiftiHeader end
struct Nifti2Header <: NiftiHeader end

function Base.size(::NiftiHeader) end
Base.size(::Nifti1Header) = Int32(348)
Base.size(::Nifti2Header) = Int32(540)


