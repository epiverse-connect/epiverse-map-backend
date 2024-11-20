#' @export
summarize_embeddings <- function(embeddings) {

  embeddings |>
    dplyr::mutate(weights = dplyr::if_else(stringr::str_detect(content, "^\\-\\-\\-"), 10, 1)) |>
    dplyr::select(-content, -file_name) |>
    dplyr::summarize(avg_embedding = list(matrixStats::colWeightedMedians(do.call(rbind, embedding), w = weights)), .by = package_name) |>
    dplyr::pull(avg_embedding, name = package_name) |>
    dplyr::bind_rows() |>
    t() |>
    as.data.frame()

}
