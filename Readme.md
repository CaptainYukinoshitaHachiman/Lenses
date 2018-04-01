> Tell us about the features and technologies you used in your Swift playground.

"Lenses" is inspired by the physics lessons I have taken. Here in Jiangsu Province in China, we learn about the image formation with the convex lenses in grade 8. During learning, I found many of my classmates confused about it and spend lots of time studying it. In my opinion, this is because the definitions are too abstract. Therefore, I've created this playground in order to help them learn better. This playground provides interactive scenes to teach the you. In a page, you'll learn the basics first, and then, you'll be able to experiment by yourself in complex scenes.

On the technical level, the playground is based on UIKit and PlaygroundSupport. What's more, this playground is highly customizable. You can easily change the properties, like focal length, object distance, and so on. This means you can try out how different physical properties affect the result. This makes the experiments possible. For example, you can set the object distance to the focal length, and then you'll find that no image forms when an object is at the focal point.

The basic knowledge of physics is written in MarkUp, and the experiments mentioned before are also done in this way. You can see how the light rays travel, how the images form and so on in the live view. At the bottom of some pages, the text "// Try your code out here" is shown for you to experiment.

And finally about the code, I've tried my best to follow the API Design Guidelines(https://swift.org/documentation/api-design-guidelines/).