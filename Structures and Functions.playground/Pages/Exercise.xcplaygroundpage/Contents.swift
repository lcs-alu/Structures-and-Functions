/*:
 [Previous](@previous)
 
 The following statement is required to make the playground run.
 
 
 Please do not remove.
 */
import Foundation
/*:
 ## Exercise
 
 Write a function named **shortestDistance** that determines the shortest distance from a point on a Cartesian plane to a line on a Cartesian plane.
 
 The function header should look like this:
 
  ![example](example1.png "example")
 
 You can re-use the **Point** structure and the *distance* function.
 
 You should declare a new **Line** structure.
 
 Recall that a line is defined by it's *slope* and it's *vertical intercept*. What stored properties would you create for a **Line** structure?
 
 Recall that slope, in turn, is defined by it's *rise* and *run*. Could you create a **Slope** structure? What stored properties might it define?
 
 Recall that the shortest distance from a point to a line is the *perpendicular* distance from that point to the line.
 
 Here is a [complete example showing how to find the shortest distance from a point to a line](http://russellgordon.ca/lcs/shortest-distance-example.pdf), using symbolic algebra.
 
 Your job is to implement a solution in code that carries out the necessary mathematics. The beautiful part of this effort is that, once you've "taught" the computer how to do this correctly, you will never need to do this type of work manually again. 👍🏽😅🎉

*/

// Set the structure
struct Point {
    var x : Double = 0.0
    var y : Double = 0.0
}
// Create a instance
var cabinSite = Point(x: 6, y:1.5)

// Define a struture that represents a Line
struct Line {
    var slope : Double = 1.0
    var verticalIntercept : Double = 0.0
}

// Create an instance of the line
var slopeOfExistingRoad = Slope(rise: -1, run: 2)
var existingRoad = Line(slope: slopeOfExistingRoad, verticalIntercept: 9.5)

func getSlopeOfPerpendicularLine(from givenLine: Line) -> Slope {

}
func shortestDistance(from: Point, to: Line) -> Double {
    return sqrt(pow(from.x - to.x, 2) + pow(from.y - to.y, 2))
}

