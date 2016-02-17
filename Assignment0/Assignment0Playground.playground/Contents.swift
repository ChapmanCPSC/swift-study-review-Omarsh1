//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

//Explicit Declaration
var whatev1 : Int
//Implicit Declaration
var whatev2 = 5

//In Swift everything is an object
var everythingIsObject : Int = 2
print(everythingIsObject.successor())


//We can extend a current types methods by saying
extension Int{
    //Extend the functions in Int and add this method:
    func  returnIsEven() -> Bool{
        if(self % 2 == 0){
            return true
        }
        else{
            return false
        }
    }
}

//Implementing the extended function
everythingIsObject.returnIsEven()


//Enums
enum majorType{
    case undeclared
    case softwareEngineering
}

//Defining classes
class student{
    var studentName : String = "noName"{
        //Using willSet and didSet
        willSet{
            print("Setting student name from to : \(newValue)")
        }
        didSet{
            print("Set student name from \(oldValue) to: \(self.studentName)")
        }
        
    }
    var studentId: Int = 0
    var Major = majorType.undeclared
    private var _isUnderGrad: Bool = true
    
    
    //Accessor and mutator(Getter and setter)
    var isUnderGrad : Bool{
        get{
            return self._isUnderGrad
        }
        set{
            self._isUnderGrad = newValue
        }
    }
    
}


//Creating instances of class student
var Omar = student()
Omar.studentName = "Omar Sherief"
Omar.isUnderGrad = true
Omar.studentId = 1925797

var Jack = student()
Jack.studentId = 1343497

var Lucy = student()
Lucy.studentId = 1246573

var Jason = student()
Jason.studentId = 7695743

//Variadic Paramaters
func returnStudentId(anyStudents : student...){
    for student in anyStudents
    {
        print(student.studentId)
    }
}

func returnMajor(anystudents: student...){
    for student in anystudents{
        let studentMajor = student.Major
        switch studentMajor{
        case.undeclared:
            print("You'll figure out what you want soon!")
        case.softwareEngineering:
            print("I wish I knew how to do that..")
        }
    }
}
//Tuple of students
var studentCollection = (Omar, Jack, Lucy, Jason)
var studentCollectionArray = [Omar, Jack, Lucy, Jason]
returnStudentId(Omar, Jack, Lucy, Jason)
returnMajor(Omar, Jack, Lucy, Jason)


//Omar.Major = majorTypes.softwareEngineering

//Functions as param
func addTwoNumbers(num1 : Int, and num2 : Int) -> Int{
    return num1+num2
}
func doMath(firstNum : Int, secNum : Int, someFunction:(Int, Int) -> Int){
    print(someFunction(firstNum, secNum))
}

//Setting variables to functions
var calculation = addTwoNumbers(23, and: 314)
doMath(22, secNum:22 , someFunction: addTwoNumbers)


//Anonymous function
let x = 3
let y = 2
let addOfTwoNums = {(num1 : Int, num2 : Int) -> Int in return(num1+num2)}
print(addOfTwoNums(y,x))

//Compound variable
var testVar:Int = {
    var rando = rand()
    if(rando > 0){
        return 1
    }
    else{
        return 2
    }
}() //Don't forget () for compound intializer
