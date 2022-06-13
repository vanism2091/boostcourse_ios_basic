import Swift

func lec02_naming () -> Void {
    let age : Int = 10
    
    // 텍스트 보간 \()
    "안녕하세요! 저는 \(age)살 입니다"
    "안녕하세요! 저는 \(age+5)살 입니다"
    
    print("안녕하세요! 저는 \(age+5)살 입니다")
    print("\n###################\n")

    class Person{
        var name : String = "kate"
        var age : Int = 10
    }

    let kate: Person = Person()
    print(kate)
    dump(kate)
}

func lec03_consAndVars () -> Void {
    let constant: String = "차후에 변경이 불가능한 상수 let"
    var variable: String = "차후에 변경이 가능한 변수 var"
    
//    constant = "2322"
//    Cannot assign to value: 'constant' is a 'let' constant
    variable = "1234"
    print(constant+variable)
    
    // 나중에 할당하려고 하는 상수나 변수는 타입을 꼭 명시해야 한다.
    let sum: Int
    let inputA: Int = 100
    let inputB: Int = 200
    
    // 선언 후 첫 할당
    sum = inputA + inputB
    
    // 상수는 재할당 불가능
    // Error: Immutable value 'sum' may only be initialized once
//    sum = 1234
    
    dump(sum)
    
    // 변수도 차후 할당 가능
    var nickName: String
    
    //할당되기 전에는 변수를 사용할 수 없다.
    // Error: Variable 'nickName' used before being initialized
//    print(nickName)
    
    nickName = "onetwothree"
    nickName = "wuliuqi"
    
    print(nickName)
}

func lec04_dataTypes () -> Void {
    // 1. Bool
    // 2. Int, UInt
    // 3. Float, Double
    // 4. Character, String
    
    // 1. Bool
    var someBool: Bool = true
    someBool = false

    // Error: Type 'Int' cannot be used as a boolean; test for '!= 0' instead
//    someBool = 1
    
    //2-1. Int
    // 64bit 정수형 타입, 양수, 0, 음수
    var someInt: Int = -100
    
    // Error: Cannot assign value of type 'Double' to type 'Int'
//    someInt = 1.345
    
    //2-2. UInt Unsigned Int
    var someUInt: UInt = 100
    // Error: Negative integer '-100' overflows when stored into unsigned type 'UInt'
//    someUInt = -100
    // Error: Cannot assign value of type 'Int' to type 'UInt'
//    someUInt = someInt
    // Fatal error: Negative value is not representable
//    someUInt = UInt(someInt)

    var someFloat: Float = 3.14
    // Float 형에는 정수를 넣어도 된다.
    someFloat = 3
    
    var someDouble: Double = 3.14
    // Error: Cannot assign value of type 'Float' to type 'Double'
//    someDouble = someFloat
    
    var someCharacter: Character = "✅"
    someCharacter = "가"
    someCharacter = "A"
    // Error: Cannot assign value of type 'String' to type 'Character'
//    someCharacter = "하하하"
    print(someCharacter)
    
    var someString: String = "하하하 😆"
    someString += " 웃으면 복이 와요!"
    print(someString)
    
    // Error: Cannot assign value of type 'Character' to type 'String'
//    someString = someCharacter
    
    let integer = 100
    let floatingPoint = 12.34
    let apple = "A"
    type(of: integer)
    type(of: floatingPoint)
    type(of: apple)
}

func lec05_any_object_any() -> Void{
    
    // MARK: - Any
    
    var someAny: Any = 100
    someAny = "어떤 타입도 수용 가능"
    someAny = 123.12
    
    // Error: Cannot convert value of type 'Any' to specified type 'Double'
    // Double <- Any: 불가능
//    let someDouble: Double = someAny
    let someDouble: Double = 1.234
    // Any <- Double: 가능
    someAny = someDouble
    print(someAny)
    
    
    // MARK: - AnyObject
    // class instance만 ㄱㄴ
    class SomeClass {}
    var someAnyObject: AnyObject = SomeClass()
    
    // Error: Type of expression is ambiguous without more context
//    someAnyObject = 123.12
    
    // MARK: - nil
    // Error: 'nil' cannot be assigned to type 'Any'
//    someAny = nil
    // Error: 'nil' cannot be assigned to type 'AnyObject'
//    someAnyObject = nil
}

