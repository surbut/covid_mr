source("code/normfuncs.R")

m2=readRDS("data/m2_gtex.rds")


standard.error=read.table("data/df_se.txt")[1,-c(21,22,43,49)]
posterior.means=m2$result$PosteriorMean[1,-c(21,22,43,49)]

posterior.betas=standard.error*posterior.means

lfsr=m2$result$lfsr[1,-c(21,22,43,49)]

mar.sd=m2$result$PosteriorSD[1,-c(21,22,43,49)]


# 
# 
# missing.tissues=c(7,8,19,20,24,25,31,34,37)
# uk3labels=read.table("uk3rowindices.txt")[,1]
# 
newfunc.2=function(j){
#   gtex.colors=read.table('GTExColors.txt', sep = '\t', comment.char = '')[-missing.tissues,2]
#   gtex.colors=gtex.colors[uk3labels]
#   
#   
#   
#   
#   pm.beta.norm=pm.beta.norm[,uk3labels]##shufflecolumns
#   z.shuffle=z.stat[,uk3labels]
#   b.shuffle=b.stat[,uk3labels]
#   post.var=mar.var[,uk3labels]
#   post.bshuffle=posterior.betas[,uk3labels]
#   sem.shuffle=standard.error[,uk3labels]
#   lfsr=lfsr[,uk3labels]
#   title=strsplit(rownames(z.stat)[j], "[.]")[[1]][1]
#   
#   
#   post.bshuffle=posterior.betas[-which(posterior.betas[1,]==0),]
#   
#   x=as.numeric(post.bshuffle[j,])
#   

  par(mfrow=c(1,1))
  x=as.numeric(posterior.betas[j,])
  sd=as.numeric(standard.error[1,])*(as.numeric(mar.sd))##to transform to posterior sd of beta
  metaplot(x,sd,xlab = "",ylab="",#colors=meta.colors(box=as.character(gtex.colors)),
           xlim=c(-1,1),labels = colnames(standard.error),cex.lab=0.4,conf.level = 0.95)
  #title(title)
}
