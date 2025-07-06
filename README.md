# 🧠 Typing Speed Test in Assembly (x86 - Irvine32)

This project is a typing speed test implemented in **x86 Assembly Language** using the **Irvine32** library. It helps users test their typing accuracy and speed across three difficulty levels.

## 🚀 Features

- ⌨️ Type a given sentence and compare it with the correct one
- 🕒 Measures total time taken (in milliseconds)
- ✅ Counts number of correct characters
- 📊 Calculates Words Per Minute (WPM)
- 🔄 Prompts the user to continue to the next level or exit

## 🧩 Levels

1. **Level 1:** Basic sentence
2. **Level 2:** Moderate sentence with logic terms
3. **Level 3:** Advanced paragraph covering low-level programming and optimization

## 📁 File Structure

```
TypingSpeedTest.asm        # Main Assembly source code
README.md                  # Project documentation (this file)
```

## 🔧 Requirements

- Windows OS (x86-based)
- [MASM](https://learn.microsoft.com/en-us/cpp/assembler/masm/microsoft-macro-assembler-reference?view=msvc-170)
- Irvine32 Library setup in Visual Studio
- Visual Studio with MASM and custom build rule for `.asm`

## 🛠️ How to Run

1. Clone or download this repository
2. Open the `.asm` file in Visual Studio
3. Make sure Irvine32 is properly configured (`Irvine32.inc`, `Irvine32.lib`, and DLLs)
4. Press **Ctrl + F5** or build and run

## 🧪 Output Example

```
Level 1: Type the following sentence:
Assembly is easy.

Your input: Assembly is esay.

Time taken (ms): 3140
Correct characters: 14
Typing Speed (WPM): 53
```

## 📚 Educational Purpose

This project demonstrates:
- String comparison logic
- Real-time user input
- Timer handling with `GetTickCount`
- Basic performance calculation in Assembly

## 📝 Author

- Muhammad Hassan
- Computer Science Student | Assembly & Systems Programming Enthusiast

---

### 📢 Disclaimer

This project is for **educational use** only. Built using the Irvine32 library which is commonly used in academic courses for teaching low-level programming.
