#%%
fruits = ["apple", "banana", "cherry", "kiwi", "mango","apple","kiwi"]
newlist = [x for x in fruits if "a" in x]

print(newlist)
#%%
fruits = ["apple", "banana", "cherry", "kiwi", "mango","apple","kiwi"]
# no puedes poner else despues del for, si antes
newlist = [x if "a" in x else None for x in fruits]

print(newlist)
# %%
# set no admite repetidos
list(set(fruits))
# %%
