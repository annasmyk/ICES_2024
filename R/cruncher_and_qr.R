
################################################################################
#######               Démonstration du package JDCruncheR                #######
################################################################################

# Chargement des packages ------------------------------------------------------

library("JDCruncheR")
library("rjwsacruncher")

# Set cruncher option ----------------------------------------------------------

# v2
options(cruncher_bin_directory = "C:/Users/INSEE_User/Documents/Software/jwsacruncher-2.2.4/bin/")
# v3
options(cruncher_bin_directory = "C:/Users/INSEE_User/Documents/Software/jwsacruncher-3.2.2/bin/")

# Call or cruncher
rjwsacruncher::cruncher_and_param(
  workspace = "./jdemetra/ws_IPI_v2.xml", # in v2
  rename_multi_documents = TRUE, # Pour renommer les dossiers en sortie
  delete_existing_file = TRUE, # Pour remplacer les sorties existantes
  policy = "complete", # Politique de rafraichissement
  csv_layout = "vtable", # Format de sortie des tables
  log_file = "./jdemetra/log.txt"
)

QR_auto <- JDCruncheR::extract_QR("./jdemetra/ws_IPI_v2/Output/SAProcessing-1/demetra_m.csv")
QR_auto_score <- JDCruncheR::compute_score(QR_auto)
scores <- JDCruncheR::extract_score(QR_auto_score)
