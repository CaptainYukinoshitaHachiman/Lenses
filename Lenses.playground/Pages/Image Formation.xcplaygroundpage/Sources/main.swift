import UIKit
import PlaygroundSupport

public class ImageFormationView: PhView {
    
    public var lensCustomization = PhLensCustomization(color: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), focalLength: 100, opticalCenter: CGPoint(x: 400, y: 200), size: CGSize(width: 75, height: 300), principleAxis: PhPrincipleAxisCustomization(color: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1))) {
        didSet {
            setNeedsDisplay()
        }
    }
    
    public var objectCustomization = PhObjectCustomization(objectDistance: 200, height: 100, color: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)) {
        didSet {
            setNeedsDisplay()
        }
    }
    
    public var lightCustomization = PhLightCustomization(color: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)) {
        didSet {
            setNeedsDisplay()
        }
    }
    
    public override func draw(_ rect: CGRect) {
        let opticalCenter = lensCustomization.opticalCenter
        let lensSize = lensCustomization.size
        let lensColor = lensCustomization.color
        drawConvexLens(at: opticalCenter, for: lensSize, color: lensColor)
        let principleAxisColor = lensCustomization.principleAxis.color
        drawPrincipleAxis(at: opticalCenter, color: principleAxisColor)
        drawOpticalCenter(at: opticalCenter, color: principleAxisColor)
        let focalLength = lensCustomization.focalLength
        drawFocalPoints(at: opticalCenter, for: focalLength, color: principleAxisColor)
        
        let objectDistance = objectCustomization.objectDistance
        let objectHeight = objectCustomization.height
        let objectColor = objectCustomization.color
        let objectPoint = opticalCenter.applying(CGAffineTransform(translationX: -objectDistance, y: 0))
        let objectTopPoint = drawImage(for: .real, at: objectPoint, with: objectHeight, color: objectColor)
        
        let topMidPoint = CGPoint(x: opticalCenter.x, y: objectTopPoint.y)
        let focalPoint = opticalCenter.applying(CGAffineTransform(translationX: focalLength, y: 0))
        
        let functionParallel = CGLinearFunction(from: topMidPoint, to: focalPoint)
        let functionThroughO = CGLinearFunction(from: objectTopPoint, to: opticalCenter)
        
        let imageArrowPoint = functionParallel.crossingPoint(with: functionThroughO)
        
        let imagePoint = CGPoint(x: imageArrowPoint.x, y: opticalCenter.y)
        
        let imageHeight  = imagePoint.y - imageArrowPoint.y
        
        let lightColor = lightCustomization.color
        
        guard objectDistance > 0 else {
            fatalError()
        }
        
        if abs(objectDistance - focalLength) < 0.1 {
            drawLight(from: objectTopPoint, to: topMidPoint, color: lightColor)
            drawLight(from: objectTopPoint, to: functionThroughO.point(y: bounds.maxY), color: lightColor)
            drawLight(from: topMidPoint, to: functionParallel.point(y: bounds.maxY), color: lightColor)
            "NO IMAGE FORMED\n(Object is at the focal point)".draw(atCenter: opticalCenter.applying(CGAffineTransform(translationX: 0, y: 50)), with: [.font:UIFont.systemFont(ofSize: 32, weight: .bold),.foregroundColor:#colorLiteral(red: 0.8549019694, green: 0.250980407, blue: 0.4784313738, alpha: 1)])
        } else if objectDistance < focalLength {
            drawLight(from: objectTopPoint, to: topMidPoint, color: lightColor)
            drawLight(from: topMidPoint, to: functionParallel.point(x: focalPoint.x + 20), color: lightColor)
            drawLight(from: objectTopPoint, to: functionThroughO.point(x: opticalCenter.x + 20), color: lightColor)
            drawImage(for: .virtual, at: imagePoint, with: imageHeight, color: objectColor)
            drawDottedLines(from: topMidPoint, to: imageArrowPoint, color: lightColor)
            drawDottedLines(from: opticalCenter, to: imageArrowPoint, color: lightColor)
        } else if objectDistance > focalLength {
            drawLight(from: objectTopPoint, to: topMidPoint, color: lightColor)
            drawLight(from: topMidPoint, to: imageArrowPoint, color: lightColor)
            drawLight(from: objectTopPoint, to: imageArrowPoint, color: lightColor)
            drawImage(for: .real, at: imagePoint, with: imageHeight, color: objectColor)
        }
        
    }
    
}

public let view = ImageFormationView(frame: CGRect(origin: .zero, size: CGSize(width: 800, height: 400)))

public func showImageFormationView() {
    view.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
    PlaygroundPage.current.liveView = view
}
