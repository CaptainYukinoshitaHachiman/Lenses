import UIKit

public struct PhObjectCustomization {
    
    public var objectDistance: CGFloat
    
    public var height: CGFloat
    
    public var color: UIColor
    
    public init(objectDistance: CGFloat, height: CGFloat, color: UIColor) {
        self.objectDistance = objectDistance
        self.height = height
        self.color = color
    }
    
}

public struct PhLightCustomization {
    
    public var color: UIColor
    
    public init(color: UIColor) {
        self.color = color
    }
    
}

public struct PhLensCustomization {
    
    public var color: UIColor
    
    public var focalLength: CGFloat
    
    public var principleAxis: PhPrincipleAxisCustomization
    
    public var opticalCenter: CGPoint
    
    public var size: CGSize
    
    public init(color: UIColor, focalLength: CGFloat, opticalCenter: CGPoint, size: CGSize, principleAxis: PhPrincipleAxisCustomization) {
        self.color = color
        self.focalLength = focalLength
        self.opticalCenter = opticalCenter
        self.size = size
        self.principleAxis = principleAxis
    }
    
}

public struct PhPrincipleAxisCustomization {
    
    public var color: UIColor
    
    public init(color: UIColor) {
        self.color = color
    }
    
}
