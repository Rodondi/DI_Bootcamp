class AnagramChecker:
    def __init__(self, wordlist_path='sowpods.txt'):
        with open(wordlist_path) as file:
            self.words = set(word.strip().upper() for word in file.readlines())

    def is_valid_word(self, word):
        return word.upper() in self.words

    def get_anagrams(self, word):
        word = word.upper()
        return [
            w for w in self.words 
            if self.is_anagram(word, w) and w != word
        ]

    def is_anagram(self, word1, word2):
        return sorted(word1) == sorted(word2)