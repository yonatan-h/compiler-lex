# Lex programs
 
This repository houses four Lex programs I created to explore how compilers work.

## Programs 

### 1. **Vowel & Consonant Counter**
This program scans C/C++ files and counts how many vowels and consonants are present the files.
### 2. **Number Detective** 
This tool gets numbers in C/C++ code and sorts them into categories:  
- Positive/negative integers  
- Positive/negative fractions (like `-3.14` or `0.99`)  

### 3. **Language Validator**
A basic checker for C, C++, and Java programs. It looks for essentials like the `main` function and proper braces/parentheses.  

### 4. **MINI Language Scanner**
This scanner tokenizes code written in **MINI**, a simple educational language. It recognizes:  
- Keywords (`if`, `else`, `int`)  
- Operators (`+`, `==`)  
- Numbers, identifiers, and more  

**How it was built**:  
1. Designed regex patterns for MINI’s syntax.  
2. Simulated automata (NFAs/DFAs) to match patterns.  
3. Wrote Lex rules to turn code into tokens.  

