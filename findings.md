

By giving the example-methods a name starting with 'test' some (most?) will be usable also from Pharo9. 

```Smalltalk
testChapter02Example01
	<gtExample>
	^ #(1 2 3) 
		with: #(10 20 30) 
		collect: [ :a :b | a + b ]
```
