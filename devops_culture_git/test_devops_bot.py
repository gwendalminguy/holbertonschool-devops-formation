#!/usr/bin/env python3
"""
Tests for devops_bot.py.
"""
import unittest

validate_energy = __import__('devops_bot').validate_energy


class Test(unittest.TestCase):
    def test_correct_value(self):
        self.assertEqual(validate_energy(50), 50)

    def test_greater_than_100_value(self):
        self.assertEqual(validate_energy(125), 100)

    def test_lower_than_0_value(self):
        self.assertEqual(validate_energy(-25), 0)


if __name__ == '__main__':
    unittest.main()
