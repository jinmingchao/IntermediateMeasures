# Calculating Intermediate performance measures

To calculate Intermediate performance measures, please use the custom version of MOA available in this repository.
For further details on MOA, see [MOA project website]( 
http://moa.cms.waikato.ac.nz)

## Building MOA 
1. To build the code published in this repository, first clone it with `git`. This can be done with: `git clone https://github.com/mgrzenda/IntermediateMeasures`
2. Next, please build the code with `mvn`


## Running experiments
### Preparing input data stream

To run the experiments, an ARFF file containing stream data for delayed labelling setting is needed. This means, to run the experiments you will need an ARFF file, which apart from independent features and a class label feature includes:
* `instanceId` - an integer identifier of an instance, used to link an entry in the file containing an unlabelled instance with another entry matching it, sharing the same identifier and containing the true label of the instance
* `timeStamp` - an integer timestamp used to calculate bin periods

An example of such a file is [Hyperplane file](./hyperplane_delayed.arff).

### Executing experiments
To run the calculations you can customise sample `run_moa.bat` file. The key MOA settings needed to calculate intermediate performance measures are as follows:
* **-B** - the number of bins for which binned performance will be calculated. **B**=100 can be used to calculate binned performance for 100 subperiods of latency periods i.e. the subperiods between getting instance data and receiving true label for it. 
* **-K** - the number of true labels that cause a new prediction to be polled from an evolving classification model. **K**=10 means that a new periodic prediction is requested from a model every time it is (potentially) updated with 10 new true labels.
* **-c** - the index of a column in the ARFF file containing class label. The two columns after this column are expected to contain `instanceId` and `timeStamp`
* **-e** and **-a** make MOA report the cost of extended evaluation and aggregate multiple predictions in one bin into a single prediction, respectively. 

Further details:
* For details on binned performance and the meaning of bin count **B**, the number of potential model updates **K** triggering new predictions, the cost of extended evaluation and the problem of aggregating multiple predictions in one bin into a single prediction, see our related work [_Delayed labelling evaluation for data streams_](https://link.springer.com/article/10.1007/s10618-019-00654-y)
* Remaning MOA options are standard options documented in the project. See [MOA website](https://moa.cms.waikato.ac.nz/) for details on how to set them.

### Result files
After running the code a number of output files will be produced. One of the files is named OutputFileName.**txt_summary** file. It includes the values of intermediate performance measures. As an example, the column named `summary 0.5:classifications correct (percent)` contains intermediate accuracy calculated for ![](https://latex.codecogs.com/svg.latex?%5Cfrac%7B1%7D%7B%5Calpha%7D=0.5)

In particular, the value of intermediate accuracy ![](https://latex.codecogs.com/svg.latex?%5CPsi%28T%29_2%5E%5Cmathrm%7BA%7D) is provided in `summary 0.5:classifications correct (percent)` column of the file.

### Sample MOA batch execution used to calculate intermediate performance measures
`java -cp ..\moa-2017.10-SNAPSHOT.jar  moa.DoTask EvaluatePrequential  -e (WindowClassificationPerformanceEvaluator -w 50000 -e -a) -B 100 -K 10 -l (moa.classifiers.bayes.NaiveBayes) -s (ArffFileStream -f hyperplane_delayed.arff -c 3) -f 100 -d stats_NaiveBayes.txt`

calls custom version of MOA to:
* process `hyperplane_delayed.arff` delayed data stream, which includes class label in its `-c 3` i.e. third column
* learn a Naive Bayes classifier
* save performance measures every `-f 100` instances in `stats_NaiveBayes.txt_summary` file. This includes intermediate performance measures aggregating periodic predictions made with `-B 100` and `-K 10` settings described above.




