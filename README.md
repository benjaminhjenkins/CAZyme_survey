# CAZyme_survey
For the identification and evolutionary reconstruction of all carbohydrate acting enzymes (CAZymes) in an organism

## Install dependencies
Dependencies can be installed using conda:

`conda env create -f env.yml`

Or manually installed with external dependencies. Below are listed the versions used for development of this pipeline (older or newer versions may also be compatible)

```
  - sed=4.8
  - awk=5.1.0
  - seqtk=1.3
  - mafft=7.490
  - trimal=1.4
  - iqtree=2.1.2
  - run_dbcan=3.0.2
```

## Usage

Running the .sh scripts will allow you to annotate, search for homologues, and build trees for every CAZyme family in your initial sequence dataset.

First, edit "01_annotate_dataset.sh" to set the relevant paths for your initial sequence dataset (YOUR_DATASET_PATH) and specify your desired naming convention for your output file (YOUR_OUTPUT_NAME). You may want to edit the location of your created working directory (~/CAZyme_survey). Once updated, run this first script. 

` bash 01_annotate_dataset `

Depending on the size of your dataset and the CPU space available this will take a few days to run. 

Next, edit "02_search_for_homologues" to set the path for your broader sequence dataset containing the broader dataset in which you want to search for homologues (YOUR_BROADER_SPECIES_DATASET). This allows you to identify homologues at the species, genus, or broader taxonomic level depending on your preference. Once updated, run this second script. 

` bash 02_search_for_homologues `

This will take several hours to several days to run depending on the number of annotated CAZY gene families identified. 

Finally, edit "03_build_trees" to set the conditions for your sequence filtering and alignment trimming, and the number of bootstraps for your tree building. Once updated, run this final script.

` bash 03_build_trees `

This will take anywhere from several days to several weeks to run depending on the size of your previously generated alignments. Once complete, you will have phylogenies outlining a rough evolutionary history (at the taxonomic level of your choice) of every identifiable CAZyme in your initial sequence dataset. 
