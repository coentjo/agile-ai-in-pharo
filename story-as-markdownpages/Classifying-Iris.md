---
Title: Classifying with the Iris dataset
---
#Classifying with the Iris dataset

A famous example: The Iris dataset case
- attachments/cfq22ybf8bqck0thc6dzv2szj/2021-AI-General.044.png
- ![](workshop-AI/agile-ai-as-markdownpages/attach/2021-AI-General.044.png)
Using a *machine* to classify what type of iris we have data from.
Dataset came from [here](https://archive.ics.uci.edu/ml/machine-learning-databases/iris/iris.data).  Some more [info](https://archive.ics.uci.edu/ml/machine-learning-databases/iris/iris.names).
# Step 1 - Read data
    - In the 'iris.csv' file there is data about 150 flowers of three types.
    - ```Pharo
"Step 1."
"Download Iris csv from url"
irisCSV := (ZnEasy get: 'https://agileartificialintelligence.github.io/Datasets/iris.csv') contents.
```
# Step 2 - Convert iris types names to numbers
    - ```Pharo
"Step 2."
lines := irisCSV lines allButFirst.	"Initialize the variable irisData."
tLines := lines
		collect: [ :line | 
			| valuesOnThisLine |
			valuesOnThisLine := line substrings: '',''.
			(valuesOnThisLine allButLast collect: [ :w | w asNumber ])
				, (Array with: valuesOnThisLine last) ].

irisData := tLines
		collect: [ :row | 
			| l |
			row last = 'setosa' ifTrue: [ l := #(0) ].
			row last = 'versicolor' ifTrue: [ l := #(1) ].
			row last = 'virginica' ifTrue: [ l := #(2) ].
			row allButLast , l ].
^ irisData
```
# Step 3 - Create Neural Network
    - ```Pharo
"Step 3."
network := NNetwork new.
network configure: 4 hidden: 6 nbOfOutputs: 3.
network learningRate: 0.3 .
^ network
```
# Step 4 - Train the network
    - ```Pharo
"Step 4."
 " Repeat the script "
network train: irisData nbEpochs: 1000.
^ network
```
# Step 5 - Try
    - ```Pharo
"Step 5."
network feed: #(  5.6  2.9  3.6  1.3 )
```
