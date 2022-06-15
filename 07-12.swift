import Swift

func lec07_func_basic () -> Void {
    // MARK: - 함수의 선언

    // MARK: - 함수의 기본 형태
    // func 함수이름(매개변수1이름: 매개변수1 타입, 매개변수2: 매개2타입...) -> 반환 타입 {
    //      함수 구현
    //      return 반환값
    // }

    func sum(a: Int, b: Int) -> Int {
        return a + b
    }


    // MARK: 반환 값이 없는 함수
    // func 함수이름(매개변수1이름: 매개변수1 타입, 매개변수2: 매개2타입...) -> Void {
    //      함수 구현
    //      return 반환값
    // }

    func printMyName(name: String) -> Void {
        print(name)
    }

    // 생략해도 ㅇㅋ
    // func 함수이름(매개변수1이름: 매개변수1 타입, 매개변수2: 매개2타입...) {
    //      함수 구현
    //      return 반환값
    // }

    func printYourName(name: String) {
        print(name)
    }

    // MARK: 매개변수가 없는 함수
    // func 함수이름() -> 반환타입 {
    //      함수 구현
    //      return 반환값
    // }

    func maximumIntegerValue() -> Int {
        return Int.max;
    }

    // MARK: 매개변수와 반환값이 없는 함수
    // func 함수이름() -> Void {
    //      함수 구현
    //      return 반환값
    // }

    func hello() -> Void { print("hello") }

    // func 함수이름() {
    //      함수 구현
    //      return 반환값
    // }

    func bye() { print("bye") }


    // MARK: - 함수의 호출

    sum(a: 3, b: 5) // 8
    printMyName(name: "kate")
    printYourName(name: "aaron")
    maximumIntegerValue()
    hello()
    bye()
}

