# bakery_problem

# Findings

While testing I realized that my algorithm optimizes the output based on the total amount that user will have to pay. The task description says that - To save on shipping space each order should contain the minimal number of packs.

In case of the second input My algorithm is returning  - 

```
14 MB11 $53.8
          2 X 2 $9.95
          2 X 5 $16.95

But expected output is - 

14 MB11 $54.8
          1 x 8 $24.95
          3 x 2 $9.95
```

Both the solutions above require (2 + 2 OR 1 + 3) 4 packs in total. 

Hence I find that there is something I am missing or there is an ambiguity in the question.

# Assumptions

- I am not serving the order if order total can not be formed using available packs 
  e.g. From the given description, none of the Products are available for 1 as quantity.

# Running Instructions - 

- Clone the repo on your local machine
- Input must be written to input.txt file
- From your terminal execute `ruby bakery.rb`
- Output will be available in output.txt file
