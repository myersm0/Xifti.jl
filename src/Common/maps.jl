
# NIFTI_INTENT_*
const intent_code_map = Bijection{Symbol, Int32}(
	:NONE => 0, :CORREL => 2, :TTEST => 3, :FTEST => 4,
	:ZSCORE => 5, :CHISQ => 6, :BETA => 7, :BINOM => 8,
	:GAMMA => 9, :POISSON => 10, :NORMAL => 11, :FTEST_NONC => 12,
	:CHISQ_NONC => 13, :LOGISTIC => 14, :LAPLACE => 15, :UNIFORM => 16,
	:TTEST_NONC => 17, :WEIBULL => 18, :CHI => 19, :INVGAUSS => 20,
	:EXTVAL => 21, :PVAL => 22, :LOGPVAL => 23, :LOG10PVAL => 24,
	:ESTIMATE => 1001, :LABEL => 1002, :NEURONAME => 1003, :GENMATRIX => 1004,
	:SYMMATRIX => 1005, :DISPVECT => 1006, :VECTOR => 1007, :POINTSET => 1008,
	:TRIANGLE => 1009, :QUATERNION => 1010, :DIMLESS => 1011, :TIME_SERIES => 2001,
	:NODE_INDEX => 2002, :RGB_VECTOR => 2003, :RGBA_VECTOR => 2004, :SHAPE => 2005,
	:UNKNOWN => -1
)


# CIFTI_STRUCTURE_*
const brain_structures = Set([
	:CORTEX_LEFT, :CORTEX_RIGHT,
	:ACCUMBENS_LEFT, :ACCUMBENS_RIGHT,
	:AMYGDALA_LEFT, :AMYGDALA_RIGHT,
	:BRAIN_STEM,
	:CAUDATE_LEFT, :CAUDATE_RIGHT, 
	:CEREBELLUM_LEFT, :CEREBELLUM_RIGHT,
	:DIENCEPHALON_VENTRAL_LEFT, :DIENCEPHALON_VENTRAL_RIGHT,
	:HIPPOCAMPUS_LEFT, :HIPPOCAMPUS_RIGHT,
	:PALLIDUM_LEFT, :PALLIDUM_RIGHT,
	:PUTAMEN_LEFT, :PUTAMEN_RIGHT,
	:THALAMUS_LEFT, :THALAMUS_RIGHT,
	:CORTEX, :CEREBELLUM,
	:CEREBELLAR_WHITE_MATTER_LEFT, :CEREBELLAR_WHITE_MATTER_RIGHT,
	:OTHER_WHITE_MATTER, :OTHER_GREY_MATTER,
	:ALL_WHITE_MATTER, :ALL_GREY_MATTER,
	:OTHER
])


# NIFTI_TYPE_*
const datatype_julia_map = Bijection{Symbol, Type}(
	:BOOL => Bool,
	:UINT8 => UInt8,
	:INT16 => Int16,
	:INT32 => Int32,
	:FLOAT32 => Float32,
	:COMPLEX64 => ComplexF32,
	:FLOAT64 => Float64,
	:RGB24 => Nothing,  # special case
	:INT8 => Int8,
	:UINT16 => UInt16,
	:UINT32 => UInt32,
	:INT64 => Int64,
	:UINT64 => UInt64,
	:COMPLEX128 => ComplexF64,
	:UNKNOWN => Nothing
)

const datatype_code_map = Bijection{Symbol, Int16}(
	:BOOL => 1,
	:UINT8 => 2,
	:INT16 => 4,
	:INT32 => 8,
	:FLOAT32 => 16,
	:COMPLEX64 => 32,
	:FLOAT64 => 64,
	:RGB24 => 128,
	:INT8 => 256,
	:UINT16 => 512,
	:UINT32 => 768,
	:INT64 => 1024,
	:UINT64 => 1280,
	:COMPLEX128 => 1792
)

const structures_primary = Set([
	:CortexLeft, :CortexRight,
	:CortexRightAndLeft,
	:CerebullumLeft, :CerebellumRight,
	:Cerebellum,
	:Head,
	:HippocampusLeft, :HippocampusRight
])

# note: what about MidLayer, which I see in all example .gii files
const structures_secondary = Set([
	:GrayWhite, :Pial, :MidThickness
])

const topological_types = Set([
	:Closed, :Open, :Cut
])

const encoding_types = Set([
	:ASCII, :Base64Binary, :GZipBase64Binary, :ExternalFileBinary
])

const endian_types = Set([
	:BigEndian, :LittleEndian
])

const indexing_orders = Set([
	:RowMajorOrder, :ColumMajorOrder
])


# NIFTI_XFORM_
const coordinate_systems = Set([
	:UNKNOWN,
	:SCANNER_ANAT,
	:ALIGNED_ANAT,
	:TALAIRACH,
	:MNI_152
])

const geometric_types = Set([
	:Reconstruction, :Anatomical, :Inflated, :VeryInflated, 
	:Spherical, :SemiSpherical, :Ellipsoid, :Flat, :Hull
])