func lec08_func_advanced () -> Void {
    // 함수의 다양한 모습
//    1. 매개변수 기본 값
//    2. 전달인자 레이블(Argument Label)
//    3. 가변 매개변수
    
    // MARK: - 매개변수 기본 값
    // 기본값을 갖는 매개변수는 매개변수 목록 중 뒤쪽에 위치하는 것이 좋다.
    // func 함수이름(매개변수1이름: 매개변수1 타입, 매개변수2: 매개2타입 = 매개2 기본값...) -> 반환 타입 {
    func greeting(friend: String, me: String = "kate") {
        print("Hello \(friend)! I'm \(me)")
    }
    greeting(friend: "aa");
    // 좋다는건, 반드시 그럴 필요는 없다는 것? 그러하다.
    // Error: '=' must have consistent whitespace on both sides
    // 함수의 이름을 greeting으로 했을 때 중복 정의 오류
    // Error: Invalid redeclaration of 'greeting(friend:me:)'
    func greeting2(friend: String = "no Friend..:(", me: String) {
        print("Hello \(friend)! I'm \(me)")
    }
    greeting2(me: "kate")
    
    
    // MARK: 전달인자 레이블(Argument Label)
    
    // 전달인자 레이블은 함수를 호출할 때
    // 매개변수의 역할을 좀 더 명확하게 하거나
    // 함수 사용자의 입장에서 표현하고자 할 때 사용한다.
    // 함수 중복 정의도 쉽게 할 수 있다.
    // to, from 전달 인자 레이블을 사용해서 함수의 이름 자체가 바뀐 효과이다.
    // func 함수이름(전달인자레이블 매개변수1이름: 매개변수1 타입, 전달인자레이블 매개변수2: 매개2타입 ...) -> 반환 타입 {
    
    // 함수 내부에서 전달인자를 사용할 때에는 매개변수 이름을 사용한다.
    func greeting(to friend: String, from me: String){
        print("Hello \(friend)! I'm \(me)!!!")
    }
    
    // 함수를 호출할 때에는 전달인자 레이블을 사용해야 한다.
    greeting(to: "aa", from: "kate")
    
    // 전달인자 레이블 사용할 때
    // 함수 외부/내부에서 전달 인자의 의미가 상이할 때
    // 사용자 입장에서 전달 인자의 역할을 표현하고 싶을 때

    // MARK: 가변 매개변수
    
    // 전달 받을 값의 개수를 알기 어려울 때 사용할 수 있다.
    // 가변 매개변수는 함수당 하나만 가질 수 있다.
    // 맨 뒤에 위치하는 것이 좋다.
    // 선언 시 타입 뒤에 마침표 3개
    // func 함수이름(매개변수1이름: 매개변수1 타입, 매개변수2: 매개2타입...) -> 반환 타입 {
    func sayHelloToFriends(me: String, friends: String...) -> String{
        return "Hello \(friends)! I'm \(me)"
    }
    print(sayHelloToFriends(me: "kate", friends: "aa", "bb", "cc"))
//    Hello ["aa", "bb", "cc"]! I'm kate
    print(sayHelloToFriends(me: "kate"))

    /*
        위에 설명한 함수의 다양한 모양은 모두 섞어서 사용할 수 있다.
    */
    
    //MARK: - 데이터 타입으로서의 함수
    
    // 스위프트는 함수형 프로그래밍 패러다임을 포함하는 다중 패러다임 언어
    // 스위프트의 함수는 일급객체이므로 변수, 상수 등에 저장이 가능하고
    // 매개변수를 통해 전달할 수도 있다.
    
    //MARK: 함수의 타입 표현
    // 반환 타입을 생략할 수 없다.
    // (매개변수1 타입, 매개변수2 타입, ...) -> 반환타입
    
    // someFunction이라는 변수에 오른쪽과 같은 함수가 들어올 것이다.
    // 2개의 String 매개변수를 받고 Void를 반환하는 함수.
    // greeting이라는 함수를 someFunction에 할당
    // 이제 someFunction이라는 변수는 함수이기에, 아래와 같이 실행할 수 있다.
    var someFunction: (String, String) -> Void = greeting(to:from:)
    someFunction("eric", "kate") // Hello eric! I'm kate
    
    // greeting(to:from:)과 greeting(friend:me:)는 타입이 같으므로 재할당할 수 있다.
    someFunction = greeting(friend:me:)
    // Error:: Cannot find 'greeting(me:friend:)' in scope
//    someFunction = greeting(me:friend:)
    someFunction("kate", "aaa")
    
    // 타입이 다른 함수는 할당할 수 없다.
    // Error: Cannot assign value of type '(String, String...) -> String' to type '(String, String) -> Void'
//    someFunction = sayHelloToFriends(me:friends:)
    
    // 함수 타입을 매개변수 타입으로 지정해주면, 전달받은 함수를 안에서 실행할 수 있다.
    func runAnother(function: (String, String) -> Void) {
        function("jenny", "kate")
    }
    runAnother(function: greeting(to:from:))
    runAnother(function: someFunction)
    
    // 생각해보기 가변 매개변수와 Array로 전달할 때의 차이
    // 함수 호출할 때 외적으로 다를 것이다.
    func sayHelloToFriendsByArray(me: String, friends: [String]) -> String{
        return "Hello \(friends)! I'm \(me)"
    }
    print(sayHelloToFriendsByArray(me: "kate", friends: ["aa", "bb", "cc"]))
    var anotherFunc: (String, String)->Void = greeting(friend:me:)
    anotherFunc("abc", "cdfb")
    anotherFunc = greeting(to:from:)
    anotherFunc("abc", "cdfb")
}

