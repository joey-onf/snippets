let mut vec = Vec::new();
vec.push(5);
vec.push(10);
vec.push(15);

assert_eq!(vec.len(), 3);
assert_eq!(vec[0], 5);

assert_eq!(vec.pop(), Some(2));
assert_eq!(vec.len(), 2);
