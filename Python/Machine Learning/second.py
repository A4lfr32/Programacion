#%%

import numpy as np
import matplotlib.pyplot as plt

# %%
n=100

x=np.linspace(0,100,n).reshape((-1,1))

y=3*x+5+20*np.random.randn(n,1)

plt.plot(x,y,'.k')

# %%
class neuronal:
    thetas=thetas
    def predict(self,x):
        zes=np.multiply(self.thetas,x)
        return zes
    def error(self,y_predict):
        return y_predict-y
    def cost(self,error):
        return np.dot(error.T,error)/(2*m)
    def update(self):
        self.thetas-=alfa*np.dot(error.T,x)/m
        pass

# %%
m = len(y)
alfa=0.00001
thetas = np.random.randn(1,x.shape[1])

#%%
ja = neuronal()
for _ in range(20):
    # feedfodward
    y_predict=ja.predict(x)
    # error
    error=ja.error(y_predict)
    # Cost
    J= ja.cost(error)
    # Update parameters
    ja.update()
    # thetas-=alfa*np.dot(error.T,x)/m
    # 
    print(_,J)
# %%
plt.plot(x,y,'.k')
plt.plot(x,y_predict)
# %%
