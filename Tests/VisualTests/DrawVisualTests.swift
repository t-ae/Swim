import XCTest
import Swim

class DrawVisualTests: XCTestCase {

    func testDrawLine() {
        var image = Image<Gray, UInt8>(width: 201, height: 201, value: 0)
        
        image.drawLine(p1: (50, 0), p2: (150, 200), pixel: Pixel(gray: 255))
        image.drawLine(p1: (150, 0), p2: (50, 200), pixel: Pixel(gray: 255))
        
        image.drawLine(p1: (0, 50), p2: (200, 150), pixel: Pixel(gray: 255))
        image.drawLine(p1: (0, 150), p2: (200, 50), pixel: Pixel(gray: 255))
        
        image.drawLine(p1: (100, 0), p2: (100, 200), pixel: Pixel(gray: 255))
        image.drawLine(p1: (0, 100), p2: (200, 100), pixel: Pixel(gray: 255))
        
        image.drawLines(points: [(10, 10), (190, 190), (190, 10), (10, 190)], pixel: Pixel(gray: 128))
        
        image.drawX(center: (60, 10), size: 5, pixel: Pixel(gray: 192))
        image.drawX(center: (70, 10), size: 6, pixel: Pixel(gray: 192))
        
        let ns = image.nsImage()
        
        XCTAssertTrue(ns.isValid, "break here")
    }

    func testDrawCircle() {
        var image = Image<Gray, UInt8>(width: 201, height: 201, value: 0)
        
        image.drawCircle(center: (100, 100), radius: 112, pixel: Pixel(value: 96))
        image.drawCircle(center: (50, 50), radius: 50, pixel: Pixel(value: 192))
        
        image.drawCirclePelimeter(center: (100, 100), radius: 30, pixel: Pixel(value: 255))
        
        image.drawCirclePelimeter(center: (150, 150), radius: 70, pixel: Pixel(value: 255))
        
        let ns = image.nsImage()
        
        XCTAssertTrue(ns.isValid, "break here")
    }
    
    func testDrawRect() {
        var image = Image<Gray, UInt8>(width: 201, height: 201, value: 0)
        
        image.drawRect(origin: (0, 0), size: (100, 100), pixel: Pixel(gray: 128))
        image.drawRect(origin: (30, 30), size: (200, 200), pixel: Pixel(gray: 192))
        
        image.drawRect(origin: (-30, -30), size: (200, 200), pixel: Pixel(gray: 255))
        
        let ns = image.nsImage()
        
        XCTAssertTrue(ns.isValid, "break here")
    }
    
    func testDrawImage() {
        var image = Image<Gray, UInt8>(width: 201, height: 201, value: 0)
        let draw = Image<Gray, UInt8>(width: 50, height: 50, value: 255)
        
        let mask = Image<Gray, Bool>(width: 5,
                                     height: 5,
                                     data: [true, true, true, true, true,
                                            true, false, false, false, false,
                                            true, true, true, true, true,
                                            false, false, false, false, true,
                                            true, true, true, true, true])
            .resizeNN(width: draw.width, height: draw.height)
        
        image.drawImage(origin: (50, 50), image: draw)
        image.drawImage(origin: (130, 130), image: draw, mask: mask)
        
        image.drawImage(origin: (-5, -5), image: draw, mask: mask)
        image.drawImage(origin: (170, -5), image: draw, mask: mask)
        image.drawImage(origin: (-5, 170), image: draw, mask: mask)
        image.drawImage(origin: (170, 170), image: draw, mask: mask)
        
        let ns = image.nsImage()
        
        XCTAssertTrue(ns.isValid, "break here")
    }
}
