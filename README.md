# A python interface for IDyOM 

Last version update: Aug 10, 2021

Library dependency:
   - numpy
   - matplotlib
   - scipy
   - tqdm
   - mido
   - MIDIUtil
    
                        
## Usage Overview (brief version)

1. Change the ```configuration.py``` script to specify the model parameters, training-set/test-set folder for the experiment.
2. Run ```run_idyom.py``` to run LISP codes of IDyOM.
3. Use the `outputs_in_mat_format.py` script to get the model outputs in ```.mat``` format.



 ## Usage (detailed version):
 
 
#### 1. Set model parameters in ```configuration.py```:
This step is to set the model parameters and input/output dataset folder and experiment history folder location.

See the script for tempalte (and examples).



#### 2. Execute the ```run_idyom.py```. 
 This step is to load and run the LISP version of IDyOM.

```python run_idyom.py```

##### What happens when you execute ```run_idyom.py```?

A folder (timestamp naming format: MM/DD/YY_HH.MM.SS) will be created to record information of the current experiment,
including the following:
- the configuration file (a script containing info of the configurations we set for this experiment)
- the dataset input named 'experiment_input_data_folder' (duplicated from original path, which is specifiable in the ```configuration.py```)
- the output from IDyOM named 'experiment_output_data_folder' (containing the ```.dat``` file)

Other post IDyOM data exportation and analysis files will also be recorded in **this** expermenet history folder.
                  
 [Comments:] *By creating an 'experiment_history' folder, we can have a record of all data and information used and the output concerning this particular experiment we can check if we have any doubts of the output of the model.*
 
 
#### 3. Get the model outputs in different file formats. 
 
To get the model outputs in mat format, run `post_idyom_export.py`. 


Follow the 2 steps to extract the outputs: 

- 1. You  need to manually change the path of ```selected_experiment_history_folder``` to the folder of which experiment output you want to get in this script (preferably in absolute path).

    ```
    selected_experiment_history_folder = '/Users/xinyiguan/Desktop/Codes/IDyOM_Python_Interface/experiment_history/03-08-21_13.40.14/' 
    ``` 

- 2. Specify the **data_type_to_export**. 

    Change the template ```data_type_to_export``` to output your features:

    Default features for output in ```.mat ``` file format:  

        'melody_name',
        'cpitch',
        'onset',
        'overall_probability',
        'overall_information_content',
        'overall_entropy',
        'cpitch_information_content',
        'cpitch_entropy',
        'onset_information_content',
        'onset_entropy',


You can further extract different model outputs by changing/adding different "extraction methods" in the dictionary called 
```features_method_name_dict``` accordingly in the `outputs_in_mat_format.py` script. 


Change the ```selected_experiment_history_folder``` at the bottom of the script.

#### 4(optional). Get output visualizations:

To get the model outputs visualization, run `post_idyom_viz.py`.  

*You need to change the ```selected_experiment_history_folder``` at the bottom of the script.*

You can find the output figures within your experiment history folder called:
    - "viz_pitch_prediction_comparison" folder, containing all pitch prediction vs. ground truth figures.
    - "viz_surprise_with_pianoroll" folder, containing all surprisal values aligned with piano roll figures. 


## Model Output visualization examples:


#### 1. Here is an intentional underfiting example (train on distribution X test on distribution Y, with X supposed to be very different from Y):

IDyOM pitch prediction vs. ground truth:

![alt text][logo5]

[logo5]: Demo_Figs/prediction-shanx033.png

IDyOM surprise values aligned with piano roll:

![alt text][logo6]

[logo6]: Demo_Figs/surprise-shanx033.png


#### 2. Here is an intentional overfitting example (train X is exactly test Y):

IDyOM pitch prediction vs. ground truth:

![alt text][logo3]

[logo3]: Demo_Figs/prediction-chor-015.png

IDyOM surprise values aligned with piano roll:

![alt text][logo4]

[logo4]: Demo_Figs/surprise-chor-015.png


#### 3. Here is a normal example (train X and test Y have similar distribution and being mutually exclusive) (notice the surprise):

IDyOM pitch prediction vs. ground truth:

![alt text][logo1]

[logo1]: Demo_Figs/prediction-chor-030.png

IDyOM surprise values aligned with piano roll:

![alt text][logo2]

[logo2]: Demo_Figs/surprise-chor-030.png


