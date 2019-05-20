extension Image {
    @inlinable
    public subscript(channel channel: Int) -> Image<Gray, T> {
        get{
            precondition(0 <= channel && channel < P.channels, "Index out of range.")
            var newImage = Image<Gray, T>(width: width, height: height)
            strideCopy(src: data, srcOffset: channel, srcStride: P.channels,
                       dst: &newImage.data, dstOffset: 0, dstStride: 1,
                       count: newImage.data.count)
            return newImage
        }
        set {
            precondition(0 <= channel && channel < P.channels, "Index out of range.")
            precondition(size == newValue.size, "Invalid `size`.")
            strideCopy(src: newValue.data, srcOffset: 0, srcStride: 1,
                       dst: &data, dstOffset: channel, dstStride: P.channels,
                       count: newValue.data.count)
        }
    }
    
    @inlinable
    public subscript(channel channel: P) -> Image<Gray, T> {
        get {
            return self[channel: channel.rawValue]
        }
        set {
            self[channel: channel.rawValue] = newValue
        }
    }
}
