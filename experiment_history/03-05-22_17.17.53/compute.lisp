(start-idyom)
(idyom-db:import-data :mid "experiment_history/03-05-22_17.17.53/experiment_input_data_folder/test/" "TEST_DATASET" 66050322171753)
(idyom-db:import-data :mid "experiment_history/03-05-22_17.17.53/experiment_input_data_folder/train/" "PRETRAIN_DATASET" 99050322171753)
(idyom:idyom 66050322171753 '(cpitch onset) '(cpitch onset) :models :both :pretraining-ids '(99050322171753) :k 1 :detail 3 :output-path "experiment_history/03-05-22_17.17.53/experiment_output_data_folder/" :overwrite nil)
(quit)