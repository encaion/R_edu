#### example code ####
library("tensorflow")

# Create 100 phony x, y data points, y = x * 0.1 + 0.3
x_data = runif(100, min=0, max=1)
y_data = x_data * 0.1 + 0.3

x_data
y_data

# Try to find values for W and b that compute y_data = W * x_data + b
# (We know that W should be 0.1 and b 0.3, but TensorFlow will
# figure that out for us.)
W = tf$Variable(tf$random_uniform(shape(1L), -1.0, 1.0))
b = tf$Variable(tf$zeros(shape(1L)))
y = W * x_data + b



# Minimize the mean squared errors.
loss = tf$reduce_mean((y - y_data) ^ 2)
optimizer = tf$train$GradientDescentOptimizer(0.5)
train = optimizer$minimize(loss)

# Launch the graph and initialize the variables.
sess = tf$Session()
sess$run(tf$global_variables_initializer())

# Fit the line (Learns best fit is W: 0.1, b: 0.3)
for(step in 1:201){
  sess$run(train)
  if(step %% 20 == 0){
    cat(step, "-", sess$run(W), sess$run(b), "\n")
  }
}

#### 2-D code ####
library("tensorflow")

xx1 = runif(100, min = 0, max = 1)
xx2 = runif(100, min = 0, max = 1)
yyy = 7 * xx1 - 2 * xx2 + 4

head(xx1)
head(xx2)
head(yyy)


w1 = tf$Variable(tf$random_uniform(shape(1L), -1.0, 1.0))
w2 = tf$Variable(tf$random_uniform(shape(1L), -1.0, 1.0))
b = tf$Variable(tf$zeros(shape(1L)))
y = w1 * xx1 + w2 * xx2 + b

loss = tf$reduce_mean((y - yyy) ^ 2)
optimizer = tf$train$GradientDescentOptimizer(0.5)
train = optimizer$minimize(loss)

sess = tf$Session()
sess$run(tf$global_variables_initializer())

for(step in 1:101){
  sess$run(train)
  if(step %% 10 == 0){
    cat(step, ":", sess$run(w1), sess$run(w2), sess$run(b), "\n")
  }
}
