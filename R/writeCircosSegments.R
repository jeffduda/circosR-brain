writeCircosSegments <- function( dat, file ) {

  dat$colorName = tolower(gsub("[^[:alnum:]]", "", dat$name))
  nr = nrow(dat)
  dat$circos.axis = rep(NA, nr)
  dat$circos.start = rep(NA, nr)
  dat$circos.end = rep(NA, nr)

  lDat = dat[ which(dat$hemisphere=='left'), ]
  mDat = NULL
  if ( length( which( is.na(dat$hemisphere)==TRUE ) ) > 0 ) {
    mDat = dat[ is.na(dat$hemisphere), ]
  }
  rDat = dat[ which(dat$hemisphere=='right'), ]

  segments = c()
  segmentLabels = c()

  groups = unique( lDat$group )

  for ( g in groups ) {
    parcels = which(lDat$group==g)
    n = length( parcels )
    segments = c(segments, paste0( "chr - ", g,'-l ', g, ' ', 0, ' ', 100*n-1, ' black' ))
    for (p in 1:length(parcels)) {
      # band fro-l TrFPoG/S TrFPoG/S 0 99 trfpogs
      name = lDat$name[ parcels[p] ]
      i1 = 100*(p-1)
      segments = c(segments, paste0("band ", g, '-l ', name, ' ', name, ' ', i1, ' ', i1+99, ' ', lDat$colorName[parcels[p]]))
      segmentLabels = c(segmentLabels, paste0(g,'-l ', i1, ' ', i1+99, ' ', name))
      idx = which( dat$name==name & dat$hemisphere=="left")
      dat$circos.axis[idx] = paste0(g,'-l')
      dat$circos.start[idx] = i1
      dat$circos.end[idx] = i1+99
    }
  }

  mgroups = unique(mDat$group)
  for ( g in mgroups ) {
    print(g)
    parcels = which(mDat$group==g)
    n = length( parcels )
    print(n)
    segments = c(segments, paste0( "chr - ", g,' ', g, ' ', 0, ' ', 100*n-1, ' black' ))
    for (p in 1:length(parcels)) {
      # band fro-l TrFPoG/S TrFPoG/S 0 99 trfpogs
      name = mDat$name[ parcels[p] ]
      print(paste(name))
      i1 = 100*(p-1)
      segments = c(segments, paste0("band ", g, ' ', name, ' ', name, ' ', i1, ' ', i1+99, ' ', mDat$colorName[parcels[p]]))
      segmentLabels = c(segmentLabels, paste0(g, ' ', i1, ' ', i1+99, ' ', name))
      idx = which( dat$name==name )

      dat$circos.axis[idx] = paste0(g)
      dat$circos.start[idx] = i1
      dat$circos.end[idx] = i1+99
    }
  }

  for ( g in groups ) {
    parcels = which(rDat$group==g)
    n = length( parcels )
    segments = c(segments,paste0( "chr - ", g,'-r ', g, ' ', 0, ' ', 100*n-1, ' black' ))
    for (p in 1:length(parcels)) {
      # band fro-l TrFPoG/S TrFPoG/S 0 99 trfpogs
      name = rDat$name[ parcels[p] ]
      i1 = 100*(p-1)
      segments = c(segments, paste0("band ", g, '-r ', name, ' ', name, ' ', i1, ' ', i1+99, ' ', rDat$colorName[parcels[p]]))
      segmentLabels = c(segmentLabels, paste0(g,'-r ', i1, ' ', i1+99, ' ', name))
      idx = which( dat$name==name & dat$hemisphere=="right")
      dat$circos.axis[idx] = paste0(g,'-r')
      dat$circos.start[idx] = i1
      dat$circos.end[idx] = i1+99
    }
  }

  return( list(dat=dat, seg=segments, labels=segmentLabels) )
  #colorName = tolower(gsub("[^[:alnum:]]", "", dat$name))
  #rgb = col2rgb(dat$color)
  #lines = paste0( colorName, " = ", rgb[1,], ",", rgb[2], ",", rgb[3,] )

  #lines = c( paste("#", file), lines )

  #fileConn<-file(file)
  #writeLines(lines, fileConn)
  #close(fileConn)

}
