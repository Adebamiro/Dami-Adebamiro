#TASK 1b
#Filter for and remove any dud records where there is no value for SiteID or there is a mismatch between SiteID and Location.

# importing the library nedeeded for the task
import pandas as pd

# reading the cropped csv file
new_air_quality_data = pd.read_csv("crop.csv", sep=';', low_memory=False)

# creating a dictionary for the Site ID and Location
streets= [
    {'street_id':188, 'street_name':'AURN Bristol Centre'},
    {'street_id':203, 'street_name':'Brislington Depot'},
    {'street_id':206, 'street_name':'Rupert Street'},
    {'street_id':209, 'street_name':'IKEA M32'},
    {'street_id':213, 'street_name':'Old Market'},
    {'street_id':215, 'street_name':'Parson Street School'},
    {'street_id':228, 'street_name':'Temple Meads Station'},
    {'street_id':270, 'street_name':'Wells Road'},
    {'street_id':271, 'street_name':'Trailer Portway P&R'},
    {'street_id':375, 'street_name':'Newfoundland Road Police Station'},
    {'street_id':395, 'street_name':"Shiner's Garage"},
    {'street_id':452, 'street_name':'AURN St Pauls'},
    {'street_id':447, 'street_name':'Bath Road'},
    {'street_id':459, 'street_name':"Cheltenham Road \ Station Road"},
    {'street_id':463, 'street_name':'Fishponds Road'},
    {'street_id':481, 'street_name':'CREATE Centre Roof'},
    {'street_id':500, 'street_name':'Temple Way'},
    {'street_id':501, 'street_name':'Colston Avenue'},

]

# loop matching station that have the right station name and ID
new_listing= []

for index, row in new_air_quality_data.iterrows():
    index = index + 2
    if not any(street['street_name'] == row.Location
              and street["street_id"] == row.SiteID for street in streets):
        print(index, row.Location, row.SiteID)

    else:
        new_listing.append(row)

# converting the code to the right station
new_data_frame = pd.DataFrame(new_listing)

# Converting the data frame to csv
new_data_frame.to_csv('clean.csv', sep = ';', index=False)

#cchecking the number of rows of the clean data
print(f"the clean data has {new_data_frame.shape[0]} lines")
