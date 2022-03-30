# Python

[Back to HOME](https://prone19.github.io/)

## Python Crash Course notes
### Styling - Python Enhancement Proposal (PEP)
1. use four spaces per indentation level (use tab but the editor should make them 'spaces')
2. lines to 80 char limit (comments to 79 char limit)
3. 

### Strings
```python
first_name = "ada"
last_name = "lovelace"
full_name = f"{first_name} {last_name}"
print(full_name)
print(f"Hello, {full_name.title()}!")
message = f"Hello, {full_name.title()}!"
print(message)
```
For cutting spaces:  
str.strip(), or str.lstrip(), or str.rstrip()

### Numbers
- floats ...
```
0.2 + 0.1 = 0.30000000000000004 
```
- When you divide any two numbers, even if they are integers that result in a 
  whole number, you’ll always get a float: *4/2 = 2.0*  
  Python defaults to a float in any operation that uses a float, even if the
  output is a whole number.

### Multiple Assignment
``` x, y, z = 0, 0, 0```

### CONSTANTS
Python doesn’t have built-in constant types, but Python programmers use all capital letters
to indicate a variable should be treated as a 
constant and never be changed: ```MAX_CONNECTIONS = 5000```

### Comments
*You should add notes within your programs that describe your overall **approach to the
problem** you’re solving*  
The main reason to write comments is to explain what your code is supposed
to do and how you are making it work  

When you’re determining whether to write a comment, ask yourself if
you had to consider several approaches before coming up with a reasonable way to make something work; if so, write 
a comment about your solution.

### Lists
```message = f"My first bicycle was a {bicycles[-3].title()}."```
#### appending
```motorcycles.append('ducati')``` adds ducati to the end of the list
#### inserting
The insert() method opens a space at position 0 and stores
the value 'ducati' at that location. This operation shifts every other value
in the list one position to the right
```python
motorcycles = ['honda', 'yamaha', 'suzuki']

motorcycles.insert(0, 'ducati') 
# output: ['ducati', 'honda', 'yamaha', 'suzuki'] 
```
#### removing elemets from a list
- del statement - if you know a position and not to store the deleted element use 'del' statement:
```python 
del list_name[0]
```

- pop() method  
The pop() method removes the last item in a list, but it lets you work 
with that item after removing it. The term pop comes from thinking of a 
list as a stack of items and popping one item off the top of the stack. In
this analogy, the top of a stack corresponds to the end of a list.
  
```python
motorcycles = ['honda', 'yamaha', 'suzuki']

popped_motorcycle = motorcycles.pop() 
print(motorcycles) # ['honda', 'yamaha']
print(popped_motorcycle) #  suzuki
```
pop() method can be used with indexes, like pop(1) will remove the second element from a list

- remove() method - use to remove by a value

```python
motorcycles = ['honda', 'yamaha', 'suzuki']

motorcycles.remove('ducati')
```
*The remove() method deletes only the first occurrence of the value you specify.*

#### sorting lists
- sort() method - changes the order permanently alphabetically. Alternatively you can use reverse ```cars.sort(reverse=True)```
- sorted() function - temporal sorting ```sorted(cars)```
*Sorting a list alphabetically is a bit more complicated when all the values are not in
  lowercase*
- reverse() method - reverses the order of the list

#### Slicing a list
```python
players = ['charles', 'martina', 'michael', 'florence', 'eli'] 
print(players[0:3])
```

#### Copying a list
Use ```[:]``` slices to make a copy, because otherwise you will a new link to the same list. 

```python
my_foods = ['pizza', 'falafel', 'carrot cake']
friend_foods = my_foods[:]
print("My favorite foods are:")
```

#### useful functions 
min(), max(), len(), sum()  

lists comprehensions
```python
squares = [value**2 for value in range(1, 11)]
print(squares)
```

### Loops
range(1,5) function in for loops will not print last value (5)  
list
```python
numbers = list(range(1,12, 2)) 
# produces even numbers
print(numbers)
```
```python
players = ['charles', 'martina', 'michael', 'florence', 'eli']
for player in players[:3]:
 print(player.title())
```

### Tuples
Tuples - is the lists that cannot change.
```python
imensions = (200, 50)
my_t = (3,) # single element tuple
```
### Dictionaries
A dictionary in Python is a collection of key-value pairs  

```python
alien_0 = {'color': 'green', 'points': 5}
print(alien_0['color'])
print(alien_0['points'])
```
#### Assign new values to dictionary
```python
alien_0 = {'color': 'green', 'points': 5}
print(alien_0)
alien_0['x_position'] = 0
alien_0['y_position'] = 25
print(alien_0)
```

#### Modifying dictionaries
```python
alien_0 = {'color': 'green'}
print(f"The alien is {alien_0['color']}.")

alien_0['color'] = 'yellow'
print(f"The alien is now {alien_0['color']}.")
```
It’s good practice to include a comma after the 
last key-value pair as well, so you’re ready to add a new key-value pair on the 
next line

```python
favorite_languages = {
  'jen': 'python',
  'sarah': 'c',
  'edward': 'ruby',
  'phil': 'python',
}
```

you can use the get() method to
set a default value that will be returned if the requested key doesn’t exist.  
If the key 'points' exists in the dictionary, you’ll get the corresponding value. 
If it doesn’t, you get the default value
```python
alien_0 = {'color': 'green', 'speed': 'slow'}
point_value = alien_0.get('points', 'No point value assigned.')
print(point_value)
```




