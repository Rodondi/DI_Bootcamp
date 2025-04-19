from anagram_checker import AnagramChecker

def is_valid_input(user_input):
    cleaned = user_input.strip()
    return cleaned.isalpha() and ' ' not in cleaned

def main():
    checker = AnagramChecker()

    while True:
        print("\nANAGRAM CHECKER")
        print("1. Enter a word")
        print("2. Exit")

        choice = input("Choose an option (1 or 2): ").strip()

        if choice == '2':
            print("Goodbye!")
            break
        elif choice == '1':
            user_word = input("Enter a word: ").strip()

            if not is_valid_input(user_word):
                print("Invalid input. Please enter a single alphabetic word.")
                continue

            user_word = user_word.upper()

            print(f"\nYOUR WORD: \"{user_word}\"")

            if checker.is_valid_word(user_word):
                print("This is a valid English word.")
                anagrams = checker.get_anagrams(user_word)
                if anagrams:
                    print("Anagrams for your word:", ', '.join(anagrams))
                else:
                    print("No anagrams found.")
            else:
                print("This is not a valid English word.")
        else:
            print("Invalid choice. Please enter 1 or 2.")

if __name__ == "__main__":
    main()