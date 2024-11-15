# mut 和shadow的区别

```rust
// mut 可变，此变量可以在其作用域内被多次赋值，如果没有mut，会编译报错
// 变量本身在内存位置（如果涉及到内存分配）通常是不变的，只是存储的值会改变
// 当变量是mut时，类型声明不能改变
let mut x = 5;
x = 6;

// let x = 5;
// x = 6;  这样会编译报错

// let x: i32 = 5;
// x只能存储i32类型的值，下面的操作是错误的
// x = "hello";

// shadow 遮蔽允许改变变量的类型
// 通过重新使用let关键字声明一个与之前变量同名的新变量
// 每一次遮蔽实际上是创建了一个全新的变量。从编译器的角度来看，新变量和之前被遮蔽的变量除了名字相同外，是相互独立的实体。它们在内存中的位置等情况可能不同，而且生命周期等也可能不同，具体要看变量的类型和使用场景。

let x: i32 = 5;
let x = "hello"

let x = 5;
let x = x + 1;


```

# 数据类型

## 有符号和无符号整型

| Length | Signed | Unsigned |
| :-----: | :----: | :------: |
|  8-bit  |   i8   |    u8    |
| 16-bit |  i16  |   u16   |
| 32-bit |  i32  |   u32   |
| 64-bit |  i64  |   u64   |
| 128-bit |  i128  |   u128   |
|  arch  | isize |  usize  |

## 进制

| Number literals | Example     |
| --------------- | ----------- |
| Decimal         | 98_222      |
| Hex             | 0xff        |
| Octal           | 0o77        |
| Binary          | 0b1111_0000 |
| Byte(u8 only)   | b'A'        |

## 浮点数

```rust
fn main() {
    let x = 2.0; // f64

    let y: f32 = 3.0; // f32
}
```

## 常用数字算术

```rust
fn main() {
    // addition
    let sum = 5 + 10;
    // subtraction
    let difference = 95.5 - 4.3;
    // multiplication
    let product = 4 * 30;
    // division
    let quotient = 56.7 / 32.2;
    let truncated = -5 / 3; // Results in -1

    // remainder
    let remainder = 43 % 5;
}

```

## 布尔

```rust
fn main() {
    let t = true;
    let f:bool = false;// with explicit type annotation
}


```

## 字节

```rust
fn main() {
    let c = 'z';
    let z: char = 'ℤ'; // with explicit type annotation
    let heart_eyed_cat = '😻';
}
```

## 元组

```rust
fn main() {
    let tup: (i32, f64, u8) = (500, 6.4, 1);
}
// 元组是一种将许多具有不同类型的值分组为一个复合类型的通用方法。元组具有固定的长度：一旦声明，它们的大小就不能增加或缩小。通过在圆括号内写入以逗号分隔的值列表来创建元组。元组中的每个位置都有一个类型，元组中不同值的类型不必相同。

fn main() {
    let tup = (500, 6.4, 1);

    let (x, y, z) = tup;

    println!("The value of y is: {y}");
}

fn main() {
    let x: (i32, f64, u8) = (500, 6.4, 1);

    let five_hundred = x.0;

    let six_point_four = x.1;

    let one = x.2;
}
```

元组是一种将许多具有不同类型的值分组为一个复合类型的通用方法。元组具有固定的长度：一旦声明，它们的大小就不能增加或缩小。

通过在圆括号内写入以逗号分隔的值列表来创建元组。元组中的每个位置都有一个类型，元组中不同值的类型不必相同。

## 数组

```rust
fn main() {
    let a = [1, 2, 3, 4, 5];
}
let months = ["January", "February", "March", "April", "May", "June", "July",
              "August", "September", "October", "November", "December"];
let a: [i32; 5] = [1, 2, 3, 4, 5];
let a = [3; 5]; // The array named a will contain 5 elements that will all be set to the value 3 initially. This is the same as writing let a = [3, 3, 3, 3, 3]; but in a more concise way.
fn main() {
    let a = [1, 2, 3, 4, 5];

    let first = a[0];
    let second = a[1];
}


use std::io;

fn main() {
    let a = [1, 2, 3, 4, 5];

    println!("Please enter an array index.");

    let mut index = String::new();

    io::stdin()
        .read_line(&mut index)
        .expect("Failed to read line");

    let index: usize = index
        .trim()
        .parse()
        .expect("Index entered was not a number");

    let element = a[index];

    println!("The value of the element at index {index} is: {element}");
}

```

# functions

```rust
fn main() {
    println!("Hello, world!");

    another_function();
    another_function1(5);
    print_labeled_measurement(5, 'h');
}

fn another_function() {
    println!("Another function.");
}

fn another_function1(x: i32) {
    println!("The value of x is: {x}");
}

fn print_labeled_measurement(value: i32, unit_label: char) {
    println!("The measurement is: {value}{unit_label}");
}
```

* **Statements** are instructions that perform some action and do not return a value.
* **Expressions** evaluate to a resultant value. Let’s look at some examples.

```rust
fn main() {
    let y = 6;
}

fn main() {
    let y = {
        let x = 3;
        x + 1
    };

    println!("The value of y is: {y}");
}
```

Functions with Return Values

```rust
fn five() -> i32 {
    5
}

fn main() {
    let x = five();
    println!("The value of x is: {x}")
}
--------------------------------------
fn main() {
    let x = plus_one(5);

    println!("The value of x is: {x}");
}

fn plus_one(x: i32) -> i32 {
    x + 1
}
```

# control flow

## if else

```rust
fn main() {
    let number = 3;
    if number < 5 {
        println!("condition was true");
    } else {
        println!("condition was false");
    }
}

------------------------
fn main() {
    let number = 3;

    if number != 0 {
        println!("number was something other than zero");
    }
}
---------------------------
fn main() {
    let number = 6;

    if number % 4 == 0 {
        println!("number is divisible by 4");
    } else if number % 3 == 0 {
        println!("number is divisible by 3");
    } else if number % 2 == 0 {
        println!("number is divisible by 2");
    } else {
        println!("number is not divisible by 4, 3, or 2");
    }
}

--------------------------
fn main() {
    let condition = true;
    // if 和 else下的都是相同类型，不能是不同类型
    let number = if condition { 5 } else { 6 };

    println!("The value of number is: {number}");
}
```

## 循环

### loop

```rust
fn main() {
    loop {
        println!("again!");
    }
}
--------------------------
fn main() {
    let mut counter = 0;

    let result = loop {
        counter += 1;

        if counter == 10 {
            break counter * 2;
        }
    };

    println!("The result is {result}");
}

----------------------------
// 打断某层loop
fn main() {
    let mut count = 0;
    'counting_up: loop {
        println("count = {count}");
        let mut remaining = 10;
        loop {
            println!("remaining = {remaining}");
            if remaining == 9 {
                break 'counting_up;
            }
            remaining -= 1
        }
        count += 1;
    }
    println!("End count = {count}");
}
```
