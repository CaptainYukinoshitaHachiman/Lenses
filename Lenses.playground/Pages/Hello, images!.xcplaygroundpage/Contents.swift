/*: Hello, images!
 [Previous](@previous)
 # Hello, images!
 In this playground, an arrow means an image. (Yep, arrows again, but it's not my fault since all the physics books do so, whether in the U.S. or in China)
 */
showImages()
/*:
 Here are two images, the left one drawn in real line and the right one in dotted line.
 
 > The one drawn in real line is called a _real image_, which forms when two light rays converge. A real image can be seen on a screen.
 >
 > And the other one is called a _virtual image_, it got the name because a virtual image can't be seen on a screen. A virtual image is formed at the two light rays' reversed extension lines' intersection.
 
 Maybe it sounds abstracted, but don't worry. You'll see how the two kinds of images form in the next page.
 */
//: [Next](@next)
import UIKit

public extension String {
    public func draw(at center: CGPoint, with attributes: [NSAttributedStringKey:Any]? = nil) {
        let nsstring = self as NSString
        nsstring.boundingRect(with: <#T##CGSize#>, options: <#T##NSStringDrawingOptions#>, attributes: <#T##[NSAttributedStringKey : Any]?#>, context: <#T##NSStringDrawingContext?#>)
        nsstring.draw(at: <#T##CGPoint#>, withAttributes: <#T##[NSAttributedStringKey : Any]?#>)
    }
}
