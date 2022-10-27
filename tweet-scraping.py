import snscrape.modules.twitter as sntwitter
import pandas as pd


query = "(#WorldHumanitarianDay2021) until:2021-08-20 since:2021-08-19"
tweets = []
limit = 5000

for tweet in sntwitter.TwitterSearchScraper(query).get_items():
    #print(vars(tweet))
    #break
    if len(tweets) == limit:
        break
    else:
        tweets.append([tweet.date,tweet.user.username,tweet.place,tweet.content])

df = pd.DataFrame(tweets, columns=["Date", "User", "place", "tweet"])
print(df)
date_columns = df.select_dtypes(include=['datetime64[ns, UTC]']).columns
for date_column in date_columns:
   df[date_column] = df[date_column].apply(str)

writer = pd.ExcelWriter('whd2021b.xlsx')
df.to_excel(writer)
writer.save()
