#require("testthat")

#-----------------------------------------------------------
#eq 3.11
#-----------------------------------------------------------
x <- eq3.011.alpha_t(theta_0 = 0, theta_1 = 1, alpha_t.minus.1 = 600)
expect_that(x, equals(600))

x <- eq3.011.alpha_t(theta_0 = 0, theta_1 = 1.05, alpha_t.minus.1 = 600)
expect_that(x > 600, is_true())

x <- eq3.011.alpha_t(theta_0 = 0, theta_1 = 0.95, alpha_t.minus.1 = 600)
expect_that(x < 600, is_true())

#-----------------------------------------------------------
#eq 3.11 equilibrium
#-----------------------------------------------------------
x <- eq3.011.equilibrium(theta_0 = -30, theta_1 = 1.05)
expect_that(x, equals(600))

#-----------------------------------------------------------
#iterations
#-----------------------------------------------------------
x <- iterate.f1p(f = eq3.012.alpha_t, alpha_0 = 600, iterations = 100)
expect_that(x[length(x)], equals(600))

#-----------------------------------------------------------
#eq 3.12
#-----------------------------------------------------------
x <- eq3.012.alpha_t(alpha_t_minus1 = 600)
expect_that(x, equals(600))
#----------------------------------------------------------
#eq 3.46
#----------------------------------------------------------
M <- matrix(c(1.1, 0.2, -0.2, 0.3, 1.0, 0.4, 0.2, -0.1, 0.9), ncol=3)
#lamda_i <- eigen(M,FALSE,TRUE)$values
delta <- 0.1# Not sure if this is the value. What about 2*pi/PHI
S_i.list <- sensibilityMatrix(M, delta)

S_1.res = matrix(c(0.56, 0.69, 0.11, 0.35, 0.42, 0.07, 0.06, 0.08, 0.01), nrow = 3)
expect_that(S_i.list, equals(S_1.res))
#----------------------------------------------------------
#eq 3.49
#----------------------------------------------------------
x <- eq3.049.alpha_t(10, 0.25, 4)
expect_that(x, equals(4.6))
#----------------------------------------------------------
#eq 3.50
#----------------------------------------------------------
x <- eq3.050.alpha_t(4)
expect_that(x, equals(-12))
#----------------------------------------------------------
#eq 3.51
#----------------------------------------------------------
x <- eq3.051.equilibrium(2.9)
expect_that(x, equals(c(NaN, NaN)))
x <- eq3.051.equilibrium(3)
expect_that(x[1] > 0.666666, is_true())
expect_that(x[1] < 0.666667, is_true())
expect_that(x[2] > 0.666666, is_true())
expect_that(x[2] < 0.666667, is_true())





