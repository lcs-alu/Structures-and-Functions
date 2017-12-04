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

// Define a struture that represents a slope
struct Slope {
    var rise : Double = 1.0
    var run: Double = 0.0
}

// Define a structure that represents a Line
struct Line {
    var slope : Slope = Slope(rise: 1.0, run: 1.0)
    var verticalIntercept : Double = 0.0
}

// Create an instance of the line
var slopeOfExistingRoad = Slope(rise:-1, run: 2)
var existingRoad = Line(slope: slopeOfExistingRoad, verticalIntercept: 9.5)

/// Returns the slope of a line perpendicular to the provided line
///
/// - Parameter givenLine: The line that we are strarting from
/// - Returns: The slope of the line that is perpendicular
func getSlopeOfPerpendicularLine(from givenLine: Line) -> Slope {
    return Slope(rise: givenLine.slope.run, run: givenLine.slope.rise * -1)
}

// Get the perpendicular slope (the slope of the new road from the cabin to the exist road)
let perpendicularSlope = getSlopeOfPerpendicularLine(from: existingRoad)

func getVerticalIntercept(from p: Point, onLineWith m: Slope) -> Double {
    
     // Get the slope as a decimal
    let mAsADecimal = m.rise / m.run
    
    // b = y - m * x
    return p.y - mAsADecimal * p.x
}

// Get the vertical intercept of the new road
 let perpendicularLineVerticalIntercept = getVerticalIntercept(from: cabinSite, onLineWith: perpendicularSlope)

// Define the equation o the new line (the new road that needs to be built)
let newRoad = Line(slope: perpendicularSlope, verticalIntercept: perpendicularLineVerticalIntercept)

/// Gets the point where two lines in a Cartesian plane intersect
///
/// - Parameters:
///   - first: the first line
///   - second: the second line
/// - Returns: the point of intersection
func getPointOfIntersection(between first: Line, and second: Line) -> Point {
    
    // Reminder x = ( b1 - b2) / (m2 - m1)
    
    // Get the vertical inercept difference
    let verticalInterceptDifference = first.verticalIntercept - second.verticalIntercept
    
    // Get the slope difference
    let slopeDifference = second.slope.rise / second.slope.run - first.slope.rise / first.slope.run
    
    // Now get the x value
    let x = verticalInterceptDifference / slopeDifference
    
    // Get the actual y-value (substitution)
    // y = m1 * x + b1
    let y = first.slope.rise / first.slope.run * x + first.verticalIntercept
    
    // Return the point of intersection
    return Point(x: x, y: y)
}

// Invoke the function to get the point of intersection
getPointOfIntersection(between: existingRoad, and: newRoad)
