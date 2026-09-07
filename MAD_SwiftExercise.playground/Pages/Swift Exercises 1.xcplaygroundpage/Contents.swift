//: # Swift Exercise
//: Welcome to the Swift Exercise. This document is an interactive Playground. The goal of this exercise is to familiarize yourself with the Swift syntax, terminology and concepts.
//:
//: If this text you're currently reading is being displayed as a code comment with `//:`, you can make it look prettier by selecting `Editor` --> `Show Rendered Markup` in the menu bar at the very top of your screen. You can switch back to the raw markup by clicking `Editor` --> `Show Raw Markup`. The document is designed to be viewed in Rendered Markup mode.
//:
//: You can type your Swift code in here and it'll automatically compile.
//: If the automatic compilation annoys you, you can turn it off by clicking-and-holding your mouse on the "Play" icon in the toolbar below. Then, select `Manually Run`.
//:
//: If you need help or have any questions, please feel free to contact me. You can find my contact info on the [course website](https://avf.github.io/mobile-app-dev/). I'm always happy to help!
//:
//: ## How to do the exercises
//: - Follow the instructions for the exercises.
//: - Please write any code that I ask for right into the playground.
//: - Any time I ask a question in an exercise, **please add a comment with the explanation in your own words.**
//:
//: Here's an example:
//:
//: Write a Hello World program in Swift in a single line. Why is this a valid Swift program?

print("Hello, World!") // This works because Swift programs by default execute statements in the global scope. A `main` function or similar is not required.

//: ## Exercises
//: ### Variables and Constants
//: 1. Declare a variable with value `42` that is implicitly assigned type `Int`.
//: 1. Declare a constant with value `42` that is implicitly assigned type `Int`.
//: 1. Declare a variable with value `42.5`. What type does it have?
//: 1. Declare a variable with explicit type `Float` and value `42.5`.
//: 1. Declare an uninitialized constant with type `String`. Will you ever be able to assign a value to this constant?
var num1 = 42
let num2 = 42
var num3 = 42.5     // Double as it's implicitly inferred
var num4: Float = 42.5
let string1: String
// string1.append("abc")
// No because "string1" is declared as a constant via the "let" keyword (error message by Swift: Cannot use mutating member on immutable value: 'string1' is a 'let' constant)
//: ### Strings and String interpolation
//: 1. Create a constant of type `String` containing the text `"This is a String."`.
//: 1. Create a mutable String with `"This is an Int: "` as its initial value.
//: 1. Create an `Int` constant with value 42 and append it to the mutable string, resulting in the value: `"This is an Int: 42"`.
//: 1. Create another constant containing the same string, but this time use a string literal and string interpolation (the `\()` syntax) to create it.
//: 1. Create a multiline string using the multiline string literal.
let string2: String = "This is a String"
var string3 = "This is an Int: "
let num5: Int = 42
string3 += String(num5)
let string4 = "This is an Int: \(num5)"
let string5 = """
    This
    is
    the
    5th
    string
    in
    this
    Exercise.
    """

print(string5)
//: ### Arrays and Dictionaries
//: Arrays
//: 1. Create an immutable array and initialize it with an array literal containing 3 `String` elements
//: 1. Create an empty mutable array of type `[String]`
//: 1. Append the second element of the first (immutable) array to the second (mutable) array.
//: 1. Can you modify one of the `String` elements in the first array (for example, append a word to it)? Why/why not? What if the elements were not of type `String`, but instead of a class?
//: 1. What happens if you modify the `String` element in the second array (for example, if you append a word to it)? Will the second element in the first array also change, or stay the same? Explain why.
//: 1. Create an immutable empty array of type `[Int]` without any literals, using the name of the class (`Array`) and the standard initializer for generic types (`var value = ClassName<GenericType>()`)
let array1 = ["a", "b", "c"]
var array2: [String] = []
array2.append(array1[1])

// array1[0].append(" is the first element") doesn't work because array1 was initalised as a constant array

class MyClass1 {
    var value1 = "a"
    var value2 = "b"
    var value3 = "c"
}

let myValue1 = MyClass1()
let myValue2 = MyClass1()
let myValue3 = MyClass1()

let array3 = [myValue1, myValue2, myValue3]

