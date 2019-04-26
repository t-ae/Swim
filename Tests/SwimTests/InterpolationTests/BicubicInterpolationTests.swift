import XCTest
import Swim

class BicubicInterpolationTests: XCTestCase {
    func testInterpolate() {
        let intpl = BicubicInterpolator<Intensity, Double>(edgeMode: .zero)
        
        let image = Image<Intensity, Double>(width: 4,
                                             height: 4,
                                             data: (0..<4*4).map { Double($0+1) })
        
        XCTAssertEqual(intpl.interpolate(x: 0, y: 0, in: image), Pixel(intensity: 1))
        XCTAssertEqual(intpl.interpolate(x: 1, y: 1, in: image), Pixel(intensity: 6))
        XCTAssertEqual(intpl.interpolate(x: 1, y: 2, in: image), Pixel(intensity: 10))
        XCTAssertEqual(intpl.interpolate(x: 3, y: 3, in: image), Pixel(intensity: 16))
    }
}
