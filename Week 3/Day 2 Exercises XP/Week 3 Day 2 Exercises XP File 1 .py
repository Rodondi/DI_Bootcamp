"""🌟 Exercise 1 : Pets

Instructions

Using this code:

class Pets():
    def __init__(self, animals):
        self.animals = animals

    def walk(self):
        for animal in self.animals:
            print(animal.walk())

class Cat():
    is_lazy = True

    def __init__(self, name, age):
        self.name = name
        self.age = age

    def walk(self):
        return f'{self.name} is just walking around'

class Bengal(Cat):
    def sing(self, sounds):
        return f'{sounds}'

class Chartreux(Cat):
    def sing(self, sounds):
        return f'{sounds}'


Create another cat breed named Siamese which inherits from the Cat class.

Create a list called all_cats, which holds three cat instances : one Bengal, one Chartreux and one Siamese.

Those three cats are Sara’s pets. Create a variable called sara_pets which value is an instance of the Pet class, and pass the variable all_cats to the new instance.

Take all the cats for a walk, use the walk method.
"""

class Cats():
    def __init__(self, cats):
        self.cats = cats

    def walk(self):
        for cat in self.cats:
            print(cat.walk())

class Cat():
    is_lazy = True

    def __init__(self, name, age):
        self.name = name
        self.age = age

    def walk(self):
        return f'{self.name} is just walking around'

class Bengal(Cat):
    def sing(self, sounds):
        return f'{sounds}'

class Chartreux(Cat):
    def sing(self, sounds):
        return f'{sounds}'

class Siamese(Cat):
    def sing(self, sounds):
        return f'{sounds}'

# Creates a list of cat instances
all_cats = [
    Bengal('Bengal', 2),
    Chartreux('Chartreux', 3),
    Siamese('Siamese', 1)
]

# Creates Sara's pets
sara_pets = Cats(all_cats)

# Takes all the cats for a walk
sara_pets.walk()

"""🌟 Exercise 2 : Dogs

Instructions

Create a class called Dog with the following attributes name, age, weight.

Implement the following methods in the Dog class:
bark: returns a string which states: “<dog_name> is barking”.
run_speed: returns the dogs running speed (weight/age*10).
fight : takes a parameter which value is another Dog instance, called other_dog. This method returns a string stating which dog won the fight. The winner should be the dog with the higher run_speed x weight.

Create 3 dogs and run them through your class.
"""

class Dog:
    def __init__(self, name, age, weight):
        self.name = name
        self.age = age
        self.weight = weight

    def bark(self):
        return f"{self.name} is barking"

    def run_speed(self):
        return (self.weight / self.age) * 10

    def fight(self, other_dog):
        self_strength = self.run_speed() * self.weight
        other_strength = other_dog.run_speed() * other_dog.weight

        if self_strength > other_strength:
            return f"{self.name} won the fight"
        elif other_strength > self_strength:
            return f"{other_dog.name} won the fight"
        else:
            return "It's a tie!"

# Creates 3 dog instances
dog1 = Dog(name="Dobby", age=5, weight=25)
dog2 = Dog(name="Chuki", age=3, weight=30)
dog3 = Dog(name="Kelev", age=4, weight=28)

# Tests the methods
print(dog1.bark())
print(f"{dog1.name}'s run speed is: {dog1.run_speed()}")

print(dog2.bark())
print(f"{dog2.name}'s run speed is: {dog2.run_speed()}")

print(dog3.bark())
print(f"{dog3.name}'s run speed is: {dog3.run_speed()}")

print(dog1.fight(dog2))
print(dog2.fight(dog3))
print(dog3.fight(dog1))