array3[0].value1.append(" is the first element")
print(array3[0].value1)
// If the elements of an array are instances of a class, their properties can still be modified because classes are reference types. While "let" prevents replacing the references in the array, it does not make the referenced objects immutable (if value1, value2, and value3 were declared as constants via the "let" keyword, the manipulation wouldn't be possible: "Cannot use mutating member on immutable value: 'value1' is a 'let' constant").
//: Dictionaries
//: 1. Create a mutable empty Dictionary of type `[String: Double]`
//: 1. Set the value for the key `"Answer to Life, the Universe and Everything"` to `42`.
var myDictionary: [String: Double]
myDictionary = ["Answer to Life, the Universe and Everything": 42.0]
//: ### Optionals
//: 1. Create an optional `String` variable and assign a non-nil value of your choice
//: 1. Print the String on the console. Make sure the variable is first unwrapped and only the actual value is printed. You may either force-unwrap the string or use an `if let` construct.
//: 1. What happens if you force-unwrap an optional variable that contains `nil`?
//: 1. Create another optional `String` variable and asign the value `nil`. Use the nil coalescing operator (`??`) to print the first unwrapped String from above.
//: 1. Do the same thing again, but this time use the ternary conditional operator `(a ? b : c)`.
var optString1: String? = "abc"
if let unwrapped1 = optString1 {
    print(unwrapped1)
}

var optString2: String? = nil
if let unwrapped2 = optString2 {
    print("Unwrapped2: ", unwrapped2)
}
// The optional variable doesn't get printed. Moreover, no errors occur

var optString3: String? = nil
let unwrapped3 = optString1 ?? "Non-optional String"
print("First unwrapped String value again: \(unwrapped3)")

let unwrapped4 = optString1 != nil ? optString1 : "Non-optional String"
print("First unwrapped String value again: \(unwrapped3)")
//: Optional chaining
//: 1. Consider the following `struct`. Use optional chaining to change the value of `anOptionalInt` in `instance` to a new value of your choice in a single line of code. What would happen if we executed that line while `instance` is `nil`?
//: 1. Use the `if let` conditional and optional chaining to print the value of `anOptionalInt` in `instance`. What would happen if `instance` or `anOptionalInt` were `nil`?
//: 1. Use optional chaining to call the method `sayHelloWorld` of `instance`. What would happen if `instance` were `nil`?

struct MyStruct {
    var anOptionalInt: Int? = 5
    
    func sayHelloWorld() {
        print("Hello, World!")
    }
}

var instance: MyStruct? = MyStruct()

instance?.anOptionalInt = 4

var instance1: MyStruct? = nil
if var instanceInt1 = instance1?.anOptionalInt {
    instanceInt1 = 3
    print(instanceInt1)
} else {
    print("instanceInt1 is nil")
}
// The value of instanceInt1 can't be changed because the superordinate "instance1" hasn't been initialised due to the "nil" assignment

if let printInt = instance?.anOptionalInt {
    print(printInt)
}

var instance2: MyStruct? = nil
if let printInt1 = instance2?.anOptionalInt {
    print(printInt1)
}

// "printInt1" doesn't get printed because "instance2" hasn't been initialised due to the "nil" keyword

var instance3: MyStruct? = MyStruct()
instance3?.anOptionalInt = nil
if let printInt2 = instance3?.anOptionalInt {
    print(printInt2)
}
// "printInt2" doesn't get printed because it has been set to "nil" explicitly

instance?.sayHelloWorld()

instance1?.sayHelloWorld()
// The sayHelloWorld() function can't be called because the superordinate "instance1" hasn't been initialised due to the "nil" assignment. No error occurs...
//: ### Control flow
//: 1. Write a `for-in` loop that sums up all the values in `myNumbers`.
//: 1. Create an empty mutable `[Int: Int]` dictionary. Use a `for-in` loop to iterate over the elements in `myNumbers` and add each value to the dictionary, using the index of each element in `myNumbers` as its key. So for example, the dictionary should contain the key/value pair `0:12`, because 12 is element 0 of `myNumbers`.

let myNumbers = [12, 23, 1, 104]
var sum = 0
for number in myNumbers {
    sum += number
}

