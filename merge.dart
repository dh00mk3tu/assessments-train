List mSort(List list, int l, int r) {
  if (l >= r) {
    List temp = new List.filled(1, null, growable: false);
    temp[0] = list[l];
    return temp;
  }

  int mid = (l + r) ~/ 2;

  List left = mSort(list, l, mid); 
  List right = mSort(list, mid + 1, r); 

  List New = merge(left, right);
  return New;
}

List merge(List left, List right) {
  int i = 0; 
  int j = 0; 
  int k = 0; 
  List list =
      new List.filled(left.length + right.length, null, growable: false);

  while (i < left.length && j < right.length) {
   
    if (left[i] <= right[j]) {
      list[k] = left[i];
      i++;
      k++;
    } else {
      list[k] = right[j];
      j++;
      k++;
    }
  }

  while (i < left.length) {
    list[k] = left[i];
    i++;
    k++;
  }

  while (j < right.length) {
    list[k] = right[j];
    j++;
    k++;
  }
  return list;
}

void main() {
  List list = [1, 3, 5, 7, 9, 2, 4, 6, 8];
  int left = 0;
  int right = list.length - 1; 
  List merged = mSort(list, left, right); 
  print(merged);
}