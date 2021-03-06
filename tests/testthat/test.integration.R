# ==============================================================================
# Testing integration with SingleCellExperiment
# ==============================================================================
context("Converting other formats to DISCBIO")

pmbc_seurat <- Seurat::pbmc_small
pmbc_sce <- Seurat::as.SingleCellExperiment(pmbc_seurat)
g1_sce <- SingleCellExperiment::SingleCellExperiment(
    list(counts=as.matrix(valuesG1msReduced))
)

test_that("Pure text gets formatted as DISCBIO", {
    expect_true(is(as.DISCBIO(pmbc_seurat), "DISCBIO"))
})
test_that("SCE file gets formatted as DISCBIO", {
    expect_true(is(as.DISCBIO(pmbc_sce), "DISCBIO"))
    expect_true(is(as.DISCBIO(g1_sce), "DISCBIO"))
})
