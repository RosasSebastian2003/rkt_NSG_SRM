def calculate_sum(n):
    a1 = 1/3
    an = (1e9) / 3
    S = (n / 2) * (a1 + an)
    return S

result = calculate_sum(1e9)
print(result)
