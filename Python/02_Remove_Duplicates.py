#Remove duplicate characters from a string
text_input = input("Enter a string: ")
result = ""
for char in text_input:
    if char not in result:
        result += char

print("Result: ", result)