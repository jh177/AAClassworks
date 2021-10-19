function range(start, end) {
  if (start === end) {
    return [start];
  }
  return range(start, end - 1).concat([end]);
}

function sumRec(arr) {
  if (arr.length === 0) {
    return 0;
  }
  return arr.pop() + sumRec(arr);
}

function exp1(b, n) {
  if (n === 0) {
    return 1;
  }
  if (n > 0) {
    return b * exp1(b, n - 1);
  } else if (n < 0) {
    return exp1(b, n + 1) / b;
  }
}