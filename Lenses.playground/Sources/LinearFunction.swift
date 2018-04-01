import UIKit

public final class CGLinearFunction {
    
    public var k: CGFloat
    public var b: CGFloat
    
    public init(k: CGFloat, b: CGFloat) {
        self.k = k
        self.b = b
    }
    
    public init(from pointA: CGPoint, to pointB: CGPoint) {
        k = (pointA.y - pointB.y) / (pointA.x - pointB.x)
        b = pointA.y - pointA.x * k
    }
    
    public func x(`for` y: CGFloat) -> CGFloat {
        return (y - b) / k
    }
    
    public func y(`for` x: CGFloat) -> CGFloat {
        return x * k + b
    }
    
    public func point(x: CGFloat) -> CGPoint {
        return CGPoint(x: x, y: y(for: x))
    }
    
    public func point(y: CGFloat) -> CGPoint {
        return CGPoint(x: x(for: y), y: y)
    }
    
    public func crossingPoint(with function: CGLinearFunction) -> CGPoint {
        let x: CGFloat = (k - function.k) / (b - function.b)
        let y = self.y(for: x)
        return CGPoint(x: x, y: y)
    }
    
}
