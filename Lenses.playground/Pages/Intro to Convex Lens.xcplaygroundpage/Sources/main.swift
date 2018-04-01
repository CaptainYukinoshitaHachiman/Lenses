import UIKit
import PlaygroundSupport

public func showConvexLens() {
    let view = LenShowingView(frame: CGRect(origin: .zero, size: CGSize(width: 500, height: 500)))
    view.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
    PlaygroundPage.current.liveView = view
}

public final class LenShowingView: PhView {
    
    public var lensCustomizations = PhLensCustomization(color: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), focalLength: 100, opticalCenter: CGPoint(x: 250, y: 250), size: CGSize(width: 50, height: 200))
    
    public override func draw(_ rect: CGRect) {
        drawConvexLens(at: lensCustomizations.opticalCenter, for: lensCustomizations.size, color: lensCustomizations.color)
    }
    
}
