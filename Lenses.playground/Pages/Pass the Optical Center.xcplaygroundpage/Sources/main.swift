import UIKit
import PlaygroundSupport

public class PassingOpticalCenterView: PhView {
    
    public var lensCustomizations = PhLensCustomization(color: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), focalLength: 100, opticalCenter: CGPoint(x: 400, y: 250), size: CGSize(width: 50, height: 200), principleAxis: PhPrincipleAxisCustomization(color: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1))) {
        didSet {
            setNeedsDisplay()
        }
    }
    
    public var lightRayStartHeights: [CGFloat] = [] {
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
        let opticalCenter = lensCustomizations.opticalCenter
        let lensColor = lensCustomizations.color
        let principleAxisColor = lensCustomizations.principleAxis.color
        
        drawConvexLens(at: opticalCenter, for: lensCustomizations.size, color: lensColor)
        drawPrincipleAxis(at: opticalCenter, color: principleAxisColor)
        drawOpticalCenter(at: opticalCenter, color: principleAxisColor)
        drawFocalPoints(at: opticalCenter, for: lensCustomizations.focalLength, color: principleAxisColor)
        
        let focalLength = lensCustomizations.focalLength
        lightRayStartHeights.forEach { lightRayStartHeight in
            let startPoint = opticalCenter.applying(CGAffineTransform(translationX: -focalLength * (7 / 3), y: -lightRayStartHeight))
            let function = CGLinearFunction(from: startPoint, to: opticalCenter)
            let endPoint = function.point(x: opticalCenter.x + focalLength * (7 / 3))
            drawLight(from: startPoint, to: endPoint, color: lightCustomization.color)
        }
    }
    
}

public let view = PassingOpticalCenterView(frame: CGRect(origin: .zero, size: CGSize(width: 800, height: 400)))

public func showPassingOpticalCenterView() {
    view.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
    view.lightRayStartHeights = [80]
    PlaygroundPage.current.liveView = view
}
