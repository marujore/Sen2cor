# Docker Sen2cor 2.9.0
## Sen2cor Parameters
Sen2cor parameters can be changing by modifing the /sen2cor/2.9/L2A_GIPP.xml file and mounting it.
This repository L2A_GIPP.xml only set DEM_Terrain_Correction to FALSE.
If you wish to use sen2cor default parameters, don't mount the parameters folder (-v /path/to/sen2cor/2.9:/root/sen2cor/2.9).

More info regarding Sen2Cor can be found on its Configuration and User Manual (http://step.esa.int/thirdparties/sen2cor/2.9.0/docs/S2-PDGS-MPC-L2A-SRN-V2.9.0.pdf).

## step 1: building docker image
  Download this repository and navigate to its folder (where you can find the Dockerfile). Build the docker image running:

    docker build -t sen2cor:2.9.0 .

## step 2: downloading auxiliarie files
  Download from http://maps.elie.ucl.ac.be/CCI/viewer/download.php (fill info on the right and download "ESACCI-LC for Sen2Cor data package")
  extract the downloaded file and the files within. It will contain two files and one directory:

  Example on Ubuntu (Linux) installation:

    $ ls home/user/sen2cor/CCI4SEN2COR

  ESACCI-LC-L4-LCCS-Map-300m-P1Y-2015-v2.0.7.tif

  ESACCI-LC-L4-Snow-Cond-500m-P13Y7D-2000-2012-v2.0

  ESACCI-LC-L4-WB-Map-150m-P13Y-2000-v4.0.tif

## step 3: run sen2cor docker:

    docker run --rm -v /path/to/CCI4SEN2COR:/home/lib/python2.7/site-packages/sen2cor/aux_data -v /path/to/sen2cor/2.9:/root/sen2cor/2.9 -v /path/to/folder/containing/.SAFEfile:/app sen2cor:2.9.0 yourFile.SAFE

  Example:

    docker run --rm -v /home/user/sen2cor/CCI4SEN2COR:/home/lib/python2.7/site-packages/sen2cor/aux_data -v /home/user/sen2cor/2.9:/root/sen2cor/2.9 -v /home/user/Downloads:/app sen2cor:2.9.0 S2B_MSIL1C_20200604T142729_N0209_R053_T20MMT_20200604T161053.SAFE
