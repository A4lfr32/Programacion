#%%

import numpy as np
import matplotlib.pyplot as plt


# %%
n=100

x=np.linspace(0,100,n).reshape((-1,1))

y=3*x+5+20*np.random.randn(n,1)

plt.plot(x,y,'.k')

# %%

bias= 0
thetas = np.random.randn(1,x.shape[1])


# %%
def model(x):
    # z=np.dot(x.T,thetas)
    zes=np.multiply(thetas,x)
    return zes
# %%

y_predict=model(x)
# %%
error=y_predict-y
# %%
m = len(error)
J=np.dot(error.T,error)/(2*m)
# %%
alfa=1
thetas-=alfa*np.dot(error.T,x)/m
# %%

for _ in range(100):
    # feedfodward
    y_predict=model(x)
    # error
    error=y_predict-y
    # Cost
    m = len(error)
    J=np.dot(error.T,error)/(2*m)
    # Update parameters
    alfa=0.00001
    thetas-=alfa*np.dot(error.T,x)/m
    # 
    print(_,J)

# %%
plt.plot(x,y,'.k')
y_predict=model(x)
plt.plot(x,y_predict)
# %%
