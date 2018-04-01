import UIKit

public extension UIBezierPath {
    
    public func rotate(degree: CGFloat, `around` type: RotatingPoint) {
        let bounds = cgPath.boundingBox
        let rotationCenter: CGPoint
        switch type {
        case .topMid:
            rotationCenter = CGPoint(x: bounds.midX, y: bounds.minY)
        case .bottomMid:
            rotationCenter = CGPoint(x: bounds.midX, y: bounds.maxY)
        case .custom(let point):
            rotationCenter = point
        }
        var transform = CGAffineTransform.identity
        transform = transform.translatedBy(x: rotationCenter.x, y: rotationCenter.y)
        transform = transform.rotated(by: degree / 180 * .pi)
        transform = transform.translatedBy(x: -rotationCenter.x, y: -rotationCenter.y)
        apply(transform)
    }
    
    public enum RotatingPoint {
        case topMid
        case bottomMid
        case custom(_:CGPoint)
    }
    
}
