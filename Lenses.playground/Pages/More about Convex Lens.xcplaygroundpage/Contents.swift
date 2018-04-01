/*: More about Convex Lens
 [Previous](@previous)
 # More about Convex Lens
 Here we are going to review and learn more about the fundamental definitions of lens.
 */
showCompleteLens()
/*:
 Have you see the points 2F, F and O? These are the principle points of a lens. Here we are introducing them:
 
 > The center of the lens is the _optical center_, _O_.
 >
 > The horizontal dash dotted line passing the optical center, is the _principle axis_.
 >
 > The distance from the optical center, of a lens to its focal point, is the _focal length_, _f_.
 >
 > The distance from its _2F_ point to its optical center is double the focal length.
 
 ## Lens Customizations
 ### Color
 You may change the color of the lens by modifying the color property of lensCustomization.
 ````
 view.lensCustomization.color = .orange
 ````
 Samely, for the principle axis and the principle points, do stuff like this:
 ````
 view.lensCustomization.principleAxis.color = .cyan
 ````
 
 ### Focal Length
 You may simply change the lens' focal length.
 ````
 view.lensCustomization.focalLength = 150
 ````
 - Important:
 All lengths are measured in CGFloat in this playground.
 
 ### Position & Size
 You may change the lens' position and size, too.
 ````
 view.lensCustomization.opticalCenter = CGPoint(x: view.bounds.midX, y: view.bounds.midY)
 
 view.lensCustomization.size = CGSize(width: 90, height: 450)
 ````
 
 - Experiment:
 Try to modify the properties above and get your unique lens
 */
import UIKit
// Try your code out here
//: [Next](@next)
