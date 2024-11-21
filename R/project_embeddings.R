#' @export
project_embeddings <- function(embeddings) {

  projed_embs_pca <- do.call(rbind, embeddings$embedding) |>
    as.data.frame() |>
    prcomp()

  embs_2D <- projed_embs_pca$x |>
    tibble::as_tibble(rownames = "pkg") |>
    dplyr::select(package = pkg, coord1 = PC1, coord2 = PC2)

}