func lec09_conditional () -> Void {
    let someInteger = 100

    //MARK: - if-else
    //if <#condition#> {
    //    <#statements#>
    //} else if <#condition#> {
    //    <#statements#>
    //} else {
    //    <#statements#>
    //}
    if someInteger < 100 {
        print("100 미만")
    } else if someInteger > 100 {
        print("100 초과")
    } else {
        print("100")
    } // 100
    // 스위프트의 조건에는 항상 Bool 타입이 들어와야합니다
    // someInteger는 Bool 타입이 아닌 Int 타입이기 때문에
    // 컴파일 오류가 발생합니다
    // Error:: Type 'Int' cannot be used as a boolean; test for '!= 0' instead
//    if someInteger { }
    
    
    //MARK: - switch
    //switch <#value#> {
    //case <#pattern#>:
    //    <#code#>
    //default:
    //    <#code#>
    //}
    // 범위 연산자를 활용하면 더욱 쉽고 유용합니다
    // 1...100 : [1, 100]
    // 1..<100 : 1이상 100 미만, [1, 100)
    switch someInteger {
    case ..<0:
        print("-")
    case 0:
        print("zero")
    case 1..<100:
        print("1~99")
    case 100:
        print("100")
    case 101...:
//    case 101...Int.max:
        print("over 100")
    default:
        print("unknown")
    } // 100
    
    // 정수 외의 대부분의 기본 타입을 사용할 수 있습니다
    switch "jake" {
    case "jake", "mina":
        print("jake or mina")
        fallthrough
    case "kate":
        print("kate!!")
    default:
        print("unknown")
    }
    
    // 명확히 case가 명시되지 않은 이상 default 구문을 꼭 작성해야 한다.
    // Error:: Switch must be exhaustive
    // 명시적으로 break를 하지 않아도 break가 걸린다.
    // 다른 언어에서 break 없애는 꼼수는 안통한다. 대체 방법: case 뒤에 여러 값을 ,로 연결하자.
    // 다른 case까지 실행하고 싶은 경우, fallthrough 예약어로 가능하다. jake, mina에 걸리면 kate까지 실행된다.

}

func lec10_iteration () -> Void {
    // 반복문
    // 주로 collection type(Array, Dictionary, set) data들과 함께 사용된다.
    // 1. for-in
    // 2. while
    // 3. repeat-while
    
    var integers = [1, 2, 3]
    let people = ["yagom": 10, "eric": 15, "mike": 12]

    //MARK: - for-in
    // js 에선 Array 한정해서 for ... of / python에선 for in
    //for <#item#> in <#items#> {
    //    <#code#>
    //}
    for integer in integers {
        print(integer)
    }

    // Dictionary의 item은 key와 value로 구성된 튜플 타입입니다
    // (key, value)
    for (name, age) in people {
        print("\(name): \(age)")
    }



    //MARK: - while
    // 조건문의 ( )는 선택사항. xcode 자동완성에서는 소괄호 없다.
    // 조건부분은 반드시 Boolean 값이 들어와야 한다.
    //while <#condition#> {
    //    <#code#>
    //}
    while integers.count > 1 {
        integers.removeLast()
    }


    //MARK: - repeat-while
    // 다른 언어의 do while과 유사.
    // swift에서는 do 키워드가 오류 처리에 사용된다
    //repeat {
    //    <#code#>
    //} while <#condition#>
    repeat {
        integers.removeLast()
    } while integers.count > 0
}

func lec11_optional () -> Void {
    // Optional: 값이 있을 수도 없을 수도 있음
    // 필요한 이유: nil이 할당 될 수 있는지 없는지 표현하기 위해
    
    // optional 이 아닌 값에는 nil을 보낼 수 없다.
    // 컴파일 단계에서도 안전하게 optional 값을 처리할 수 있다.
    // optional자체가 그것을 의미하기에, 함수 위의 주석이 사라져도 괜찮다.
    
    // someOptionalParam can be nil
    func someFunction(someOptionalParam: Int?){
        // ...
    }
    // someParam must not be nil
    func someFunction(someParam: Int){
        // ...
    }
    
    someFunction(someOptionalParam: nil)
    // Error:: 'nil' is not compatible with expected argument type 'Int'
//    someFunction(someParam: nil)
    
    // 열거형이 기본 타입. 값이 있을 때, 없을 때 2 case
//    enum Optional<Wrapped> : ExpressibleByNilLiteral {
//        case none
//        case some(Wrapped)
//    }
    
    // Optional 선언하는 방법
    let optionalValue__: Optional<Int> = nil
    let optionalValue___: Int? = nil
    
    
    //MARK: - ! : 암시적 추출 옵셔널
    
    // Implicitly Unwrapped Optional
    var implicitlyUnwrappedOptionalValue: Int! = 100

    // optional 타입 자체는 열거형이기 때문에 switch case 구문으로 아래와 같이 구분할 수 있다.
    // Alert:: Switch condition evaluates to a constant
    switch implicitlyUnwrappedOptionalValue {
    case .none:
        print("This Optional variable is nil")
    case .some(let value):
        print("Value is \(value)")
    }

    // 기존 변수처럼 사용 가능
    implicitlyUnwrappedOptionalValue = implicitlyUnwrappedOptionalValue + 1

    // nil 할당 가능
    implicitlyUnwrappedOptionalValue = nil

    // 잘못된 접근으로 인한 런타임 오류 발생 가능
    // nil을 할당한 후 optional 변수에 접근한 경우
    //implicitlyUnwrappedOptionalValue = implicitlyUnwrappedOptionalValue + 1

    //MARK: - ? 일반적인 옵셔널
    // 일반적인 Optional
    // Int 값이 있을 수도, 없을 수도.
    var optionalValue: Int? = 100
    
    // !와 똑같이,
    // optional 타입 자체는 열거형이기 때문에 switch case 구문으로 아래와 같이 구분할 수 있다.
    // Alert:: Switch condition evaluates to a constant
    switch optionalValue {
    case .none:
        print("This Optional variable is nil")
    case .some(let value):
        print("Value is \(value)")
    }

    // nil 할당 가능
    optionalValue = nil

    // 기존 변수처럼 사용불가 - 옵셔널과 일반 값은 다른 타입이므로 연산불가
    //optionalValue = optionalValue + 1
    // ? 옵셔널 값 꺼내서 사용하는 방법은 다음 시간에:)
}



