---
author: Philip Habib
title: Best first language for high school students
date: AUGUST 2025
---

Every high school CS teacher I've met seems to pick one of two camps for Grade 11 and 12: **Python** or **Java**. (Okay, *maybe* C# if the computer lab can run VisualStudio 😅)

The reasoning is often the same:  
- *Python* is "high-level" and "reads like English."  
- *Java* is "close to C" and forces students to think about data types, memory, and object-oriented programming.  

But here's the thing: if we're chasing *those* ideals, why choose these languages?

If you love Python because it's expressive and minimal, Haskell is the *real* mvp. 

Let's take factorial for a moment ("N factorial" is the product of all numbers between 1 and N inclusive). In python, unless we `import prod from math` we have to hand-roll our own raw for loop, which would look something like this:

```python
def factorial(n: int) -> int:
    """Calculate n!, that is, n*(n-1)*...*2*1

    >>> factorial(5)
    120
    >>> factorial(10)
    362880
    """
    fact = 1
    for i in range(1, n+1):
        fact *= i
    return fact

```

In a language like Haskell, that I believe is a higher-level language than python, we would write the following

```haskell
{- | Calculate n!, that is, n*(n-1)*...*2*1

>>> factorial 5
120
>>> factorial 10
362880
-}
factorial :: Int -> Int
factorial n = product [1..n]
```

That, I say, is essentially the dictionary definition of factorial. So, which one reads *more like English*?

On the flip side, if you're in Camp Java because it "teaches fundamentals" and has C-style syntax, then why not... teach C? It's a much smaller language, and it'll make students think hard about memory, types, and foundational data structures. Then, when you actually need classes, virtual methods, or polymorphism you bring in C++ (perhaps with a small library to make functions that take iterators behave a little more like python).

Instead, we've picked the middle of the road for both philosophies. Python's not the most high-level; Java's not the leanest low-level. If our goal is to teach fundamentals and mental models, maybe we should be braver about the languages we choose to teach.

All of this being said, I, too, teach *python* in grade 11 and *java* in grade 12, but I wonder what the outcome would be if I taught a mix of FP and C!
