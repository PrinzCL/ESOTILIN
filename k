from numpy import *
from random import randint

matriz = zeros((4,5), dtype="int")

for f in range(4):
  for c in range(5):
    matriz[f,c] = randint(0,100)

print(matriz)
print("Fila, columna 1: ")
print("Suma " , matriz[0,:].sum())
print("Suma " , matriz[:,0].sum())
print("Fila, columna 2: ")
print("Suma " , matriz[1,:].sum())
print("Suma " , matriz[:,1].sum())
print("Fila, columna 3: ")
print("Suma " , matriz[2,:].sum())
print("Suma " , matriz[:,2].sum())
print("Fila, columna 4: ")
print("Suma " , matriz[3,:].sum())
print("Suma " , matriz[:,3].sum())
print("Fila 5: ")
print("Suma " , matriz[:,4].sum())
print(f"La diagonal es: {matriz.diagonal()}")
print(f"La suma de la diagonal es: " , matriz.diagonal())
