import random
import unittest

def run_guess(guess, answer):
    if 0 < guess < 11:
        if guess == answer:
            print('you are a genius')
            return True
    else:
        print ('enter correct number')
        return False

if __name__ == '__main__'
    answer = random.randint(1, 10)
    while True:
        try:
            guess = int(input('guess number: '))
            if run_guess(guess,answer):
                break
        except ValueError:
            print('enter correct number')
            continue

#another file test
class TestMain(unittest.TestCase):
    def test_input(self):
        answer = 5
        guess = 5
        result = script.run_guess(answer, guess)
        self.assertTrue(result)
