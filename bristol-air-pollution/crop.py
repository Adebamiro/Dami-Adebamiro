# TASK 1a
# Crop the file to delete any records before 00:00 1 Jan 2010 (1262304000)

# importing the library needed for the task
import pandas as pd

# naming the csv data as a pandas data frame with the name(air_data), delimiter is ';'
air_data = pd.read_csv("bristol-air-quality-data.csv", sep=";")


# checking to see the total number of rows in the csv file
print("The main file has" + str(air_data.shape[0]) + "lines")


# using the function .loc to crop data before 2010
crop_data = air_data.loc[air_data["Date Time"] >= "2010-01-01"].index

new_data = air_data.loc[crop_data]


# checking to see the number of rows of the cropped data
print(f"the cropped data has {new_data.shape[0]} lines")

# saving file to csv using .to_csv ,sep= ';' and index = false
new_data.to_csv('crop.csv', sep=';', index=False)

