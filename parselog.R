getspeedlog <- function()
{
  currentlog <- readLines("log")
  ping <- numeric()
  down <- numeric()
  up <- numeric()
  datum <- character()
  
  for (entry in currentlog) {
    if (length(grep("2015", entry)))
    {
      datum = c(datum, as.character(entry))
    }
    
    if (length(grep("Ping:", entry)))
    {
      ping <- c(ping, as.numeric(gsub("Ping: | ms", "", entry)))
    }
    
    if (length(grep("Download:", entry)))
    {
      down <- c(down, as.numeric(gsub("Download: | Mbits/s", "", entry)))
    }
    
    if (length(grep("Upload:", entry)))
    {
      up <- c(up, as.numeric(gsub("Upload: | Mbits/s", "", entry)))
    } 
  }
  df <- data.frame(datum=strptime(datum, format="%d/%m/%Y %H:%M"), ping=ping, download=down, upload=up)
  return(df)
}

speedtest <- getspeedlog()

