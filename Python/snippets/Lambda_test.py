#%%
# puede tomar multiples argumentos pero solo una expresion
x = lambda a: a + 10
print(x(5))

x = lambda a, b : a * b
print(x(5, 6))
# %%
# sirve como plantilla de funciones
def myfunc(n):
  return lambda a : a * n
# aca se crea una funcion duplicadora
mydoubler = myfunc(2)
# aca se ejecuta la funcion
print(mydoubler(11))

# %%
full_name = lambda first, last: f'Full name: {first.title()} {last.title()}'
full_name('guido', 'van rossum')
# %%
_=lambda x, y: x + y
_(1, 2)