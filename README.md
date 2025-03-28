# Lexical Adventures 🎮  
*A collection of Lex programs to analyze code and scan languages – built for learning and fun!*  

Hi! This repository houses **four Lex programs** I created to explore how compilers understand code.

## What’s Here? 

### 1. **Vowel & Consonant Counter**
This program scans C/C++ files and tells you how many **vowels** (a, e, i, o, u) and **consonants** are present in your code.
### 2. **Number Detective** 
*“Positive or negative? Integer or fraction?”*  
This tool gets numbers in C/C++ code and sorts them into categories:  
- Positive/negative integers  
- Positive/negative fractions (like `-3.14` or `0.99`)  

### 3. **Language Validator**
A basic checker for C, C++, and Java programs. It looks for essentials like the `main` function and proper braces/parentheses.  

### 4. **MINI Language Scanner**
*“A tiny compiler for a tiny language!”*  
This scanner tokenizes code written in **MINI**, a simple educational language. It recognizes:  
- Keywords (`if`, `else`, `int`)  
- Operators (`+`, `==`)  
- Numbers, identifiers, and more  

**How I Built It**:  
1. Designed regex patterns for MINI’s syntax.  
2. Simulated automata (NFAs/DFAs) to match patterns.  
3. Wrote Lex rules to turn code into tokens.  


---
