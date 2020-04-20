# Intermediate performance measures

Repository of a custom MOA version providing support for calculating intermediate performance measure, including prioritised performance measure implemented in 2019. This code extends previously developed code of continuous re-evaluation and is used to assess performance of prediction models under delayed labeling scenarios. The accuracy of predictions made in individual subperiods between an unlabelled instance arrival and its true label arrival is aggregated for the entire period of waiting for true labels. This enables comparison of such intermediate measure values with initial and test-then-train measure values e.g. with the accuracy of initial predictions. 

This code is planned to be available in MOA in the future.

For further details on MOA, see project website: 
http://moa.cms.waikato.ac.nz 


## Key source files
Some of the key changes made to MOA include changes in:
* EvaluatePrequential.java: this version of the task enables the calculation of intermediate performance measures i.e. the measures reflecting the overall quality of multiple predictions made between receiving instance data and its true label.


Important new classes include:
* ExponentialDecayPerformanceEvaluator.java: a prioritised performance measure i.e. the intermediate measure used to evaluate multiple predictions made for an instance while waiting for its true label by calculating a weighted average of binned measure values
* MaximumPerformanceEvaluator.java: a maximum performance measure i.e. the intermediate measure used to evaluate multiple predictions made for an instance while waiting for its true label by calculating maximum of binned measure values
