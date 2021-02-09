makeCircosMap <- function( dat, cortex=TRUE ) {

  if (cortex) {
    dat = dat[dat$cortex==1,]
  }
  dat = dat[dat$hemisphere=="right",]

  rgb = col2rgb(dat$color)
  df = data.frame(lobe=dat$group, parcellation=dat$name, r=rgb[1,], g=rgb[2,], b=rgb[3,] )
  df = df[order(df$lobe),]
  return(df)
}
