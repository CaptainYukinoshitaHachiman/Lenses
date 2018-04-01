import UIKit
import PlaygroundSupport
public final class CompleteLensView: PhView {
    public override func draw(_ rect: CGRect) {
        /*
        setupCustomizationsIfNeeded()
        drawLen()
        drawPrincipleAxis()
        drawFocalPoints()
        */
    }
}

public func showCompleteLens() {
    let view = CompleteLensView(frame: CGRect(origin: .zero, size: CGSize(width: 800, height: 500)))
    view.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
    PlaygroundPage.current.liveView = view
}
