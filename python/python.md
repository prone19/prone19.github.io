# Python

[Back to HOME](https://prone19.github.io/)

## Python Crash Course notes
### Styling - Python Enhancement Proposal (PEP)
1. use four spaces per indentation level (use tab but the editor should make them 'spaces')
2. lines to 80 char limit (comments to 79 char limit)
3. functions and module names should be descriptive, lowercase and using underscores
4. functions should have a comment what it does `"""comment"""`
5. no spaces near equal sign when specifying default values for functions
6. indention for function
```
def function_name(
        parameter_0, parameter_1, parameter_2,
        parameter_3, parameter_4, parameter_5):
    function body...
```
7. separate function definitions by 2 blank lines

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

*Special* value `None`, which is used when a variable
has no specific value assigned to it. You can think of None as a placeholder
value for functions and then check if value true of false (none).

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

Don't modify
a list inside a `for` loop because Python will have trouble keeping track of the
items in the list. To modify a list use a `while` loop

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

In order to delete a key from the list use `del`statement:
```python
alien_0 = {'color': 'green', 'points': 5}
print(alien_0)
del alien_0['points']
print(alien_0)
```

#### Looping through dictionaries
```python
user_0 = {
 'username': 'efermi',
 'first': 'enrico',
 'last': 'fermi',
 }
for key, value in user_0.items():
print(f"\nKey: {key}")
print(f"Value: {value}")
```

The `keys()` method allows looping through dictionary and show values.dict.keys(). *But this is set by default*,
you can add this .keys() if you need to make your code easier to read.  
The `sorted()` function allows to create a sorted copy of a dict.
The `values()` method allow going through all values in the dict.
Use `set()` to get unique values `set(favorite_languages.values())` 

You can build a **set** directly using braces and separating the elements with commas:
> languages = {'python', 'ruby', 'python', 'c'}

*It’s easy to mistake **sets** for dictionaries because they’re both wrapped in braces.
When you see braces but no key-value pairs, you’re probably looking at a set. Unlike
lists and dictionaries, sets do not retain items in any specific order.*


#### Nesting
Storing multiple dictionaries in a list, or a list of
items as a value in a dictionary. This is called **nesting**.

```python
# dict inside a list
alien_0 = {'color': 'green', 'points': 5}
alien_1 = {'color': 'yellow', 'points': 10}
alien_2 = {'color': 'red', 'points': 15}
aliens = [alien_0, alien_1, alien_2]
```

```python
# list inside a dict
pizza = {
  'crust': 'thick',
  'toppings': ['mushrooms', 'extra cheese'],
}
```
*You should not nest lists and dictionaries too deeply*

```python
# dict inside a dict
users = {
  'aeinstein': {
    'first': 'albert',
    'last': 'einstein',
    'location': 'princeton',
  },
  'mcurie': {
    'first': 'marie',
    'last': 'curie',
    'location': 'paris',
  },
}
for username, user_info in users.items():
  print(f"\nUsername: {username}")
  full_name = f"{user_info['first']} {user_info['last']}"
  location = user_info['location']
  print(f"\tFull name: {full_name.title()}")
  print(f"\tLocation: {location.title()}")
```


### Functions
```python
def describe_pet(animal_type, pet_name='Cook'):       # 'Cook' is default value for the parameter
    """Display information about a pet."""
    print(f"\nI have a {animal_type}.")
    print(f"My {animal_type}'s name is {pet_name.title()}.")

describe_pet(animal_type='hamster', pet_name='harry') # key word assignment arguments
```

The text at 2nd row is a comment called a *docstring*, which describes
what the function does. Docstrings are enclosed in triple quotes, which
Python looks for when it generates documentation.

```python
 def get_formatted_name(first_name, last_name):
    """Return a full name, neatly formatted."""
    full_name = f"{first_name} {last_name}"
    return full_name.title()

musician = get_formatted_name('jimi', 'hendrix')
print(musician)
```

If you notice the function
is doing too many different tasks, try to split the code into two functions.
Remember that you can always call a function from another function,
which can be helpful when splitting a complex task into a series of steps.

When working with lists you can work with lists copies when you need to modify it `print_models(unprinted_designs[:], completed_models)`.  

But even though you can preserve the contents of a list by passing a copy
of it to your functions, you should pass the original list to functions unless
you have a specific reason to pass a copy. It’s more efficient for a function
to work with an existing list to avoid using the time and memory needed to
make a separate copy, especially when you’re working with large lists.

#### arbitrary arguments
```python
def make_pizza(size, *args):    # '*' creates a tuple which accepts as many values as it receives, should be placed
                                    # at the end of the listed parameters
    """Summarize the pizza we are about to make."""
    print(f"\nMaking a {size}-inch pizza with the following toppings:")
    for topping in args:
        print(f"- {topping}")

make_pizza(16, 'pepperoni')
make_pizza(12, 'mushrooms', 'green peppers', 'extra cheese')
```

```python
# from pizza import make_pizza as mp    
# import pizza as p
# from module_name import * --- be careful with that it may cause unexpected result when using large modules like
                                # matching with existing function names

def build_profile(first, last, **kwargs):    # '**' creates a dict that accepts key-value elements
    kwargs['first_name'] = first
    kwargs['last_name'] = last
	return kwargs
user_profile = build_profile('albert', 'einstein',
	location='princeton',
	field='physics')
print(user_profile)
```

### Classes

*Instantiation* - making an object from a class.
*function in a class* - called method 

```python
 class Dog:     # capitalized names
    """A simple attempt to model a dog.""" 
 
    def __init__(self, name, age):      # python  runs automatically whenever creating a new instance based 
                                        # on the class
        """Initialize name and age attributes."""
        self.name = name
        self.age = age
 
    def sit(self):
        """Simulate a dog sitting in response to a command."""
        print(f"{self.name} is now sitting.")
 
    def roll_over(self):
        """Simulate rolling over in response to a command."""
        print(f"{self.name} rolled over!")
```