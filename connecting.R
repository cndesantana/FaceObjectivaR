library("Rfacebook")

app_id = "1219535758094887"
app_secret = "0d7b93fb337020b9220de47a02b55d70"
token = "EAACEdEose0cBAI982I1SpESjEcDUB2ulb7PciGEyejHYP4ZCuOrHOuRrBorcASGKKB4jRB088ddCNxalXiox9MEE6KvD0lj92tjby27ZB2DteLseOssgjZCkFYLCZB1ZCmuENZArxx6wLEULdYS6InXvQQ9AYNtT6wamqRocAd1AH1OyrId5ZBhvOGaT3XzCAcZD"

me <- getUsers("me", token=token)
my_friends <- getFriends(token, simplify=TRUE)
my_friends_info <- getUsers(my_friends$id, token=token, private_info=TRUE)
ssa_resident <- subset(my_friends_info$first_name,my_friends_info$location == "Salvador, Brazil")

my_likes <- getLikes(user = "me", token = token)

##Jonatas monteiro



#### page info

id_rasta = "484059694944787"
rasta_page_data = getPage(id_rasta, token = token, feed=TRUE, n= 1000)

### posts network
filename <- "posts_network.net"
nnodes <- length(rasta_page_data$id)
# each post is a node of the network
nodes <- rasta_page_data$id
#author of post
author <- rasta_page_data$from_id
#likes of the post
likes <- rasta_page_data$likes_count

cat(paste("*Vertices ",nnodes,"\n",sep=""),file=filename)
for(i in 1:nnodes){
   cat(paste(nodes[i],likes[i],sep=" "),sep="\n",file=filename,append=TRUE)
}
cat("*Edges \n",file=filename,append=TRUE)
for(i in 1:nnodes){
   connections_i <- which(author %in% author[i])
   cat(paste(nodes[i],nodes[connections_i],sep=" "),sep="\n",file=filename,append=TRUE)
}


id_governo_bahia = "230798307122484"
governo_bahia_page_data = getPage(id_governo_bahia, token = token, n= 50)

#### Get post

id_post = "484059694944787_1430601980290549"
post = getPost(id_post, token, n = 500)
post$comments$message
post$comments$likes_count
post$comments$created_time
post$comments$from_id

getUsers(post$comments$from_id[1],token=token)
#From the message we can study the sentiments (Sentimental Analysis). We can also look for the location of each user, etc... 

#### Search public status updates that mention a given keyword
##### DEPRECATED FUNCTION :(

keyword = "#GovernoDaBahia"
status_governo_bahia = searchFacebook(keyword, token = token, n = 2000, "yesterday 00:00", until = "yesterday 23:59")

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
