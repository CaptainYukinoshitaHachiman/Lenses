import UIKit

public extension String {
    
    public func draw(atCenter center: CGPoint, with attributes: [NSAttributedStringKey:Any]? = nil) {
        let nsstring = self as NSString
        let size = nsstring.boundingRect(with: CGSize(width: .max, height: .max), options: .usesLineFragmentOrigin, attributes: attributes, context: nil).size
        let originPoint = center.applying(CGAffineTransform(translationX: -size.width / 2, y: -size.height / 2))
        nsstring.draw(at: originPoint, withAttributes: attributes)
    }
    
    public func draw(atMidTop midTop: CGPoint, with attributes: [NSAttributedStringKey:Any]? = nil) {
        let nsstring = self as NSString
        let size = nsstring.boundingRect(with: CGSize(width: .max, height: .max), options: .usesLineFragmentOrigin, attributes: attributes, context: nil).size
        let originPoint = midTop.applying(CGAffineTransform(translationX: -size.width / 2, y: 0))
        nsstring.draw(at: originPoint, withAttributes: attributes)
    }
    
}
