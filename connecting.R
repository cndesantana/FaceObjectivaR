library("Rfacebook")

app_id = "1219535758094887"
app_secret = "0d7b93fb337020b9220de47a02b55d70"
token = "EAACEdEose0cBANI2hoJb7xodEgWCJNfez8egzZBAvjtgFjl5mCA6NzUal4P3i5pogQ1OiBnJijzyZCrHG6baXyg7bLNEPYZB43h6PPFZBF6hBlgZC4KuEjEN0YHfe2SfeKQnDHe7rtnf2tIJ9ZAPpramgRKHZCwHygaGcVjI9cNhhm245TZARC7TidDr6whoqegZD"

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
