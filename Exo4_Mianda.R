#Mianda Luse Cynthia 
#EXO4
library(httr)
library(jsonlite)
library(dplyr)

# Fonction pour récupérer les modes de transports de la SNCF
get_transport_modes <- function() {
  url <- "https://ressources.data.sncf.com/api/records/1.0/search/?dataset=referentiel-gares-voyageurs&q=&rows=1000"
  response <- GET(url)
  if (http_type(response) == "application/json") {
    content(response, "parsed")
  } else {
    stop("Erreur lors de la récupération des données.")
  }
}

# Appel de la fonction pour récupérer les données
resultats <- get_transport_modes()

# Extraction des modes de transports
modes_transport <- resultats$records$fields$type

# Supprimer les doublons
modes_transport <- unique(modes_transport)

# Créer un data frame
df <- data.frame(Mode_de_transport = modes_transport)

# Enregistrer dans un fichier CSV
write.csv(df, file = "modes_transport_sncf.csv", row.names = FALSE)
print(resultats)


