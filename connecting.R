library("Rfacebook")

app_id = "1219535758094887"
app_secret = "0d7b93fb337020b9220de47a02b55d70"
token = "EAACEdEose0cBADLNztcCQAzgjYRFWY0KxuF3xZAcn3vnhb6kkPuzpbB330aSydEpZBFz3xI1Nx2cZBlfG83XZCZANSaZAZAutPpxTKHWzYGCxQKvzZC5ooRaclb5nRwH46LZCn7omovUYekE8VLaEcIGcffaXJyfmawzz4UDRrDp5FWO10o5Q5tjSed2Sv345GzcZD"

me <- getUsers("me", token=token)
my_friends <- getFriends(token, simplify=TRUE)
my_friends_info <- getUsers(my_friends$id, token=token, private_info=TRUE)
ssa_resident <- subset(my_friends_info$first_name,my_friends_info$location == "Salvador, Brazil")

my_likes <- getLikes(user = "me", token = token)

#### page info

id_rasta = "484059694944787"
rasta_page_data = getPage(id_rasta, token = token, n= 10)

id_governo_bahia = "230798307122484"
governo_bahia_page_data = getPage(id_governo_bahia, token = token, n= 50)


#### Groups

group_name = "DataMining"
data_mining_groups = searchGroup(group_name, token = token)

group_name = "GovernoBahia"
governo_bahia_groups = searchGroup(group_name, token = token)

#### getting group info

id_group_data_mining = "161422081743"
group_posts <- getGroup (id_group_data_mining, token = token, n = 50)

### Source: https://bigdataenthusiast.wordpress.com/2016/03/19/mining-facebook-data-using-r-facebook-api/
####

fbOAuth(app_id = app_id, app_secret = app_secret)

fbOAuth(app_id = "1219535758094887", app_secret = "0d7b93fb337020b9220de47a02b55d70")
