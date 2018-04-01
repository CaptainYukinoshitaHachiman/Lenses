import UIKit

open class PhView: UIView {
    
    open override func draw(_ rect: CGRect) {
        fatalError("You shouldn't use this class directly since it is an abstract class providing functions and properties on Physics. Instead, use its implemented subclasses.")
    }
    
    public func drawConvexLens(at opticalCenter: CGPoint, for size: CGSize, color: UIColor) {
        let originPoint = CGPoint(x: opticalCenter.x - size.width / 2, y: opticalCenter.y - size.height / 2)
        let lenPath = UIBezierPath(ovalIn: CGRect(origin: originPoint, size: size))
        color.setStroke()
        lenPath.stroke()
    }
    
    public func drawPrincipleAxis(at opticalCenter: CGPoint, color: UIColor) {
        let path = UIBezierPath()
        color.setStroke()
        path.move(to: CGPoint(x: bounds.minX, y: opticalCenter.y))
        let dashPattern: [CGFloat] = [16,16]
        path.setLineDash(dashPattern, count: 3, phase: 16)
        path.addLine(to: CGPoint(x: bounds.maxX, y: opticalCenter.y))
        path.stroke()
    }
    
    public func drawOpticalCenter(at opticalCenter: CGPoint, color: UIColor) {
        color.setFill()
        let opticalCenterPointPath = UIBezierPath(arcCenter: opticalCenter, radius: 2, startAngle: 0, endAngle: .pi * 2, clockwise: true)
        opticalCenterPointPath.fill()
        "O".draw(atMidTop: opticalCenter.applying(CGAffineTransform(translationX: 0, y: 5)))
    }
    
    public func drawFocalPoints(at opticalCenter: CGPoint, for focalLength: CGFloat, color: UIColor) {
        let focalPoints = [CGPoint(x: opticalCenter.x - focalLength, y: opticalCenter.y),CGPoint(x: opticalCenter.x + focalLength, y: opticalCenter.y)]
        focalPoints.forEach { focalPoint in
            color.setFill()
            let path = UIBezierPath(arcCenter: focalPoint, radius: 2, startAngle: 0, endAngle: .pi * 2, clockwise: true)
            path.fill()
            "F".draw(atMidTop: focalPoint.applying(CGAffineTransform(translationX: 0, y: 5)))
        }
        let doubleFocalPoints = [CGPoint(x: opticalCenter.x - focalLength * 2, y: opticalCenter.y),CGPoint(x: opticalCenter.x + focalLength * 2, y: opticalCenter.y)]
        doubleFocalPoints.forEach { focalPoint in
            color.setFill()
            let path = UIBezierPath(arcCenter: focalPoint, radius: 2, startAngle: 0, endAngle: .pi * 2, clockwise: true)
            path.fill()
            "2F".draw(atMidTop: focalPoint.applying(CGAffineTransform(translationX: 0, y: 5)))
        }
    }
    
    public func drawDottedLines(from startPoint: CGPoint, to endPoint: CGPoint, color: UIColor) {
        color.setStroke()
        let path = UIBezierPath()
        path.move(to: startPoint)
        let dashPattern: [CGFloat] = [8,8]
        path.setLineDash(dashPattern, count: 2, phase: 4)
        path.addLine(to: endPoint)
        path.stroke()
    }
    
