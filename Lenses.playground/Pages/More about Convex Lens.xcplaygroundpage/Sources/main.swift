import UIKit
import PlaygroundSupport

public final class CompleteLensView: PhView {
    
    public var lensCustomization = PhLensCustomization(color: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1),
                                                       focalLength: 100,
                                                       opticalCenter: CGPoint(x: 400, y: 250),
                                                       size: CGSize(width: 75, height: 400),
                                                       principleAxis: PhPrincipleAxisCustomization(color: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1))) {
        didSet {
            setNeedsDisplay()
        }
    }
    
    public override func draw(_ rect: CGRect) {
        let opticalCenter = lensCustomization.opticalCenter
        drawConvexLens(at: opticalCenter, for: lensCustomization.size, color: lensCustomization.color)
        let principleAxisColor = lensCustomization.principleAxis.color
        drawPrincipleAxis(at: opticalCenter, color: principleAxisColor)
        drawOpticalCenter(at: opticalCenter, color: principleAxisColor)
        drawFocalPoints(at: opticalCenter, for: lensCustomization.focalLength, color: principleAxisColor)
    }
    
}

public let view = CompleteLensView(frame: CGRect(origin: .zero, size: CGSize(width: 800, height: 500)))

public func showCompleteLens() {
    view.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
    PlaygroundPage.current.liveView = view
}
