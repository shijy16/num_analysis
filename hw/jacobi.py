# -*- coding: utf-8 -*-
"""
Created on Wed Feb 13 08:09:46 2019

@author: 鹰皇
"""

#jacobi迭代法
import numpy as np
A=[[5.0,2.0,1.0],[-1.0,4.0,2.0],[2.0,-3.0,10.0]]
b=[[-12.0,20.0,3.0]]

def get_base(A):#获得一个基，在基上修改
    base=list(np.zeros((len(A),len(A))))
    D=[]
    for i in base:
        D.append(list(i))
    return D

def get_D(A):#获得对角矩阵D
    D=get_base(A)
    for i in A:
        D[A.index(i)][A.index(i)]=A[A.index(i)][A.index(i)]
    return D

def get_LU(A,D):#获得L+U
    AA=np.array(A)
    DD=np.array(D)
    LLUU=DD-AA
    LU=[]
    for i in LLUU:
        LU.append(list(i))
    return LU

def matrix_to_list(x):#将矩阵转换为列表的函数，numpy中应当有这一函数
    d=[]
    ans=[]
    for i in x:
        d.append(i.tolist())
    for i in d:
        ans.append(i[0])
    return ans

def roll(A,b,x0):#主循环结构
    D=get_D(A)
    LU=np.mat(get_LU(A,D))
    D=np.mat(get_D(A))
    B=D.I*LU
    b1=np.mat(b).T
    f=D.I*b1
    x=np.mat(x0).T
    y=B*x+f
    print(y)
    return matrix_to_list(y.T)
x0=[[0,0,0]]
x1= roll(A,b,x0)

def main(A,b,e):#输入系数矩阵，方程组右端b，初始值x0，以及需要的绝对误差限
    global x0
    global x1
    n=0
    a = "ss"
    while abs(x0[0][0] - x1[0][0]) > 0.01 or abs(x0[0][1] - x1[0][1]) > 0.01 or abs(x0[0][2] - x1[0][2]) > 0.01:
        n+=1
        print(n)
        x0 = x1
        x1 = roll(A,b,x0)
        # a = input()

e=0.000000001
main(A,b,e)