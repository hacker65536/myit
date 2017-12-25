
https://www.katacoda.com/basiafusinska/courses/tensorflow-getting-started/tensorflow-core

```bash
$ docker exec -it $(docker ps -q -f ancestor=tensorflow/tensorflow) bash
root@85b43d28a0fc:/notebooks# python
Python 2.7.12 (default, Nov 20 2017, 18:23:56)
[GCC 5.4.0 20160609] on linux2
Type "help", "copyright", "credits" or "license" for more information.
```

```
>>> import tensorflow as tf
>>> input1 = tf.constant(2.0)
>>> input2 = tf.constant(5.0)
>>> print(input1,input2)
(<tf.Tensor 'Const:0' shape=() dtype=float32>, <tf.Tensor 'Const_1:0' shape=() dtype=float32>)
>>> sess = tf.Session()
2017-12-25 03:32:57.475457: I tensorflow/core/platform/cpu_feature_guard.cc:137] Your CPU supports instructions that this TensorFlow binary was not compiled to use: SSE4.1 SSE4.2 AVX AVX2 FMA
>>> sess = tf.Session()
>>> print(sess.run([input1,input2]))
[2.0, 5.0]
>>> add_node = tf.add(input1, input2)
>>> print(add_node)
Tensor("Add:0", shape=(), dtype=float32)
>>> print(sess.run(add_node))
7.0
>>> p1 = tf.placeholder(tf.float32)
>>> p2 = tf.placeholder(tf.float32)
>>> add_ph = p1 + p2
>>> print(sess.run(add_ph, {p1: 2, p2:5}))
7.0
>>> print(sess.run(add_ph,{p1:1.2,p2:3.5}))
4.7
>>> print(sess.run(add_ph, {p1: [1, 2], p2: [5, 8]}))
[  6.  10.]
>>> x = tf.placeholder(tf.float32)
>>> y = tf.placeholder(tf.float32)
>>> a = tf.Variable([1], dtype=tf.float32)
>>> b = tf.Variable([-2], dtype=tf.float32)
>>> linear_model = a*x + b
>>> init = tf.global_variables_initializer()
>>> sess.run(init)
>>> print(sess.run(linear_model, {x:[0,1,2,3,4,5]}))
[-2. -1.  0.  1.  2.  3.]
>>> squared_deltas = tf.square(linear_model - y)
>>> loss = tf.reduce_sum(squared_deltas)
>>> feed_dict = {
...   x:[0,1,2,3,4,5],
...   y:[-1,-.5,0,.5,1,1.5]}
>>> print(sess.run(loss, feed_dict))
4.75
>>> assignA = tf.assign(a, [.25])
>>> assignB = tf.assign(b, [0])
>>> sess.run([assignA, assignB])
[array([ 0.25], dtype=float32), array([ 0.], dtype=float32)]
>>> print(sess.run(loss, feed_dict))
1.9375
>>> assignA = tf.assign(a, [.5])
>>> assignB = tf.assign(b, [-1])
>>> sess.run([assignA, assignB])
[array([ 0.5], dtype=float32), array([-1.], dtype=float32)]
>>> print(sess.run(loss, feed_dict))
0.0
>>>
```
