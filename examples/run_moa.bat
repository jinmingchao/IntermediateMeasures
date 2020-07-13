rem 25 50000 100 10

rem java -cp ..\moa-2017.10-SNAPSHOT.jar -javaagent:D:\tools\moa-release-2016.04\lib\sizeofag-1.0.0.jar moa.DoTask EvaluatePrequential  -e (WindowClassificationPerformanceEvaluator -w 50000 -e -a) -B 100 -K 10 -l (moa.classifiers.bayes.NaiveBayes) -s (ArffFileStream -f synthetic_delayed.arff -c 3) -f 100 -d stats_NaiveBayes.txt -i 50000 -o delayed_raw_prediction_NaiveBayes.txt

java -cp ..\moa-2017.10-SNAPSHOT.jar  moa.DoTask EvaluatePrequential  -e (WindowClassificationPerformanceEvaluator -w 50000 -e -a) -B 100 -K 10 -l (moa.classifiers.bayes.NaiveBayes) -s (ArffFileStream -f hyperplane_delayed.arff -c 3) -f 100 -d stats_NaiveBayes.txt