import XCTest
import Swim

class NearestNeighborInterpolatorTests: XCTestCase {

    func testInterpolate() {
        let intpl = NearestNeighborInterpolator<Gray, Double>(edgeMode: .constant(value: 255))
        
        let image = Image<Gray, Double>(width: 4,
                                        height: 4,
                                        data: (0..<4*4).map { Double($0) })
        
        XCTAssertEqual(intpl.interpolate(x: 0, y: 0, in: image), Pixel(gray: 0))
        XCTAssertEqual(intpl.interpolate(x: 1, y: 1, in: image), Pixel(gray: 5))
        XCTAssertEqual(intpl.interpolate(x: 1, y: 2, in: image), Pixel(gray: 9))
        XCTAssertEqual(intpl.interpolate(x: 3, y: 3, in: image), Pixel(gray: 15))
        
        XCTAssertEqual(intpl.interpolate(x: 0.3, y: 0.3, in: image), Pixel(gray: 0))
        XCTAssertEqual(intpl.interpolate(x: 0.7, y: 0.9, in: image), Pixel(gray: 5))
        XCTAssertEqual(intpl.interpolate(x: 1.1, y: 1.8, in: image), Pixel(gray: 9))
        XCTAssertEqual(intpl.interpolate(x: 2.7, y: 3.3, in: image), Pixel(gray: 15))
    }

}
