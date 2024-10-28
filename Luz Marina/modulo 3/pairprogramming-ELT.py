
#%%
import pandas as pd 
import numpy as np

#Leer los archivos CSV (ventas.csv, productos.csv, clientes.csv).
df_ventas = pd.read_csv("../files/ventas.csv")
df_ventas.head()
# %%
df_ventas.isnull().sum()
#%%
df_ventas.info()

#%%
df_productos = pd.read_csv("../files/productos.csv",on_bad_lines='skip')
df_productos.head()
# %%
df_productos.isnull().sum()
# %%
df_clientes = pd.read_csv("../files/clientes.csv")
df_clientes.head()

# %%
df_clientes.isnull().sum()
# %%
df_clientes.columns

# %%
df_productos['Descripción'] = df_productos['Descripción'].replace(999,np.nan)
# %%
df_productos.isnull().sum()
# %%
df_clientes["gender"].unique()

# %%
df_clientes.shape
# %%
((df_clientes.isnull().sum())/1000)*100
# %%
filas_con_nulos = df_clientes[df_clientes['City'].isnull()]
filas_con_nulos
# %%
df_clientes["Country"].unique()

# %%
df_clientes["City"].unique()
# %%
df_clientes["City"+"Country"].isnull().sum()
# %%

