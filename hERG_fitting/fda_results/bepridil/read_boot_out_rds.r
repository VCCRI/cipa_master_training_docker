source("../../funs/get_boot_data.R")

boot_num = 3
print("1")
boot.out<-readRDS(sprintf("boot_out.rds"))
print("2")
boot_idx<-boot::boot.array(boot.out, indices=TRUE)
print("3")
if(boot_num>0){
  print("4")
    idx<-boot_idx[boot_num,]
  print("5")
}else{
  print("6")
    idx<-1:ncol(boot_idx)
  print("7")
}
print("8")
print(idx)

fracdata<-get_boot_data(paste0("../../data/bepridil.csv"), idx)

#df <- readRDS("boot_out.rds")
#write.csv(df, "out.csv", row.names=FALSE)
