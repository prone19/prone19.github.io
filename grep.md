## grep - global regular expression print

## Sources
1. [https://www.opensourceforu.com/2012/06/beginners-guide-gnu-grep-basics/](https://www.opensourceforu.com/2012/06/beginners-guide-gnu-grep-basics/)

**grep [options] [regexp] [filename]**

*-E* option is the extended regex which includes meta-characters ?, +, {, |, (, and ).

*-i* case-insensitive
e.g. 

```bash
grep -i 'abcd' testfile 
```

*-w* whole-word search

*-v* inverses the result

*-q* quite mode which returns 1/0 indicating if a match was found or not

**Using shell expansions**

```grep "$HOME" /etc/passwd ``` -- *must be double-quoted for using env variables*

```grep `whoami` /etc/passwd ``` -- here the back-tick expansion replaced the whoami command with its value

