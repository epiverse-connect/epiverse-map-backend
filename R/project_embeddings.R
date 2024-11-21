#' @export
project_embeddings <- function(embeddings) {

  projed_embs_pca <- do.call(rbind, embeddings$embedding) |>
    as.data.frame() |>
    prcomp()

  embs_2D <- projed_embs_pca$x |>
    tibble::as_tibble() |>
    dplyr::mutate(package = embeddings$package_name) |>
    dplyr::select(package, coord1 = PC1, coord2 = PC2)

}
