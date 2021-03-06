% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/convert.R
\name{RToH5}
\alias{RToH5}
\alias{H5ToR_Pre}
\alias{H5ToR_Post}
\title{Low-level conversion functions from R to HDF5 and vice versa}
\usage{
RToH5(Robj, dtype, nelem)

H5ToR_Pre(dtype, nelem)

H5ToR_Post(Robj, dtype, nelem, flags = getOption("hdf5r.h5tor_default"),
  id = -1)
}
\arguments{
\item{Robj}{The R-object to transfer to HDF5}

\item{dtype}{Datatype of the HDF5 object. Of class \code{\link{H5T}}}

\item{nelem}{Number of elements to copy}

\item{flags}{Some flags governing edge cases of conversion from HDF5 to R. This is related to how integers are being treated and
the issue of R not being able to natively represent 64bit integers and not at all being able to represent unsigned 64bit integers
(even using add-on packages). The constants governing this are part of \code{\link{h5const}}. The relevant ones start with the term
\code{H5TOR} and are documented there. The default set here returns a regular 32bit integer if it doesn't lead to an overflow
and returns a 64bit integer from the \code{bit64} package otherwise. For 64bit unsigned int that are larger than 64bit signed int,
it is truncated (the default; but can also be set to NA).}

\item{id}{When creating a reference, an id for the file (or an object in the file) is needed. By default \code{-1}, which will work
with everything except references.}
}
\value{
The converted object or the buffer into which the object is written.
}
\description{
Low-level conversion functions from R to HDF5 and vice versa
}
\details{
These are the low-level function that dispatch the R object to HDF5 object conversion to the underlying C code.
None of these should be accessed by the end-user under normal circumstances. See also \code{\link{convertRoundTrip}}
for an example of how to use them.
}
\author{
Holger Hoefling
}
\keyword{internal}
