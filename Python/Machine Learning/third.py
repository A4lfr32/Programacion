#%%

import numpy as np
import matplotlib.pyplot as plt

# %%
n=100

x=np.linspace(0,100,n).reshape((-1,1))

y=3*x+150+20*np.random.randn(n,1)

plt.plot(x,y,'.k')
bias=1
thetas = np.random.randn(1,x.shape[1])
# %%
class Adaline:
    bias=1
    thetas=np.random.randn(1,x.shape[1])
    def predict(self,x):
        zes=np.multiply(self.thetas,x)+self.bias
        return zes
    def error(self,y_predict):
        return y_predict-y
    def cost(self,error):
        return np.dot(error.T,error)/(2*m)
    def update(self):
        self.bias-=alfa*sum(error)/m*1000
        self.thetas-=alfa*np.dot(error.T,x)/m
        pass

# %%
m = len(y)
alfa=0.00001

#%%
model = Adaline()

for _ in range(1000):
    # feedfodward
    y_predict=model.predict(x)
    # error
    error=model.error(y_predict)
    # Cost
    J= model.cost(error)
    # Update parameters
    model.update()
    # thetas-=alfa*np.dot(error.T,x)/m
    # 
    print(_,J)

plt.plot(x,y,'.k')
plt.plot(x,y_predict)
# %%

# %%
