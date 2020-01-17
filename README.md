# docker-Sen2cor
## step 1: building docker image
  go to the repository dir (where you can find the Dockerfile) and run:
  docker build -t sen2cor_2.8.0 .

## step 2: downloading auxiliarie files
  download from http://maps.elie.ucl.ac.be/CCI/viewer/download.php (fill info on the right and download "ESACCI-LC for Sen2Cor data package")
  extract the downloaded file

## step 3: run sen2cor from outside docker:
  docker run --rm -v /path/to/CCI4SEN2COR:/home/lib/python2.7/site-packages/sen2cor/aux_data -v /path/to/folder/containing/.SAFEfile:/app sen2cor_280_test2 yourFile.SAFE

## step 3 (alternative): run sen2cor from inside docker:
  docker run --rm -it --entrypoint="" -v /path/to/CCI4SEN2COR:/home/lib/python2.7/site-packages/sen2cor/aux_data -v /path/to/folder/containing/.SAFEfile:/app sen2cor_2.8.0 bash

  cd /app
  
  L2A_Process --resolution 10 /app/file.SAFE
