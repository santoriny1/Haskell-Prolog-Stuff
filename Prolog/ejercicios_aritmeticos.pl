%%Factorial

%% factorial 0 = 1
%% factorial n = n * (factorial (n-1))

factorial(0,1):-!.
factorial(N,R):-Nred is N - 1,
               factorial(Nred, Rtemp),
               R is N * Rtemp.

%%Potencia

%% potencia b 0 = 1
%% potencia b e = b * (potencia b (e-1))

potencia(B,0,1):-!.
potencia(B,E,R):-Ered is E - 1,
                 potencia(B,Ered,Rtemp),
                 R is Rtemp * B.


%%Dado un numero calcular serie de fibonacci asociado

%% fibo 0 = 0
%% fibo 1 = 1
%% fibo n = fibo (n-1) + fibo(n-2)

fibonacci(0,0):-!.
fibonacci(1,1):-!.
fibonacci(N,R):-Nred1 is N - 1,
                fibonacci(Nred1,R1),
                Nred2 is N - 2,
                fibonacci(Nred2,R2),
                R is R1 + R2.