    public func drawLight(from startPoint: CGPoint, to endPoint: CGPoint, color: UIColor) {
        color.setStroke()
        let linePath = UIBezierPath()
        linePath.move(to: startPoint)
        linePath.addLine(to: endPoint)
        linePath.stroke()
        
        let deltaX = abs(startPoint.x - endPoint.x)
        let deltaY = abs(startPoint.y - endPoint.y)
        
        let addFunc: (CGFloat,CGFloat) -> CGFloat = { $0 + $1 }
        let minusFunc: (CGFloat,CGFloat) -> CGFloat = { $0 - $1 }
        
        let horizentalFunction: (CGFloat,CGFloat) -> CGFloat
        let verticalFunction: (CGFloat,CGFloat) -> CGFloat
        
        if startPoint.x > endPoint.x {
            horizentalFunction = minusFunc
        } else {
            horizentalFunction = addFunc
        }
        
        if startPoint.y > endPoint.y {
            verticalFunction = minusFunc
        } else {
            verticalFunction = addFunc
        }
        
        let arrowStart = CGPoint(x: horizentalFunction(startPoint.x, deltaX * (4 / 7)),
                                 y: verticalFunction(startPoint.y, deltaY * (4 / 7)))
        
        let arrowEnd = CGPoint(x: horizentalFunction(startPoint.x, deltaX * (3 / 7)),
                               y: verticalFunction(startPoint.y, deltaY * (3 / 7)))
        
        let arrowLeftPath = UIBezierPath()
        arrowLeftPath.move(to: arrowStart)
        arrowLeftPath.addLine(to: arrowEnd)
        
        let arrowRightPath = UIBezierPath()
        arrowRightPath.move(to: arrowStart)
        arrowRightPath.addLine(to: arrowEnd)
        
        arrowLeftPath.rotate(degree: 30, around: .custom(arrowStart))
        arrowRightPath.rotate(degree: -30, around: .custom(arrowStart))
        
        arrowLeftPath.stroke()
        arrowRightPath.stroke()
    }
    
    public func drawObject(at startPoint: CGPoint, for height: CGFloat, color: UIColor) {
        color.setStroke()
        let endPoint = startPoint.applying(CGAffineTransform(translationX: 0, y: -height))
        let arrowLength = height / 5
        let linePath = UIBezierPath()
        linePath.move(to: startPoint)
        linePath.addLine(to: endPoint)
        linePath.stroke()
        
        let arrowLeftPath = UIBezierPath()
        arrowLeftPath.move(to: endPoint)
        arrowLeftPath.addLine(to: endPoint.applying(CGAffineTransform(translationX: 0, y: arrowLength)))
        let arrowRightPath = UIBezierPath()
        arrowRightPath.move(to: endPoint)
        arrowRightPath.addLine(to: endPoint.applying(CGAffineTransform(translationX: 0, y: arrowLength)))
        let isReversed = startPoint.y < endPoint.y
        arrowLeftPath.rotate(degree: 30, around: isReversed ? .bottomMid : .topMid)
        arrowRightPath.rotate(degree: -30, around: isReversed ? .bottomMid : .topMid)
        arrowLeftPath.stroke()
        arrowRightPath.stroke()
    }
    
    @discardableResult public func drawImage(`for` type: PhImageType, at startPoint: CGPoint, with height: CGFloat, color: UIColor) -> CGPoint {
        color.setStroke()
        let endPoint = startPoint.applying(CGAffineTransform(translationX: 0, y: -height))
        let arrowLength = height / 5
        let linePath = UIBezierPath()
        linePath.move(to: startPoint)
        if type == .virtual {
            let dashPattern: [CGFloat] = [8,8]
            linePath.setLineDash(dashPattern, count: 2, phase: 4)
        }
        linePath.addLine(to: endPoint)
        linePath.stroke()
        
        let arrowLeftPath = UIBezierPath()
        arrowLeftPath.move(to: endPoint)
        arrowLeftPath.addLine(to: endPoint.applying(CGAffineTransform(translationX: 0, y: arrowLength)))
        let arrowRightPath = UIBezierPath()
        arrowRightPath.move(to: endPoint)
        arrowRightPath.addLine(to: endPoint.applying(CGAffineTransform(translationX: 0, y: arrowLength)))
        let isReversed = startPoint.y < endPoint.y
        arrowLeftPath.rotate(degree: 30, around: isReversed ? .bottomMid : .topMid)
        arrowRightPath.rotate(degree: -30, around: isReversed ? .bottomMid : .topMid)
        arrowLeftPath.stroke()
        arrowRightPath.stroke()
        return endPoint
    }
    
}

public enum PhImageType {
    case real
    case virtual
}