var myDictionary1: [Int: Int] = [:]
for (index, element) in myNumbers.enumerated() {
    myDictionary1[index] = element
}
//: ### Functions and Closures
//: Functions
//: 1. Declare and call a function without any parameters or return type that prints Hello World.
//: 1. Declare and call a function that takes two strings as parameters and returns a string. Remember that in Swift, most funtions have argument labels. Make sure to include them, you don't need to modify the argument labels in any way.
//: 1. Declare and call a function with the same signature (two strings as parameters and returns a string), but this time remove the first argument label.
//: 1. Declare and call a function with the same signature (two strings as parameters and returns a string), but this time make the first argument label **different** from the parameter name (=use a custom argument label).
//: 1. Declare a function with a default parameter value. Call the function twice, once with the argument present, once without.
//: 1. Declare a function with name `callAFunction` that takes another function as parameter and then executes it. Call your newly declared `callAFunction` and pass in one of the functions you previously declared.
func helloWorldPrint() {
    print("Hello World")
}

helloWorldPrint()

func printString(str1: String, str2: String) -> String {
    return "String printed"
}

print(printString(str1: "a", str2: "b"))

func printString1(_ str1: String, str2: String) -> String {
    return "Another String printed"
}

print(printString1("a", str2: "b"))

func printString2(first str1: String, str2: String) -> String {
return "Yet another String printed"
}
print(printString2(first: "a", str2: "b"))

func defaultParameterFunction(_ defParam: Int = 10) {
    print("defaultParameterFunction called, parameter value: ", defParam)
}

defaultParameterFunction(20)
defaultParameterFunction()


func callAFunction(storedFunction: () -> ()) {
    storedFunction()
}

callAFunction(storedFunction: helloWorldPrint)
//: Closures
//: 1. Create an optional variable that holds a closure (with a `String` parameter and no return type) and assign `nil`.
//: 1. Call the closure using optional chaining. What will happen?
//: 1. Create a `typealias` for this type of closure.
let optionalVar: ((String) -> (Void))?
optionalVar = nil

optionalVar?("xyz")
// "xyz" won't get printed because "optionalVar" is explicitly set to "nil"

let optionalVar1: ((String) -> (Void))? = { text in print(text) }

optionalVar1?("zyx")
// "zyx" will get printed because the "text" parameter gets successfully passed to the closure

typealias StringOptional = ((String) -> (Void))
let stringOptional: StringOptional? = nil
//: 1. Take a look at the following function, which takes a closure as parameter and calls it. This function is then called. For each of the following exercises, call the function again, but each time use one more simplification:
//:   * Omit closure parameter types.
//:   * Omit the closure return type
//:   * Omit the round brackets and argument label (we can do that since it's the last function parameter)
//:   * Omit the closure parameters completely. In the closure body, use the shorthand argument names (for example `$0`)
//:   * Omit the keyword `return`

func callAClosure(closure: (String, String) -> String) {
    print(closure("Hello", "World"))
}
callAClosure(closure: { (item1: String, item2: String) -> String in
    return "\(item1) \(item2)"
})

callAClosure(closure: { (item1, item2) -> String in
    return "\(item1) \(item2)"
})

callAClosure(closure: { (item1, item2) in
    return "\(item1) \(item2)"
})

callAClosure { item1, item2 in
    return "\(item1) \(item2)"
}

callAClosure {
    return "\($0) \($1)"
}

callAClosure {
    "\($0) \($1)"
}

//: ### Classes
//: 1. Create a new class named `Person`. Add non-optional `firstName` and `lastName` properties and an initializer.
//: 1. Add a `name` computed property that returns a `String` containing the first and last name.
//: 1. Add a method named `greet` that returns the following `String`: `"Hi, I'm \(name)."`
//: 1. Create a subclass of `Person` and name it `Student`.
//: 1. Add a `Float?` optional property called `grade`. Use the `didSet` property observer to make sure that the grade is not lower than 1.0 and not higher than 5.0 after it was set. Clamp the new value to this interval - so if a value higher than 5.0 is set, set it to 5.0 afterwards. If a value lower than 1.0 is set, set it to 1.0 afterwards.
//: 1. Override the `greet` function from the superclass. If the `grade` property is set, it should now return `"Hi, I'm \(name). My grade is: \(grade)"`. If the `grade property isn't set, return the superclass's implementation.
class Person {
    var firstName: String
    var lastName: String
    var name: String {
        return firstName + " " + lastName
    }
    func greet() -> String {
        "Hi, I'm \(name)."
    }
    init(firstName: String, lastName: String) {
        self.firstName = firstName
        self.lastName = lastName
    }
}


