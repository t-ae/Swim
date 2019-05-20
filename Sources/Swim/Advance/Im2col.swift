extension Image where P == Gray {
    /// im2col.
    /// Each column in returned matrix corresponds to patch.
    ///
    /// - Returns:
    ///   - m: patchWidth*patchHeight.
    ///   - n: number of patches.
    ///   - matrix: m x n matrix.
    ///
    /// - Note: This method doesn't support padding.
    /// If you need padding, use `withPadding` beforehand.
    @inlinable
    public func im2col(patchWidth: Int,
                       patchHeight: Int) -> (m: Int, n: Int, matrix: [T]) {
        
        let numPatchX = width-patchWidth+1
        let numPatchY = height-patchHeight+1
        
        let m = patchWidth*patchHeight
        let n = numPatchX * numPatchY
        
        var matrix = [T](repeating: T.swimDefaultValue, count: m*n)
        
        for patchY in 0..<numPatchY {
            for patchX in 0..<numPatchX {
                let patchIndex = patchY*numPatchX + patchX
                
                for y in 0..<patchHeight {
                    for x in 0..<patchWidth {
                        let valueIndex = y * patchWidth + x
                        matrix[valueIndex*n + patchIndex] = self[x+patchX, y+patchY, 0]
                    }
                }
            }
        }
        
        return (m, n, matrix)
    }
}
