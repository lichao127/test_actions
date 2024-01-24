#!/usr/bin/env python
import os

def main():
    my_secret = os.environ.get('MY_SECRET')
    secret_len = len(my_secret) // 2
    print(f"this is a clear text")
    print(f"this is the secret: {my_secret}")
    print(f"this is the secret with a prefix: a{my_secret}")
    print(f"this is the secret with a suffix: {my_secret}a")
    print(f"first half of value: {my_secret[:secret_len]}")
    print(f"second half of value: {my_secret[secret_len:]}")
    print(f"upper case: {my_secret.upper()}")
    print(f"lower case: {my_secret.lower()}")


if __name__ == "__main__":
    main()
