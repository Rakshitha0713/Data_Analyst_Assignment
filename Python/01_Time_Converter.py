#Convert minutes into hours and minutes

mins = int(input("Enter minutes: "))
hrs = mins // 60
remain_mins = mins % 60
print(f"{hrs} hours {remain_mins} minutes")