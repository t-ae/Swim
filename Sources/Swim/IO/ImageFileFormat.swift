import Foundation

public protocol ImageFileFormat {
    
}

extension Intensity: ImageFileFormat {}
extension IntensityAlpha: ImageFileFormat {}
extension RGB: ImageFileFormat {}
extension RGBA: ImageFileFormat {}