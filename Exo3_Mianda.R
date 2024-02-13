# MIANDA  LUSE  CYNTHIA
#EXERCICE N°3
library(httr)
library(jsonlite)

# Fonction pour récupérer les données à partir de l'API
get_addresses <- function(city, term) {
  url <- paste0("https://api-adresse.data.gouv.fr/search/?q=", term, "&city=", city)
  response <- GET(url)
  if (http_type(response) == "application/json") {
    content(response, "parsed")
  } else {
    stop("Erreur lors de la récupération des données.")
  }
}

# Ville et terme à rechercher
ville <- "Massy"
terme <- "Avenue"

# Appel de la fonction pour récupérer les données
resultats <- get_addresses(ville, terme)

# Extraction des noms de voies
noms_voies <- resultats$features$name

# Affichage des noms de voies
print(noms_voies)
print(resultats)

# Enregistrement dans un fichier
writeLines(noms_voies, "noms_voies_massy.txt")
writeLines(as.character(noms_voies), "noms_voies_massy.txt")


