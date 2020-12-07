#%%
import pandas as pd

# %%
pd.Series([30, 35, 40], index=['2015 Sales', '2016 Sales', '2017 Sales'], name='Product A')
# %%
pd.DataFrame({'Bob': ['I liked it.', 'It was awful.'], 
              'Sue': ['Pretty good.', 'Bland.']},
             index=['Product A', 'Product B'])
# %%
reviews=pd.read_csv('winemag-data-130k-v2.csv', index_col=0)
reviews.head(3)
# %%
reviews.loc[(reviews.country == 'Italy') & (reviews.points >= 90) & (reviews.price.notna())]
reviews.loc[(reviews.country == 'Italy') & (reviews.points >= 90) & (reviews.price.notnull())]
# %%
reviews.loc[reviews.country.isin(['Italy', 'France'])]
# %%
reviews.points.describe()
reviews.describe()

# %%
reviews.taster_name.describe()
# %%
reviews.points.mean()
reviews.taster_name.unique()
reviews.taster_name.value_counts()
# %%
review_points_mean = reviews.points.mean()
reviews.points.map(lambda p: p - review_points_mean)
# %%
def remean_points(row):
    row.points = row.points - review_points_mean
    return row

reviews.apply(remean_points, axis='columns') #axis='index'
# %%
review_points_mean = reviews.points.mean()
reviews.points - review_points_mean
# %%
reviews.country + " - " + reviews.region_1
# %%
(reviews.points / reviews.price).idxmax()
# %%
"tropical" in reviews.description[0]
reviews.description[0]
# %%
pd.DataFrame({'Minimum':reviews.groupby('points').price.min(),'Maximum':reviews.groupby('points').price.max()})

# %%
reviews.groupby('points').price.describe()
# %%
reviews.groupby(['country', 'province']).apply(lambda df: df.loc[df.points.idxmax()])
# %%
reviews.groupby(['country']).price.agg([len, min, max])
# %%
countries_reviewed = reviews.groupby(['country', 'province']).description.agg([len])
countries_reviewed
# %%
countries_reviewed.loc[:]['Other']
# %% Parte 5/6
reviews.price.dtype
reviews.dtypes
# %%
reviews[pd.isnull(reviews.country)]
reviews[reviews.country.isnull()]
# %%
reviews.region_2.fillna("Unknown")

# %%
reviews.taster_twitter_handle.replace("@kerinokeefe", "@kerino")
# %%
reviews.points.astype('str')
# %%
reviews.rename(columns={'points': 'score'})
reviews.rename(index={0: 'firstEntry', 1: 'secondEntry'})
# %% parte 6/6
canadian_youtube = pd.read_csv("../input/youtube-new/CAvideos.csv")
british_youtube = pd.read_csv("../input/youtube-new/GBvideos.csv")
# Tienen las mismas columnas
pd.concat([canadian_youtube, british_youtube])

# %%
