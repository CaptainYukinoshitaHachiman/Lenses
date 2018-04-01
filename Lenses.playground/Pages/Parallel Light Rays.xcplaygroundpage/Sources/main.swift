import UIKit
import PlaygroundSupport

public final class ParallelLightRayView: PhView {
    public override func draw(_ rect: CGRect) {
        setupCustomizationsIfNeeded()
        drawLen()
        drawPrincipleAxis()
        drawFocalPoints()
        let center = customizations.len.opticalCenter
        let startX = center.x - customizations.object.objectDistance
        let startY = center.y - customizations.object.height
        let midPoint = CGPoint(x: center.x, y: startY)
        drawLight(from: CGPoint(x: startX, y: startY), to: midPoint)
        let focalPoint = center.applying(CGAffineTransform(translationX: customizations.len.focalLength, y: 0))
        let function = CGLinearFunction(from: midPoint, to: focalPoint)
        drawLight(from: midPoint, to: function.point(x: center.x + 2 * customizations.len.focalLength))
        
    }
}

public func showCompleteLens() {
    let view = ParallelLightRayView(frame: CGRect(origin: .zero, size: CGSize(width: 800, height: 500)))
    view.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
    PlaygroundPage.current.liveView = view
}
