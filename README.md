GettingCleaningData
===================

Course project for the Getting and Cleaning Data coursera course

The run_analysis.R script in folder is the script that fulfils the Getting and Cleaning Data Course project.  It assumes that it is executed in the project folder that contains the Samsung data on which it performs its analysis.

Also included in this folder are two example files, r_environment.txt and download_metadata.txt, that were created by an initial run of the run_analysis.R script.  They may be used to identify differences in the environment and/or the downloaded file from the initial environment for debugging the execution of run_analysis.R .

Finally, there is a codebook.md that describes the variables and observations of this analysis.

When the run_analysis.R script is run, it will save two data.frames in the same directory.  The first is means_stds.RData.txt which is a data.frame created during the process of creating tidy2.RData.txt, the final submission.
