def sum_series(n, dn):
    def fraction(i):
        return i / dn

    def sum_fractions(start, end):
        result = 0
        for i in range(start, end + 1):
            result += fraction(i)
        return result

    return sum_fractions(1, n)

# Serie con denominador 3
result_series_3 = sum_series(int(1e9), 3)
print("Suma de la serie con denominador 3:", result_series_3)

# Serie con denominador 7
result_series_7 = sum_series(int(1e9), 7)
print("Suma de la serie con denominador 7:", result_series_7)
sumTot = result_series_3 + result_series_7

print("Suma total:", sumTot)