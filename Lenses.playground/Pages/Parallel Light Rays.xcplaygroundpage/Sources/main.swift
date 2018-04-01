import UIKit
import PlaygroundSupport

public let view = ParallelLightRayView(frame: CGRect(origin: .zero, size: CGSize(width: 800, height: 500)))

public final class ParallelLightRayView: PhView {
    
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
        let focalLength = lensCustomizations.focalLength
        drawFocalPoints(at: opticalCenter, for: focalLength, color: principleAxisColor)
        
        lightRayStartHeights.forEach { height in
            let point = opticalCenter.applying(CGAffineTransform(translationX: -focalLength * (7 / 3), y: -height))
            drawParallelLightRay(from: point)
        }
    }
    
    private func drawParallelLightRay(from startPoint: CGPoint) {
        let opticalCenter = lensCustomizations.opticalCenter
        let midPoint = CGPoint(x: opticalCenter.x, y: startPoint.y)
        let color = lightCustomization.color
        let focalPoint = opticalCenter.applying(CGAffineTransform(translationX: lensCustomizations.focalLength, y: 0))
        
        drawLight(from: startPoint, to: midPoint, color: color)
        
        let function = CGLinearFunction(from: midPoint, to: focalPoint)
        
        drawLight(from: midPoint, to: function.point(x: focalPoint.x + 50), color: color)
    }
    
}

public func showCompleteLens() {
    view.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
    view.lightRayStartHeights = [75,-75]
    PlaygroundPage.current.liveView = view
}
