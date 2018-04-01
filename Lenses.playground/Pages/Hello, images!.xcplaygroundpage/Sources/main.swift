import UIKit
import PlaygroundSupport

public class ImageShowingView: PhView {
    
    public override func draw(_ rect: CGRect) {
        let width = bounds.width
        let height = bounds.height
        let realImagePoint = CGPoint(x: width / 5, y: height * 3 / 4)
        let virtualImagePoint = CGPoint(x: width * 4 / 5, y: height * 3 / 4)
        drawImage(for: .real, at: realImagePoint, with: height / 2, color: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1))
        let realImageText = "Real Image" as NSString
        realImageText.draw(at: realImagePoint, withAttributes: [:])
        drawImage(for: .virtual, at: virtualImagePoint, with: height / 2, color: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1))
        let virtualImageText = "Virtual Image" as NSString
        virtualImageText.draw(at: virtualImagePoint, withAttributes: [:])
    }
    
}

public func showImages() {
    let view = ImageShowingView(frame: CGRect(origin: .zero, size: CGSize(width: 600, height: 500)))
    view.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
    PlaygroundPage.current.liveView = view
}
