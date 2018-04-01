/*: Image Formation
 [Previous](@previous)
 # Image Formation
 Here we're finally doing what this playground is designed for, showing the formation of the images.
 */
showImageFormationView()
/*:
 In this demo, we place the the object on the left of the lens, and an image forms then. Can you tell the reason due to the view and how we defined images in the last page?
 
 > The distance from the object to the optical center is called _object distance_, _u_.
 >
 > Here, the formed image is the same size as the object, reversed, and real! But does this always happen?
 
 - Experiment:
    Change the focal length and the object distance, and find out the differences between the formed images.

    Here we're listing the customizations of the object(and the image)
 ## Object & Image Customizations
 ### Color
 ````
 view.objectCustomization.color = .green
 ````
 ### Height
 ````
 view.objectCustomization.height = 200
 ````
 ### Object Distance
 ````
 view.objectCustomization.objectDistance = 150
 ````
 Use the customizations we've told you to experiment!
 * Callout(Hint):
    The focal length of the lens is 100 (you may change it)

    You may try these situations:
    - the object is on the left of the _2F_ point
    - the object is at the _2F_ point
    - the object is between the _2F_ point and the _F_ point
    - the object is at the _F_ point
    - the object is between the _F_ point and the _O_ point
 
 */
import UIKit
// Try your code out here
//: [Beyond WWDC](@next)
