extension Image where T: AdditiveArithmetic {
    @inlinable
    public static func +=<C: ColorProtocol>(lhs: inout Image, rhs: C) where C.P == P, C.T == T {
        lhs.unsafePixelwiseConvert { ref in
            ref += rhs
        }
    }
    
    @inlinable
    public static func +<C: ColorProtocol>(lhs: Image, rhs: C) -> Image where C.P == P, C.T == T {
        return lhs.unsafePixelwiseConverted { src, dst in
            for c in 0..<P.channels {
                dst.initialize(channel: c, to: src[c] + rhs[c])
            }
        }
    }
    
    @inlinable
    public static func +<C: ColorProtocol>(lhs: C, rhs: Image) -> Image where C.P == P, C.T == T {
        return rhs + lhs
    }
    
    @inlinable
    public static func -=<C: ColorProtocol>(lhs: inout Image, rhs: C) where C.P == P, C.T == T {
        lhs.unsafePixelwiseConvert { ref in
            ref -= rhs
        }
    }
    
    @inlinable
    public static func -<C: ColorProtocol>(lhs: Image, rhs: C) -> Image where C.P == P, C.T == T {
        return lhs.unsafePixelwiseConverted { src, dst in
            for c in 0..<P.channels {
                dst.initialize(channel: c, to: src[c] - rhs[c])
            }
        }
    }
    
    @inlinable
    public static func -<C: ColorProtocol>(lhs: C, rhs: Image) -> Image where C.P == P, C.T == T {
        return rhs.unsafePixelwiseConverted { src, dst in
            for c in 0..<P.channels {
                dst.initialize(channel: c, to: lhs[c] - src[c])
            }
        }
    }
}

extension Image where T: Numeric {
    @inlinable
    public static func *=<C: ColorProtocol>(lhs: inout Image, rhs: C) where C.P == P, C.T == T {
        lhs.unsafePixelwiseConvert { ref in
            ref *= rhs
        }
    }
    
    @inlinable
    public static func *<C: ColorProtocol>(lhs: Image, rhs: C) -> Image where C.P == P, C.T == T {
        return lhs.unsafePixelwiseConverted { src, dst in
            for c in 0..<P.channels {
                dst.initialize(channel: c, to: src[c] * rhs[c])
            }
        }
    }
    
    @inlinable
    public static func *<C: ColorProtocol>(lhs: C, rhs: Image) -> Image where C.P == P, C.T == T {
        return rhs * lhs
    }
}

extension Image where T: BinaryInteger {
    @inlinable
    public static func /=<C: ColorProtocol>(lhs: inout Image, rhs: C) where C.P == P, C.T == T {
        lhs.unsafePixelwiseConvert { ref in
            ref /= rhs
        }
    }
    
    @inlinable
    public static func /<C: ColorProtocol>(lhs: Image, rhs: C) -> Image where C.P == P, C.T == T {
        return lhs.unsafePixelwiseConverted { src, dst in
            for c in 0..<P.channels {
                dst.initialize(channel: c, to: src[c] / rhs[c])
            }
        }
    }
    
    @inlinable
    public static func /<C: ColorProtocol>(lhs: C, rhs: Image) -> Image where C.P == P, C.T == T {
        return rhs.unsafePixelwiseConverted { src, dst in
            for c in 0..<P.channels {
                dst.initialize(channel: c, to: lhs[c] / src[c])
            }
        }
    }
}

extension Image where T: FloatingPoint {
    @inlinable
    public static func /=<C: ColorProtocol>(lhs: inout Image, rhs: C) where C.P == P, C.T == T {
        lhs.unsafePixelwiseConvert { ref in
            ref /= rhs
        }
    }
    
    @inlinable
    public static func /<C: ColorProtocol>(lhs: Image, rhs: C) -> Image where C.P == P, C.T == T {
        return lhs.unsafePixelwiseConverted { src, dst in
            for c in 0..<P.channels {
                dst.initialize(channel: c, to: src[c] / rhs[c])
            }
        }
    }
    
    @inlinable
    public static func /<C: ColorProtocol>(lhs: C, rhs: Image) -> Image where C.P == P, C.T == T {
        return rhs.unsafePixelwiseConverted { src, dst in
            for c in 0..<P.channels {
                dst.initialize(channel: c, to: lhs[c] / src[c])
            }
        }
    }
}

extension Image where T: ComplexProtocol {
    @inlinable
    public static func /=<C: ColorProtocol>(lhs: inout Image, rhs: C) where C.P == P, C.T == T {
        lhs.unsafePixelwiseConvert { ref in
            ref /= rhs
        }
    }
    
    @inlinable
    public static func /<C: ColorProtocol>(lhs: Image, rhs: C) -> Image where C.P == P, C.T == T {
        return lhs.unsafePixelwiseConverted { src, dst in
            for c in 0..<P.channels {
                dst.initialize(channel: c, to: src[c] / rhs[c])
            }
        }
    }
    
    @inlinable
    public static func /<C: ColorProtocol>(lhs: C, rhs: Image) -> Image where C.P == P, C.T == T {
        return rhs.unsafePixelwiseConverted { src, dst in
            for c in 0..<P.channels {
                dst.initialize(channel: c, to: lhs[c] / src[c])
            }
        }
    }
}
