# path to the learn-hadoop project root
PROJECT_ROOT=$(pwd)/../..
EXAMPLE_CODE_SRC=definitive-guide-hadoop
SAMPLE_DATA=$PROJECT_ROOT/$EXAMPLE_CODE_SRC/src/main/resources/sample-data/sample-data
HADOOP_PATH=$PROJECT_ROOT/hadoop-standalone-mode/hadoop-3.3.5
OUTPUT_FOLDER=$PROJECT_ROOT/$EXAMPLE_CODE_SRC/tasks/output

# build the example code
echo "building the example classes..."
cd $PROJECT_ROOT/$EXAMPLE_CODE_SRC
mvn clean install
cd $PROJECT_ROOT

echo "setting example jar in the class path..."
export HADOOP_CLASSPATH=$PROJECT_ROOT/$EXAMPLE_CODE_SRC/target/definitive-guide-hadoop-1.0-SNAPSHOT.jar
echo $HADOOP_CLASSPATH

echo "executing map-reduce task: Max Temperature in standalone mode with sample data"
rm -rf $OUTPUT_FOLDER
$HADOOP_PATH/bin/hadoop org.crunchycookie.learn.hadoop.mapreduce.MaxTemperature $SAMPLE_DATA $OUTPUT_FOLDER