func lec06_collections ()  -> Void{
    // 컬렉션 타입
    // Array, Dictionary, Set
    /*
     Array - 순서가 있는 리스트 컬렉션
     Dictionary - 키와 값의 상으로 이루어진 컬렉션
     Set - 순서가 없고 멤버가 유일한 컬렉션
     */
    
    // MARK: - Array
    // 배열을 생성하는 다양한 방식이 있음.
    var integers: Array<Int> = Array<Int>()
    integers.append(1)
    integers.append(12)
    integers.append(100)
    //Error: Cannot convert value of type 'Double' to expected argument type 'Int'
//    integers.append(101.1)
    
    integers.contains(100)
    integers.contains(13)
    
    // Index 0인 elmt remove
    
    // remove(at idx:Int) → Int
    integers.remove(at: 0)
    // pop과 유사
    integers.removeLast()
    integers.removeAll()
    
    integers.count
    // Error: Fatal error: Index out of range
//    integers[0]
    integers.append(1)
    integers[0] = 10
    print(integers)
    
    // Array<Double>과 [Double]은 동일한 표현
    // 빈 Double Array 생성
    var doubles: Array<Double> = [Double]()
    // 빈 String Array 생성
    var strings: [String] = [String]()
    // 빈 Charater Array 생성
    // []는 새로운 빈 Array
    var characters: [Character] = []
    // Error: Cannot convert value of type 'Int' to expected argument type 'Character'
//    characters.append(1)
    
    // let을 사용하여 Array를 선언하면 불변(immutable) Array
    let immutableArray = [1, 2, 3]
    // Error: Cannot use mutating member on immutable value: 'immutableArray' is a 'let' constant
//    immutableArray.append(5)
//    immutableArray.removeAll()
    
    // MARK: - Dictionary
    
    // Key가 String 타입이고 Value가 Any 인 빈 Dictionary 생성 <Key, Value>
    // 순서는 임의. 그저 키와 값의 쌍이다.
    var anyDictionary: Dictionary<String, Any> = [String: Any]()
    anyDictionary["someKey"] = "value"
    anyDictionary["anotherKey"] = 100
    
    // value 변경
    anyDictionary["someKey"] = "another value"
    
    // key-value 삭제
    anyDictionary.removeValue(forKey: "someKey")
    anyDictionary
//    anyDictionary["anotherKey"] = nil
    anyDictionary.contains { $0.key == "abc" }
    
    
    let emptyDictionary: [String: String] = [:]
    let initializedDictionary: [String: String] = ["name": "kate", "gender": "female"]
    // Error: Cannot assign through subscript: 'emptyDictionary' is a 'let' constant
//    emptyDictionary["key"] = "value"
    
    // Error: Value of optional type 'String?' must be unwrapped to a value of type 'String'
    // dictionary에 key에 해당하는 값이 없을 수도 있는 불확실성 때문임.
//    let someValue: String = initializedDictionary["name"]
    
    // MARK: - Set
    
    // 빈 Init Set 생성
    // 축약 문법이 없다 :):):)
    var integerSet: Set<Int> = Set<Int>()
    integerSet.insert(1)
    integerSet.insert(100)
    integerSet.insert(99)
    integerSet.insert(99)
    integerSet.insert(99)
    // Set은 중복된 값이 없음을 보장한다.
    integerSet
    
    integerSet.contains(1)
    integerSet.contains(2)
    
    integerSet.remove(100)
    integerSet.removeFirst()
    
    integerSet.count
    
    // Set 응용
    let setA: Set<Int> = [1, 2, 3, 4, 5]
    // Error: Cannot use mutating member on immutable value: 'setA' is a 'let' constant
//    setA.insert(6)
    let setB: Set<Int> = [3, 4, 5, 6, 7]
    
    let union: Set<Int> = setA.union(setB)
    let sortedUnion: [Int] = union.sorted()
    let intersection: Set<Int> = setA.intersection(setB)
    let subtracting: Set<Int> = setA.subtracting(setB)
}
lec06_collections()