class Student: Person {
    var grade: Float? {
        didSet {
            if var actualGrade = grade {
                if actualGrade > 5.0 {
                    grade = 5.0
                } else if actualGrade < 1.0 {
                    grade = 1.0
                }
            }
        }
    }
    
    override func greet() -> String {
        if let actualGrade = grade {
            return "Hi, I'm \(name). My grade is: \(actualGrade)"
        } else {
            return super.greet()
        }
    }
}
//: ### Enums and Structs
//: 1. Create an enum named `PetType` with cases `dog` and `cat`
//: 1. In your new enum, create a function or computed property named `animalSound` that returns a `String`. Use a `switch` statement on `self` to differentiate between the cases and return `"woof"` for the `.dog` case and `"meow"` for the `.cat` case.
//: 1. Create a structure named `Pet`, with a `name` property of type `String` and a `type` constant of type `PetType` (both non-optional).
//: 1. Add a function to your structure named `makeNoise` that returns a `String`. In its implementation, return the `animalSound` of its `type`.
//: 1. Create 3 or more instances of your `Pet` struct and store them in `let` constants. Then create a new array that contains all your pets and store it in a variable.
//: 1. Change one of the names of the pets in your array. Does this change the name of any of the pets stored in the `let` constants? Explain why/why not.
//: 1. Can you change the name of one of the pets stored in the `let` constants? Explain why/why not.
//: 1. Create 3 or more instances of your `Student` class from above and store them in `let` constants. Then create a new array that contains all your students and store it in a variable.
//: 1. Change one of the names of the students in your array. Does this change the name of any of the students stored in the `let` constants? Explain why/why not.
//: 1. Can you change the name of one of the students stored in the `let` constants? Explain why/why not.
enum PetType {
    case dog
    case cat
    func animalSound() -> String {
        switch self {
        case .dog:
            return "woof"
        case .cat:
            return "meow"
        }
    }
}

struct Pet {
    var name: String
    let type: PetType
    
    func makeNoise() -> String {
        return type.animalSound()
    }
    
    
}

let pet1 = Pet(name: "Dog1", type: PetType.dog)
let pet2 = Pet(name: "Cat1", type: PetType.cat)
let pet3 = Pet(name: "Dog2", type: PetType.dog)

var petArray = [pet1, pet2, pet3]
var myPetArray = petArray

petArray[0].name = "CuteDog1"
print(petArray[0].name)
print(pet1.name)
// No because "petArray" is just a copy of the pets in "petArray", and changing its doesn't also affect the pets in "petArray".

// pet1.name = "CutestDog"
// No because "pet1" is a Value type and constant when declared via "let" ("Cannot assign to property: 'pet1' is a 'let' constant").

let student1 = Student(firstName: "Student1", lastName: "A")
let student2 = Student(firstName: "Student2", lastName: "B")
let student3 = Student(firstName: "Student3", lastName: "C")

var studentArray = [student1, student2, student3]
var myStudentArray = studentArray

studentArray[0].firstName = "GoodStudent1"
print(studentArray[0].firstName)
print(student1.firstName)
// Yes because Reference types such as a class are mutable even when they're declared constant. Therefore, the individual student constants are always affected by changes regarding the students in "studentArray".

student1.firstName = "BestStudent1"
print(student1.firstName)
// Yes because Reference types such as a class are mutable even when they're declared constant.
//: ### Protocols and extensions
//: 1. Create a protocol called `NamedThing`. Add a `get` variable of type `String`, with the name `name`.
//: 1. Use extensions to make your `Person` class and `Pet` structs from above conform to the new protocol.
//: 1. Create a new array that contains all the objects you declared as `let` constants above. You may have to explicitly specify the type of the array as `[NamedThing]`.
//: 1. Iterate over the objects in the array and print out their names.
//: 1. Create a protocol extension for `NamedThing` that contains a new computed property of type `String` called `initial`. Add a default implementation in your protocol extension, which returns the first character of the `name` property, or, if `name` is empty, an empty string.
//: 1. Print the new `initials` property in the loop you created above.
protocol NamedThing {
    var name: String { get }
}

extension Person: NamedThing {
    
}

extension Pet: NamedThing {
    
}

extension NamedThing {
    var initial: String {
        if let firstCharacter = name.first {
            return String(firstCharacter)
        } else {
            return ""
        }
    }
}

var objects: [NamedThing] = [pet1, pet2, pet3, student1, student2, student3]
for object in objects {
    print(object.name)
    print(object.initial)
}
