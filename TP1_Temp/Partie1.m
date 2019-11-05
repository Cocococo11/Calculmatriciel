clear all
close all

a = [5 2;
    3 4
];
b = [3;
    7
];

x0 = rand(2,1);exp
x = a\b
x1 = Jacobi(a,b)
x2 = Gauss_Seidel(a,b)