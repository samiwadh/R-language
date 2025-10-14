#1️⃣ abs() – Absolute Value
# Returns the positive magnitude of a number (distance from zero), ignoring sign.

abs(5)
abs(-2)
abs(23-3)

#2️⃣ sqrt() – Square Root
#Returns the square root of a number.
#Used in standard deviation, Euclidean distance, and other statistical

sqrt(49)
sqrt(c(1,8,9,16,25,36,49))

# 3️⃣ ceiling() – Round Up to Next Integer

# Always rounds a number upward (toward positive infinity).
# Used when you need integer upper limits, like number of batches or pages.

ceiling(1.3)
ceiling(2.45335)
ceiling(7.0000)
ceiling(-34.1112)

# 4️⃣ floor() – Round Down to Lower Integer


# Always rounds a number downward (toward negative infinity).
floor(4.8)

floor(-4.8)

# 5️⃣ round() – Round to Nearest Integer or Decimal
# Rounds a number to a given number of decimal places.
round(4.567, 2)
round(4.567)

# 6️⃣ factorial() – Factorial (n!)
# Multiplies all positive integers up to a number.

factorial(5) #(5 × 4 × 3 × 2 × 1)
factorial(10)
factorial(1+3) # 4*3*2*1


# 7️⃣ choose() – Binomial Coefficient (n Choose k)

# Gives number of ways to choose k items from n items — combination formula:
# Used in binomial distribution, sampling, and probability calculations.
choose(5,2)


# 8️⃣ exp() – Exponential Function (eˣ)

# Returns 𝑒^𝑥 , where e = 2.71828...
# Used in growth models, log transformations, and machine learning activation functions (e.g., logistic regression).

exp(1)
# [1] 2.718282

exp(2)
# [1] 7.389056

# 9️⃣ log() – Natural Logarithm
# Computes logarithm of a number.
# Default base = e, but you can specify other bases
log(10)
# [1] 2.302585  (natural log)

log(100, base = 10)
# [1] 2