func lec12_optional_unwrapping () -> Void {
    /* 옵셔널 추출 (? optional인 경우)  */
    //      옵셔널 바인딩
    //      강제 추출 -> 하지마
    
    
    //MARK: - Optional Binding
    // 1. if-let 방식
    // nil check, 안전하게 값 꺼내오는 방법
    // optional은 택배 박스라고 생각하자.
    // 값이 있는 상태는 박스 안에 값, 값이 없는 상태는 박스만 있음.
    // optional binding은 값이 있는지 여부를 상자에 물어보는 것.
    // 있으면 값을 꺼내고, 없으면 지나치고.
    func printName(_ name: String) {
        print(name)
    }

    var myName: String? = nil

    // Error:: Value of optional type 'String?' must be unwrapped to a value of type 'String'
//    printName(myName)
    // myName은 String 타입이 아니라 Optional 타입이다.
    // 전달되는 값의 타입이 다르기 때문에 컴파일 오류발생
    if let name: String = myName {
        printName(name)
    } else {
        print("myName == nil")
    }

    // 암시적 추출 옵셔널 형식도 옵셔널 타입이기 때문에 if-let으로 값을 꺼내올 수 있다.
    var yourName: String! = nil

    if let name: String = yourName {
        printName(name)
    } else {
        print("yourName == nil")
    }

    // name 상수는 if-let 구문 내에서만 사용가능합니다
    // 상수 사용범위를 벗어났기 때문에 컴파일 오류 발생
    //printName(name)
    
    // ,를 사용해 한 번에 여러 옵셔널을 바인딩 할 수 있습니다
    // 모든 옵셔널에 값이 있을 때만 동작합니다
    myName = "yagom"
    yourName = nil

    if let name = myName, let friend = yourName {
        print("\(name) and \(friend)")
    }
    // yourName이 nil이기 때문에 실행되지 않습니다
    
    // yourName에 값을 할당한 이후 실행하면 실행이 된다.
    yourName = "hana"
    if let name = myName, let friend = yourName {
        print("\(name) and \(friend)")
    } // yagom and hana

    
    //MARK: - Force Unwrapping
    // 옵셔널 강제 추출
    // 옵셔널 보호막을 강제로 깨부수고 갖고 나오는 방법이라고 보면 된다.
    // 옵셔널 뒤에 !를 붙이면, 강제로 추출한다고 보면 된다. 그래서 강제 추출된 값이 printName에 전달된다.
    printName(myName!) // yagom
    myName = nil

    //print(myName!)
    // myName이 nil값이라면 강제추출시 값이 없으므로 런타임 오류 발생
    
    // 암시적 추출 옵셔널의 경우 강제 추출을 가정하고 선언한 것이다.
    // 그렇기 때문에 printName에 !를 붙이지 않고도 전달이 가능하다.
    printName(yourName)
    
    yourName = nil
    //printName(yourName)
    // nil 값이 전달되기 때문에 런타임 오류발생

    // 안전하게 옵셔널을 사용하려면 강제추출 하지 말고 옵셔널 바인딩을 사용하자.
}

lec12_optional_unwrapping()
