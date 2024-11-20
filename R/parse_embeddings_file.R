#' @export
parse_embeddings_file <- function(file_path) {

  readr::read_csv(file_path) |>
    dplyr::mutate(embedding = gsub("\\[|\\]", "", embedding)) |>
    dplyr::mutate(embedding = purrr::map(embedding, \(x) as.numeric(strsplit(x, "\\s*,\\s*")[[1]])))

}
