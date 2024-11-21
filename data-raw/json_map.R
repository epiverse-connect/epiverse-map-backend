library(epiversemapbackend)

embeddings_location <- Sys.getenv("EMBEDDINGS_LOCATION")

doc_lvl_embeddings <- parse_embeddings_file(embeddings_location)

pkg_lvl_embeddings <- summarize_embeddings(doc_lvl_embeddings)

projected_embeddings <- project_embeddings(pkg_lvl_embeddings)

metadata <- epiverse.scraper::get_pkgs_metadata(universe = "epiverse-connect")

map_data <- merge(
  projected_embeddings,
  metadata
)

jsonlite::write_json(
  list(
    results = nrow(map_data),
    data = map_data
  ),
  "inst/extdata/map_data.json",
  pretty = TRUE,
  auto_unbox = TRUE
)
