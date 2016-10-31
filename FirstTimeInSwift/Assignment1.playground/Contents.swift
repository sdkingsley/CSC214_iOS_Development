//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

//Variables and Constants

var canChange:Int = 5 //this is a variable
canChange = 6 //this is reassignes canChange
let cantChange:Int = 5 //this is a constant
//cantChange = 6 results in an error

//Ints, floats, booleans and strings

var anInteger:Int = 4 //this is an integer variable
//anInteger = 4.5 this doesn't work because integers will not cast to a float variable
var combined:Int = anInteger + anInteger //you can add ints

var aFloat:Float = 78.9 //this is a float
var aFloat2:Float = 2 //you can assign a number that looks like an int to a float
//var aFloat3:Float = anInteger you cannot assign a int type to a float

var aBoolean:Bool = true //you can set it to 'true' or 'false
let aSecondBoolean = Bool(1)//you can also use 1 to symbolize true
let aThirdBoolean = Bool(0)//and 0 to symbolize false
let aFifthBoolean = Bool(-1)//any number other than 0 is true


var aString = "it's a string" //this is a normal string
var aNumberString:String = "1234" //you can make a stirng out of numbers
aNumberString.appendContentsOf("5") //you can append onto a string


//Multiple references to a value type make copies of the value where changing one won't change another

var anotherInteger = anInteger //this when you reference a different integer as anotherInteger
anInteger = 8 //we change the original integer
print(anotherInteger) //but the previously assigned integer remains the same

//if, if else, if let

var SarahHasHadIcecream:Bool = true //a boolean
var SarahIsFull:Bool=true //a second boolean
var SarahShouldHaveAMilkshake:Bool //a third boolean

var conditional = SarahHasHadIcecream || SarahIsFull //a conditional statement

if conditional{ //an if else statement
    SarahShouldHaveAMilkshake = false //if sarah had icecream OR is full shes shouldnt have a milkshake
}else{
    SarahShouldHaveAMilkshake = true //if neither of those things are true, she should have a milkshake
}

if SarahHasHadIcecream{//and if, if else, else statement
    SarahShouldHaveAMilkshake = false //if sarah had icecream she shouldnt have a milkshake and exits the statment
} else if SarahIsFull{
    SarahShouldHaveAMilkshake = false //if sarah is full she shouldnt have a milkshake and exits the statment
}else{
    SarahShouldHaveAMilkshake = true //otherwise sarah should have a milkshake
}

var isItNil: Float // a float that is unassigned
var optionalFloat: Float? //an optional float that is unassigned and therefore nil

if let tmp = optionalFloat{ //temporary optional float
    isItNil = tmp //checks whether isItNil is assigned to nill
}else{
    print("isItNil is unassigned") //prints if it is unassigned
}

//for, for in

var anArray:Array = [0,0,0,0] //an array

for var i = 0; i<anArray.count; i++ {//a for loop: has errors because this notation will be unsupported in later swift versions
    anArray[i] = i //assigns anArray values consecutively
}

print(anArray) //prints anArray

let range = 0..<anArray.count //creates a range the size of anArray

for i in range { //a for in loop that utilizes the range
    anArray[i] = 0 //assigns all values to 0
}

print(anArray) //prints anArray

//enumerations

enum suits{ //creates a set of related values
    case hearts
    case spades
    case clubs
    case diamonds
}

let card:suits //so a given card has a related value from suits

card = suits.hearts //this card is a heart card

//switch

let Height = 66 //a new variable

switch Height {//switch statment
case 0...67://when they are less than 68 (my height)
    print("you are shorter than me")
case 68://when they are 68 (my height)
    print("we are the same height")
default://otherwise their height is more than 68 (my height)
    print("you are taller than me")
}


