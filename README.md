
# Spin Up Resources
- ./runscript.sh deploy network network.yml network-parameters.json us-east-1
- ./runscript.sh deploy udagram udagram.yml udagram-parameters.json us-east-1


# Tear Down Resources
- ./runscript.sh delete udagram udagram.yml udagram-parameters.json us-east-1
- ./runscript.sh delete network network.yml network-parameters.json us-east-1