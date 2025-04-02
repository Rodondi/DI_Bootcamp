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