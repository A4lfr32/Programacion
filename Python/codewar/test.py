#%% Excersice 1
text='Quis custodiet ipsos custodes ?'

lambda p : p in '!?'
result=[l[1:]+l[0]+'ay' if l[0] not in '!?' else l[0] for l in text.split(' ')]
' '.join(result)

# Notas
# "asd".isalpha() # True si es alfanumerico
# "asd!".isalnum() #True si es alfanumerico

# %%
